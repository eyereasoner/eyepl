use crate::language::{plan, Plan, Relation};
use crate::proof::witness_goal;
use crate::semantics::{aggregate, bind, builtin, witness, Budget};
use crate::{
    Atom, Boundary, Error, Goal, Justification, Literal, Owner, Program, Step, Term, Value,
};
use std::collections::{BTreeMap, HashMap, HashSet};

pub(crate) type Bindings = BTreeMap<String, Value>;
type Position = (Relation, usize, Value);
#[derive(Clone, Copy, Debug)]
pub struct Limits {
    pub max_facts: usize,
    pub max_matches: usize,
}
impl Default for Limits {
    fn default() -> Self {
        Self {
            max_facts: 1_000_000,
            max_matches: 10_000_000,
        }
    }
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Answer {
    pub values: Vec<Value>,
    pub premises: Vec<usize>,
}
#[derive(Clone, Debug)]
pub struct Run {
    pub steps: Vec<Step>,
    pub answers: Vec<Vec<Answer>>,
    pub matches: usize,
    pub boundaries: Vec<Boundary>,
}
pub(crate) fn match_goal(goal: &Goal, atom: &Atom, bindings: &mut Bindings) -> bool {
    if goal.predicate != atom.predicate || goal.terms.len() != atom.values.len() {
        return false;
    }
    for (term, value) in goal.terms.iter().zip(&atom.values) {
        if !bind(term, value.clone(), bindings) {
            return false;
        }
    }
    true
}

pub(crate) fn instantiate(goal: &Goal, bindings: &Bindings) -> Option<Atom> {
    Some(Atom {
        predicate: goal.predicate.clone(),
        values: goal
            .terms
            .iter()
            .map(|term| crate::semantics::value(term, bindings))
            .collect::<Option<_>>()?,
    })
}

#[derive(Default)]
struct Store {
    steps: Vec<Step>,
    known: HashMap<Atom, usize>,
    decisions: HashMap<Step, usize>,
    relations: HashMap<Relation, Vec<usize>>,
    positions: HashMap<Position, Vec<usize>>,
    boundaries: Vec<Boundary>,
}
impl Store {
    fn insert(
        &mut self,
        atom: Atom,
        justification: Justification,
        limit: usize,
    ) -> Result<usize, Error> {
        if justification.ordinary() {
            if let Some(id) = self.known.get(&atom) {
                return Ok(*id);
            }
        } else if let Some(id) = self.decisions.get(&Step {
            atom: atom.clone(),
            justification: justification.clone(),
        }) {
            return Ok(*id);
        }
        if self.steps.len() >= limit {
            return Err(Error::new(format!(
                "Incomplete: fact limit ({limit}) reached; no complete answer is available."
            )));
        }
        let index = self.steps.len();
        if justification.ordinary() {
            let relation = (atom.predicate.clone(), atom.values.len());
            self.relations
                .entry(relation.clone())
                .or_default()
                .push(index);
            for (position, value) in atom.values.iter().enumerate() {
                self.positions
                    .entry((relation.clone(), position, value.clone()))
                    .or_default()
                    .push(index);
            }
            self.known.insert(atom.clone(), index + 1);
        } else {
            self.decisions.insert(
                Step {
                    atom: atom.clone(),
                    justification: justification.clone(),
                },
                index + 1,
            );
        }
        self.steps.push(Step {
            atom,
            justification,
        });
        Ok(index + 1)
    }
    fn candidates(&self, goal: &Goal, bindings: &Bindings) -> &[usize] {
        let relation = (goal.predicate.clone(), goal.terms.len());
        let mut result = self
            .relations
            .get(&relation)
            .map(Vec::as_slice)
            .unwrap_or(&[]);
        for (position, term) in goal.terms.iter().enumerate() {
            let value = crate::semantics::value(term, bindings);
            if let Some(value) = value {
                let candidates = self
                    .positions
                    .get(&(relation.clone(), position, value.clone()))
                    .map(Vec::as_slice)
                    .unwrap_or(&[]);
                if candidates.len() < result.len() {
                    result = candidates;
                }
            }
        }
        result
    }
    fn close(&mut self, level: usize, plan: &Plan, budget: &mut Budget) -> Result<(), Error> {
        for _ in &self.steps {
            budget.tick()?;
        }
        let steps = self
            .steps
            .iter()
            .enumerate()
            .filter(|(_, step)| {
                step.justification.ordinary()
                    && plan
                        .step_level(step)
                        .is_some_and(|producer| producer <= level)
            })
            .map(|(i, _)| i + 1)
            .collect();
        self.boundaries.push(Boundary {
            level,
            steps,
            calls: Vec::new(),
        });
        Ok(())
    }
    fn boundary(&self, level: usize) -> Option<usize> {
        self.boundaries
            .iter()
            .position(|b| b.level == level)
            .map(|i| i + 1)
    }
    fn facts(&self, boundary: usize) -> Vec<Atom> {
        self.boundaries[boundary - 1]
            .steps
            .iter()
            .map(|id| self.steps[id - 1].atom.clone())
            .collect()
    }
    fn materialize(
        &mut self,
        evidence: Vec<Evidence>,
        bindings: &Bindings,
        limit: usize,
    ) -> Result<Vec<usize>, Error> {
        evidence
            .into_iter()
            .map(|e| match e {
                Evidence::Fact(id) => Ok(id),
                Evidence::Decision(mut s) => {
                    s.atom.values = s
                        .atom
                        .values
                        .iter()
                        .map(|v| crate::semantics::resolve(v, bindings))
                        .collect();
                    if !s.atom.values.iter().all(Value::ground) {
                        return Err(Error::new("Built-in evidence remained unbound."));
                    }
                    self.insert(s.atom, s.justification, limit)
                }
            })
            .collect()
    }
}
type Trigger = (usize, usize);

#[derive(Default)]
struct RelationTriggers {
    variables: Vec<Trigger>,
    ground: HashMap<Vec<Value>, Vec<Trigger>>,
    constants: Vec<HashMap<Value, Vec<Trigger>>>,
}

#[derive(Default)]
struct Triggers(HashMap<Relation, RelationTriggers>);
impl Triggers {
    fn insert(&mut self, goal: &Goal, trigger: Trigger) {
        let entries = self
            .0
            .entry((goal.predicate.clone(), goal.terms.len()))
            .or_default();
        if let Some(atom) = goal.ground() {
            // Fully ground rules use the whole tuple, so a shared individual
            // cannot hide the selective class argument in either column.
            entries.ground.entry(atom.values).or_default().push(trigger);
        } else if let Some((position, value)) =
            goal.terms.iter().enumerate().rev().find_map(|(i, t)| {
                if let Term::Constant(v) = t {
                    if !v.ground() {
                        return None;
                    }
                    Some((i, v))
                } else {
                    None
                }
            })
        {
            // Store a partial goal once. The join still checks every other
            // constant and variable binding after this fixed-argument lookup.
            entries
                .constants
                .resize_with(goal.terms.len(), HashMap::new);
            entries.constants[position]
                .entry(value.clone())
                .or_default()
                .push(trigger);
        } else {
            entries.variables.push(trigger);
        }
    }
    fn candidates(&self, atom: &Atom) -> Vec<Trigger> {
        let Some(entries) = self.0.get(&(atom.predicate.clone(), atom.values.len())) else {
            return Vec::new();
        };
        let mut result = entries.variables.clone();
        if let Some(triggers) = entries.ground.get(&atom.values) {
            result.extend(triggers);
        }
        for (value, index) in atom.values.iter().zip(&entries.constants) {
            if let Some(triggers) = index.get(value) {
                result.extend(triggers);
            }
        }
        result
    }
}

#[derive(Clone)]
enum Evidence {
    Fact(usize),
    Decision(Step),
}
#[derive(Clone)]
struct Match {
    bindings: Bindings,
    evidence: Vec<Evidence>,
}

struct Join<'a> {
    store: &'a Store,
    program: &'a Program,
    plan: &'a Plan,
    owner: Owner,
    goals: &'a [Literal],
    seed: Option<(usize, usize)>,
}
impl Join<'_> {
    fn visit(
        &self,
        at: usize,
        current: Match,
        budget: &mut Budget,
        out: &mut Vec<Match>,
    ) -> Result<(), Error> {
        if at == self.goals.len() {
            out.push(current);
            return Ok(());
        }
        let literal = &self.goals[at];
        let mut proceed = |bindings, evidence, budget: &mut Budget| {
            let mut next = Match {
                bindings,
                evidence: current.evidence.clone(),
            };
            next.evidence.push(evidence);
            self.visit(at + 1, next, budget, out)
        };
        match literal {
            Literal::Relation(goal) => {
                if let Some((position, fact)) = self.seed {
                    if position == at {
                        budget.tick()?;
                        let mut bindings = current.bindings.clone();
                        if match_goal(goal, &self.store.steps[fact].atom, &mut bindings) {
                            proceed(bindings, Evidence::Fact(fact + 1), budget)?;
                        }
                        return Ok(());
                    }
                }
                for &fact in self.store.candidates(goal, &current.bindings) {
                    budget.tick()?;
                    let mut bindings = current.bindings.clone();
                    if match_goal(goal, &self.store.steps[fact].atom, &mut bindings) {
                        proceed(bindings, Evidence::Fact(fact + 1), budget)?;
                    }
                }
            }
            Literal::Builtin(goal) => {
                budget.tick()?;
                if let Some((atom, bindings)) = builtin(goal, &current.bindings)? {
                    proceed(
                        bindings,
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::Builtin,
                        }),
                        budget,
                    )?;
                }
            }
            Literal::NotBuiltin(goal) => {
                let atom = instantiate(goal, &current.bindings)
                    .ok_or_else(|| Error::new("Negated tests require bound operands."))?;
                budget.tick()?;
                if builtin(goal, &current.bindings)?.is_none() {
                    proceed(
                        current.bindings.clone(),
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::NotBuiltin,
                        }),
                        budget,
                    )?;
                }
            }
            Literal::Not(goal) => {
                budget.tick()?;
                let boundary = self
                    .store
                    .boundary(self.plan.goal_level(&specialize(goal, &current.bindings)))
                    .ok_or_else(|| Error::new("A negative dependency stratum is not complete."))?;
                let atom = instantiate(goal, &current.bindings)
                    .ok_or_else(|| Error::new("Unbound negative goal."))?;
                if !self.store.known.contains_key(&atom) {
                    proceed(
                        current.bindings.clone(),
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::Absent { boundary },
                        }),
                        budget,
                    )?;
                }
            }
            Literal::Aggregate(a) => {
                let outer = crate::proof::aggregate_context(
                    self.program,
                    self.plan,
                    self.owner,
                    at + 1,
                    &current.bindings,
                );
                let boundary = self
                    .store
                    .boundary(self.plan.boundary(literal))
                    .ok_or_else(|| {
                        Error::new("An aggregate dependency stratum is not complete.")
                    })?;
                if let Some(result) = aggregate(
                    a,
                    &outer,
                    &crate::semantics::Model::new(&self.store.facts(boundary), budget)?,
                    budget,
                )? {
                    let mut bindings = current.bindings.clone();
                    if bind(&a.result, result.clone(), &mut bindings) {
                        let atom = crate::proof::aggregate_atom(
                            self.program,
                            self.plan,
                            self.owner,
                            at + 1,
                            &outer,
                            result,
                        );
                        proceed(
                            bindings,
                            Evidence::Decision(Step {
                                atom,
                                justification: Justification::Aggregate {
                                    owner: self.owner,
                                    position: at + 1,
                                    boundary,
                                },
                            }),
                            budget,
                        )?;
                    }
                }
            }
            Literal::Fresh(term) => {
                budget.tick()?;
                let Owner::Rule(rule) = self.owner else {
                    return Err(Error::new("fresh/1 needs a rule context."));
                };
                let mut bindings = current.bindings.clone();
                let goal = witness_goal(self.program, self.owner, at + 1)
                    .ok_or_else(|| Error::new("Invalid witness source context."))?;
                let context = crate::proof::witness_context(&goal, &bindings)
                    .ok_or_else(|| Error::new("Unbound witness firing variable."))?;
                if bind(term, witness(rule, at + 1, &context), &mut bindings) {
                    let atom = instantiate(&goal, &bindings)
                        .ok_or_else(|| Error::new("Unbound witness firing variable."))?;
                    proceed(
                        bindings,
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::Fresh {
                                rule,
                                position: at + 1,
                            },
                        }),
                        budget,
                    )?;
                }
            }
        }
        Ok(())
    }
    fn run(&self, budget: &mut Budget) -> Result<Vec<Match>, Error> {
        let mut initial = Bindings::new();
        // Seed prebinding is safe for a positive conjunction. Other bodies keep
        // source order, preserving aggregate-local scopes and witness context.
        if self.goals.iter().all(|g| matches!(g, Literal::Relation(_))) {
            if let Some((position, fact)) = self.seed {
                if let Literal::Relation(g) = &self.goals[position] {
                    if !match_goal(g, &self.store.steps[fact].atom, &mut initial) {
                        return Ok(Vec::new());
                    }
                }
            }
        }
        let mut out = Vec::new();
        self.visit(
            0,
            Match {
                bindings: initial,
                evidence: Vec::new(),
            },
            budget,
            &mut out,
        )?;
        Ok(out)
    }
}

