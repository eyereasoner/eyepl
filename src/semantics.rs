use crate::engine::{instantiate, match_goal, Bindings};
use crate::model::HashMap;
use crate::{Aggregate, AggregateKind, Atom, Error, Goal, Literal, Name, Term, Value};
use std::collections::{BTreeMap, BTreeSet};

pub(crate) struct Budget {
    pub used: usize,
    pub limit: usize,
}
impl Budget {
    pub fn tick(&mut self) -> Result<(), Error> {
        if self.used >= self.limit {
            return Err(Error::new(format!(
                "Incomplete: match limit ({}) reached; no complete answer is available.",
                self.limit
            )));
        }
        self.used += 1;
        Ok(())
    }
}

pub(crate) fn resolve(v: &Value, bindings: &Bindings) -> Value {
    match v {
        Value::Variable(n) => bindings
            .get(n)
            .map(|v| resolve(v, bindings))
            .unwrap_or_else(|| v.clone()),
        Value::Compound(n, a) => {
            Value::Compound(n.clone(), a.iter().map(|v| resolve(v, bindings)).collect())
        }
        v => v.clone(),
    }
}
pub(crate) fn value(term: &Term, bindings: &Bindings) -> Option<Value> {
    let v = resolve(&crate::model::term_value(term), bindings);
    v.ground().then_some(v)
}
pub(crate) fn unify(a: &Value, b: &Value, bindings: &mut Bindings) -> bool {
    let a = resolve(a, bindings);
    let b = resolve(b, bindings);
    if a == b {
        return true;
    }
    match (&a, &b) {
        (Value::Variable(n), v) | (v, Value::Variable(n)) => {
            if crate::model::value_variables(v).contains(n) {
                return false;
            }
            bindings.insert(n.clone(), v.clone());
            true
        }
        (Value::Compound(n, a), Value::Compound(m, b)) if n == m && a.len() == b.len() => {
            a.iter().zip(b).all(|(a, b)| unify(a, b, bindings))
        }
        _ => false,
    }
}
pub(crate) fn bind(term: &Term, v: Value, bindings: &mut Bindings) -> bool {
    unify(&crate::model::term_value(term), &v, bindings)
}

fn fixed_mode_builtin(goal: &Goal, bindings: &Bindings) -> Option<(Atom, Bindings)> {
    let inputs = crate::language::fixed_builtin_inputs(goal).ok()?;
    let args: Vec<_> = goal.terms[..inputs]
        .iter()
        .map(|t| value(t, bindings))
        .collect::<Option<_>>()?;
    let output = match (goal.predicate.as_str(), args.as_slice()) {
        ("add", [Value::Integer(a), Value::Integer(b)]) => Some(Value::Integer(a.checked_add(*b)?)),
        ("sub", [Value::Integer(a), Value::Integer(b)]) => Some(Value::Integer(a.checked_sub(*b)?)),
        ("mul", [Value::Integer(a), Value::Integer(b)]) => Some(Value::Integer(a.checked_mul(*b)?)),
        ("div", [Value::Integer(a), Value::Integer(b)]) => Some(Value::Integer(a.checked_div(*b)?)),
        ("mod", [Value::Integer(a), Value::Integer(b)]) => Some(Value::Integer(a.checked_rem(*b)?)),
        ("abs", [Value::Integer(a)]) => Some(Value::Integer(a.checked_abs()?)),
        ("concat", [Value::Text(a), Value::Text(b)]) => Some(Value::Text(format!("{a}{b}").into())),
        ("strlen", [Value::Text(a)]) => {
            Some(Value::Integer(i64::try_from(a.chars().count()).ok()?))
        }
        ("eq", [a, b]) if a == b => None,
        ("neq", [a, b]) if a != b => None,
        ("lt", [Value::Integer(a), Value::Integer(b)]) if a < b => None,
        ("le", [Value::Integer(a), Value::Integer(b)]) if a <= b => None,
        ("gt", [Value::Integer(a), Value::Integer(b)]) if a > b => None,
        ("ge", [Value::Integer(a), Value::Integer(b)]) if a >= b => None,
        _ => return None,
    };
    let mut next = bindings.clone();
    if let Some(output) = output {
        if !bind(&goal.terms[inputs], output, &mut next) {
            return None;
        }
    }
    Some((instantiate(goal, &next)?, next))
}

