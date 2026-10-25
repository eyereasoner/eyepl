use crate::engine::{instantiate, match_goal, Bindings};
use crate::language::{bound_after, plan, Plan};
use crate::semantics::{aggregate, bind, builtin, model_solutions, witness, Budget};
use crate::{parse_atom, Atom, Error, Goal, Literal, Program, Run, Term, Value};
use std::collections::{BTreeSet, HashMap, HashSet};
use std::fmt;

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Owner {
    Rule(usize),
    Query(usize),
}
impl fmt::Display for Owner {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Rule(n) => write!(f, "r{n}"),
            Self::Query(n) => write!(f, "q{n}"),
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum Justification {
    Source(usize),
    Rule {
        rule: usize,
        premises: Vec<usize>,
    },
    Builtin,
    NotBuiltin,
    Absent {
        boundary: usize,
    },
    Aggregate {
        owner: Owner,
        position: usize,
        boundary: usize,
    },
    Fresh {
        rule: usize,
        position: usize,
    },
}
impl Justification {
    pub(crate) fn ordinary(&self) -> bool {
        matches!(self, Self::Source(_) | Self::Rule { .. })
    }
    fn boundary(&self) -> Option<usize> {
        match self {
            Self::Absent { boundary } | Self::Aggregate { boundary, .. } => Some(*boundary),
            _ => None,
        }
    }
}
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub struct Step {
    pub atom: Atom,
    pub justification: Justification,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Boundary {
    pub level: usize,
    pub steps: Vec<usize>,
    pub calls: Vec<Goal>,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Claim {
    Answer { query: usize, premises: Vec<usize> },
    Derived(usize),
}
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct Certificate {
    pub steps: Vec<Step>,
    pub claims: Vec<Claim>,
    pub boundaries: Vec<Boundary>,
}

pub(crate) fn body(program: &Program, owner: Owner) -> Option<&[Literal]> {
    match owner {
        Owner::Rule(n) => program
            .rules
            .get(n.checked_sub(1)?)
            .map(|r| r.body.as_slice()),
        Owner::Query(n) => program
            .queries
            .get(n.checked_sub(1)?)
            .map(|q| q.goals.as_slice()),
    }
}
pub(crate) fn witness_goal(program: &Program, owner: Owner, position: usize) -> Option<Goal> {
    let goals = body(program, owner)?;
    let at = position.checked_sub(1)?;
    let Literal::Fresh(result) = goals.get(at)? else {
        return None;
    };
    let result = result.clone();
    let bound = if at == 0 {
        BTreeSet::new()
    } else {
        bound_after(&goals[..at], BTreeSet::new(), false, false)
            .ok()?
            .0
    };
    let mut terms: Vec<_> = bound.into_iter().map(Term::Variable).collect();
    terms.push(result);
    Some(Goal {
        predicate: format!("$fresh:{owner}:{position}"),
        terms,
    })
}
fn aggregate_names(program: &Program, owner: Owner, position: usize) -> BTreeSet<String> {
    let mut names: BTreeSet<_> = body(program, owner).unwrap()[..position - 1]
        .iter()
        .flat_map(Literal::variables)
        .collect();
    if let Owner::Rule(n) = owner {
        names.extend(program.rules[n - 1].head.variables());
    }
    names
}
pub(crate) fn aggregate_atom(
    program: &Program,
    owner: Owner,
    position: usize,
    outer: &Bindings,
    result: Value,
) -> Atom {
    let mut groups = Vec::new();
    for name in aggregate_names(program, owner, position) {
        if let Some(value) = crate::semantics::value(&Term::Variable(name.clone()), outer) {
            groups.push(Value::Compound(
                "binding".into(),
                vec![Value::Symbol(name), value],
            ));
        }
    }
    let groups = groups.into_iter().rev().fold(Value::Nil, |tail, item| {
        Value::Compound(".".into(), vec![item, tail])
    });
    Atom {
        predicate: format!("$aggregate:{owner}:{position}"),
        values: vec![groups, result],
    }
}
fn aggregate_bindings(
    program: &Program,
    owner: Owner,
    position: usize,
    atom: &Atom,
) -> Option<Bindings> {
    if atom.predicate != format!("$aggregate:{owner}:{position}") || atom.values.len() != 2 {
        return None;
    }
    let names = aggregate_names(program, owner, position);
    let mut bindings = Bindings::new();
    let mut cursor = &atom.values[0];
    let mut previous: Option<&str> = None;
    while let Value::Compound(cons, items) = cursor {
        if cons != "." || items.len() != 2 {
            return None;
        }
        let Value::Compound(binding, pair) = &items[0] else {
            return None;
        };
        if binding != "binding" || pair.len() != 2 {
            return None;
        }
        let Value::Symbol(name) = &pair[0] else {
            return None;
        };
        if previous.is_some_and(|p| p >= name.as_str()) {
            return None;
        }
        previous = Some(name);
        if !names.contains(name)
            || !pair[1].ground()
            || !pair[1].valid()
            || bindings.insert(name.clone(), pair[1].clone()).is_some()
        {
            return None;
        }
        cursor = &items[1];
    }
    (cursor == &Value::Nil).then_some(bindings)
}
fn witness_bindings(goal: &Goal, atom: &Atom) -> Option<Bindings> {
    if goal.predicate != atom.predicate || goal.terms.len() != atom.values.len() {
        return None;
    }
    let mut bindings = Bindings::new();
    for (term, v) in goal.terms[..goal.terms.len() - 1].iter().zip(&atom.values) {
        if !bind(term, v.clone(), &mut bindings) {
            return None;
        }
    }
    Some(bindings)
}

fn claim_premises(claim: &Claim) -> Vec<usize> {
    match claim {
        Claim::Derived(id) => vec![*id],
        Claim::Answer { premises, .. } => premises.clone(),
    }
}

impl Run {
    /// Select ordinary query answers and the evidence supporting them.
    pub fn certificate(&self, program: &Program) -> Certificate {
        Certificate::from_run(program, self)
    }
}

impl Certificate {
    pub(crate) fn from_run(program: &Program, run: &Run) -> Self {
        Self::from_run_for(program, run, None)
    }
    pub(crate) fn from_run_for(program: &Program, run: &Run, query: Option<usize>) -> Self {
        let mut claims: Vec<_> = if program.queries.is_empty() {
            run.steps
                .iter()
                .enumerate()
                .filter_map(|(i, s)| {
                    matches!(s.justification, Justification::Rule { .. })
                        .then_some(Claim::Derived(i + 1))
                })
                .collect()
        } else {
            run.answers
                .iter()
                .enumerate()
                .filter(|(q, _)| {
                    (query.is_some()
                        || program.requests.is_empty()
                        || program.requests.contains(&crate::Request::Answer(*q)))
                        && query.is_none_or(|index| index == *q)
                })
                .flat_map(|(q, answers)| {
                    answers.iter().map(move |a| Claim::Answer {
                        query: q + 1,
                        premises: a.premises.clone(),
                    })
                })
                .collect()
        };
        // Dense step IDs already provide topological order. Mark dependencies
        // directly, then scan once; sorting a set would add a log(depth) cost.
        let mut needed = vec![false; run.steps.len()];
        let mut used_boundaries = vec![false; run.boundaries.len()];
        let mut pending: Vec<_> = claims.iter().flat_map(claim_premises).collect();
        while let Some(id) = pending.pop() {
            if !std::mem::replace(&mut needed[id - 1], true) {
                let step = &run.steps[id - 1];
                if let Justification::Rule { premises, .. } = &step.justification {
                    pending.extend(premises);
                }
                if let Some(b) = step.justification.boundary() {
                    if !std::mem::replace(&mut used_boundaries[b - 1], true) {
                        pending.extend(&run.boundaries[b - 1].steps);
                    }
                }
            }
        }
        let mut names = vec![0; run.steps.len() + 1];
        let mut count = 0;
        for (index, used) in needed.iter().enumerate() {
            if *used {
                count += 1;
                names[index + 1] = count;
            }
        }
        let mut boundary_names = vec![0; run.boundaries.len() + 1];
        let boundaries = used_boundaries
            .into_iter()
            .enumerate()
            .filter(|(_, used)| *used)
            .enumerate()
            .map(|(new, (index, _))| {
                boundary_names[index + 1] = new + 1;
                Boundary {
                    level: run.boundaries[index].level,
                    calls: run.boundaries[index].calls.clone(),
                    steps: run.boundaries[index]
                        .steps
                        .iter()
                        .map(|id| names[*id])
                        .collect(),
                }
            })
            .collect();
        let steps = needed
            .into_iter()
            .enumerate()
            .filter(|(_, used)| *used)
            .map(|(index, _)| {
                let mut step = run.steps[index].clone();
                match &mut step.justification {
                    Justification::Rule { premises, .. } => {
                        for p in premises {
                            *p = names[*p];
                        }
                    }
                    Justification::Absent { boundary }
                    | Justification::Aggregate { boundary, .. } => {
                        *boundary = boundary_names[*boundary]
                    }
                    _ => {}
                }
                step
            })
            .collect();
        for claim in &mut claims {
            match claim {
                Claim::Derived(id) => *id = names[*id],
                Claim::Answer { premises, .. } => {
                    for p in premises {
                        *p = names[*p];
                    }
                }
            }
        }
        Self {
            steps,
            claims,
            boundaries,
        }
    }
    pub fn parse(source: &str) -> Result<Self, Error> {
        Self::read(source).map_err(|e| Error::new(format!("Invalid proof [C3 justification]: {e}")))
    }
    fn read(source: &str) -> Result<Self, Error> {
        let mut lines = source.lines();
        if lines.next() != Some("wheye-proof 1") {
            return Err(Error::new("Expected certificate header: wheye-proof 1."));
        }
        let mut result = Self::default();
        let mut claims = false;
        for (line_number, line) in lines.enumerate() {
            let line = line.trim();
            if line.is_empty() || line.starts_with('%') {
                continue;
            }
            let invalid = || {
                Error::new(format!(
                    "Certificate line {}: invalid record.",
                    line_number + 2
                ))
            };
            if line.starts_with("step ") {
                if claims {
                    return Err(invalid());
                }
                let (metadata, atom) = line.split_once(" : ").ok_or_else(invalid)?;
                let fields: Vec<_> = metadata.split_whitespace().collect();
                if fields.len() < 3 || number(fields[1])? != result.steps.len() + 1 {
                    return Err(invalid());
                }
                let justification = match &fields[2..] {
                    ["source", n] => Justification::Source(number(n)?),
                    ["rule", n, ps] => Justification::Rule {
                        rule: number(n)?,
                        premises: references(ps)?,
                    },
                    ["builtin"] => Justification::Builtin,
                    ["not-builtin"] => Justification::NotBuiltin,
                    ["absent", b] => Justification::Absent {
                        boundary: number(b)?,
                    },
                    ["aggregate", owner, pos, b] => Justification::Aggregate {
                        owner: read_owner(owner)?,
                        position: number(pos)?,
                        boundary: number(b)?,
                    },
                    ["fresh", rule, pos] => Justification::Fresh {
                        rule: number(rule)?,
                        position: number(pos)?,
                    },
                    _ => return Err(invalid()),
                };
                result.steps.push(Step {
                    atom: parse_atom(atom)?,
                    justification,
                });
            } else if let Some(demand) = line.strip_prefix("demand ") {
                if claims {
                    return Err(invalid());
                }
                let (id, goal) = demand.split_once(" : ").ok_or_else(invalid)?;
                let boundary = result
                    .boundaries
                    .get_mut(number(id)? - 1)
                    .ok_or_else(invalid)?;
                boundary.calls.push(crate::parser::parse_goal(goal)?);
            } else {
                let fields: Vec<_> = line.split_whitespace().collect();
                match fields.as_slice() {
                    ["boundary", id, "level", level, ps]
                        if !claims && number(id)? == result.boundaries.len() + 1 =>
                    {
                        let level = level.parse().map_err(|_| invalid())?;
                        result.boundaries.push(Boundary {
                            level,
                            steps: references(ps)?,
                            calls: Vec::new(),
                        });
                    }
                    ["answer", q, ps] => {
                        claims = true;
                        result.claims.push(Claim::Answer {
                            query: number(q)?,
                            premises: references(ps)?,
                        });
                    }
                    ["derived", id] => {
                        claims = true;
                        result.claims.push(Claim::Derived(number(id)?));
                    }
                    _ => return Err(invalid()),
                }
            }
        }
        Ok(result)
    }
}
fn read_owner(text: &str) -> Result<Owner, Error> {
    if let Some(n) = text.strip_prefix('r') {
        Ok(Owner::Rule(number(n)?))
    } else if let Some(n) = text.strip_prefix('q') {
        Ok(Owner::Query(number(n)?))
    } else {
        Err(Error::new(
            "An aggregate owner must be r<RULE> or q<QUERY>.",
        ))
    }
}
fn number(text: &str) -> Result<usize, Error> {
    text.parse::<usize>()
        .ok()
        .filter(|n| *n > 0)
        .ok_or_else(|| Error::new("Certificate IDs must be positive integers."))
}
fn references(text: &str) -> Result<Vec<usize>, Error> {
    let inner = text
        .strip_prefix('[')
        .and_then(|s| s.strip_suffix(']'))
        .ok_or_else(|| Error::new("Put premise IDs inside [brackets], separated by commas."))?;
    if inner.is_empty() {
        Ok(Vec::new())
    } else {
        inner.split(',').map(number).collect()
    }
}
fn list(f: &mut fmt::Formatter<'_>, ids: &[usize]) -> fmt::Result {
    f.write_str("[")?;
    for (i, n) in ids.iter().enumerate() {
        if i > 0 {
            f.write_str(",")?;
        }
        write!(f, "{n}")?;
    }
    f.write_str("]")
}
impl fmt::Display for Certificate {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        writeln!(f, "wheye-proof 1")?;
        for (i, s) in self.steps.iter().enumerate() {
            write!(f, "step {} ", i + 1)?;
            match &s.justification {
                Justification::Source(n) => write!(f, "source {n}")?,
                Justification::Rule { rule, premises } => {
                    write!(f, "rule {rule} ")?;
                    list(f, premises)?;
                }
                Justification::Builtin => f.write_str("builtin")?,
                Justification::NotBuiltin => f.write_str("not-builtin")?,
                Justification::Absent { boundary } => write!(f, "absent {boundary}")?,
                Justification::Aggregate {
                    owner,
                    position,
                    boundary,
                } => write!(f, "aggregate {owner} {position} {boundary}")?,
                Justification::Fresh { rule, position } => write!(f, "fresh {rule} {position}")?,
            }
            writeln!(f, " : {}.", s.atom)?;
        }
        for (i, b) in self.boundaries.iter().enumerate() {
            write!(f, "boundary {} level {} ", i + 1, b.level)?;
            list(f, &b.steps)?;
            writeln!(f)?;
            for call in &b.calls {
                writeln!(f, "demand {} : {}.", i + 1, call)?;
            }
        }
        for claim in &self.claims {
            match claim {
                Claim::Derived(n) => writeln!(f, "derived {n}")?,
                Claim::Answer { query, premises } => {
                    write!(f, "answer {query} ")?;
                    list(f, premises)?;
                    writeln!(f)?;
                }
            }
        }
        Ok(())
    }
}
/// The nine proof conditions, specialized to wheye's language.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Condition {
    C1,
    C2,
    C3,
    C4,
    C5,
    C6,
    C7,
    C8,
    C9,
}

impl Condition {
    pub const ALL: [Self; 9] = [
        Self::C1,
        Self::C2,
        Self::C3,
        Self::C4,
        Self::C5,
        Self::C6,
        Self::C7,
        Self::C8,
        Self::C9,
    ];