fn fire(
    store: &mut Store,
    program: &Program,
    rule: usize,
    matched: Match,
    limit: usize,
) -> Result<(), Error> {
    let atom = instantiate(&program.rules[rule].head, &matched.bindings)
        .ok_or_else(|| Error::new("A rule head remained unbound."))?;
    if !store.known.contains_key(&atom) {
        let premises = store.materialize(matched.evidence, &matched.bindings, limit)?;
        store.insert(
            atom,
            Justification::Rule {
                rule: rule + 1,
                premises,
            },
            limit,
        )?;
    }
    Ok(())
}

pub fn reason(program: &Program, limits: Limits) -> Result<Run, Error> {
    let plan = plan(program)?;
    if plan.demand_driven.iter().any(|b| *b) {
        return reason_tabled(program, limits, &plan);
    }
    let mut store = Store::default();
    let mut budget = Budget {
        used: 0,
        limit: limits.max_matches,
    };
    for (i, atom) in program.facts.iter().enumerate() {
        store.insert(atom.clone(), Justification::Source(i + 1), limits.max_facts)?;
    }
    let max = plan.levels.values().copied().max().unwrap_or(0);
    for level in 0..=max {
        let mut triggers = Triggers::default();
        for (rule, clause) in program.rules.iter().enumerate() {
            if plan.rules[rule] != level {
                continue;
            }
            let mut positive = false;
            for (position, g) in clause.body.iter().enumerate() {
                if let Literal::Relation(g) = g {
                    positive = true;
                    triggers.insert(g, (rule, position));
                }
            }
            if !positive {
                let matches = Join {
                    store: &store,
                    program,
                    plan: &plan,
                    owner: Owner::Rule(rule + 1),
                    goals: &clause.body,
                    seed: None,
                }
                .run(&mut budget)?;
                for matched in matches {
                    fire(&mut store, program, rule, matched, limits.max_facts)?;
                }
            }
        }
        let mut cursor = 0;
        while cursor < store.steps.len() {
            let step = &store.steps[cursor];
            if step.justification.ordinary() {
                for (rule, position) in triggers.candidates(&step.atom) {
                    budget.tick()?;
                    let matches = Join {
                        store: &store,
                        program,
                        plan: &plan,
                        owner: Owner::Rule(rule + 1),
                        goals: &program.rules[rule].body,
                        seed: Some((position, cursor)),
                    }
                    .run(&mut budget)?;
                    for matched in matches {
                        fire(&mut store, program, rule, matched, limits.max_facts)?;
                    }
                }
            }
            cursor += 1;
        }
        let needed = program
            .rules
            .iter()
            .flat_map(|r| &r.body)
            .chain(program.queries.iter().flat_map(|q| &q.goals))
            .any(|g| {
                matches!(g, Literal::Not(_) | Literal::Aggregate(_)) && plan.boundary(g) == level
            });
        if needed {
            store.close(level, &plan, &mut budget)?;
        }
    }
    let mut answers = Vec::new();
    for (index, query) in program.queries.iter().enumerate() {
        let mut seen = HashSet::new();
        let mut result = Vec::new();
        for matched in (Join {
            store: &store,
            program,
            plan: &plan,
            owner: Owner::Query(index + 1),
            goals: &query.goals,
            seed: None,
        })
        .run(&mut budget)?
        {
            let values: Vec<_> = query
                .variables
                .iter()
                .map(|n| crate::semantics::resolve(&Value::Variable(n.clone()), &matched.bindings))
                .collect();
            if seen.insert(values.clone()) {
                let premises =
                    store.materialize(matched.evidence, &matched.bindings, limits.max_facts)?;
                result.push(Answer { values, premises });
            }
        }
        answers.push(result);
    }
    Ok(Run {
        steps: store.steps,
        answers,
        matches: budget.used,
        boundaries: store.boundaries,
    })
}

