use std::collections::BTreeSet;
use std::fmt;
use std::hash::{BuildHasherDefault, Hasher};

/// Hash tables for terms and atoms. SipHash's flood resistance buys nothing
/// for a local reasoner, while long IRIs make it a large share of the work.
pub(crate) type HashMap<K, V> = std::collections::HashMap<K, V, BuildHasherDefault<FastHasher>>;
pub(crate) type HashSet<K> = std::collections::HashSet<K, BuildHasherDefault<FastHasher>>;

/// A shared, immutable name or text. Terms are copied constantly during
/// matching, so cloning one only increments a reference count.
#[derive(Clone, Default, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct Name(std::sync::Arc<str>);
impl Name {
    pub fn as_str(&self) -> &str {
        &self.0
    }
}
impl std::ops::Deref for Name {
    type Target = str;
    fn deref(&self) -> &str {
        &self.0
    }
}
impl std::borrow::Borrow<str> for Name {
    fn borrow(&self) -> &str {
        &self.0
    }
}
impl AsRef<str> for Name {
    fn as_ref(&self) -> &str {
        &self.0
    }
}
impl From<&str> for Name {
    fn from(text: &str) -> Self {
        Self(text.into())
    }
}
impl From<String> for Name {
    fn from(text: String) -> Self {
        Self(text.into())
    }
}
impl From<&String> for Name {
    fn from(text: &String) -> Self {
        Self(text.as_str().into())
    }
}
impl From<Name> for String {
    fn from(name: Name) -> Self {
        name.0.to_string()
    }
}
impl PartialEq<str> for Name {
    fn eq(&self, other: &str) -> bool {
        &*self.0 == other
    }
}
impl PartialEq<&str> for Name {
    fn eq(&self, other: &&str) -> bool {
        &*self.0 == *other
    }
}
impl PartialEq<String> for Name {
    fn eq(&self, other: &String) -> bool {
        &*self.0 == other.as_str()
    }
}
impl PartialEq<Name> for str {
    fn eq(&self, other: &Name) -> bool {
        self == &*other.0
    }
}
impl PartialEq<Name> for &str {
    fn eq(&self, other: &Name) -> bool {
        *self == &*other.0
    }
}
impl PartialEq<Name> for String {
    fn eq(&self, other: &Name) -> bool {
        self.as_str() == &*other.0
    }
}
impl fmt::Display for Name {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&self.0)
    }
}
impl fmt::Debug for Name {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        fmt::Debug::fmt(&*self.0, f)
    }
}

/// Index keys for facts. Lookups through these keys yield candidates that are
/// always matched against the goal, so a collision costs one failed match.
pub(crate) fn relation_key(predicate: &str, arity: usize) -> u64 {
    use std::hash::Hash;
    let mut hasher = FastHasher::default();
    predicate.hash(&mut hasher);
    hasher.write_usize(arity);
    hasher.finish()
}
pub(crate) fn position_key(relation: u64, position: usize, value: &Value) -> u64 {
    use std::hash::Hash;
    let mut hasher = FastHasher(relation);
    hasher.write_usize(position);
    value.hash(&mut hasher);
    hasher.finish()
}
pub(crate) fn atom_key(atom: &Atom) -> u64 {
    let relation = relation_key(&atom.predicate, atom.values.len());
    atom.values
        .iter()
        .enumerate()
        .fold(relation, |key, (position, value)| {
            position_key(key, position, value)
        })
}

