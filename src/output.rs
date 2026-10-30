//! One reloadable eyepl result document for the CLI, browser, and saved example outputs.

use crate::export::{Record, Witnesses};
use crate::{
    Atom, Certificate, Claim, Error, Goal, Justification, Limits, Literal, Owner, Program, Report,
    Request, Run, Value,
};
use std::collections::BTreeSet;

fn number(n: usize) -> Value {
    crate::arithmetic::integer(n.into())
}
fn symbol(name: &str) -> Value {
    Value::Symbol(name.into())
}
fn compound(name: &str, values: Vec<Value>) -> Value {
    Value::Compound(name.into(), values)
}
fn list(values: impl DoubleEndedIterator<Item = Value>) -> Value {
    values
        .rev()
        .fold(Value::Nil, |tail, head| compound(".", vec![head, tail]))
}
fn ids(values: &[usize]) -> Value {
    list(values.iter().copied().map(number))
}
fn record(heading: &str, predicate: &str, values: Vec<Value>) -> Record {
    Record {
        heading: Some(heading.into()),
        atom: Atom {
            predicate: predicate.into(),
            values,
        },
    }
}
fn owner(value: Owner) -> Value {
    match value {
        Owner::Rule(n) => compound("rule", vec![number(n)]),
        Owner::Query(n) => compound("query", vec![number(n)]),
    }
}
fn justification(value: &Justification) -> Value {
    match value {
        Justification::Source(n) => compound("source", vec![number(*n)]),
        Justification::Rule { rule, premises } => {
            compound("rule", vec![number(*rule), ids(premises)])
        }
        Justification::Builtin => symbol("builtin"),
        Justification::NotBuiltin => symbol("not_builtin"),
        Justification::Absent { boundary } => compound("absent", vec![number(*boundary)]),
        Justification::Aggregate {
            owner: scope,
            position,
            boundary,
        } => compound(
            "aggregate",
            vec![owner(*scope), number(*position), number(*boundary)],
        ),
        Justification::Fresh { rule, position } => {
            compound("fresh", vec![number(*rule), number(*position)])
        }
    }
}

/// Proof terms are closed data. Recorded call variables and typed witnesses
/// must not become free source variables or asserted identities.
fn proof_value(value: &Value, witnesses: &Witnesses) -> Value {
    match value {
        Value::Variable(name) => compound("variable", vec![Value::Text(name.clone())]),
        Value::Witness(name) => compound("witness", vec![symbol(&witnesses.label(name))]),
        Value::Compound(name, args) => compound(
            name,
            args.iter().map(|v| proof_value(v, witnesses)).collect(),
        ),
        other => other.clone(),
    }
}
fn atom_value(atom: &Atom, witnesses: &Witnesses) -> Value {
    if atom.values.is_empty() {
        symbol(&atom.predicate)
    } else {
        compound(
            &atom.predicate,
            atom.values
                .iter()
                .map(|v| proof_value(v, witnesses))
                .collect(),
        )
    }
}
fn goal_value(goal: &Goal, witnesses: &Witnesses) -> Value {
    atom_value(
        &Atom {
            predicate: goal.predicate.clone(),
            values: goal.terms.iter().map(crate::model::term_value).collect(),
        },
        witnesses,
    )
}