#[derive(Clone)]
struct Activation {
    owner: Owner,
    position: usize,
    matched: Match,
    table: Option<Goal>,
}
enum Task {
    Resume(Activation),
    Fact(usize),
    Negative(Activation),
    Aggregate(Activation),
}
struct Tabled<'a> {
    program: &'a Program,
    plan: &'a Plan,
    store: Store,
    budget: Budget,
    limits: Limits,
    queues: std::collections::BTreeMap<usize, std::collections::VecDeque<Task>>,
    calls: HashSet<Goal>,
    waiting: Triggers,
    subscriptions: Vec<Activation>,
    answers: Vec<Vec<Answer>>,
}
pub(crate) fn specialize(goal: &Goal, bindings: &Bindings) -> Goal {
    Goal {
        predicate: goal.predicate.clone(),
        terms: goal
            .terms
            .iter()
            .map(|t| {
                let v = crate::semantics::resolve(&crate::model::term_value(t), bindings);
                match v {
                    Value::Variable(n) => Term::Variable(n),
                    v => Term::Constant(v),
                }
            })
            .collect(),
    }
}
pub(crate) fn canonical_goal(goal: &Goal) -> Goal {
    fn rename(v: Value, names: &mut HashMap<String, String>) -> Value {
        match v {
            Value::Variable(n) => {
                let next = format!("_WheyeCall{}", names.len());
                Value::Variable(names.entry(n).or_insert(next).clone())
            }
            Value::Compound(n, a) => {
                Value::Compound(n, a.into_iter().map(|v| rename(v, names)).collect())
            }
            v => v,
        }
    }
    let mut names = HashMap::new();
    Goal {
        predicate: goal.predicate.clone(),
        terms: goal
            .terms
            .iter()
            .map(|t| match rename(crate::model::term_value(t), &mut names) {
                Value::Variable(n) => Term::Variable(n),
                v => Term::Constant(v),
            })
            .collect(),
    }
}
pub(crate) fn match_call(head: &Goal, call: &Goal) -> Option<Bindings> {
    if head.predicate != call.predicate || head.terms.len() != call.terms.len() {
        return None;
    }
    // Source and call variables have separate scopes, even if a user chooses
    // one of the display names used by canonical table variants.
    let mut prefix = String::from("_WheyeScope");
    let source = head.variables();
    while source.iter().any(|n| n.starts_with(&prefix)) {
        prefix.push('_');
    }
    let substitutions: Bindings = call
        .variables()
        .into_iter()
        .enumerate()
        .map(|(i, n)| (n, Value::Variable(format!("{prefix}{i}"))))
        .collect();
    let call = specialize(call, &substitutions);
    let mut bindings = Bindings::new();
    for (a, b) in head.terms.iter().zip(&call.terms) {
        if !crate::semantics::unify(
            &crate::model::term_value(a),
            &crate::model::term_value(b),
            &mut bindings,
        ) {
            return None;
        }
    }
    Some(bindings)
}
impl Tabled<'_> {
    fn level(&self, owner: Owner) -> usize {
        match owner {
            Owner::Rule(n) => self.plan.rules[n - 1],
            Owner::Query(_) => self.plan.rules.iter().copied().max().unwrap_or(0) + 1,
        }
    }
    fn push(&mut self, task: Task, level: usize) {
        self.queues.entry(level).or_default().push_back(task);
    }
    fn resume(&mut self, a: Activation) {
        let level = self.level(a.owner);
        self.push(Task::Resume(a), level);
    }
    fn demand(&mut self, goal: &Goal) -> Result<bool, Error> {
        let goal = canonical_goal(goal);
        let rules = self
            .plan
            .demands
            .get(&(goal.predicate.clone(), goal.terms.len()))
            .cloned()
            .unwrap_or_default();
        if rules.is_empty() || !self.calls.insert(goal.clone()) {
            return Ok(false);
        }
        self.budget.tick()?;
        for index in rules {
            if let Some(bindings) = match_call(&self.program.rules[index].head, &goal) {
                self.resume(Activation {
                    owner: Owner::Rule(index + 1),
                    position: 0,
                    matched: Match {
                        bindings,
                        evidence: Vec::new(),
                    },
                    table: Some(goal.clone()),
                });
            }
        }
        Ok(true)
    }
    fn continue_with(&mut self, mut a: Activation, bindings: Bindings, evidence: Evidence) {
        a.position += 1;
        a.matched.bindings = bindings;
        a.matched.evidence.push(evidence);
        self.resume(a);
    }
    fn complete(&mut self, a: Activation) -> Result<(), Error> {
        match a.owner {
            Owner::Rule(n) => {
                let atom = instantiate(&self.program.rules[n - 1].head, &a.matched.bindings)
                    .ok_or_else(|| {
                        Error::new(format!(
                            "Rule {n}: call inputs do not produce a ground answer."
                        ))
                    })?;
                if let Some(table) = &a.table {
                    if !match_goal(table, &atom, &mut Bindings::new()) {
                        return Ok(());
                    }
                }
                if !self.store.known.contains_key(&atom) {
                    let premises = self.store.materialize(
                        a.matched.evidence,
                        &a.matched.bindings,
                        self.limits.max_facts,
                    )?;
                    let id = self.store.insert(
                        atom,
                        Justification::Rule { rule: n, premises },
                        self.limits.max_facts,
                    )?;
                    self.push(Task::Fact(id - 1), self.plan.rules[n - 1]);
                }
            }
            Owner::Query(n) => {
                let query = &self.program.queries[n - 1];
                let values = query
                    .variables
                    .iter()
                    .map(|name| {
                        crate::semantics::value(&Term::Variable(name.clone()), &a.matched.bindings)
                            .ok_or_else(|| {
                                Error::new(format!(
                                    "Query {n}: answer variable {name} remained unbound."
                                ))
                            })
                    })
                    .collect::<Result<Vec<_>, _>>()?;
                if !self.answers[n - 1]
                    .iter()
                    .any(|answer| answer.values == values)
                {
                    let premises = self.store.materialize(
                        a.matched.evidence,
                        &a.matched.bindings,
                        self.limits.max_facts,
                    )?;
                    self.answers[n - 1].push(Answer { values, premises });
                }
            }
        }
        Ok(())
    }
    fn prefix_demands(&mut self, body: &[Literal], initial: &Bindings) -> Result<bool, Error> {
        let facts: Vec<_> = self
            .store
            .steps
            .iter()
            .filter(|s| s.justification.ordinary())
            .map(|s| s.atom.clone())
            .collect();
        let model = crate::semantics::Model::new(&facts, &mut self.budget)?;
        let mut changed = false;
        for (at, literal) in body.iter().enumerate() {
            if matches!(
                literal,
                Literal::Relation(_) | Literal::Not(_) | Literal::Aggregate(_)
            ) {
                let prefixes = if at == 0 {
                    vec![initial.clone()]
                } else {
                    crate::semantics::model_solutions(
                        &body[..at],
                        initial.clone(),
                        &model,
                        &mut self.budget,
                    )?
                };
                for bindings in prefixes {
                    match literal {
                        Literal::Relation(goal) | Literal::Not(goal) => {
                            changed |= self.demand(&specialize(goal, &bindings))?
                        }
                        Literal::Aggregate(a) => {
                            changed |= self.prefix_demands(&a.body, &bindings)?
                        }
                        _ => unreachable!(),
                    }
                }
            }
        }
        Ok(changed)
    }
    fn step(&mut self, a: Activation) -> Result<(), Error> {
        let body = crate::proof::body(self.program, a.owner).unwrap();
        if a.position == body.len() {
            return self.complete(a);
        }
        match &body[a.position] {
            Literal::Relation(goal) => {
                let request = specialize(goal, &a.matched.bindings);
                self.demand(&request)?;
                let candidates = self.store.candidates(goal, &a.matched.bindings).to_vec();
                let index = self.subscriptions.len();
                self.waiting.insert(&request, (index, 0));
                self.subscriptions.push(a.clone());
                for fact in candidates {
                    self.consume(a.clone(), fact)?;
                }
            }
            Literal::Builtin(goal) => {
                self.budget.tick()?;
                if let Some((atom, bindings)) = builtin(goal, &a.matched.bindings)? {
                    self.continue_with(
                        a,
                        bindings,
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::Builtin,
                        }),
                    );
                }
            }
            Literal::NotBuiltin(goal) => {
                let atom = instantiate(goal, &a.matched.bindings)
                    .ok_or_else(|| Error::new("Negated tests require bound operands."))?;
                self.budget.tick()?;
                if builtin(goal, &a.matched.bindings)?.is_none() {
                    let bindings = a.matched.bindings.clone();
                    self.continue_with(
                        a,
                        bindings,
                        Evidence::Decision(Step {
                            atom,
                            justification: Justification::NotBuiltin,
                        }),
                    );
                }
            }
            Literal::Not(goal) => {
                let atom = instantiate(goal, &a.matched.bindings)
                    .ok_or_else(|| Error::new("Negation requires bound inputs."))?;
                self.demand(&specialize(goal, &a.matched.bindings))?;
                let _ = atom;
                let level = self.level(a.owner);
                self.push(Task::Negative(a), level);
            }
            Literal::Aggregate(_) => {
                let level = self.level(a.owner);
                self.push(Task::Aggregate(a), level);
            }
            Literal::Fresh(term) => {
                let Owner::Rule(rule) = a.owner else {
                    return Err(Error::new("fresh requires a rule context."));
                };
                let mut bindings = a.matched.bindings.clone();
                let goal = witness_goal(self.program, a.owner, a.position + 1)
                    .ok_or_else(|| Error::new("Invalid fresh context."))?;
                let context = crate::proof::witness_context(&goal, &bindings)
                    .ok_or_else(|| Error::new("Unbound fresh context."))?;
                if bind(term, witness(rule, a.position + 1, &context), &mut bindings) {
                    let atom = instantiate(&goal, &bindings)
                        .ok_or_else(|| Error::new("Unbound fresh context."))?;
                    let justification = Justification::Fresh {
                        rule,
                        position: a.position + 1,
                    };
                    self.continue_with(
                        a,
                        bindings,
                        Evidence::Decision(Step {
                            atom,
                            justification,
                        }),
                    );
                }
            }
        }
        Ok(())
    }
    fn consume(&mut self, a: Activation, fact: usize) -> Result<(), Error> {
        let Literal::Relation(goal) =
            &crate::proof::body(self.program, a.owner).unwrap()[a.position]
        else {
            unreachable!()
        };
        self.budget.tick()?;
        let mut bindings = a.matched.bindings.clone();
        if match_goal(goal, &self.store.steps[fact].atom, &mut bindings) {
            self.continue_with(a, bindings, Evidence::Fact(fact + 1));
        }
        Ok(())
    }
    fn finish_negative(&mut self, a: Activation) -> Result<(), Error> {
        let literal = &crate::proof::body(self.program, a.owner).unwrap()[a.position];
        let Literal::Not(goal) = literal else {
            unreachable!()
        };
        let atom = instantiate(goal, &a.matched.bindings)
            .ok_or_else(|| Error::new("Negation needs bound inputs."))?;
        if !self.store.known.contains_key(&atom) {
            let boundary = self.plan.goal_level(&specialize(goal, &a.matched.bindings)) + 1;
            let bindings = a.matched.bindings.clone();
            self.continue_with(
                a,
                bindings,
                Evidence::Decision(Step {
                    atom,
                    justification: Justification::Absent { boundary },
                }),
            );
        }
        Ok(())
    }
    fn finish_aggregate(&mut self, a: Activation) -> Result<(), Error> {
        let literal = &crate::proof::body(self.program, a.owner).unwrap()[a.position];
        let Literal::Aggregate(aggregate) = literal else {
            unreachable!()
        };
        let outer = crate::proof::aggregate_context(
            self.program,
            self.plan,
            a.owner,
            a.position + 1,
            &a.matched.bindings,
        );
        if self.prefix_demands(&aggregate.body, &outer)? {
            let level = self.level(a.owner);
            self.push(Task::Aggregate(a), level);
            return Ok(());
        }
        let level = self.plan.boundary(literal);
        let facts = self
            .store
            .steps
            .iter()
            .filter(|step| {
                step.justification.ordinary()
                    && self
                        .plan
                        .step_level(step)
                        .is_some_and(|producer| producer <= level)
            })
            .map(|s| s.atom.clone())
            .collect::<Vec<_>>();
        if let Some(result) = aggregate_value(
            aggregate,
            &outer,
            &crate::semantics::Model::new(&facts, &mut self.budget)?,
            &mut self.budget,
        )? {
            let mut bindings = a.matched.bindings.clone();
            if bind(&aggregate.result, result.clone(), &mut bindings) {
                let atom = crate::proof::aggregate_atom(
                    self.program,
                    self.plan,
                    a.owner,
                    a.position + 1,
                    &outer,
                    result,
                );
                let justification = Justification::Aggregate {
                    owner: a.owner,
                    position: a.position + 1,
                    boundary: level + 1,
                };
                self.continue_with(
                    a,
                    bindings,
                    Evidence::Decision(Step {
                        atom,
                        justification,
                    }),
                );
            }
        }
        Ok(())
    }
    fn drain(&mut self) -> Result<(), Error> {
        while let Some(mut entry) = self.queues.first_entry() {
            let task = entry.get_mut().pop_front().unwrap();
            if entry.get().is_empty() {
                entry.remove();
            }
            self.budget.tick()?;
            match task {
                Task::Resume(a) => self.step(a)?,
                Task::Negative(a) => self.finish_negative(a)?,
                Task::Aggregate(a) => self.finish_aggregate(a)?,
                Task::Fact(id) => {
                    for (index, _) in self.waiting.candidates(&self.store.steps[id].atom) {
                        self.consume(self.subscriptions[index].clone(), id)?;
                    }
                }
            }
        }
        Ok(())
    }
}
use crate::semantics::aggregate as aggregate_value;
fn reason_tabled(program: &Program, limits: Limits, plan: &Plan) -> Result<Run, Error> {
    let mut engine = Tabled {
        program,
        plan,
        store: Store::default(),
        budget: Budget {
            used: 0,
            limit: limits.max_matches,
        },
        limits,
        queues: Default::default(),
        calls: Default::default(),
        waiting: Default::default(),
        subscriptions: Vec::new(),
        answers: vec![Vec::new(); program.queries.len()],
    };
    for (i, fact) in program.facts.iter().enumerate() {
        engine
            .store
            .insert(fact.clone(), Justification::Source(i + 1), limits.max_facts)?;
    }
    for (i, _) in program.rules.iter().enumerate() {
        if !plan.demand_driven[i] {
            engine.resume(Activation {
                owner: Owner::Rule(i + 1),
                position: 0,
                matched: Match {
                    bindings: Bindings::new(),
                    evidence: Vec::new(),
                },
                table: None,
            });
        }
    }
    engine.drain()?;
    for (i, _) in program.queries.iter().enumerate() {
        engine.resume(Activation {
            owner: Owner::Query(i + 1),
            position: 0,
            matched: Match {
                bindings: Bindings::new(),
                evidence: Vec::new(),
            },
            table: None,
        });
        engine.drain()?;
    }
    let levels: std::collections::BTreeSet<_> = engine
        .store
        .steps
        .iter()
        .filter_map(|step| match step.justification {
            Justification::Absent { boundary } | Justification::Aggregate { boundary, .. } => {
                Some(boundary - 1)
            }
            _ => None,
        })
        .collect();
    for level in levels {
        engine.store.close(level, plan, &mut engine.budget)?;
        let boundary = engine.store.boundaries.last_mut().unwrap();
        boundary.calls = engine
            .calls
            .iter()
            .filter(|g| plan.goal_level(g) <= level)
            .cloned()
            .collect();
        boundary.calls.sort_by_key(ToString::to_string);
    }
    for step in &mut engine.store.steps {
        if let Justification::Absent { boundary } | Justification::Aggregate { boundary, .. } =
            &mut step.justification
        {
            *boundary = engine
                .store
                .boundaries
                .iter()
                .position(|b| b.level == *boundary - 1)
                .unwrap()
                + 1;
        }
    }
    let mut run = Run {
        steps: engine.store.steps,
        answers: engine.answers,
        matches: engine.budget.used,
        boundaries: engine.store.boundaries,
    };
    order_evidence(&mut run)?;
    Ok(run)
}
fn order_evidence(run: &mut Run) -> Result<(), Error> {
    let count = run.steps.len();
    let mut incoming = vec![0usize; count];
    let mut consumers = vec![Vec::new(); count];
    for (index, step) in run.steps.iter().enumerate() {
        let mut deps = match &step.justification {
            Justification::Rule { premises, .. } => premises.clone(),
            Justification::Absent { boundary } | Justification::Aggregate { boundary, .. } => {
                run.boundaries[boundary - 1].steps.clone()
            }
            _ => Vec::new(),
        };
        deps.sort_unstable();
        deps.dedup();
        for id in deps {
            incoming[index] += 1;
            consumers[id - 1].push(index);
        }
    }
    let mut queue: std::collections::VecDeque<_> = incoming
        .iter()
        .enumerate()
        .filter_map(|(i, n)| (*n == 0).then_some(i))
        .collect();
    let mut order = Vec::with_capacity(count);
    while let Some(index) = queue.pop_front() {
        order.push(index);
        for &next in &consumers[index] {
            incoming[next] -= 1;
            if incoming[next] == 0 {
                queue.push_back(next);
            }
        }
    }
    if order.len() != count {
        return Err(Error::new("Evidence dependencies contain a cycle."));
    }
    let mut names = vec![0; count + 1];
    for (i, old) in order.iter().enumerate() {
        names[old + 1] = i + 1;
    }
    run.steps = order.into_iter().map(|i| run.steps[i].clone()).collect();
    for step in &mut run.steps {
        if let Justification::Rule { premises, .. } = &mut step.justification {
            for id in premises {
                *id = names[*id];
            }
        }
    }
    for boundary in &mut run.boundaries {
        for id in &mut boundary.steps {
            *id = names[*id];
        }
        boundary.steps.sort_unstable();
    }
    for answers in &mut run.answers {
        for answer in answers {
            for id in &mut answer.premises {
                *id = names[*id];
            }
        }
    }
    Ok(())
}