fn list(values: Vec<Value>) -> Value {
    values.into_iter().rev().fold(Value::Nil, |tail, head| {
        Value::Compound(".".into(), vec![head, tail])
    })
}
fn items(v: &Value) -> Option<Vec<Value>> {
    let mut result = Vec::new();
    let mut cursor = v;
    while let Value::Compound(n, a) = cursor {
        if n != "." || a.len() != 2 {
            return None;
        }
        result.push(a[0].clone());
        cursor = &a[1];
    }
    (cursor == &Value::Nil).then_some(result)
}
pub(crate) fn builtin(goal: &Goal, bindings: &Bindings) -> Result<Option<(Atom, Bindings)>, Error> {
    use std::cmp::Ordering;
    if !crate::parser::builtin_name(&goal.predicate, goal.terms.len()) {
        return Ok(fixed_mode_builtin(goal, bindings));
    }
    let args: Vec<_> = goal
        .terms
        .iter()
        .map(|t| resolve(&crate::model::term_value(t), bindings))
        .collect();
    let mut next = bindings.clone();
    let require = |v: &Value| -> Result<(), Error> {
        if v.ground() {
            Ok(())
        } else {
            Err(Error::new(format!(
                "{} inputs must be bound by an earlier goal or call.",
                goal.predicate
            )))
        }
    };
    let success = match (goal.predicate.as_str(), args.as_slice()) {
        ("true", []) => true,
        ("false", []) => false,
        ("=", [a, b]) => unify(a, b, &mut next),
        ("\\=", [a, b]) => !unify(a, b, &mut next.clone()),
        ("is", [a, b]) => {
            require(b)?;
            unify(a, &crate::arithmetic::eval(b)?, &mut next)
        }
        ("<" | "=<" | ">" | ">=" | "=:=" | "=\\=", [a, b]) => {
            require(a)?;
            require(b)?;
            let order = crate::arithmetic::compare(
                &crate::arithmetic::eval(a)?,
                &crate::arithmetic::eval(b)?,
            )?;
            match goal.predicate.as_str() {
                "<" => order == Ordering::Less,
                "=<" => order != Ordering::Greater,
                ">" => order == Ordering::Greater,
                ">=" => order != Ordering::Less,
                "=:=" => order == Ordering::Equal,
                _ => order != Ordering::Equal,
            }
        }
        ("@<" | "@=<" | "@>" | "@>=", [a, b]) => {
            require(a)?;
            require(b)?;
            let order = match (a, b) {
                (Value::Symbol(a), Value::Symbol(b)) | (Value::Text(a), Value::Text(b)) => {
                    a.encode_utf16().cmp(b.encode_utf16())
                }
                _ => {
                    return Err(Error::new(
                        "Lexicographic comparisons require two atoms or two strings.",
                    ))
                }
            };
            match goal.predicate.as_str() {
                "@<" => order == Ordering::Less,
                "@=<" => order != Ordering::Greater,
                "@>" => order == Ordering::Greater,
                _ => order != Ordering::Less,
            }
        }
        ("contains_text", [a, b]) => {
            require(a)?;
            require(b)?;
            match (a, b) {
                (Value::Text(a), Value::Text(b)) => a.to_lowercase().contains(&b.to_lowercase()),
                _ => return Err(Error::new("contains_text requires two strings.")),
            }
        }
        ("string_concat", [a, b, c]) => {
            require(a)?;
            require(b)?;
            match (a, b) {
                (Value::Text(a), Value::Text(b)) => {
                    if a.len() + b.len() > crate::model::MAX_TERM_BYTES {
                        return Err(crate::model::term_limit_error(crate::model::MAX_TERM_BYTES));
                    }
                    unify(c, &Value::Text(format!("{a}{b}").into()), &mut next)
                }
                _ => return Err(Error::new("string_concat requires two input strings.")),
            }
        }
        ("string_length", [a, b]) => {
            require(a)?;
            let Value::Text(a) = a else {
                return Err(Error::new("string_length requires a string."));
            };
            unify(b, &Value::Integer(a.chars().count() as i64), &mut next)
        }
        ("atom_codes" | "string_codes", [a, b]) => {
            let text = match a {
                Value::Symbol(s) if goal.predicate == "atom_codes" => Some(s),
                Value::Text(s) if goal.predicate == "string_codes" => Some(s),
                Value::Variable(_) => None,
                _ => {
                    return Err(Error::new(
                        "The first text conversion argument has the wrong type.",
                    ))
                }
            };
            if let Some(text) = text {
                unify(
                    b,
                    &list(text.chars().map(|c| Value::Integer(c as i64)).collect()),
                    &mut next,
                )
            } else {
                require(b)?;
                let codes = items(b).ok_or_else(|| {
                    Error::new("Text codes must be a proper list of Unicode scalar values.")
                })?;
                let text = codes
                    .into_iter()
                    .map(|v| {
                        if let Value::Integer(n) = v {
                            u32::try_from(n).ok().and_then(char::from_u32)
                        } else {
                            None
                        }
                    })
                    .collect::<Option<String>>()
                    .ok_or_else(|| {
                        Error::new("Use valid Unicode scalar values in the codes list.")
                    })?;
                let v = if goal.predicate == "atom_codes" {
                    Value::Symbol(text.into())
                } else {
                    Value::Text(text.into())
                };
                unify(a, &v, &mut next)
            }
        }
        ("=..", [a, b]) => {
            if !matches!(a, Value::Variable(_)) {
                let parts = match a {
                    Value::Compound(n, args) => {
                        let mut v = vec![Value::Symbol(n.clone())];
                        v.extend(args.iter().cloned());
                        v
                    }
                    v => vec![v.clone()],
                };
                unify(b, &list(parts), &mut next)
            } else {
                let parts = items(b)
                    .filter(|v| !v.is_empty())
                    .ok_or_else(|| Error::new("=.. requires a nonempty proper list of parts."))?;
                let v = if parts.len() == 1 {
                    require(&parts[0])?;
                    if matches!(parts[0], Value::Compound(_, _)) {
                        return Err(Error::new(
                            "A singleton parts list requires an atomic value or [].",
                        ));
                    }
                    parts[0].clone()
                } else {
                    let Value::Symbol(name) = &parts[0] else {
                        return Err(Error::new("A compound functor must be an atom."));
                    };
                    Value::Compound(name.clone(), parts[1..].to_vec())
                };
                unify(a, &v, &mut next)
            }
        }
        _ => return Err(Error::new("Unsupported built-in call.")),
    };
    if !success {
        return Ok(None);
    }
    if args.iter().map(|v| resolve(v, &next)).any(|v| !v.valid()) {
        return Err(Error::new(
            "Unification produced an improper list or invalid numeric term.",
        ));
    }
    let values = goal
        .terms
        .iter()
        .map(|t| resolve(&crate::model::term_value(t), &next))
        .collect();
    Ok(Some((
        Atom {
            predicate: goal.predicate.clone(),
            values,
        },
        next,
    )))
}