impl Run {
    /// A query of ordinary calls answers with its instantiated facts; any other
    /// query, or one with anonymous variables, lists its bindings, since a
    /// decision or an open goal is not a reloadable fact.
    fn answer_records(&self, program: &Program, index: usize, records: &mut Vec<Record>) {
        let heading = format!("Answer {}", index + 1);
        if self.answers[index].is_empty() {
            records.push(record(&heading, "no_answer", vec![number(index + 1)]));
            return;
        }
        let query = &program.queries[index];
        let facts: Option<Vec<Atom>> = query
            .goals
            .iter()
            .map(|literal| match literal {
                Literal::Relation(goal) => Some(goal),
                _ => None,
            })
            .collect::<Option<Vec<&Goal>>>()
            .and_then(|relations| {
                let mut facts = Vec::new();
                let mut seen = BTreeSet::new();
                for answer in &self.answers[index] {
                    let bindings = query
                        .variables
                        .iter()
                        .cloned()
                        .zip(answer.values.iter().cloned())
                        .collect();
                    for goal in &relations {
                        let atom = crate::engine::instantiate(goal, &bindings)?;
                        if seen.insert(atom.clone()) {
                            facts.push(atom);
                        }
                    }
                }
                Some(facts)
            });
        if let Some(facts) = facts {
            records.extend(facts.into_iter().map(|atom| Record {
                heading: Some(heading.clone()),
                atom,
            }));
            return;
        }
        for answer in &self.answers[index] {
            let bindings = list(
                query
                    .variables
                    .iter()
                    .zip(&answer.values)
                    .map(|(name, value)| {
                        compound("binding", vec![Value::Text(name.clone()), value.clone()])
                    }),
            );
            records.push(record(
                &heading,
                "answer",
                vec![number(index + 1), bindings],
            ));
        }
    }
    fn proof_records(
        certificate: &Certificate,
        index: usize,
        records: &mut Vec<Record>,
        witnesses: &Witnesses,
    ) {
        let heading = format!("Reason {}", index + 1);
        let query = number(index + 1);
        let mut used = BTreeSet::new();
        for step in &certificate.steps {
            let mut pending: Vec<_> = step.atom.values.iter().collect();
            while let Some(value) = pending.pop() {
                match value {
                    Value::Witness(name) => {
                        used.insert(name.clone());
                    }
                    Value::Compound(_, args) => pending.extend(args),
                    _ => {}
                }
            }
        }
        let mut used: Vec<_> = used.into_iter().collect();
        used.sort_by_key(|name| witnesses.label(name)[1..].parse::<usize>().unwrap_or(0));
        for name in used {
            records.push(record(
                &heading,
                "proof_witness",
                vec![
                    query.clone(),
                    symbol(&witnesses.label(&name)),
                    Value::Text(name),
                ],
            ));
        }
        for (at, step) in certificate.steps.iter().enumerate() {
            records.push(record(
                &heading,
                "proof_step",
                vec![
                    query.clone(),
                    number(at + 1),
                    atom_value(&step.atom, witnesses),
                    justification(&step.justification),
                ],
            ));
        }
        // A boundary can hold thousands of steps and calls. Flat records, with
        // runs of consecutive steps as ranges, keep the document free of list
        // terms too deep to reload.
        for (at, boundary) in certificate.boundaries.iter().enumerate() {
            let id = number(at + 1);
            records.push(record(
                &heading,
                "proof_boundary",
                vec![query.clone(), id.clone(), number(boundary.level)],
            ));
            let mut runs: Vec<(usize, usize)> = Vec::new();
            for &step in &boundary.steps {
                match runs.last_mut() {
                    Some((_, last)) if *last + 1 == step => *last = step,
                    _ => runs.push((step, step)),
                }
            }
            for (first, last) in runs {
                records.push(record(
                    &heading,
                    "proof_boundary_steps",
                    vec![query.clone(), id.clone(), number(first), number(last)],
                ));
            }
            for call in &boundary.calls {
                records.push(record(
                    &heading,
                    "proof_boundary_call",
                    vec![query.clone(), id.clone(), goal_value(call, witnesses)],
                ));
            }
        }
        for claim in &certificate.claims {
            let claim = match claim {
                Claim::Answer { query, premises } => {
                    compound("answer", vec![number(*query), ids(premises)])
                }
                Claim::Derived(step) => compound("derived", vec![number(*step)]),
            };
            records.push(record(&heading, "proof_claim", vec![query.clone(), claim]));
        }
    }
    fn check_records(report: &Report, index: usize, records: &mut Vec<Record>) {
        let heading = format!("Check {}", index + 1);
        let query = number(index + 1);
        records.push(record(
            &heading,
            "proof_check",
            vec![
                query.clone(),
                symbol("checked"),
                list(
                    [
                        compound("steps", vec![number(report.steps)]),
                        compound("claims", vec![number(report.claims)]),
                        compound("source_facts", vec![number(report.source_facts)]),
                        compound("rule_applications", vec![number(report.rule_applications)]),
                        compound(
                            "assumed",
                            vec![list(
                                [symbol("source_facts"), symbol("source_rules")].into_iter(),
                            )],
                        ),
                        compound("answer_completeness", vec![symbol("not_checked")]),
                    ]
                    .into_iter(),
                ),
            ],
        ));
        for result in &report.conditions {
            let id = format!("c{}", result.condition as usize + 1);
            let result_value = if let Some(reason) = result.not_applicable {
                compound("not_applicable", vec![Value::Text(reason.into())])
            } else {
                compound(
                    "checked",
                    vec![number(result.checked), number(result.failed)],
                )
            };
            records.push(record(
                &heading,
                "proof_condition",
                vec![
                    query.clone(),
                    symbol(&id),
                    Value::Text(result.condition.name().into()),
                    result_value,
                ],
            ));
        }
    }