    pub fn name(self) -> &'static str {
        match self {
            Self::C1 => "resolution",
            Self::C2 => "well-foundedness",
            Self::C3 => "justification",
            Self::C4 => "coverage",
            Self::C5 => "re-decision",
            Self::C6 => "boundary consistency",
            Self::C7 => "relevance",
            Self::C8 => "witness integrity",
            Self::C9 => "query isolation",
        }
    }
}
impl fmt::Display for Condition {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "C{} {}", *self as usize + 1, self.name())
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ProofLocation {
    Step(usize),
    Claim(usize),
    Boundary(usize),
}
impl fmt::Display for ProofLocation {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Step(id) => write!(f, "step {id}"),
            Self::Claim(id) => write!(f, "claim {id}"),
            Self::Boundary(id) => write!(f, "boundary {id}"),
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Failure {
    pub condition: Condition,
    pub location: ProofLocation,
    pub detail: String,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ConditionReport {
    pub condition: Condition,
    /// Attempted checks, including those that failed. Dependent checks with
    /// missing evidence are skipped; they are not counted as successful.
    pub checked: usize,
    pub failed: usize,
    pub not_applicable: Option<&'static str>,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Report {
    pub steps: usize,
    pub claims: usize,
    pub source_facts: usize,
    pub rule_applications: usize,
    pub conditions: [ConditionReport; 9],
    pub failures: Vec<Failure>,
}
impl Report {
    fn new(program: &Program, certificate: &Certificate) -> Self {
        let source_facts = certificate
            .steps
            .iter()
            .filter(|step| matches!(step.justification, Justification::Source(_)))
            .count();
        Self {
            steps: certificate.steps.len(),
            claims: certificate.claims.len(),
            source_facts,
            rule_applications: certificate
                .steps
                .iter()
                .filter(|s| matches!(s.justification, Justification::Rule { .. }))
                .count(),
            conditions: Condition::ALL.map(|condition| ConditionReport {
                condition,
                checked: 0,
                failed: 0,
                not_applicable: match condition {
                    Condition::C5
                        if !program
                            .rules
                            .iter()
                            .flat_map(|r| &r.body)
                            .chain(program.queries.iter().flat_map(|q| &q.goals))
                            .any(|g| {
                                matches!(
                                    g,
                                    Literal::Builtin(_)
                                        | Literal::NotBuiltin(_)
                                        | Literal::Aggregate(_)
                                )
                            }) =>
                    {
                        Some("program uses no built-ins or aggregates")
                    }
                    Condition::C6
                        if !program
                            .rules
                            .iter()
                            .flat_map(|r| &r.body)
                            .chain(program.queries.iter().flat_map(|q| &q.goals))
                            .any(|g| matches!(g, Literal::Not(_) | Literal::Aggregate(_))) =>
                    {
                        Some("program uses no negation or aggregation")
                    }
                    Condition::C8
                        if !program
                            .rules
                            .iter()
                            .flat_map(|r| &r.body)
                            .any(|g| matches!(g, Literal::Fresh(_))) =>
                    {
                        Some("program uses no fresh witnesses")
                    }
                    _ => None,
                },
            }),
            failures: Vec::new(),
        }
    }

    pub fn valid(&self) -> bool {
        self.failures.is_empty()
    }
    pub fn condition(&self, condition: Condition) -> &ConditionReport {
        &self.conditions[condition as usize]
    }

    /// Turn an invalid report into a diagnostic error for CLI/browser callers.
    /// Library callers can inspect `valid()` and the structured failures instead.
    pub fn require_valid(self) -> Result<Self, Error> {
        if self.valid() {
            Ok(self)
        } else {
            Err(Error::new(self.to_string()))
        }
    }

    fn attempt(&mut self, condition: Condition) {
        self.conditions[condition as usize].checked += 1;
    }
    fn fail(&mut self, condition: Condition, location: ProofLocation, detail: impl Into<String>) {
        self.conditions[condition as usize].failed += 1;
        self.failures.push(Failure {
            condition,
            location,
            detail: detail.into(),
        });
    }

    fn reference(&mut self, id: usize, length: usize, kind: &str, location: ProofLocation) -> bool {
        self.attempt(Condition::C4);
        if id > 0 && id <= length {
            true
        } else {
            self.fail(Condition::C4, location, format!("Unknown {kind} {id}."));
            false
        }
    }
}
impl fmt::Display for Report {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let plural = |count| if count == 1 { "" } else { "s" };
        writeln!(
            f,
            "{}: {} step{}, {} claim{}",
            if self.valid() { "checked" } else { "invalid" },
            self.steps,
            plural(self.steps),
            self.claims,
            plural(self.claims)
        )?;
        writeln!(
            f,
            "{} source fact{}; {} rule application{}",
            self.source_facts,
            plural(self.source_facts),
            self.rule_applications,
            plural(self.rule_applications)
        )?;
        writeln!(f, "Conditions:")?;
        for result in &self.conditions {
            if let Some(reason) = result.not_applicable {
                writeln!(f, "  {}: not applicable ({reason})", result.condition)?;
            } else {
                writeln!(
                    f,
                    "  {}: {} checked, {} failed",
                    result.condition, result.checked, result.failed
                )?;
            }
        }
        if !self.failures.is_empty() {
            writeln!(f, "Failures:")?;
            for failure in &self.failures {
                writeln!(
                    f,
                    "  [{}] {}: {}",
                    failure.condition, failure.location, failure.detail
                )?;
            }
        }
        writeln!(
            f,
            "Source facts and rules are assumed. Answer completeness is not checked."
        )
    }
}

fn boundary_facts(certificate: &Certificate, id: usize) -> Option<Vec<Atom>> {
    let b = certificate.boundaries.get(id.checked_sub(1)?)?;
    b.steps
        .iter()
        .map(|id| {
            certificate
                .steps
                .get(id.checked_sub(1)?)
                .map(|s| s.atom.clone())
        })
        .collect()
}

/// Check evidence kinds as well as terms: a negative test or builtin decision
/// must never be usable as an ordinary asserted relation.
fn match_premises(
    program: &Program,
    owner: Owner,
    premises: &[usize],
    steps: &[Step],
    head: Option<&Atom>,
) -> Option<Bindings> {
    let goals = body(program, owner)?;
    if goals.len() != premises.len() {
        return None;
    }
    let mut bindings = Bindings::new();
    if let (Owner::Rule(n), Some(atom)) = (owner, head) {
        if !match_goal(&program.rules[n - 1].head, atom, &mut bindings) {
            return None;
        }
    }
    let head_bindings = bindings.clone();
    let mut preceding_bindings = Bindings::new();
    let mut producer_names = BTreeSet::new();
    for (position, (literal, id)) in goals.iter().zip(premises).enumerate() {
        let step = steps.get(id.checked_sub(1)?)?;
        let matches = match (literal, &step.justification) {
            (Literal::Relation(g), j) if j.ordinary() => match_goal(g, &step.atom, &mut bindings),
            (Literal::Builtin(g), Justification::Builtin) => {
                match_goal(g, &step.atom, &mut bindings)
            }
            (Literal::NotBuiltin(g), Justification::NotBuiltin) => {
                match_goal(g, &step.atom, &mut bindings)
            }
            (Literal::Not(g), Justification::Absent { .. }) => {
                // Negation must only test a closed tuple; it cannot bind names.
                instantiate(g, &bindings).as_ref() == Some(&step.atom)
            }
            (
                Literal::Aggregate(a),
                Justification::Aggregate {
                    owner: o,
                    position: p,
                    ..
                },
            ) if *o == owner && *p == position + 1 => {
                let groups = aggregate_bindings(program, owner, position + 1, &step.atom)?;
                let names = aggregate_names(program, owner, position + 1);
                for name in names {
                    if let Some(value) =
                        crate::semantics::value(&Term::Variable(name.clone()), &preceding_bindings)
                    {
                        if groups.get(&name) != Some(&value) {
                            return None;
                        }
                    }
                }
                for (name, value) in groups {
                    if !bind(&Term::Variable(name.clone()), value.clone(), &mut bindings)
                        || !bind(&Term::Variable(name), value, &mut preceding_bindings)
                    {
                        return None;
                    }
                }
                producer_names.extend(a.body.iter().flat_map(Literal::variables));
                bind(
                    &a.result,
                    step.atom.values[1].clone(),
                    &mut preceding_bindings,
                ) && bind(&a.result, step.atom.values[1].clone(), &mut bindings)
            }
            (Literal::Fresh(_), Justification::Fresh { rule, position: p })
                if owner == Owner::Rule(*rule) && *p == position + 1 =>
            {
                match_goal(
                    &witness_goal(program, owner, position + 1)?,
                    &step.atom,
                    &mut bindings,
                )
            }
            _ => false,
        };
        if !matches {
            return None;
        }
        match literal {
            Literal::Relation(g) => {
                if !match_goal(g, &step.atom, &mut preceding_bindings) {
                    return None;
                }
            }
            Literal::Builtin(g) => {
                let attempt = builtin(g, &preceding_bindings);
                if attempt.is_err() {
                    for name in g.variables() {
                        if let Some(value) = head_bindings.get(&name) {
                            bind(
                                &Term::Variable(name),
                                value.clone(),
                                &mut preceding_bindings,
                            );
                        }
                    }
                }
                if let Some((_, next)) = builtin(g, &preceding_bindings).ok().flatten() {
                    preceding_bindings = next;
                }
            }
            Literal::Not(g) | Literal::NotBuiltin(g) => {
                for name in g.variables() {
                    if crate::semantics::value(&Term::Variable(name.clone()), &preceding_bindings)
                        .is_none()
                    {
                        if let Some(value) = head_bindings.get(&name) {
                            bind(
                                &Term::Variable(name),
                                value.clone(),
                                &mut preceding_bindings,
                            );
                        }
                    }
                }
            }
            Literal::Fresh(term) => {
                bind(
                    term,
                    step.atom.values.last()?.clone(),
                    &mut preceding_bindings,
                );
            }
            Literal::Aggregate(_) => {}
        }
    }
    for name in producer_names {
        if head_bindings.contains_key(&name)
            && crate::semantics::value(&Term::Variable(name), &preceding_bindings).is_none()
        {
            return None;
        }
    }
    Some(bindings)
}

/// Verify supplied derivations and finite closed boundary models. This never
/// calls reason(): closure is tested against the recorded model in one pass.
pub fn check(program: &Program, certificate: &Certificate) -> Result<Report, Error> {
    check_with_limits(program, certificate, crate::Limits::default())
}

/// Check a certificate with explicit evidence-size and model-matching limits.
pub fn check_with_limits(
    program: &Program,
    certificate: &Certificate,
    limits: crate::Limits,
) -> Result<Report, Error> {
    Checker::new(program, certificate, limits)?.check()
}

#[derive(Clone, PartialEq, Eq)]
struct WitnessOrigin {
    rule: usize,
    position: usize,
    bindings: Bindings,
}

type WitnessOrigins = HashMap<Value, WitnessOrigin>;

struct Checker<'a> {
    program: &'a Program,
    certificate: &'a Certificate,
    plan: Plan,
    report: Report,
    budget: Budget,
    witnesses: WitnessOrigins,
}