pub(crate) struct Model<'a> {
    facts: &'a [Atom],
    relations: HashMap<u64, Vec<usize>>,
    positions: HashMap<u64, Vec<usize>>,
    /// Facts by `atom_key`; equal keys are confirmed against `facts`.
    exact: HashMap<u64, Vec<usize>>,
}
impl<'a> Model<'a> {
    pub fn new(facts: &'a [Atom], budget: &mut Budget) -> Result<Self, Error> {
        let mut model = Self {
            facts,
            relations: HashMap::default(),
            positions: HashMap::default(),
            exact: HashMap::default(),
        };
        for (i, atom) in facts.iter().enumerate() {
            budget.tick()?;
            let relation = crate::model::relation_key(&atom.predicate, atom.values.len());
            model.relations.entry(relation).or_default().push(i);
            let exact = model.exact.entry(crate::model::atom_key(atom)).or_default();
            match exact.iter_mut().find(|j| facts[**j] == *atom) {
                Some(j) => *j = i,
                None => exact.push(i),
            }
            for (at, value) in atom.values.iter().enumerate() {
                model
                    .positions
                    .entry(crate::model::position_key(relation, at, value))
                    .or_default()
                    .push(i);
            }
        }
        Ok(model)
    }
    fn contains(&self, atom: &Atom) -> bool {
        self.exact
            .get(&crate::model::atom_key(atom))
            .is_some_and(|ids| ids.iter().any(|&i| self.facts[i] == *atom))
    }
    fn candidates(&self, goal: &Goal, bindings: &Bindings) -> &[usize] {
        if let Some(atom) = instantiate(goal, bindings) {
            return self
                .exact
                .get(&crate::model::atom_key(&atom))
                .map(Vec::as_slice)
                .unwrap_or(&[]);
        }
        let relation = crate::model::relation_key(&goal.predicate, goal.terms.len());
        let mut result = self
            .relations
            .get(&relation)
            .map(Vec::as_slice)
            .unwrap_or(&[]);
        for (at, term) in goal.terms.iter().enumerate() {
            if let Some(value) = value(term, bindings) {
                let candidates = self
                    .positions
                    .get(&crate::model::position_key(relation, at, &value))
                    .map(Vec::as_slice)
                    .unwrap_or(&[]);
                if candidates.len() < result.len() {
                    result = candidates;
                }
            }
        }
        result
    }
}

