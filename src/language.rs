use crate::model::term_variables;
use crate::model::HashMap;
use crate::{AggregateKind, Error, Goal, Literal, Name, Program, Term, Value};
use std::collections::BTreeSet;

pub(crate) type Relation = (Name, usize);
pub(crate) fn relation(goal: &Goal) -> Relation {
    (goal.predicate.clone(), goal.terms.len())
}

pub(crate) struct Plan {
    pub levels: HashMap<Relation, usize>,
    pub rules: Vec<usize>,
    pub demand_driven: Vec<bool>,
    pub range_restricted: Vec<bool>,
    pub demands: HashMap<Relation, Vec<usize>>,
    /// Lean satisfaction tests (Section 8.3), which read only facts of their
    /// own or lower strata because their witness rule's conclusions are not
    /// counted among their producers.
    pub satisfaction: Vec<bool>,
    /// Witness rules whose conclusions some satisfaction test ignores.
    witness: Vec<bool>,
    heads: Vec<Goal>,
    producers: HashMap<Relation, Producers>,
}
type ProducerSlot = (HashMap<Value, Vec<usize>>, Vec<usize>);

#[derive(Default)]
struct Producers {
    all: Vec<usize>,
    slots: Vec<ProducerSlot>,
}
fn atomic(term: &Term) -> Option<&Value> {
    match term {
        Term::Constant(v) if !matches!(v, Value::Compound(_, _) | Value::Variable(_)) => Some(v),
        _ => None,
    }
}
fn candidates(goal: &Goal, heads: &[Goal], index: &HashMap<Relation, Producers>) -> Vec<usize> {
    let Some(entry) = index.get(&relation(goal)) else {
        return Vec::new();
    };
    let mut selected: Option<(&[usize], &[usize])> = None;
    let mut size = entry.all.len();
    for (i, term) in goal.terms.iter().enumerate() {
        if let Some(value) = atomic(term) {
            let (values, wildcard) = &entry.slots[i];
            let matching = values.get(value).map(Vec::as_slice).unwrap_or(&[]);
            if matching.len() + wildcard.len() < size {
                size = matching.len() + wildcard.len();
                selected = Some((matching, wildcard));
            }
        }
    }
    let mut result = if let Some((matching, wildcard)) = selected {
        matching.iter().chain(wildcard).copied().collect()
    } else {
        entry.all.clone()
    };
    result.retain(|id| {
        !heads[*id]
            .terms
            .iter()
            .zip(&goal.terms)
            .any(|(a, b)| matches!((atomic(a),atomic(b)),(Some(a),Some(b)) if a!=b))
    });
    result
}
fn goal_dependencies<'a>(literal: &'a Literal, strict: bool, out: &mut Vec<(&'a Goal, bool)>) {
    match literal {
        Literal::Relation(g) => out.push((g, strict)),
        Literal::Not(g) => out.push((g, true)),
        Literal::Aggregate(a) => {
            for l in &a.body {
                goal_dependencies(l, true, out);
            }
        }
        _ => {}
    }
}
impl Plan {
    pub fn goal_level(&self, goal: &Goal) -> usize {
        candidates(goal, &self.heads, &self.producers)
            .into_iter()
            .map(|i| self.rules[i])
            .max()
            .unwrap_or(0)
    }
    /// The lowest boundary level that records a demanded call: its goal level
    /// without witness rules, since a lean satisfaction test at a lower level
    /// calls that relation before their conclusions exist (Section 8.3).
    pub fn call_level(&self, goal: &Goal) -> usize {
        candidates(goal, &self.heads, &self.producers)
            .into_iter()
            .filter(|i| !self.witness[*i])
            .map(|i| self.rules[i])
            .max()
            .unwrap_or(0)
    }
    pub fn step_level(&self, step: &crate::Step) -> Option<usize> {
        match step.justification {
            crate::Justification::Rule { rule, .. } => {
                self.rules.get(rule.checked_sub(1)?).copied()
            }
            _ => Some(0),
        }
    }
    pub fn boundary(&self, literal: &Literal) -> usize {
        let mut deps = Vec::new();
        goal_dependencies(literal, false, &mut deps);
        deps.iter()
            .map(|(g, _)| self.goal_level(g))
            .max()
            .unwrap_or(0)
    }
}

/// Built-ins have explicit input modes; arithmetic relations never enumerate an
/// unbounded domain. The optional final argument is a deterministic output.
pub(crate) fn fixed_builtin_inputs(goal: &Goal) -> Result<usize, Error> {
    let (arity, inputs) = match goal.predicate.as_str() {
        "add" | "sub" | "mul" | "div" | "mod" | "concat" => (3, 2),
        "abs" | "strlen" => (2, 1),
        "eq" | "neq" | "lt" | "le" | "gt" | "ge" => (2, 2),
        name => {
            return Err(Error::new(format!(
                "Unknown built-in {name}/{}.",
                goal.terms.len()
            )))
        }
    };
    if goal.terms.len() != arity {
        return Err(Error::new(format!(
            "{} needs {arity} arguments.",
            goal.predicate
        )));
    }
    Ok(inputs)
}