impl<'a> Checker<'a> {
    fn new(
        program: &'a Program,
        certificate: &'a Certificate,
        limits: crate::Limits,
    ) -> Result<Self, Error> {
        let evidence = certificate
            .boundaries
            .iter()
            .fold(certificate.steps.len(), |size, boundary| {
                size.saturating_add(boundary.calls.len())
            });
        if evidence > limits.max_facts {
            return Err(Error::new(format!(
                "Incomplete: proof evidence limit ({}) exceeded.",
                limits.max_facts
            )));
        }
        Ok(Self {
            program,
            certificate,
            plan: plan(program)?,
            report: Report::new(program, certificate),
            budget: Budget {
                used: 0,
                limit: limits.max_matches,
            },
            witnesses: HashMap::new(),
        })
    }

    fn check(mut self) -> Result<Report, Error> {
        self.check_steps()?;
        self.check_witness_occurrences()?;
        self.check_claims();
        self.check_boundaries()?;
        self.check_relevance();
        Ok(self.report)
    }

    fn check_steps(&mut self) -> Result<(), Error> {
        use Condition::*;
        let program = self.program;
        let certificate = self.certificate;
        let plan = &self.plan;
        let report = &mut self.report;
        let budget = &mut self.budget;
        let witnesses = &mut self.witnesses;

        let mut known = HashSet::new();
        let mut decisions = HashSet::new();
        for (index, step) in certificate.steps.iter().enumerate() {
            budget.tick()?;
            let location = ProofLocation::Step(index + 1);
            report.attempt(C3);
            if !step.atom.values.iter().all(|v| v.ground() && v.valid()) {
                report.fail(C3, location, "Evidence must be ground.");
            }
            if (step.justification.ordinary() && !known.insert(&step.atom))
                || (!step.justification.ordinary() && !decisions.insert(step))
            {
                report.fail(C3, location, "Duplicate conclusion or decision.");
            }
            match &step.justification {
                Justification::Source(source) => {
                    if report.reference(*source, program.facts.len(), "source fact", location) {
                        report.attempt(C1);
                        if program.facts[source - 1] != step.atom {
                            report.fail(
                                C1,
                                location,
                                "Conclusion differs from the cited source fact.",
                            );
                        }
                    }
                }
                Justification::Rule { rule, premises } => {
                    let mut covered =
                        report.reference(*rule, program.rules.len(), "rule", location);
                    let mut deps = true;
                    for p in premises {
                        let exists =
                            report.reference(*p, certificate.steps.len(), "premise step", location);
                        covered &= exists;
                        deps &= exists;
                    }
                    if deps {
                        report.attempt(C2);
                        if premises.iter().any(|p| *p > index) {
                            report.fail(
    C2,
    location,
    "Every premise must refer to an earlier step; cycles and forward references are forbidden.",
);
                        }
                    }
                    if covered {
                        report.attempt(C1);
                        if let Some(bindings) = match_premises(
                            program,
                            Owner::Rule(*rule),
                            premises,
                            &certificate.steps,
                            Some(&step.atom),
                        ) {
                            if instantiate(&program.rules[rule - 1].head, &bindings).as_ref()
                                != Some(&step.atom)
                            {
                                report.fail(
                                    C1,
                                    location,
                                    "Conclusion is not this rule application's head.",
                                );
                            }
                        } else {
                            report.fail(
                                C1,
                                location,
                                "Premises do not match every body goal, evidence kind, and binding.",
                            );
                        }
                    }
                }
                Justification::Builtin | Justification::NotBuiltin => {
                    report.attempt(C5);
                    let goal = Goal {
                        predicate: step.atom.predicate.clone(),
                        terms: step
                            .atom
                            .values
                            .iter()
                            .cloned()
                            .map(Term::Constant)
                            .collect(),
                    };
                    let result = builtin(&goal, &Bindings::new());
                    let valid = if step.justification == Justification::NotBuiltin {
                        matches!(result, Ok(None))
                    } else {
                        result.ok().flatten().map(|(a, _)| a).as_ref() == Some(&step.atom)
                    };
                    if !valid {
                        report.fail(C5, location, "Built-in tuple is false or unsupported.");
                    }
                }
                Justification::Absent { boundary } => {
                    if report.reference(
                        *boundary,
                        certificate.boundaries.len(),
                        "boundary",
                        location,
                    ) {
                        report.attempt(C6);
                        let b = &certificate.boundaries[boundary - 1];
                        let level = plan.goal_level(&Goal {
                            predicate: step.atom.predicate.clone(),
                            terms: step
                                .atom
                                .values
                                .iter()
                                .cloned()
                                .map(Term::Constant)
                                .collect(),
                        });
                        if b.level != level {
                            report.fail(
                                C6,
                                location,
                                "Negative test cites the wrong dependency level.",
                            );
                        }
                        if let Some(facts) = boundary_facts(certificate, *boundary) {
                            if facts.contains(&step.atom) {
                                report.fail(
                                    C6,
                                    location,
                                    "Negative test is contradicted by its closed boundary.",
                                );
                            }
                        }
                    }
                }
                Justification::Aggregate {
                    owner,
                    position,
                    boundary,
                } => {
                    let count = match owner {
                        Owner::Rule(_) => program.rules.len(),
                        Owner::Query(_) => program.queries.len(),
                    };
                    let number = match owner {
                        Owner::Rule(n) | Owner::Query(n) => *n,
                    };
                    let mut covered = report.reference(number, count, "aggregate owner", location);
                    covered &= report.reference(
                        *boundary,
                        certificate.boundaries.len(),
                        "boundary",
                        location,
                    );
                    if let Some(goals) = body(program, *owner) {
                        covered &=
                            report.reference(*position, goals.len(), "aggregate goal", location);
                    }
                    if covered {
                        let literal = &body(program, *owner).unwrap()[position - 1];
                        if let Literal::Aggregate(a) = literal {
                            report.attempt(C5);
                            report.attempt(C6);
                            if certificate.boundaries[boundary - 1].level != plan.boundary(literal)
                            {
                                report.fail(
                                    C6,
                                    location,
                                    "Aggregate cites the wrong dependency level.",
                                );
                            }
                            let mut valid = false;
                            if let (Some(mut bindings), Some(facts)) = (
                                aggregate_bindings(program, *owner, *position, &step.atom),
                                boundary_facts(certificate, *boundary),
                            ) {
                                if let Some(result) = aggregate(
                                    a,
                                    &bindings,
                                    &crate::semantics::Model::new(&facts, budget)?,
                                    budget,
                                )? {
                                    valid = result == step.atom.values[1]
                                        && bind(&a.result, result, &mut bindings);
                                }
                            }
                            if !valid {
                                report.fail(
                                    C5,
                                    location,
                                    "Aggregate result differs from its closed boundary calculation.",
                                );
                            }
                        } else {
                            report.fail(
                                C3,
                                location,
                                "Aggregate justification does not name an aggregate source goal.",
                            );
                        }
                    }
                }
                Justification::Fresh { rule, position } => {
                    let mut covered =
                        report.reference(*rule, program.rules.len(), "witness rule", location);
                    if let Some(goals) = body(program, Owner::Rule(*rule)) {
                        covered &=
                            report.reference(*position, goals.len(), "witness goal", location);
                    }
                    if covered {
                        report.attempt(C8);
                        let owner = Owner::Rule(*rule);
                        if let (Some(Literal::Fresh(term)), Some(goal)) = (
                            body(program, owner).and_then(|b| b.get(position - 1)),
                            witness_goal(program, owner, *position),
                        ) {
                            let mut valid = false;
                            if let Some(mut bindings) = witness_bindings(&goal, &step.atom) {
                                let identity = witness(*rule, *position, &bindings);
                                let context = WitnessOrigin {
                                    rule: *rule,
                                    position: *position,
                                    bindings: bindings.clone(),
                                };
                                if let Some(previous) =
                                    witnesses.insert(identity.clone(), context.clone())
                                {
                                    if previous != context {
                                        report.fail(
                                            C8,
                                            location,
                                            "A witness identity was reused by another firing.",
                                        );
                                    }
                                }
                                valid = bind(term, identity, &mut bindings)
                                    && instantiate(&goal, &bindings).as_ref() == Some(&step.atom);
                            }
                            if !valid {
                                report.fail(
                                    C8,
                                    location,
                                    "Witness identity does not belong to this source-rule firing.",
                                );
                            }
                        } else {
                            report.fail(
                                C8,
                                location,
                                "Witness justification does not name a fresh source goal.",
                            );
                        }
                    }
                }
            }
            if let Some(boundary) = step.justification.boundary() {
                if let Some(b) = certificate.boundaries.get(boundary.wrapping_sub(1)) {
                    report.attempt(C2);
                    if b.steps.iter().any(|id| *id > index) {
                        report.fail(
                            C2,
                            location,
                            "Boundary evidence must precede the decision that uses it.",
                        );
                    }
                }
            }
        }
        Ok(())
    }

