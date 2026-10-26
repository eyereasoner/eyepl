use crate::{
    Aggregate, AggregateKind, Atom, Error, Goal, Literal, Program, Query, Rule, Term, Value,
};
use num_bigint::BigInt;

#[derive(Clone, Debug, PartialEq, Eq)]
enum Token {
    Name(String),
    Variable(String),
    Text(String),
    Number(String),
    Symbol(String),
    End,
}
struct Parser {
    tokens: Vec<(Token, usize)>,
    position: usize,
    anonymous: usize,
    depth: usize,
}
fn tokenize(source: &str) -> Result<Vec<(Token, usize)>, Error> {
    let chars: Vec<_> = source.chars().collect();
    let (mut at, mut line, mut tokens) = (0, 1, Vec::new());
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
                Token::Name(text)
            } else {
                Token::Text(text)
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
            Token::Number(chars[start..at].iter().collect())
        } else if c.is_ascii_alphabetic() || c == '_' {
            let start = at;
            at += 1;
            while chars
                .get(at)
                .is_some_and(|c| c.is_ascii_alphanumeric() || *c == '_')
            {
                at += 1;
            }
            let name = chars[start..at].iter().collect();
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
                let width = op.chars().count();
                if chars
                    .get(at..at + width)
                    .is_some_and(|part| part.iter().copied().eq(op.chars()))
                {
                    found = Some(op.to_string());
                    break;
                }
            }
            let op = found.unwrap_or_else(|| c.to_string());
            at += op.chars().count();
            if !matches!(
                op.as_str(),
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
                    "Line {line}: Unexpected character {c:?}; use extended Datalog syntax."
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
            Token::Symbol(op)
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
    fn primary(&mut self) -> Result<(Value, u8), Error> {
        self.depth += 1;
        if self.depth > 256 {
            return Err(self.error("Term nesting exceeds the parser limit (256)."));
        }
        let token = self.peek().clone();
        self.position += 1;
        let mut priority = u8::MAX;
        let value = match token {
            Token::Variable(name) if name == "_" => {
                self.anonymous += 1;
                Value::Variable(format!("_${}", self.anonymous))
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
                    let mut args = vec![self.expression(0)?];
                    while self.take(",") {
                        args.push(self.expression(0)?);
                        if args.len() > 64 {
                            return Err(self.error("A term supports at most 64 arguments."));
                        }
                    }
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
                    Value::Compound(name, args)
                } else {
                    Value::Symbol(name)
                }
            }
            Token::Symbol(s) if s == "(" => {
                let v = self.expression(0)?;
                self.expect(")")?;
                v
            }
            Token::Symbol(s) if s == "[" => {
                let mut args = Vec::new();
                if !self.is("]") {
                    args.push(self.expression(0)?);
                    while self.take(",") {
                        args.push(self.expression(0)?);
                    }
                }
                let mut tail = if self.take("|") {
                    self.expression(0)?
                } else {
                    Value::Nil
                };
                self.expect("]")?;
                if !matches!(&tail, Value::Nil | Value::Variable(_))
                    && !matches!(&tail,Value::Compound(n,a) if n=="." && a.len()==2)
                {
                    return Err(self.error("A list tail must be a list or variable."));
                }
                for arg in args.into_iter().rev() {
                    tail = Value::Compound(".".into(), vec![arg, tail]);
                }
                tail
            }
            Token::Symbol(s) if matches!(s.as_str(), "-" | "+" | "\\") => {
                let v = self.expression(5)?;
                priority = 5;
                if s == "-" {
                    match v {
                        Value::Integer(n) => {
                            priority = u8::MAX;
                            crate::arithmetic::integer(-BigInt::from(n))
                        }
                        Value::BigInteger(n) => {
                            priority = u8::MAX;
                            crate::arithmetic::integer(-n)
                        }
                        Value::Real(b) => {
                            priority = u8::MAX;
                            crate::arithmetic::real(-f64::from_bits(b))?
                        }
                        v => Value::Compound(s, vec![v]),
                    }
                } else {
                    Value::Compound(s, vec![v])
                }
            }
            Token::Symbol(s) if s == "~" => {
                let Token::Text(s) = self.peek().clone() else {
                    return Err(self.error("A witness needs a quoted identity."));
                };
                self.position += 1;
                Value::Witness(s)
            }
            _ => {
                return Err(
                    self.error("Expected an atom, number, string, variable, compound, or list.")
                )
            }
        };
        self.depth -= 1;
        Ok((value, priority))
    }
    fn expression(&mut self, min: u8) -> Result<Value, Error> {
        self.expression_with_priority(min).map(|(value, _)| value)
    }
    fn expression_with_priority(&mut self, min: u8) -> Result<(Value, u8), Error> {
        let (mut left, mut priority) = self.primary()?;
        while let Some((precedence, right)) = binary(self.spelling()) {
            if precedence < min {
                break;
            }
            let op = self.spelling().to_string();
            if priority < precedence || ((right || op == "**") && priority == precedence) {
                return Err(self.error("Parenthesize operators with incompatible priorities."));
            }
            self.position += 1;
            let rhs_min = precedence + u8::from(!right);
            let (rhs, rhs_priority) = self.expression_with_priority(rhs_min)?;
            if rhs_priority < rhs_min {
                return Err(self.error("Parenthesize operators with incompatible priorities."));
            }
            left = Value::Compound(op, vec![left, rhs]);
            priority = precedence;
        }
        Ok((left, priority))
    }
    fn as_goal(&self, v: Value) -> Result<Goal, Error> {
        if !v.valid() {
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
            let predicate = self.spelling().to_string();
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
        program.validate()?;
        Ok(program)
    }
}
pub fn parse(source: &str) -> Result<Program, Error> {
    Parser::new(source)?.program()
}
pub fn parse_atom(source: &str) -> Result<Atom, Error> {
    let mut p = Parser::new(source)?;
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
    let value = p.expression(0)?;
    let goal = p.as_goal(value)?;
    p.expect(".")?;
    if p.peek() != &Token::End {
        return Err(p.error("Expected one goal."));
    }
    Ok(goal)
}
