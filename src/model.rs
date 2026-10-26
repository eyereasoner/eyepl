use std::collections::BTreeSet;
use std::fmt;

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
    Symbol(String),
    Text(String),
    Integer(i64),
    BigInteger(num_bigint::BigInt),
    /// Finite binary64 number, stored as normalized IEEE bits.
    Real(u64),
    Nil,
    Compound(String, Vec<Value>),
    /// Variables occur only in source templates and transient substitutions.
    Variable(String),
    /// Opaque identity produced only by a checked fresh-witness firing.
    Witness(String),
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
    pub predicate: String,
    pub values: Vec<Value>,
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum Term {
    Variable(String),
    Constant(Value),
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct Goal {
    pub predicate: String,
    pub terms: Vec<Term>,
}

impl Goal {
    pub fn variables(&self) -> BTreeSet<String> {
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
    pub fn variables(&self) -> BTreeSet<String> {
        match self {
            Self::Relation(g) | Self::Builtin(g) | Self::Not(g) | Self::NotBuiltin(g) => {
                g.variables()
            }
            Self::Aggregate(a) => term_variables(std::slice::from_ref(&a.result)),
            Self::Fresh(t) => term_variables(std::slice::from_ref(t)),
        }
    }
}

pub(crate) fn term_variables(terms: &[Term]) -> BTreeSet<String> {
    terms
        .iter()
        .flat_map(|t| value_variables(&term_value(t)))
        .collect()
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
    pub variables: Vec<String>,
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
    pub tables: BTreeSet<(String, usize)>,
    pub requests: Vec<Request>,
}

impl Program {
    pub fn extend(&mut self, other: Self) {
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
pub(crate) fn value_variables(value: &Value) -> Vec<String> {
    match value {
        Value::Variable(name) => vec![name.clone()],
        Value::Compound(_, args) => args.iter().flat_map(value_variables).collect(),
        _ => Vec::new(),
    }
}
impl Value {
    pub(crate) fn ground(&self) -> bool {
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