    fn check_witness_occurrences(&mut self) -> Result<(), Error> {
        use Condition::*;
        let certificate = self.certificate;
        let report = &mut self.report;
        let budget = &mut self.budget;
        let witnesses = &self.witnesses;

        for (index, step) in certificate.steps.iter().enumerate() {
            let mut pending: Vec<_> = step.atom.values.iter().collect();
            while let Some(value) = pending.pop() {
                budget.tick()?;
                match value {
                    Value::Compound(_, args) => pending.extend(args),
                    Value::Witness(_) => {
                        report.conditions[C8 as usize].not_applicable = None;
                        report.attempt(C8);
                        if !witnesses.contains_key(value) {
                            report.fail(
                                C8,
                                ProofLocation::Step(index + 1),
                                "Witness has no checked fresh source-rule firing.",
                            );
                        }
                    }
                    _ => {}
                }
            }
        }
        Ok(())
    }

    fn check_claims(&mut self) {
        use Condition::*;
        let program = self.program;
        let certificate = self.certificate;
        let report = &mut self.report;

        let source_atoms: HashSet<_> = program.facts.iter().collect();
        let mut answers = HashSet::new();
        let mut derived = HashSet::new();
        for (index, claim) in certificate.claims.iter().enumerate() {
            let location = ProofLocation::Claim(index + 1);
            report.attempt(C3);
            match claim {
                Claim::Derived(id) => {
                    report.attempt(C9);
                    if !derived.insert(*id) {
                        report.fail(C3, location, "Duplicate derived claim.");
                    }
                    if !program.queries.is_empty() {
                        report.fail(
                            C9,
                            location,
                            "A program with queries must claim query selections, not derived steps.",
                        );
                    }
                    if report.reference(*id, certificate.steps.len(), "claimed step", location) {
                        report.attempt(C7);
                        let step = &certificate.steps[id - 1];
                        if !matches!(step.justification, Justification::Rule { .. })
                            || source_atoms.contains(&step.atom)
                        {
                            report.fail(
    C7,
    location,
    "A derived-output claim must be a rule conclusion absent from the source facts.",
);
                        }
                    }
                }
                Claim::Answer { query, premises } => {
                    let mut covered =
                        report.reference(*query, program.queries.len(), "query", location);
                    for p in premises {
                        covered &= report.reference(
                            *p,
                            certificate.steps.len(),
                            "query premise step",
                            location,
                        );
                    }
                    if covered {
                        report.attempt(C9);
                        if let Some(bindings) = match_premises(
                            program,
                            Owner::Query(*query),
                            premises,
                            &certificate.steps,
                            None,
                        ) {
                            let values: Vec<_> = program.queries[query - 1]
                                .variables
                                .iter()
                                .map(|n| {
                                    crate::semantics::resolve(
                                        &Value::Variable(n.clone()),
                                        &bindings,
                                    )
                                })
                                .collect();
                            if !answers.insert((*query, values)) {
                                report.fail(C3, location, "Duplicate projected answer.");
                            }
                        } else {
                            report.fail(
    C9,
    location,
    "Query goals do not match complete, correctly typed evidence under one consistent substitution.",
);
                        }
                    }
                }
            }
        }
    }