/// A multiply-rotate hasher over 8-byte words. Tables pick buckets from the
/// low bits, so `finish` applies the MurmurHash3 finalizer to spread them.
#[derive(Default)]
pub(crate) struct FastHasher(u64);
impl FastHasher {
    fn add(&mut self, word: u64) {
        self.0 = (self.0.rotate_left(5) ^ word).wrapping_mul(0x51_7c_c1_b7_27_22_0a_95);
    }
}
impl Hasher for FastHasher {
    fn write(&mut self, bytes: &[u8]) {
        let (chunks, rest) = bytes.as_chunks::<8>();
        for chunk in chunks {
            self.add(u64::from_le_bytes(*chunk));
        }
        let mut tail = [0u8; 8];
        tail[..rest.len()].copy_from_slice(rest);
        self.add(u64::from_le_bytes(tail) ^ ((rest.len() as u64) << 56));
    }
    fn write_u8(&mut self, n: u8) {
        self.add(u64::from(n));
    }
    fn write_u32(&mut self, n: u32) {
        self.add(u64::from(n));
    }
    fn write_u64(&mut self, n: u64) {
        self.add(n);
    }
    fn write_usize(&mut self, n: usize) {
        self.add(n as u64);
    }
    fn finish(&self) -> u64 {
        let mut h = self.0;
        h ^= h >> 33;
        h = h.wrapping_mul(0xff51_afd7_ed55_8ccd);
        h ^= h >> 33;
        h = h.wrapping_mul(0xc4ce_b9fe_1a85_ec53);
        h ^ (h >> 33)
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Error(pub String);

impl Error {
    pub fn new(message: impl Into<String>) -> Self {
        Self(message.into())
    }
}
impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(&self.0)
    }
}
impl std::error::Error for Error {}

/// Ground values have structural identity; integers, reals, atoms, and strings are distinct.
#[derive(Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub enum Value {
    Symbol(Name),
    Text(Name),
    Integer(i64),
    BigInteger(num_bigint::BigInt),
    /// Finite binary64 number, stored as normalized IEEE bits.
    Real(u64),
    Nil,
    Compound(Name, Vec<Value>),
    /// Variables occur only in source templates and transient substitutions.
    Variable(Name),
    /// Opaque identity produced only by a checked fresh-witness firing.
    Witness(Name),
}

fn quoted(f: &mut fmt::Formatter<'_>, value: &str, quote: char) -> fmt::Result {
    write!(f, "{quote}")?;
    for character in value.chars() {
        match character {
            '\n' => f.write_str("\\n")?,
            '\r' => f.write_str("\\r")?,
            '\t' => f.write_str("\\t")?,
            '\\' => f.write_str("\\\\")?,
            c if c == quote => write!(f, "\\{c}")?,
            c => write!(f, "{c}")?,
        }
    }
    write!(f, "{quote}")
}

pub(crate) fn symbol(f: &mut fmt::Formatter<'_>, value: &str) -> fmt::Result {
    let mut characters = value.chars();
    if characters.next().is_some_and(|c| c.is_ascii_lowercase())
        && characters.all(|c| c.is_ascii_alphanumeric() || c == '_')
    {
        f.write_str(value)
    } else {
        quoted(f, value, '\'')
    }
}

