//! Render source requests after evaluation.

use crate::{Certificate, Error, Justification, Limits, Program, Query, Request, Run};

impl Run {
    fn query_output(&self, program: &Program, index: usize) -> String {
        let query = &program.queries[index];
        let mut text = format!("?- {}.\n", goals_text(query));
        if self.answers[index].is_empty() {
            text.push_str("false.\n");
        }
        for answer in &self.answers[index] {
            if query.variables.is_empty() {
                text.push_str("true.\n");
            } else {
                text.push_str(
                    &query
                        .variables
                        .iter()
                        .zip(&answer.values)
                        .map(|(name, value)| format!("{name} = {value}"))
                        .collect::<Vec<_>>()
                        .join(", "),
                );
                text.push_str(".\n");
            }
        }
        text
    }
    /// Render requests in source order, checking proofs with the default limits.
    pub fn output(&self, program: &Program) -> Result<String, Error> {
        self.output_with_limits(program, Limits::default())
    }
    pub(crate) fn output_with_limits(
        &self,
        program: &Program,
        limits: Limits,
    ) -> Result<String, Error> {
        if program.requests.is_empty() {
            return Ok(if program.queries.is_empty() {
                self.steps
                    .iter()
                    .filter(|step| matches!(step.justification, Justification::Rule { .. }))
                    .map(|step| format!("{}.\n", step.atom))
                    .collect()
            } else {
                (0..program.queries.len())
                    .map(|i| self.query_output(program, i))
                    .collect::<Vec<_>>()
                    .join("\n")
            });
        }
        let mut last_query = None;
        let mut blocks = Vec::new();
        for request in &program.requests {
            match *request {
                Request::Answer(index) => {
                    last_query = Some(index);
                    blocks.push(self.query_output(program, index));
                }
                Request::Result(index) => {
                    let query = &program.queries[index];
                    let mut goals = goals_text(query);
                    if query.goals.len() > 1 {
                        goals = format!("({goals})");
                    }
                    let result = if self.answers[index].is_empty() {
                        "false"
                    } else {
                        "true"
                    };
                    blocks.push(format!("?- check({goals}).\n{result}.\n"));
                }
                Request::Proof | Request::Check => {
                    let index = last_query.ok_or_else(|| {
                        Error::new("why and check need a preceding ordinary query.")
                    })?;
                    let certificate = Certificate::from_run_for(program, self, Some(index));
                    if matches!(request, Request::Proof) {
                        blocks.push(format!(
                            "?- why.\n{}",
                            Self::format_proof(program, &certificate)
                        ));
                    } else {
                        blocks.push(format!(
                            "?- check.\n{}",
                            crate::check_with_limits(program, &certificate, limits)?
                                .require_valid()?
                        ));
                    }
                }
            }
        }
        Ok(blocks.join("\n"))
    }
    /// The single, readable proof format, accepted by `Certificate::parse`.
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

fn goals_text(query: &Query) -> String {
    query
        .goals
        .iter()
        .map(ToString::to_string)
        .collect::<Vec<_>>()
        .join(", ")
}