    fn check_boundaries(&mut self) -> Result<(), Error> {
        use Condition::*;
        let program = self.program;
        let certificate = self.certificate;
        let plan = &self.plan;
        let report = &mut self.report;
        let budget = &mut self.budget;
        let witnesses = &self.witnesses;

        let mut boundary_levels = HashSet::new();
        for (index, boundary) in certificate.boundaries.iter().enumerate() {
            let location = ProofLocation::Boundary(index + 1);
            report.attempt(C3);
            report.attempt(C6);
            if !boundary_levels.insert(boundary.level) {
                report.fail(C3, location, "Duplicate boundary level.");
            }
            let mut covered = true;
            let mut ids = HashSet::new();
            for id in &boundary.steps {
                budget.tick()?;
                covered &=
                    report.reference(*id, certificate.steps.len(), "boundary step", location);
                if !ids.insert(*id) {
                    report.fail(C6, location, "Duplicate boundary member.");
                }
            }
            if !covered {
                continue;
            }
            let facts = boundary_facts(certificate, index + 1).unwrap();
            let model: HashSet<_> = facts.iter().collect();
            let indexed = crate::semantics::Model::new(&facts, budget)?;
            for id in &boundary.steps {
                let s = &certificate.steps[id - 1];
                if !s.justification.ordinary()
                    || plan
                        .step_level(s)
                        .is_none_or(|level| level > boundary.level)
                {
                    report.fail(
                        C6,
                        location,
                        "Boundary contains a decision or a fact above its level.",
                    );
                }
            }
            for atom in &program.facts {
                if !model.contains(atom) {
                    report.fail(
                        C6,
                        location,
                        format!("Closed boundary omits source fact {atom}."),
                    );
                }
            }
            let calls: HashSet<_> = boundary
                .calls
                .iter()
                .map(crate::engine::canonical_goal)
                .collect();
            if calls.len() != boundary.calls.len() {
                report.fail(C6, location, "Duplicate demanded call.");
            }
            let demands = BoundaryDemands {
                plan,
                calls: &calls,
                location,
            };
            for call in &boundary.calls {
                let mut values: Vec<_> = call
                    .terms
                    .iter()
                    .filter_map(|t| {
                        if let Term::Constant(v) = t {
                            Some(v)
                        } else {
                            None
                        }
                    })
                    .collect();
                while let Some(value) = values.pop() {
                    budget.tick()?;
                    match value {
                        Value::Compound(_, args) => values.extend(args),
                        Value::Witness(_) => {
                            report.conditions[C8 as usize].not_applicable = None;
                            report.attempt(C8);
                            if !witnesses.contains_key(value) {
                                report.fail(
                                    C8,
                                    location,
                                    "Demanded witness has no checked fresh source-rule firing.",
                                );
                            }
                        }
                        _ => {}
                    }
                }
                budget.tick()?;
                if plan.goal_level(call) > boundary.level
                    || !plan
                        .demands
                        .contains_key(&(call.predicate.clone(), call.terms.len()))
                {
                    report.fail(
                        C6,
                        location,
                        "Demand does not name a tabled producer in this prefix.",
                    );
                }
            }
            // A negative/aggregate consumer must request every producer call needed
            // by its supplied prefix. This is finite model checking, not evaluation.
            for step in &certificate.steps {
                match &step.justification {
                    Justification::Absent { boundary: b } if *b == index + 1 => {
                        let goal = Goal {
                            predicate: step.atom.predicate.clone(),
                            terms: step
                                .atom
                                .values
                                .iter()
                                .cloned()
                                .map(Term::Constant)
                                .collect(),
                        };
                        demands.require(&goal, report);
                    }
                    Justification::Aggregate {
                        owner,
                        position,
                        boundary: b,
                    } if *b == index + 1 => {
                        if let Some(goals) = body(program, *owner) {
                            if let Some(Literal::Aggregate(a)) =
                                goals.get(position.saturating_sub(1))
                            {
                                if let Some(initial) =
                                    aggregate_bindings(program, *owner, *position, &step.atom)
                                {
                                    demands.check(&a.body, &initial, &indexed, budget, report)?;
                                }
                            }
                        }
                    }
                    _ => {}
                }
            }
            for (i, rule) in program.rules.iter().enumerate() {
                if plan.rules[i] > boundary.level {
                    continue;
                }
                let initial = if plan.backward[i] {
                    boundary
                        .calls
                        .iter()
                        .filter_map(|call| crate::engine::match_call(&rule.head, call))
                        .collect::<Vec<_>>()
                } else {
                    vec![Bindings::new()]
                };
                let (prefix, fresh) = if let Some(Literal::Fresh(t)) = rule.body.last() {
                    (&rule.body[..rule.body.len() - 1], Some(t))
                } else {
                    (rule.body.as_slice(), None)
                };
                for initial in initial {
                    demands.check(prefix, &initial, &indexed, budget, report)?;
                    let solutions = if prefix.is_empty() {
                        vec![initial]
                    } else {
                        model_solutions(prefix, initial, &indexed, budget)?
                    };
                    for mut bindings in solutions {
                        if let Some(term) = fresh {
                            let identity = witness(i + 1, rule.body.len(), &bindings);
                            bind(term, identity, &mut bindings);
                        }
                        let head = instantiate(&rule.head, &bindings)
                            .ok_or_else(|| Error::new("Unbound closure-check head."))?;
                        if !model.contains(&head) {
                            report.fail(
                                C6,
                                location,
                                format!("Closed boundary omits rule {} conclusion {head}.", i + 1),
                            );
                        }
                    }
                }
            }
        }
        Ok(())
    }