/// Closed aggregate inputs established by this body's prefix and call mode.
pub(crate) fn aggregate_scope(
    prefix: &[Literal],
    inputs: &BTreeSet<Name>,
    bindings: &Bindings,
) -> Bindings {
    inputs
        .iter()
        .cloned()
        .chain(prefix.iter().flat_map(Literal::variables))
        .filter_map(|name| value(&Term::Variable(name.clone()), bindings).map(|v| (name, v)))
        .collect()
}

/// Finite matching over an already supplied model, without adding facts or
/// searching for their derivations. Used for closure and aggregate re-decision.
pub(crate) fn model_solutions(
    body: &[Literal],
    initial: Bindings,
    model: &Model<'_>,
    budget: &mut Budget,
) -> Result<Vec<Bindings>, Error> {
    let scope = initial.keys().cloned().collect();
    model_solutions_scoped(body, initial, &scope, model, budget)
}

pub(crate) fn model_solutions_scoped(
    body: &[Literal],
    initial: Bindings,
    scope: &BTreeSet<Name>,
    model: &Model<'_>,
    budget: &mut Budget,
) -> Result<Vec<Bindings>, Error> {
    fn visit(
        body: &[Literal],
        at: usize,
        bindings: Bindings,
        scope: &BTreeSet<Name>,
        model: &Model<'_>,
        budget: &mut Budget,
        out: &mut Vec<Bindings>,
    ) -> Result<(), Error> {
        if at == body.len() {
            out.push(bindings);
            return Ok(());
        }
        match &body[at] {
            Literal::Relation(goal) => {
                for &index in model.candidates(goal, &bindings) {
                    budget.tick()?;
                    let mut next = bindings.clone();
                    if match_goal(goal, &model.facts[index], &mut next) {
                        visit(body, at + 1, next, scope, model, budget, out)?;
                    }
                }
            }
            Literal::Builtin(goal) => {
                budget.tick()?;
                if let Some((_, next)) = builtin(goal, &bindings)? {
                    visit(body, at + 1, next, scope, model, budget, out)?;
                }
            }
            Literal::NotBuiltin(goal) => {
                for term in &goal.terms {
                    if value(term, &bindings).is_none() {
                        return Err(Error::new("Negated tests require bound operands."));
                    }
                }
                budget.tick()?;
                if builtin(goal, &bindings)?.is_none() {
                    visit(body, at + 1, bindings, scope, model, budget, out)?;
                }
            }
            Literal::Not(goal) => {
                let atom = instantiate(goal, &bindings)
                    .ok_or_else(|| Error::new("Unbound negative goal."))?;
                budget.tick()?;
                let present = model.contains(&atom);
                if !present {
                    visit(body, at + 1, bindings, scope, model, budget, out)?;
                }
            }
            Literal::Aggregate(a) => {
                let outer = aggregate_scope(&body[..at], scope, &bindings);
                if let Some(result) = aggregate(a, &outer, model, budget)? {
                    let mut next = bindings;
                    if bind(&a.result, result, &mut next) {
                        visit(body, at + 1, next, scope, model, budget, out)?;
                    }
                }
            }
            Literal::Fresh(_) => {
                return Err(Error::new("A fresh witness needs its source rule context."))
            }
        }
        Ok(())
    }
    let mut out = Vec::new();
    visit(body, 0, initial, scope, model, budget, &mut out)?;
    Ok(out)
}

