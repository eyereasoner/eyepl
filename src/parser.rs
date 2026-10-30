use crate::model::HashSet;
use crate::{
    Aggregate, AggregateKind, Atom, Error, Goal, Literal, Name, Program, Query, Rule, Term, Value,
};
use num_bigint::BigInt;
use std::collections::BTreeSet;

/// Predicate prefixes of the helper relations that make witness rules lean.
pub(crate) const LEAN: &str = "$lean:";
pub(crate) const SATISFIED: &str = "$satisfied:";

#[derive(Clone, Debug, PartialEq, Eq)]
enum Token {
    Name(Name),
    Variable(Name),
    Text(Name),
    Number(Name),
    Symbol(Name),
    End,
}
struct Parser {
    tokens: Vec<(Token, usize)>,
    position: usize,
    anonymous: usize,
    depth: usize,
    recorded: bool,
}
fn tokenize(source: &str) -> Result<Vec<(Token, usize)>, Error> {
    let chars: Vec<_> = source.chars().collect();
    let (mut at, mut line, mut tokens) = (0, 1, Vec::new());
    // A program repeats its names, so tokens share one copy of each spelling.
    let mut names = HashSet::<Name>::default();
    let mut intern = |text: &str| match names.get(text) {
        Some(name) => name.clone(),
        None => {
            let name = Name::from(text);
            names.insert(name.clone());
            name
        }
    };
    let mut spelling = String::new();
    while at < chars.len() {
        let c = chars[at];
        if c.is_whitespace() {
            line += usize::from(c == '\n');
            at += 1;
            continue;
        }
        if c == '%' {
            while at < chars.len() && chars[at] != '\n' {
                at += 1;
            }
            continue;
        }
        if chars.get(at..at + 2) == Some(&['/', '*']) {
            at += 2;
            while at + 1 < chars.len() && chars[at..at + 2] != ['*', '/'] {
                line += usize::from(chars[at] == '\n');
                at += 1;
            }
            if at + 1 >= chars.len() {
                return Err(Error::new(format!("Line {line}: Close the block comment.")));
            }
            at += 2;
            continue;
        }
        let start_line = line;
        let token = if c == '\'' || c == '"' {
            at += 1;
            let mut text = String::new();
            loop {
                let Some(&next) = chars.get(at) else {
                    return Err(Error::new(format!(
                        "Line {start_line}: Close the quoted value."
                    )));
                };
                at += 1;
                if next == c {
                    if chars.get(at) == Some(&c) {
                        text.push(c);
                        at += 1;
                        continue;
                    }
                    break;
                }
                if next == '\\' {
                    let Some(&escape) = chars.get(at) else {
                        return Err(Error::new("Complete the escape sequence."));
                    };
                    at += 1;
                    text.push(match escape {
                        'n' => '\n',
                        'r' => '\r',
                        't' => '\t',
                        'b' => '\u{8}',
                        'f' => '\u{c}',
                        '\\' => '\\',
                        '\'' => '\'',
                        '"' => '"',
                        'u' | 'U' => {
                            let length = if escape == 'u' { 4 } else { 8 };
                            let digits: String = chars
                                .get(at..at + length)
                                .ok_or_else(|| Error::new("Complete the Unicode escape."))?
                                .iter()
                                .collect();
                            at += length;
                            let mut code = u32::from_str_radix(&digits, 16)
                                .map_err(|_| Error::new("Use a valid Unicode escape."))?;
                            if (0xd800..=0xdbff).contains(&code) && escape == 'u' {
                                if chars.get(at..at + 2) != Some(&['\\', 'u']) {
                                    return Err(Error::new(
                                        "Pair a high surrogate with a low Unicode surrogate.",
                                    ));
                                }
                                let low: String = chars
                                    .get(at + 2..at + 6)
                                    .ok_or_else(|| {
                                        Error::new("Complete the Unicode surrogate pair.")
                                    })?
                                    .iter()
                                    .collect();
                                let low = u32::from_str_radix(&low, 16)
                                    .map_err(|_| Error::new("Invalid Unicode surrogate pair."))?;
                                if !(0xdc00..=0xdfff).contains(&low) {
                                    return Err(Error::new("Invalid Unicode surrogate pair."));
                                }
                                at += 6;
                                code = 0x10000 + ((code - 0xd800) << 10) + (low - 0xdc00);
                            }
                            char::from_u32(code)
                                .ok_or_else(|| Error::new("Use a valid Unicode scalar value."))?
                        }
                        _ => {
                            return Err(Error::new(format!(
                                "Line {line}: Unsupported escape \\{escape}."
                            )))
                        }
                    });
                } else {
                    line += usize::from(next == '\n');
                    text.push(next);
                }
            }
            if c == '\'' {
                Token::Name(intern(&text))
            } else {
                Token::Text(intern(&text))
            }
        } else if c.is_ascii_digit() {
            let start = at;
            while chars.get(at).is_some_and(char::is_ascii_digit) {
                at += 1;
            }
            if chars.get(at) == Some(&'.') && chars.get(at + 1).is_some_and(char::is_ascii_digit) {
                at += 1;
                while chars.get(at).is_some_and(char::is_ascii_digit) {
                    at += 1;
                }
            }
            if chars.get(at).is_some_and(|c| *c == 'e' || *c == 'E') {
                at += 1;
                if chars.get(at).is_some_and(|c| *c == '+' || *c == '-') {
                    at += 1;
                }
                let first = at;
                while chars.get(at).is_some_and(char::is_ascii_digit) {
                    at += 1;
                }
                if at == first {
                    return Err(Error::new(format!(
                        "Line {line}: Complete the numeric exponent."
                    )));
                }
            }
            spelling.clear();
            spelling.extend(&chars[start..at]);
            Token::Number(intern(&spelling))
        } else if c.is_ascii_alphabetic() || c == '_' {
            let start = at;
            at += 1;
            while chars
                .get(at)
                .is_some_and(|c| c.is_ascii_alphanumeric() || *c == '_')
            {
                at += 1;
            }
            spelling.clear();
            spelling.extend(&chars[start..at]);
            let name = intern(&spelling);
            if c.is_ascii_uppercase() || c == '_' {
                Token::Variable(name)
            } else {
                Token::Name(name)
            }
        } else {
            let mut found = None;
            for op in [
                "=\\=", "=:=", "@=<", "@>=", "=..", ":-", "?-", "\\+", "\\=", "=<", ">=", "@<",
                "@>", "//", "**", "<<", ">>", "\\/", "/\\",
            ] {
                // Every operator spelling is ASCII, so bytes count characters.
                if chars
                    .get(at..at + op.len())
                    .is_some_and(|part| part.iter().copied().eq(op.chars()))
                {
                    found = Some(op);
                    break;
                }
            }
            spelling.clear();
            match found {
                Some(op) => spelling.push_str(op),
                None => spelling.push(c),
            }
            let op = spelling.as_str();
            at += op.chars().count();
            if !matches!(
                op,
                "(" | ")"
                    | "["
                    | "]"
                    | "|"
                    | ","
                    | "."
                    | "~"
                    | "+"
                    | "-"
                    | "*"
                    | "/"
                    | "^"
                    | "\\"
                    | "="
                    | "<"
                    | ">"
                    | "=\\="
                    | "=:="
                    | "@=<"
                    | "@>="
                    | "=.."
                    | ":-"
                    | "?-"
                    | "\\+"
                    | "\\="
                    | "=<"
                    | ">="
                    | "@<"
                    | "@>"
                    | "//"
                    | "**"
                    | "<<"
                    | ">>"
                    | "\\/"
                    | "/\\"
            ) {
                return Err(Error::new(format!(
                    "Line {line}: Unexpected character {c:?}; use eyepl syntax."
                )));
            }
            if op == "."
                && chars.get(at).is_some_and(|c| {
                    !c.is_whitespace()
                        && *c != '%'
                        && !(*c == '/' && chars.get(at + 1) == Some(&'*'))
                })
            {
                return Err(Error::new(format!(
                    "Line {line}: Follow a statement period with whitespace, a comment, or end of input."
                )));
            }
            Token::Symbol(intern(op))
        };
        tokens.push((token, start_line));
    }
    tokens.push((Token::End, line));
    Ok(tokens)
}
fn binary(op: &str) -> Option<(u8, bool)> {
    Some(match op {
        "+" | "-" | "\\/" | "/\\" | "xor" => (2, false),
        "*" | "/" | "//" | "div" | "rem" | "mod" | "<<" | ">>" => (3, false),
        "**" => (5, false),
        "^" => (5, true),
        _ => return None,
    })
}
fn test(op: &str) -> bool {
    matches!(
        op,
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
    )
}
pub(crate) fn builtin_name(name: &str, arity: usize) -> bool {
    (arity == 2 && test(name))
        || matches!(
            (name, arity),
            ("true" | "false", 0)
                | (
                    "contains_text" | "atom_codes" | "string_codes" | "string_length",
                    2
                )
                | ("string_concat", 3)
        )
}
fn term(value: Value) -> Term {
    match value {
        Value::Variable(name) => Term::Variable(name),
        value => Term::Constant(value),
    }
}
impl Parser {
    fn new(source: &str) -> Result<Self, Error> {
        Ok(Self {
            tokens: tokenize(source)?,
            position: 0,
            anonymous: 0,
            depth: 0,
            recorded: false,
        })
    }
    fn peek(&self) -> &Token {
        &self.tokens[self.position].0
    }
    fn spelling(&self) -> &str {
        match self.peek() {
            Token::Name(s) | Token::Symbol(s) => s,
            _ => "",
        }
    }
    fn is(&self, s: &str) -> bool {
        self.spelling() == s
    }
    fn take(&mut self, s: &str) -> bool {
        if self.is(s) {
            self.position += 1;
            true
        } else {
            false
        }
    }
    fn error(&self, s: impl AsRef<str>) -> Error {
        Error::new(format!(
            "Line {}: {}",
            self.tokens[self.position].1,
            s.as_ref()
        ))
    }
    fn expect(&mut self, s: &str) -> Result<(), Error> {
        if self.take(s) {
            Ok(())
        } else {
            Err(self.error(format!("Expected {s}.")))
        }
    }
    fn expression(&mut self, min: u8) -> Result<Value, Error> {
        self.expression_with_priority(min).map(|(value, _)| value)
    }
    fn expression_with_priority(&mut self, min: u8) -> Result<(Value, u8), Error> {
        // Explicit continuations keep certificate term depth off the Rust stack.
        // Source terms retain the existing nesting and argument limits.
        enum Part {
            Expression(u8),
            Primary,
            EndPrimary,
            Rest(u8),
            Binary {
                min: u8,
                left: Value,
                op: Name,
                precedence: u8,
                rhs_min: u8,
            },
            Prefix(Name),
            Group,
            Arguments(Name, Vec<Value>),
            List(Vec<Value>),
            ListTail(Vec<Value>),
        }
        fn list(items: Vec<Value>, mut tail: Value) -> Value {
            for item in items.into_iter().rev() {
                tail = Value::Compound(".".into(), vec![item, tail]);
            }
            tail
        }
        let mut parts = vec![Part::Expression(min)];
        let mut values: Vec<(Value, u8)> = Vec::new();
        while let Some(part) = parts.pop() {
            match part {
                Part::Expression(min) => {
                    parts.push(Part::Rest(min));
                    parts.push(Part::Primary);
                }
                Part::Primary => {
                    self.depth += 1;
                    if !self.recorded && self.depth > 256 {
                        return Err(self.error("Term nesting exceeds the parser limit (256)."));
                    }
                    let token = self.peek().clone();
                    if token == Token::End {
                        return Err(self.error(
                            "Expected an atom, number, string, variable, compound, or list.",
                        ));
                    }
                    self.position += 1;
                    parts.push(Part::EndPrimary);
                    let value = match token {
                        Token::Variable(name) if name == "_" => {
                            self.anonymous += 1;
                            Value::Variable(format!("_${}", self.anonymous).into())
                        }
                        Token::Variable(name) => Value::Variable(name),
                        Token::Text(s) => Value::Text(s),
                        Token::Number(s) => {
                            if s.contains(['.', 'e', 'E']) {
                                crate::arithmetic::real(
                                    s.parse().map_err(|_| self.error("Invalid real number."))?,
                                )?
                            } else {
                                crate::arithmetic::integer(
                                    s.parse::<BigInt>()
                                        .map_err(|_| self.error("Invalid integer."))?,
                                )
                            }
                        }
                        Token::Name(name) => {
                            if self.take("(") {
                                parts.push(Part::Arguments(name, Vec::new()));
                                parts.push(Part::Expression(0));
                                continue;
                            }
                            Value::Symbol(name)
                        }
                        Token::Symbol(s) if s == "(" => {
                            parts.push(Part::Group);
                            parts.push(Part::Expression(0));
                            continue;
                        }
                        Token::Symbol(s) if s == "[" => {
                            if self.take("]") {
                                Value::Nil
                            } else {
                                parts.push(Part::List(Vec::new()));
                                parts.push(Part::Expression(0));
                                continue;
                            }
                        }
                        Token::Symbol(s) if matches!(s.as_str(), "-" | "+" | "\\") => {
                            parts.push(Part::Prefix(s));
                            parts.push(Part::Expression(5));
                            continue;
                        }
                        Token::Symbol(s) if s == "~" => {
                            let Token::Text(s) = self.peek().clone() else {
                                return Err(self.error("A witness needs a quoted identity."));
                            };
                            self.position += 1;
                            Value::Witness(s)
                        }
                        _ => {
                            return Err(self.error(
                                "Expected an atom, number, string, variable, compound, or list.",
                            ))
                        }
                    };
                    values.push((value, u8::MAX));
                }
                Part::EndPrimary => self.depth -= 1,
                Part::Rest(min) => {
                    let (left, priority) = values.pop().unwrap();
                    let Some((precedence, right)) =
                        binary(self.spelling()).filter(|(p, _)| *p >= min)
                    else {
                        values.push((left, priority));
                        continue;
                    };
                    let (Token::Name(op) | Token::Symbol(op)) = self.peek().clone() else {
                        unreachable!("binary operators are names or symbols")
                    };
                    if priority < precedence || ((right || op == "**") && priority == precedence) {
                        return Err(
                            self.error("Parenthesize operators with incompatible priorities.")
                        );
                    }
                    self.position += 1;
                    let rhs_min = precedence + u8::from(!right);
                    parts.push(Part::Binary {
                        min,
                        left,
                        op,
                        precedence,
                        rhs_min,
                    });
                    parts.push(Part::Expression(rhs_min));
                }
                Part::Binary {
                    min,
                    left,
                    op,
                    precedence,
                    rhs_min,
                } => {
                    let (rhs, priority) = values.pop().unwrap();
                    if priority < rhs_min {
                        return Err(
                            self.error("Parenthesize operators with incompatible priorities.")
                        );
                    }
                    values.push((Value::Compound(op, vec![left, rhs]), precedence));
                    parts.push(Part::Rest(min));
                }
                Part::Prefix(op) => {
                    let (value, _) = values.pop().unwrap();
                    let mut priority = 5;
                    let value = if op == "-" {
                        match value {
                            Value::Integer(n) => {
                                priority = u8::MAX;
                                crate::arithmetic::integer(-BigInt::from(n))
                            }
                            Value::BigInteger(n) => {
                                priority = u8::MAX;
                                crate::arithmetic::integer(-n)
                            }
                            Value::Real(bits) => {
                                priority = u8::MAX;
                                crate::arithmetic::real(-f64::from_bits(bits))?
                            }
                            value => Value::Compound(op, vec![value]),
                        }
                    } else {
                        Value::Compound(op, vec![value])
                    };
                    values.push((value, priority));
                }
                Part::Group => {
                    self.expect(")")?;
                    let (value, _) = values.pop().unwrap();
                    values.push((value, u8::MAX));
                }
                Part::Arguments(name, mut args) => {
                    args.push(values.pop().unwrap().0);
                    let witness = self.recorded && name.starts_with("$fresh:");
                    if args.len() > 64 && !witness {
                        return Err(self.error("A term supports at most 64 arguments."));
                    }
                    if self.take(",") {
                        parts.push(Part::Arguments(name, args));
                        parts.push(Part::Expression(0));
                    } else {
                        self.expect(")")?;
                        if name == "."
                            && args.len() == 2
                            && !matches!(
                                args[1],
                                Value::Nil | Value::Variable(_) | Value::Compound(_, _)
                            )
                        {
                            return Err(self.error("A list tail must be a list or variable."));
                        }
                        values.push((Value::Compound(name, args), u8::MAX));
                    }
                }
                Part::List(mut items) => {
                    items.push(values.pop().unwrap().0);
                    if self.take(",") {
                        parts.push(Part::List(items));
                        parts.push(Part::Expression(0));
                    } else if self.take("|") {
                        parts.push(Part::ListTail(items));
                        parts.push(Part::Expression(0));
                    } else {
                        self.expect("]")?;
                        values.push((list(items, Value::Nil), u8::MAX));
                    }
                }
                Part::ListTail(items) => {
                    let (tail, _) = values.pop().unwrap();
                    self.expect("]")?;
                    if !matches!(&tail, Value::Nil | Value::Variable(_))
                        && !matches!(&tail, Value::Compound(n, a) if n == "." && a.len() == 2)
                    {
                        return Err(self.error("A list tail must be a list or variable."));
                    }
                    values.push((list(items, tail), u8::MAX));
                }
            }
        }
        Ok(values.pop().unwrap())
    }
    fn as_goal(&self, v: Value) -> Result<Goal, Error> {
        let wide_witness = self.recorded
            && matches!(&v, Value::Compound(name, args) if name.starts_with("$fresh:") && args.iter().all(Value::valid));
        if !wide_witness && !v.valid() {
            return Err(self.error("Use proper lists and valid finite numeric terms."));
        }
        match v {
            Value::Symbol(predicate) => Ok(Goal {
                predicate,
                terms: vec![],
            }),
            Value::Compound(predicate, args) => Ok(Goal {
                predicate,
                terms: args.into_iter().map(term).collect(),
            }),
            _ => Err(self.error("A goal needs a predicate name.")),
        }
        .and_then(|goal| {
            if !self.recorded && goal.predicate.starts_with('$') {
                return Err(self.error(
                    "Predicate names that begin with $ are reserved for generated relations.",
                ));
            }
            Ok(goal)
        })
    }
    fn literal(&mut self) -> Result<Literal, Error> {
        if self.take("\\+") {
            let wrapped = self.take("(");
            let g = self.literal()?;
            if wrapped {
                self.expect(")")?;
            }
            return match g {
                Literal::Relation(goal) => Ok(Literal::Not(goal)),
                Literal::Builtin(goal) => Ok(Literal::NotBuiltin(goal)),
                _ => Err(self.error(
                    "Negate one ordinary goal or test; define a helper predicate for a conjunction.",
                )),
            };
        }
        if self.is("aggregate_all") && self.tokens[self.position + 1].0 == Token::Symbol("(".into())
        {
            self.position += 2;
            let template = self.expression(0)?;
            self.expect(",")?;
            let body = if self.take("(") {
                let body = self.goals()?;
                self.expect(")")?;
                body
            } else {
                vec![self.literal()?]
            };
            self.expect(",")?;
            let result = term(self.expression(0)?);
            self.expect(")")?;
            let (kind, template) = match template {
                Value::Symbol(s) if s == "count" => (AggregateKind::Count, vec![]),
                Value::Compound(s, mut a) if a.len() == 1 => {
                    let kind = match s.as_str() {
                        "sum" => AggregateKind::Sum,
                        "min" => AggregateKind::Min,
                        "max" => AggregateKind::Max,
                        "list" => AggregateKind::List,
                        _ => {
                            return Err(self.error(
                                "Use count, sum(Value), min(Value), max(Value), or list(Term).",
                            ))
                        }
                    };
                    (kind, vec![term(a.remove(0))])
                }
                _ => {
                    return Err(
                        self.error("Use count, sum(Value), min(Value), max(Value), or list(Term).")
                    )
                }
            };
            return Ok(Literal::Aggregate(Aggregate {
                kind,
                template,
                body,
                result,
            }));
        }
        let left = self.expression(0)?;
        if test(self.spelling()) {
            let predicate = self.spelling().into();
            self.position += 1;
            return Ok(Literal::Builtin(Goal {
                predicate,
                terms: vec![term(left), term(self.expression(0)?)],
            }));
        }
        let goal = self.as_goal(left)?;
        if goal.predicate == "fresh" && goal.terms.len() == 1 {
            return Ok(Literal::Fresh(goal.terms[0].clone()));
        }
        if builtin_name(&goal.predicate, goal.terms.len()) {
            Ok(Literal::Builtin(goal))
        } else {
            Ok(Literal::Relation(goal))
        }
    }
    fn goals(&mut self) -> Result<Vec<Literal>, Error> {
        let mut goals = Vec::new();
        loop {
            let grouped = if self.is("(") {
                let mut nesting = 0;
                let mut end = self.position;
                loop {
                    match &self.tokens[end].0 {
                        Token::Symbol(s) if s == "(" => nesting += 1,
                        Token::Symbol(s) if s == ")" => {
                            nesting -= 1;
                            if nesting == 0 {
                                break;
                            }
                        }
                        Token::End => return Err(self.error("Close the goal group.")),
                        _ => {}
                    }
                    end += 1;
                }
                let next = match &self.tokens[end + 1].0 {
                    Token::Symbol(s) | Token::Name(s) => s.as_str(),
                    _ => "",
                };
                !test(next) && binary(next).is_none()
            } else {
                false
            };
            if grouped {
                self.position += 1;
                goals.extend(self.goals()?);
                self.expect(")")?;
            } else {
                goals.push(self.literal()?);
            }
            if goals.len() > 64 {
                return Err(self.error("Use at most 64 goals in a rule or query."));
            }
            if !self.take(",") {
                break;
            }
        }
        Ok(goals)
    }
    fn request(&mut self, program: &mut Program) -> Result<(), Error> {
        let goals = self.goals()?;
        let mut variables = Vec::new();
        for goal in &goals {
            let terms = match goal {
                Literal::Relation(g)
                | Literal::Builtin(g)
                | Literal::Not(g)
                | Literal::NotBuiltin(g) => g.terms.as_slice(),
                Literal::Aggregate(a) => std::slice::from_ref(&a.result),
                Literal::Fresh(t) => std::slice::from_ref(t),
            };
            for v in terms
                .iter()
                .flat_map(|t| crate::model::value_variables(&crate::model::term_value(t)))
            {
                if !v.starts_with('_') && !variables.contains(&v) {
                    variables.push(v);
                }
            }
        }
        program.queries.push(Query { goals, variables });
        Ok(())
    }
    fn program(&mut self) -> Result<Program, Error> {
        let mut program = Program::default();
        while self.peek() != &Token::End {
            if self.take("?-") {
                if self.take("why") {
                    if self.take("(") {
                        let index = program.queries.len();
                        self.request(&mut program)?;
                        self.expect(")")?;
                        program.requests.push(crate::Request::Answer(index));
                    }
                    program.requests.push(crate::Request::Proof);
                } else if self.take("check") {
                    if self.take("(") {
                        let index = program.queries.len();
                        self.request(&mut program)?;
                        self.expect(")")?;
                        program.requests.push(crate::Request::Result(index));
                    } else {
                        program.requests.push(crate::Request::Check);
                    }
                } else {
                    let index = program.queries.len();
                    self.request(&mut program)?;
                    program.requests.push(crate::Request::Answer(index));
                }
            } else if self.take(":-") {
                if self.take("table") {
                    loop {
                        let Token::Name(name) = self.peek().clone() else {
                            return Err(self.error("A table declaration needs a predicate name."));
                        };
                        if name.starts_with('$') {
                            return Err(self.error(
                                "Predicate names that begin with $ are reserved for generated relations.",
                            ));
                        }
                        self.position += 1;
                        self.expect("/")?;
                        let Token::Number(n) = self.peek() else {
                            return Err(self.error("A table arity must be an integer."));
                        };
                        let arity = n
                            .parse::<usize>()
                            .map_err(|_| self.error("Invalid table arity."))?;
                        self.position += 1;
                        if arity > 64 {
                            return Err(self.error("A relation supports at most 64 arguments."));
                        }
                        program.tables.insert((name, arity));
                        if !self.take(",") {
                            break;
                        }
                    }
                } else {
                    return Err(self.error("Only table directives are supported."));
                }
            } else {
                let value = self.expression(0)?;
                let head = self.as_goal(value)?;
                if builtin_name(&head.predicate, head.terms.len())
                    || matches!(
                        head.predicate.as_str(),
                        "aggregate_all" | "fresh" | "why" | "check"
                    )
                {
                    return Err(self.error("A fact or rule must name an ordinary predicate."));
                }
                if self.take(":-") {
                    program.rules.push(Rule {
                        head,
                        body: self.goals()?,
                    });
                } else if let Some(atom) = head.ground() {
                    program.facts.push(atom);
                } else {
                    program.rules.push(Rule { head, body: vec![] });
                }
            }
            self.expect(".")?;
        }
        lean_witnesses(&mut program);
        Ok(program)
    }
}
/// Make witness rules lean (Section 8.3). A rule `H :- B, fresh(W).` whose
/// head variables other than `W`, its frontier `F`, are bound by `B` becomes
///
/// ```text
/// H :- '$lean:K'(F), fresh(W).
/// '$satisfied:K'(F) :- H.
/// '$lean:K'(F) :- B, \+ '$satisfied:K'(F).
/// ```
///
/// The witness then depends only on the frontier, and it is introduced only
/// when no fact of a completed lower stratum already matches `H` with any
/// value for `W`. The decision is an ordinary absence, so the checker's
/// boundary closure (C6) verifies it. Malformed witness rules keep their
/// shape so that planning reports them.
fn lean_witnesses(program: &mut Program) {
    let mut helpers = Vec::new();
    for rule in &mut program.rules {
        let Some((Literal::Fresh(Term::Variable(witness)), body)) = rule.body.split_last() else {
            continue;
        };
        let Ok((bound, _)) = crate::language::bound_after(body, BTreeSet::new(), false, false)
        else {
            continue;
        };
        let mut frontier = rule.head.variables();
        frontier.remove(witness);
        if bound.contains(witness) || !frontier.is_subset(&bound) {
            continue;
        }
        let tag = helpers.len() / 2 + 1;
        let terms: Vec<_> = frontier.into_iter().map(Term::Variable).collect();
        let lean = Goal {
            predicate: format!("{LEAN}{tag}").into(),
            terms: terms.clone(),
        };
        let satisfied = Goal {
            predicate: format!("{SATISFIED}{tag}").into(),
            terms,
        };
        let mut test = body.to_vec();
        test.push(Literal::Not(satisfied.clone()));
        helpers.push(Rule {
            head: satisfied,
            body: vec![Literal::Relation(rule.head.clone())],
        });
        helpers.push(Rule {
            head: lean.clone(),
            body: test,
        });
        let fresh = rule.body.pop().unwrap();
        rule.body = vec![Literal::Relation(lean), fresh];
    }
    program.rules.extend(helpers);
}
/// Parse an eyepl program and check its modes and strata.
pub fn parse(source: &str) -> Result<Program, Error> {
    let program = parse_document(source)?;
    program.validate()?;
    Ok(program)
}
/// Parse an eyepl program without planning its modes and strata. `reason`
/// performs those checks, so a program read only to be merged and run need
/// not be planned twice.
pub fn parse_document(source: &str) -> Result<Program, Error> {
    Parser::new(source)?.program()
}
pub fn parse_atom(source: &str) -> Result<Atom, Error> {
    let mut p = Parser::new(source)?;
    p.recorded = true;
    let value = p.expression(0)?;
    let goal = p.as_goal(value)?;
    p.expect(".")?;
    if p.peek() != &Token::End {
        return Err(p.error("Expected exactly one recorded fact."));
    }
    goal.ground()
        .ok_or_else(|| p.error("Recorded facts must be ground."))
}

pub(crate) fn parse_goal(source: &str) -> Result<Goal, Error> {
    let mut p = Parser::new(source)?;
    p.recorded = true;
    let value = p.expression(0)?;
    let goal = p.as_goal(value)?;
    p.expect(".")?;
    if p.peek() != &Token::End {
        return Err(p.error("Expected one goal."));
    }
    Ok(goal)
}