impl fmt::Display for Value {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Symbol(value) => symbol(f, value),
            Self::Text(value) => quoted(f, value, '"'),
            Self::Integer(value) => write!(f, "{value}"),
            Self::BigInteger(value) => write!(f, "{value}"),
            Self::Real(bits) => write!(f, "{:?}", f64::from_bits(*bits)),
            Self::Nil => f.write_str("[]"),
            Self::Variable(name) if name.starts_with("_$") => f.write_str("_"),
            Self::Variable(name) => f.write_str(name),
            Self::Compound(name, values) if name == "." && values.len() == 2 => {
                f.write_str("[")?;
                let mut cursor = self;
                let mut first = true;
                while let Self::Compound(name, values) = cursor {
                    if name != "." || values.len() != 2 {
                        break;
                    }
                    if !first {
                        f.write_str(", ")?;
                    }
                    first = false;
                    write!(f, "{}", values[0])?;
                    cursor = &values[1];
                }
                if cursor != &Self::Nil {
                    write!(f, " | {cursor}")?;
                }
                f.write_str("]")
            }
            Self::Compound(name, values) => relation(f, name, values),
            Self::Witness(value) => {
                f.write_str("~")?;
                quoted(f, value, '"')
            }
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
pub struct Atom {
    pub predicate: Name,
    pub values: Vec<Value>,
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum Term {
    Variable(Name),
    Constant(Value),
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct Goal {
    pub predicate: Name,
    pub terms: Vec<Term>,
}

impl Goal {
    pub fn variables(&self) -> BTreeSet<Name> {
        term_variables(&self.terms)
    }
    pub fn ground(&self) -> Option<Atom> {
        Some(Atom {
            predicate: self.predicate.clone(),
            values: self
                .terms
                .iter()
                .map(|t| crate::semantics::value(t, &Default::default()))
                .collect::<Option<_>>()?,
        })
    }
}

fn relation(
    f: &mut fmt::Formatter<'_>,
    predicate: &str,
    values: &[impl fmt::Display],
) -> fmt::Result {
    symbol(f, predicate)?;
    if !values.is_empty() {
        f.write_str("(")?;
        for (index, value) in values.iter().enumerate() {
            if index > 0 {
                f.write_str(", ")?;
            }
            write!(f, "{value}")?;
        }
        f.write_str(")")?;
    }
    Ok(())
}
impl fmt::Display for Term {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Variable(name) if name.starts_with("_$") => f.write_str("_"),
            Self::Variable(name) => f.write_str(name),
            Self::Constant(value) => write!(f, "{value}"),
        }
    }
}
impl fmt::Display for Goal {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        relation(f, &self.predicate, &self.terms)
    }
}
impl fmt::Display for Atom {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        relation(f, &self.predicate, &self.values)
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum AggregateKind {
    Count,
    Sum,
    Min,
    Max,
    List,
}

impl fmt::Display for AggregateKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.write_str(match self {
            Self::Count => "count",
            Self::Sum => "sum",
            Self::Min => "min",
            Self::Max => "max",
            Self::List => "list",
        })
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Aggregate {
    pub kind: AggregateKind,
    pub template: Vec<Term>,
    pub body: Vec<Literal>,
    pub result: Term,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Literal {
    Relation(Goal),
    Builtin(Goal),
    Not(Goal),
    NotBuiltin(Goal),
    Aggregate(Aggregate),
    Fresh(Term),
}

impl Literal {
    /// Aggregate-local variables are deliberately absent from outer projection.
    pub fn variables(&self) -> BTreeSet<Name> {
        match self {
            Self::Relation(g) | Self::Builtin(g) | Self::Not(g) | Self::NotBuiltin(g) => {
                g.variables()
            }
            Self::Aggregate(a) => term_variables(std::slice::from_ref(&a.result)),
            Self::Fresh(t) => term_variables(std::slice::from_ref(t)),
        }
    }
}

pub(crate) fn term_variables(terms: &[Term]) -> BTreeSet<Name> {
    let mut names = BTreeSet::new();
    for term in terms {
        match term {
            Term::Variable(name) => {
                names.insert(name.clone());
            }
            Term::Constant(value) => names.extend(value_variables(value)),
        }
    }
    names
}

impl fmt::Display for Literal {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Relation(g) => write!(f, "{g}"),
            Self::Builtin(g)
                if matches!(
                    g.predicate.as_str(),
                    "is" | "="
                        | "\\="
                        | "<"
                        | "=<"
                        | ">"
                        | ">="
                        | "=:="
                        | "=\\="
                        | "@<"
                        | "@=<"
                        | "@>"
                        | "@>="
                        | "=.."
                ) =>
            {
                write!(f, "{} {} {}", g.terms[0], g.predicate, g.terms[1])
            }
            Self::Builtin(g) => write!(f, "{g}"),
            Self::NotBuiltin(g) => write!(f, "\\+ ({})", Self::Builtin(g.clone())),
            Self::Not(g) => write!(f, "\\+ ({g})"),
            Self::Fresh(t) => write!(f, "fresh({t})"),
            Self::Aggregate(a) => {
                write!(f, "aggregate_all({}", a.kind)?;
                if let Some(term) = a.template.first() {
                    write!(f, "({term})")?;
                }
                f.write_str(", (")?;
                for (i, g) in a.body.iter().enumerate() {
                    if i > 0 {
                        f.write_str(", ")?;
                    }
                    write!(f, "{g}")?;
                }
                write!(f, "), {})", a.result)
            }
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Rule {
    pub head: Goal,
    pub body: Vec<Literal>,
}

impl fmt::Display for Rule {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{} :- ", self.head)?;
        for (index, goal) in self.body.iter().enumerate() {
            if index > 0 {
                f.write_str(", ")?;
            }
            write!(f, "{goal}")?;
        }
        f.write_str(".")
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Query {
    pub goals: Vec<Literal>,
    pub variables: Vec<Name>,
}

/// Output requests, in source order. Query indexes are zero-based.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Request {
    Answer(usize),
    Proof,
    Check,
    Result(usize),
}

/// Merge parsed documents with `extend`; variable scopes are local to clauses.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct Program {
    pub facts: Vec<Atom>,
    pub rules: Vec<Rule>,
    pub queries: Vec<Query>,
    pub tables: BTreeSet<(Name, usize)>,
    pub requests: Vec<Request>,
}

impl Program {
    pub fn extend(&mut self, mut other: Self) {
        // Lean witness helpers are numbered per document. Renumber the added
        // document's helpers after this program's so they stay distinct.
        let tag = |name: &str| {
            [crate::parser::LEAN, crate::parser::SATISFIED]
                .iter()
                .find_map(|prefix| {
                    Some((*prefix, name.strip_prefix(prefix)?.parse::<usize>().ok()?))
                })
        };
        let offset = self
            .rules
            .iter()
            .filter_map(|r| tag(&r.head.predicate).map(|(_, n)| n))
            .max()
            .unwrap_or(0);
        if offset > 0 {
            for rule in &mut other.rules {
                let goals = rule.body.iter_mut().filter_map(|l| match l {
                    Literal::Relation(g) | Literal::Not(g) => Some(g),
                    _ => None,
                });
                for goal in std::iter::once(&mut rule.head).chain(goals) {
                    if let Some((prefix, n)) = tag(&goal.predicate) {
                        goal.predicate = format!("{prefix}{}", n + offset).into();
                    }
                }
            }
        }
        self.facts.extend(other.facts);
        self.rules.extend(other.rules);
        let offset = self.queries.len();
        self.requests
            .extend(other.requests.into_iter().map(|request| match request {
                Request::Answer(i) => Request::Answer(i + offset),
                Request::Result(i) => Request::Result(i + offset),
                other => other,
            }));
        self.queries.extend(other.queries);
        self.tables.extend(other.tables);
    }
    pub fn validate(&self) -> Result<(), Error> {
        crate::language::plan(self).map(|_| ())
    }
}

pub(crate) fn term_value(term: &Term) -> Value {
    match term {
        Term::Variable(name) => Value::Variable(name.clone()),
        Term::Constant(value) => value.clone(),
    }
}
pub(crate) fn value_variables(value: &Value) -> Vec<Name> {
    match value {
        Value::Variable(name) => vec![name.clone()],
        Value::Compound(_, args) => args.iter().flat_map(value_variables).collect(),
        _ => Vec::new(),
    }
}
impl Value {
    pub(crate) fn ground(&self) -> bool {
        match self {
            Self::Variable(_) => return false,
            Self::Compound(_, _) => {}
            _ => return true,
        }
        let mut pending = vec![self];
        while let Some(value) = pending.pop() {
            match value {
                Self::Variable(_) => return false,
                Self::Compound(_, args) => pending.extend(args),
                _ => {}
            }
        }
        true
    }
    pub(crate) fn valid(&self) -> bool {
        use num_traits::ToPrimitive;
        if matches!(
            self,
            Self::Symbol(_)
                | Self::Text(_)
                | Self::Integer(_)
                | Self::Nil
                | Self::Variable(_)
                | Self::Witness(_)
        ) {
            return true;
        }
        let mut pending = vec![self];
        while let Some(value) = pending.pop() {
            match value {
                Self::Real(bits)
                    if !f64::from_bits(*bits).is_finite()
                        || (f64::from_bits(*bits) == 0.0 && *bits != 0.0f64.to_bits()) =>
                {
                    return false
                }
                Self::BigInteger(n) if n.to_i64().is_some() => return false,
                Self::Compound(name, args) => {
                    if args.is_empty() || args.len() > 64 {
                        return false;
                    }
                    if name == "."
                        && args.len() == 2
                        && !matches!(&args[1], Self::Nil | Self::Variable(_))
                        && !matches!(&args[1],Self::Compound(n,a) if n=="." && a.len()==2)
                    {
                        return false;
                    }
                    pending.extend(args);
                }
                _ => {}
            }
        }
        true
    }
    pub(crate) fn has_witness(&self) -> bool {
        match self {
            Self::Witness(_) => true,
            Self::Compound(_, args) => args.iter().any(Self::has_witness),
            _ => false,
        }
    }
}
