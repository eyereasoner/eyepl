//! eyepl implements reasoning for the eyepl rule language, with a separate certificate checker.
//!
//! Parse a program with [`parse`], evaluate it with [`reason`], and inspect
//! answers or save a [`Certificate`]. Checking replays recorded applications;
//! it does not run the evaluator or establish answer completeness.
//!
//! ```
//! use eyepl::{check, parse, reason, Limits};
//! let program = parse("human(socrates). mortal(X) :- human(X). ?- mortal(Who).")?;
//! let run = reason(&program, Limits::default())?;
//! let report = check(&program, &run.certificate(&program))?;
//! assert!(report.valid());
//! assert_eq!(report.claims, 1);
//! # Ok::<(), eyepl::Error>(())
//! ```

mod arithmetic;
mod engine;
mod export;
mod language;
mod model;
mod output;
mod parser;
mod proof;
mod semantics;
#[cfg(target_arch = "wasm32")]
mod wasm;

pub use engine::{reason, Answer, Limits, Run};
pub use model::{
    Aggregate, AggregateKind, Atom, Error, Goal, Literal, Name, Program, Query, Request, Rule,
    Term, Value,
};
pub use parser::{parse, parse_atom, parse_document};
pub use proof::{
    check, check_with_limits, Boundary, Certificate, Claim, Condition, ConditionReport, Failure,
    Justification, Owner, ProofLocation, Report, Step,
};

pub const VERSION: &str = env!("CARGO_PKG_VERSION");

/// Evaluate source and render its answer, certificate, and verification requests.
pub fn execute(source: &str, limits: Limits) -> Result<String, Error> {
    let program = parse_document(source)?;
    reason(&program, limits)?.output_with_limits(&program, limits)
}