pub(crate) fn aggregate(
    a: &Aggregate,
    outer: &Bindings,
    model: &Model<'_>,
    budget: &mut Budget,
) -> Result<Option<Value>, Error> {
    // Distinct producer tuples retain equal projected values from different
    // subjects, while repeated facts and proof paths contribute only once.
    let names: BTreeSet<_> = a.body.iter().flat_map(Literal::variables).collect();
    let mut tuples = BTreeMap::new();
    for bindings in model_solutions(&a.body, outer.clone(), model, budget)? {
        budget.tick()?;
        let key = names
            .iter()
            .map(|name| value(&Term::Variable(name.clone()), &bindings))
            .collect::<Option<Vec<_>>>()
            .ok_or_else(|| Error::new("Unbound aggregate producer variable."))?;
        let tuple = a
            .template
            .iter()
            .map(|t| value(t, &bindings))
            .collect::<Option<Vec<_>>>()
            .ok_or_else(|| Error::new("Unbound aggregate template."))?;
        tuples.insert(key, tuple);
    }
    if a.kind == AggregateKind::Count {
        return Ok(i64::try_from(tuples.len()).ok().map(Value::Integer));
    }
    let mut values = Vec::new();
    for tuple in tuples.into_values() {
        let element = if a.kind == AggregateKind::List {
            tuple[0].clone()
        } else {
            crate::arithmetic::eval(&tuple[0])?
        };
        values.push(element);
    }
    if a.kind == AggregateKind::List {
        return Ok(Some(list(values)));
    }
    let mut result = if a.kind == AggregateKind::Sum {
        Some(Value::Integer(0))
    } else {
        None
    };
    for value in values {
        result = Some(match result {
            None => value,
            Some(previous) => match a.kind {
                AggregateKind::Sum => {
                    crate::arithmetic::eval(&Value::Compound("+".into(), vec![previous, value]))?
                }
                AggregateKind::Min | AggregateKind::Max => {
                    let order = crate::arithmetic::compare(&previous, &value)?;
                    if (a.kind == AggregateKind::Min && order.is_gt())
                        || (a.kind == AggregateKind::Max && order.is_lt())
                    {
                        value
                    } else {
                        previous
                    }
                }
                _ => unreachable!(),
            },
        });
    }
    Ok(result)
}

pub(crate) fn witness(rule: usize, position: usize, bindings: &Bindings) -> Value {
    // Debug's tagged, escaped value representation keeps kinds and delimiters
    // distinct; this is a scoped identity, not a hash that could collide.
    Value::Witness(format!("r{rule}:g{position}:{bindings:?}").into())
}