fn source_term(term: &Term) -> Result<(), Error> {
    let Term::Constant(value) = term else {
        return Ok(());
    };
    if !value.valid() {
        return Err(Error::new(
            "Use proper lists and valid finite numeric terms.",
        ));
    }
    if value.has_witness() {
        return Err(Error::new(
            "Witness constants belong to certificates, not source programs.",
        ));
    }
    Ok(())
}
fn goal_shape(goal: &Goal) -> Result<(), Error> {
    if goal.terms.len() > 64 {
        return Err(Error::new("A relation supports at most 64 arguments."));
    }
    for t in &goal.terms {
        source_term(t)?;
    }
    Ok(())
}

fn literal_shapes(body: &[Literal], fresh: bool, nested: bool) -> Result<(), Error> {
    if body.len() > 64 {
        return Err(Error::new("Use at most 64 body goals."));
    }
    for (at, literal) in body.iter().enumerate() {
        match literal {
            Literal::Relation(g)
            | Literal::Builtin(g)
            | Literal::Not(g)
            | Literal::NotBuiltin(g) => goal_shape(g)?,
            Literal::Aggregate(a) => {
                if a.template.len() != usize::from(a.kind != AggregateKind::Count)
                    || a.body.is_empty()
                {
                    return Err(Error::new("Invalid aggregate template or empty producer."));
                }
                for term in a.template.iter().chain(std::iter::once(&a.result)) {
                    source_term(term)?;
                }
                literal_shapes(&a.body, false, true)?;
            }
            Literal::Fresh(term) => {
                source_term(term)?;
                if !fresh || nested || at + 1 != body.len() {
                    return Err(Error::new(
                        "fresh is allowed only as the final goal of a range-restricted rule.",
                    ));
                }
            }
        }
    }
    Ok(())
}

/// Left-to-right safety also defines aggregate grouping: an already bound name
/// is a parameter; new producer names have only that aggregate's scope.
pub(crate) fn bound_after(
    body: &[Literal],
    mut bound: BTreeSet<Name>,
    fresh: bool,
    nested: bool,
) -> Result<(BTreeSet<Name>, bool), Error> {
    if body.len() > 64 {
        return Err(Error::new("Use 1 to 64 body goals."));
    }
    let mut generates = false;
    for (position, literal) in body.iter().enumerate() {
        match literal {
            Literal::Relation(g) => {
                goal_shape(g)?;
                bound.extend(g.variables());
            }
            Literal::Builtin(g) => {
                goal_shape(g)?;
                if crate::parser::builtin_name(&g.predicate, g.terms.len()) {
                    let vars = g.variables();
                    let known = |i: usize| term_variables(&g.terms[i..i + 1]).is_subset(&bound);
                    let produces = match g.predicate.as_str() {
                        "is" => known(1),
                        "=" | "=.." | "atom_chars" | "atom_codes" | "number_chars"
                        | "string_codes" => known(0) || known(1),
                        "string_concat" => known(0) && known(1),
                        "atom_concat" => {
                            (known(0) && known(1)) || (known(2) && (known(0) || known(1)))
                        }
                        "string_length" => known(0),
                        "true" | "false" => true,
                        _ => vars.is_subset(&bound),
                    };
                    if !produces {
                        return Err(Error::new(format!(
                            "{} inputs require call bindings.",
                            g.predicate
                        )));
                    }
                    generates |= !vars.is_subset(&bound);
                    if !matches!(g.predicate.as_str(), "\\=" | "true" | "false") {
                        bound.extend(vars);
                    }
                    continue;
                }
                let inputs = fixed_builtin_inputs(g)?;
                if !term_variables(&g.terms[..inputs]).is_subset(&bound) {
                    return Err(Error::new(format!(
                        "{} inputs must be bound by earlier goals.",
                        g.predicate
                    )));
                }
                if !term_variables(&g.terms[inputs..]).is_subset(&bound) {
                    generates = true;
                }
                bound.extend(g.variables());
            }
            Literal::Not(g) | Literal::NotBuiltin(g) => {
                goal_shape(g)?;
                if !g.variables().is_subset(&bound) {
                    return Err(Error::new(
                        "Every variable in a negated goal must be bound by an earlier goal.",
                    ));
                }
            }
            Literal::Aggregate(a) => {
                let expected = usize::from(a.kind != AggregateKind::Count);
                if a.template.len() != expected {
                    return Err(Error::new(
                        "Use count without a value, or sum/min/max with one value.",
                    ));
                }
                for t in a.template.iter().chain(std::iter::once(&a.result)) {
                    source_term(t)?;
                }
                let (inner, _) = bound_after(&a.body, bound.clone(), false, true)?;
                if !term_variables(&a.template).is_subset(&inner) {
                    return Err(Error::new(
                        "Every aggregate template variable must be bound by its goals.",
                    ));
                }
                bound.extend(term_variables(std::slice::from_ref(&a.result)));
                generates = true;
            }
            Literal::Fresh(t) => {
                if !fresh || nested || position + 1 != body.len() {
                    return Err(Error::new(
                        "fresh/1 is allowed only as the final goal of a rule.",
                    ));
                }
                let Term::Variable(name) = t else {
                    return Err(Error::new("fresh/1 needs a new output variable."));
                };
                if bound.contains(name) {
                    return Err(Error::new(
                        "fresh/1 needs a variable not bound by an earlier goal.",
                    ));
                }
                bound.insert(name.clone());
                generates = true;
            }
        }
    }
    Ok((bound, generates))
}