    /// Render all source requests as one formatted, reloadable eyepl document.
    pub fn output(&self, program: &Program) -> Result<String, Error> {
        self.output_with_limits(program, Limits::default())
    }
    pub(crate) fn output_with_limits(
        &self,
        program: &Program,
        limits: Limits,
    ) -> Result<String, Error> {
        let mut witnesses = Witnesses::default();
        for step in &self.steps {
            for value in &step.atom.values {
                witnesses.remember(value);
            }
        }
        let mut records = Vec::new();
        if program.requests.is_empty() {
            if program.queries.is_empty() {
                records.extend(
                    self.steps
                        .iter()
                        .filter(|step| {
                            matches!(step.justification, Justification::Rule { .. })
                                && !step.atom.predicate.starts_with('$')
                        })
                        .map(|step| Record {
                            heading: None,
                            atom: step.atom.clone(),
                        }),
                );
            } else {
                for index in 0..program.queries.len() {
                    self.answer_records(program, index, &mut records);
                }
            }
        } else {
            let mut last_query = None;
            for request in &program.requests {
                match *request {
                    Request::Answer(index) => {
                        last_query = Some(index);
                        self.answer_records(program, index, &mut records);
                    }
                    Request::Result(index) => records.push(record(
                        &format!("Goal check {}", index + 1),
                        "check_result",
                        vec![
                            number(index + 1),
                            symbol(if self.answers[index].is_empty() {
                                "false"
                            } else {
                                "true"
                            }),
                        ],
                    )),
                    Request::Proof | Request::Check => {
                        let index = last_query.ok_or_else(|| {
                            Error::new("why and check need a preceding ordinary query.")
                        })?;
                        let certificate = Certificate::from_run_for(program, self, Some(index));
                        if matches!(request, Request::Proof) {
                            Self::proof_records(&certificate, index, &mut records, &witnesses);
                        } else {
                            let report = crate::check_with_limits(program, &certificate, limits)?
                                .require_valid()?;
                            Self::check_records(&report, index, &mut records);
                        }
                    }
                }
            }
        }
        crate::export::render(&records, &witnesses)
    }

    /// A standalone certificate, accepted by `Certificate::parse`.
    pub fn proof(&self, program: &Program) -> String {
        Self::format_proof(program, &self.certificate(program))
    }
    fn format_proof(program: &Program, certificate: &Certificate) -> String {
        let mut used = vec![false; program.rules.len()];
        for step in &certificate.steps {
            if let Justification::Rule { rule, .. } = step.justification {
                used[rule - 1] = true;
            }
        }
        let mut text = String::from("eyepl-proof 1\n");
        for (index, rule) in program.rules.iter().enumerate() {
            if used[index] {
                text.push_str(&format!("% Rule {}: {}\n", index + 1, rule));
            }
        }
        let serialized = certificate.to_string();
        text.push_str(serialized.split_once('\n').unwrap().1);
        text
    }
}