    fn check_relevance(&mut self) {
        use Condition::*;
        let certificate = self.certificate;
        let report = &mut self.report;

        let mut relevant = HashSet::new();
        let mut used_boundaries = HashSet::new();
        let mut pending: Vec<_> = certificate.claims.iter().flat_map(claim_premises).collect();
        while let Some(id) = pending.pop() {
            if let Some(step) = id.checked_sub(1).and_then(|i| certificate.steps.get(i)) {
                if relevant.insert(id) {
                    if let Justification::Rule { premises, .. } = &step.justification {
                        pending.extend(premises);
                    }
                    if let Some(b) = step.justification.boundary() {
                        if let Some(boundary) = certificate.boundaries.get(b.wrapping_sub(1)) {
                            if used_boundaries.insert(b) {
                                pending.extend(&boundary.steps);
                            }
                        }
                    }
                }
            }
        }
        for index in 0..certificate.steps.len() {
            report.attempt(C7);
            if !relevant.contains(&(index + 1)) {
                report.fail(
                    C7,
                    ProofLocation::Step(index + 1),
                    "Step is unrelated to every claim and required boundary.",
                );
            }
        }
        for index in 0..certificate.boundaries.len() {
            report.attempt(C7);
            if !used_boundaries.contains(&(index + 1)) {
                report.fail(
                    C7,
                    ProofLocation::Boundary(index + 1),
                    "Boundary is unrelated to every claim.",
                );
            }
        }
    }
}