fn dependencies_of(literal: &Literal, strict: bool, output: &mut Vec<(Relation, bool)>) {
    match literal {
        Literal::Relation(g) => output.push((relation(g), strict)),
        Literal::Not(g) => output.push((relation(g), true)),
        Literal::Aggregate(a) => {
            for g in &a.body {
                dependencies_of(g, true, output);
            }
        }
        _ => {}
    }
}

/// The witness rules whose conclusions a lean satisfaction test ignores. The
/// test `'$satisfied:K'` decides, by completed negation in `'$lean:K'`, whether
/// the rule reading `'$lean:K'` introduces a witness, so those conclusions are
/// later evidence rather than inputs to the test (Section 8.3).
fn own_conclusions(program: &Program, helper: usize) -> Vec<usize> {
    let Some(tag) = program.rules[helper]
        .head
        .predicate
        .strip_prefix(crate::parser::SATISFIED)
    else {
        return Vec::new();
    };
    let lean = format!("{}{tag}", crate::parser::LEAN);
    program
        .rules
        .iter()
        .enumerate()
        .filter(|(_, r)| {
            r.body
                .iter()
                .any(|l| matches!(l, Literal::Relation(g) if g.predicate == lean))
        })
        .map(|(i, _)| i)
        .collect()
}

pub(crate) fn plan(program: &Program) -> Result<Plan, Error> {
    for request in &program.requests {
        if let crate::Request::Answer(i) | crate::Request::Result(i) = request {
            if *i >= program.queries.len() {
                return Err(Error::new("Output request refers to an unknown query."));
            }
        }
    }
    let mut levels = HashMap::default();

    let mut demand_driven = Vec::new();
    let mut range_restricted = Vec::new();
    for atom in &program.facts {
        if atom.values.len() > 64 {
            return Err(Error::new("A relation supports at most 64 arguments."));
        }
        if atom.values.iter().any(|v| !v.ground() || !v.valid()) {
            return Err(Error::new(
                "Source facts must be ground proper terms with finite numbers.",
            ));
        }
        if crate::parser::builtin_name(&atom.predicate, atom.values.len()) {
            return Err(Error::new("A fact must name an ordinary predicate."));
        }
        if atom.values.iter().any(Value::has_witness) {
            return Err(Error::new("Source facts cannot supply witness identities."));
        }
        levels.insert((atom.predicate.clone(), atom.values.len()), 0);
    }
    for rule in &program.rules {
        goal_shape(&rule.head)?;
        if crate::parser::builtin_name(&rule.head.predicate, rule.head.terms.len()) {
            return Err(Error::new("A rule head must name an ordinary predicate."));
        }
        literal_shapes(&rule.body, true, false)?;
        let forward = bound_after(&rule.body, BTreeSet::new(), true, false)
            .is_ok_and(|(bound, _)| rule.head.variables().is_subset(&bound));
        range_restricted.push(forward);
        demand_driven.push(
            !forward || program.tables.contains(&relation(&rule.head)) || rule.body.is_empty(),
        );
        if !forward && rule.body.iter().any(|l| matches!(l, Literal::Fresh(_))) {
            return Err(Error::new(
                "fresh needs safe preceding goals and a new final output variable.",
            ));
        }
    }
    for (i, query) in program.queries.iter().enumerate() {
        literal_shapes(&query.goals, false, false)?;
        let mut supplied = BTreeSet::new();
        for literal in &query.goals {
            supplied.extend(literal.variables());
        }
        let (bound, _) = bound_after(&query.goals, supplied, false, false)?;
        let projected: BTreeSet<_> = query.variables.iter().cloned().collect();
        if projected.len() != query.variables.len() || !projected.is_subset(&bound) {
            return Err(Error::new(format!(
                "Query {} has invalid projected variables.",
                i + 1
            )));
        }
        for literal in &query.goals {
            let mut deps = Vec::new();
            dependencies_of(literal, false, &mut deps);
            for (dependency, _) in deps {
                levels.entry(dependency).or_insert(0);
            }
        }
    }
    let heads: Vec<_> = program.rules.iter().map(|r| r.head.clone()).collect();
    let mut producers: HashMap<Relation, Producers> = HashMap::default();
    for (id, head) in heads.iter().enumerate() {
        let entry = producers.entry(relation(head)).or_default();
        entry.all.push(id);
        entry.slots.resize_with(head.terms.len(), Default::default);
        for (position, term) in head.terms.iter().enumerate() {
            if let Some(value) = atomic(term) {
                entry.slots[position]
                    .0
                    .entry(value.clone())
                    .or_default()
                    .push(id);
            } else {
                entry.slots[position].1.push(id);
            }
        }
    }
    let count = heads.len();
    let mut outgoing = vec![Vec::new(); count];
    let mut incoming = vec![Vec::new(); count];
    let mut deps = Vec::new();
    let mut satisfaction = vec![false; count];
    let mut witness = vec![false; count];
    for (target, rule) in program.rules.iter().enumerate() {
        deps.clear();
        for l in &rule.body {
            goal_dependencies(l, false, &mut deps);
        }
        let own = own_conclusions(program, target);
        satisfaction[target] = !own.is_empty();
        for &i in &own {
            witness[i] = true;
        }
        for &(goal, strict) in &deps {
            for source in candidates(goal, &heads, &producers) {
                if own.contains(&source) {
                    continue;
                }
                outgoing[source].push((target, strict));
                incoming[target].push(source);
            }
        }
    }
    let mut visited = vec![false; count];
    let mut order = Vec::new();
    let mut stack = Vec::new();
    for root in 0..count {
        if visited[root] {
            continue;
        }
        visited[root] = true;
        stack.push((root, 0));
        while let Some((id, at)) = stack.last_mut() {
            if *at == outgoing[*id].len() {
                order.push(*id);
                stack.pop();
            } else {
                let next = outgoing[*id][*at].0;
                *at += 1;
                if !visited[next] {
                    visited[next] = true;
                    stack.push((next, 0));
                }
            }
        }
    }
    let mut component = vec![usize::MAX; count];
    let mut components = 0;
    let mut stack = Vec::new();
    for root in order.into_iter().rev() {
        if component[root] != usize::MAX {
            continue;
        }
        component[root] = components;
        stack.push(root);
        while let Some(id) = stack.pop() {
            for &next in &incoming[id] {
                if component[next] == usize::MAX {
                    component[next] = components;
                    stack.push(next);
                }
            }
        }
        components += 1;
    }
    let mut edges = vec![Vec::new(); components];
    let mut indegree = vec![0; components];
    for (source, targets) in outgoing.iter().enumerate() {
        for &(target, strict) in targets {
            let (a, b) = (component[source], component[target]);
            if a == b {
                if strict {
                    return Err(Error::new(
                        "Negation and aggregation must be stratified: a dependency cycle crosses a negative or aggregate goal.",
                    ));
                }
            } else {
                edges[a].push((b, strict));
                indegree[b] += 1;
            }
        }
    }
    let mut heights = vec![0; components];
    for (i, r) in program.rules.iter().enumerate() {
        if r.body
            .iter()
            .any(|l| matches!(l, Literal::Aggregate(_) | Literal::Not(_)))
        {
            heights[component[i]] = 1;
        }
    }
    let mut queue: std::collections::VecDeque<_> = indegree
        .iter()
        .enumerate()
        .filter_map(|(i, n)| (*n == 0).then_some(i))
        .collect();
    while let Some(from) = queue.pop_front() {
        for &(to, strict) in &edges[from] {
            heights[to] = heights[to].max(heights[from] + usize::from(strict));
            indegree[to] -= 1;
            if indegree[to] == 0 {
                queue.push_back(to);
            }
        }
    }
    let rules: Vec<_> = component.iter().map(|i| heights[*i]).collect();
    for (i, head) in heads.iter().enumerate() {
        let level = levels.entry(relation(head)).or_insert(0);
        *level = (*level).max(rules[i]);
    }
    let mut demands: HashMap<Relation, Vec<usize>> = HashMap::default();
    for (i, rule) in program.rules.iter().enumerate() {
        if demand_driven[i] {
            demands.entry(relation(&rule.head)).or_default().push(i);
        }
    }
    Ok(Plan {
        levels,
        rules,
        demand_driven,
        range_restricted,
        demands,
        satisfaction,
        witness,
        heads,
        producers,
    })
}