struct BoundaryDemands<'a> {
    plan: &'a Plan,
    calls: &'a HashSet<Goal>,
    location: ProofLocation,
}

impl BoundaryDemands<'_> {
    fn require(&self, goal: &Goal, report: &mut Report) {
        if self
            .plan
            .demands
            .contains_key(&(goal.predicate.clone(), goal.terms.len()))
            && !self.calls.contains(&crate::engine::canonical_goal(goal))
        {
            report.fail(
                Condition::C6,
                self.location,
                format!("Closed boundary omits demanded call {goal}."),
            );
        }
    }

    fn check(
        &self,
        body: &[Literal],
        initial: &Bindings,
        facts: &crate::semantics::Model<'_>,
        budget: &mut Budget,
        report: &mut Report,
    ) -> Result<(), Error> {
        for (at, literal) in body.iter().enumerate() {
            if matches!(
                literal,
                Literal::Relation(_) | Literal::Not(_) | Literal::Aggregate(_)
            ) {
                let prefixes = if at == 0 {
                    vec![initial.clone()]
                } else {
                    model_solutions(&body[..at], initial.clone(), facts, budget)?
                };
                for bindings in prefixes {
                    budget.tick()?;
                    match literal {
                        Literal::Relation(goal) | Literal::Not(goal) => {
                            self.require(&crate::engine::specialize(goal, &bindings), report);
                        }
                        Literal::Aggregate(aggregate) => {
                            self.check(&aggregate.body, &bindings, facts, budget, report)?
                        }
                        _ => unreachable!(),
                    }
                }
            }
        }
        Ok(())
    }
}
