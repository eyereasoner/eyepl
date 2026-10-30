use eyepl::{
    check, parse, reason, Certificate, Claim, Condition, Justification, Limits, ProofLocation,
    Report, Step,
};

const SOCRATES: &str = include_str!("fixtures/minimal.pl");

fn inspect(source: &str, proof: &str) -> Report {
    check(&parse(source).unwrap(), &Certificate::parse(proof).unwrap()).unwrap()
}

fn fails(report: &Report, condition: Condition) {
    assert!(!report.valid(), "{report}");
    assert!(report.condition(condition).failed > 0, "{report}");
    assert!(report
        .failures
        .iter()
        .any(|failure| failure.condition == condition));
    assert!(report.to_string().starts_with("invalid:"));
    assert!(report.to_string().contains(&format!("[{condition}]")));
    assert!(report.clone().require_valid().is_err());
}

#[test]
fn valid_reports_list_all_nine_conditions_and_exact_counts() {
    let p = parse(SOCRATES).unwrap();
    let c = reason(&p, Limits::default()).unwrap().certificate(&p);
    let report = check(&p, &c).unwrap();
    assert!(report.valid());
    assert!(report.failures.is_empty());
    assert_eq!(
        report.conditions.each_ref().map(|result| result.condition),
        Condition::ALL
    );
    for (condition, expected) in [
        (Condition::C1, 2),
        (Condition::C2, 1),
        (Condition::C3, 3),
        (Condition::C4, 5),
        (Condition::C7, 2),
        (Condition::C9, 1),
    ] {
        let result = report.condition(condition);
        assert_eq!(result.checked, expected, "{condition}");
        assert_eq!(result.failed, 0);
        assert_eq!(result.not_applicable, None);
    }
    for condition in [Condition::C5, Condition::C6, Condition::C8] {
        let result = report.condition(condition);
        assert_eq!((result.checked, result.failed), (0, 0));
        assert!(result.not_applicable.is_some());
        assert!(report
            .to_string()
            .contains(&format!("{condition}: not applicable")));
    }
    assert!(report.require_valid().is_ok());
}

#[test]
fn c1_rejects_forged_facts_heads_and_inconsistent_rule_bindings() {
    let report = inspect(SOCRATES, "eyepl-proof 1\nstep 1 source 1 : human(plato).\nstep 2 rule 1 [1] : mortal(plato).\nanswer 1 [2]\n");
    fails(&report, Condition::C1);
    assert_eq!(report.failures[0].location, ProofLocation::Step(1));
    let report = inspect(SOCRATES, "eyepl-proof 1\nstep 1 source 1 : human(socrates).\nstep 2 rule 1 [1] : mortal(plato).\nanswer 1 [2]\n");
    fails(&report, Condition::C1);
    let report = inspect("p(a). edge(b,c). r(X,Y) :- p(X), edge(X,Y). ?- r(X,Y).", "eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : edge(b,c).\nstep 3 rule 1 [1,2] : r(a,c).\nanswer 1 [3]\n");
    fails(&report, Condition::C1);
}

#[test]
fn c2_rejects_a_self_justifying_cycle_and_acyclic_forward_references() {
    let report = inspect(
        "p(X) :- p(X). ?- p(X).",
        "eyepl-proof 1\nstep 1 rule 1 [1] : p(a).\nanswer 1 [1]\n",
    );
    fails(&report, Condition::C2);
    assert_eq!(report.condition(Condition::C1).failed, 0);
    let report = inspect(
        "p(a). q(X) :- p(X). ?- q(X).",
        "eyepl-proof 1\nstep 1 rule 1 [2] : q(a).\nstep 2 source 1 : p(a).\nanswer 1 [1]\n",
    );
    fails(&report, Condition::C2);
}

#[test]
fn c3_rejects_duplicate_steps_and_duplicate_projected_answers() {
    let report = inspect("p(a). ?- p(X).", "eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 1 : p(a).\nanswer 1 [1]\nanswer 1 [2]\n");
    fails(&report, Condition::C3);
    assert_eq!(report.condition(Condition::C3).failed, 2);
    let report = inspect("p(a). p(b). ?- p(_).", "eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : p(b).\nanswer 1 [1]\nanswer 1 [2]\n");
    fails(&report, Condition::C3);
}

#[test]
fn c4_reports_missing_references_without_panicking_or_running_dependent_checks() {
    let report = inspect(
        SOCRATES,
        "eyepl-proof 1\nstep 1 rule 999 [999] : mortal(socrates).\nanswer 999 [999]\n",
    );
    fails(&report, Condition::C4);
    assert_eq!(report.condition(Condition::C4).failed, 4);
    assert_eq!(report.condition(Condition::C1).checked, 0);
    assert_eq!(report.condition(Condition::C2).checked, 0);
    assert_eq!(report.condition(Condition::C9).checked, 0);
    let p = parse(SOCRATES).unwrap();
    let mut c = reason(&p, Limits::default()).unwrap().certificate(&p);
    c.steps[0].justification = Justification::Source(0);
    fails(&check(&p, &c).unwrap(), Condition::C4);
}

#[test]
fn c7_rejects_unrelated_steps_and_input_facts_disguised_as_derived_output() {
    let report = inspect(
        "p(a). p(b). ?- p(X).",
        "eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : p(b).\nanswer 1 [1]\n",
    );
    fails(&report, Condition::C7);
    assert_eq!(report.failures[0].location, ProofLocation::Step(2));
    let report = inspect(
        "p(a). q(a). p(X) :- q(X).",
        "eyepl-proof 1\nstep 1 source 2 : q(a).\nstep 2 rule 1 [1] : p(a).\nderived 2\n",
    );
    fails(&report, Condition::C7);
    assert_eq!(report.condition(Condition::C1).failed, 0);
    // A query may still select that same supported input fact.
    let report = inspect(
        "p(a). q(a). p(X) :- q(X). ?- p(X).",
        "eyepl-proof 1\nstep 1 source 2 : q(a).\nstep 2 rule 1 [1] : p(a).\nanswer 1 [2]\n",
    );
    assert!(report.valid(), "{report}");
}

#[test]
fn c9_requires_complete_consistent_query_selection() {
    for evidence in ["[1]", "[1,2]"] {
        let report = inspect("p(a). q(b). ?- p(X), q(X).", &format!("eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : q(b).\nanswer 1 {evidence}\n"));
        fails(&report, Condition::C9);
    }
    let p = parse(SOCRATES).unwrap();
    let mut c = reason(&p, Limits::default()).unwrap().certificate(&p);
    c.claims[0] = Claim::Derived(2);
    fails(&check(&p, &c).unwrap(), Condition::C9);
}

#[test]
fn inapplicable_conditions_do_not_admit_unsupported_proof_justifications() {
    for justification in [
        "builtin 1",
        "trusted 1",
        "obligation 1",
        "witness 1",
        "answer 1",
    ] {
        let text =
            format!("eyepl-proof 1\nstep 1 {justification} : mortal(socrates).\nanswer 1 [1]\n");
        let error = Certificate::parse(&text).unwrap_err().to_string();
        assert!(error.contains("[C3 justification]"), "{error}");
        assert!(Certificate::parse(&text)
            .and_then(|c| check(&parse(SOCRATES).unwrap(), &c)?.require_valid())
            .is_err());
    }
    for source in ["p().", "p :- @eq(a,a).", "p :- \\+ q. q :- p."] {
        assert!(parse(source).is_err());
    }
}

#[test]
fn all_independent_failures_are_reported_and_rechecking_is_repeatable() {
    let p = parse(SOCRATES).unwrap();
    let c = Certificate::parse("eyepl-proof 1\nstep 1 source 1 : human(plato).\nstep 2 rule 1 [1] : mortal(socrates).\nanswer 1 [2]\n").unwrap();
    let report = check(&p, &c).unwrap();
    assert_eq!(report.condition(Condition::C1).failed, 2);
    assert_eq!(check(&p, &c).unwrap(), report);
    assert!(check(&p, &c).unwrap().require_valid().is_err());
}

#[test]
fn empty_certificates_check_no_positive_claims_and_no_inapplicable_conditions() {
    let report = inspect(SOCRATES, "eyepl-proof 1\n");
    assert!(report.valid());
    assert_eq!((report.steps, report.claims), (0, 0));
    assert!(report
        .conditions
        .iter()
        .all(|condition| condition.checked == 0 && condition.failed == 0));
    assert!(report
        .to_string()
        .contains("Answer completeness is not checked."));
}

#[test]
fn exhaustive_small_forged_certificates_never_establish_a_false_query_answer() {
    // The only entailed query answer is q(a). Include an unsupported positive
    // cycle over b, missing IDs, wrong source facts, and every two-step ordering.
    let p = parse("p(a). q(X) :- p(X). p(X) :- q(X). ?- q(Who).").unwrap();
    let atoms: Vec<_> = ["p(a).", "p(b).", "q(a).", "q(b)."]
        .iter()
        .map(|text| eyepl::parse_atom(text).unwrap())
        .collect();
    let expected = eyepl::parse_atom("q(a).").unwrap();
    let mut justifications = vec![
        Justification::Source(0),
        Justification::Source(1),
        Justification::Source(2),
    ];
    for rule in 1..=2 {
        for premise in 0..=3 {
            justifications.push(Justification::Rule {
                rule,
                premises: vec![premise],
            });
        }
    }
    let steps: Vec<_> = atoms
        .iter()
        .flat_map(|atom| {
            justifications.iter().map(move |justification| Step {
                atom: atom.clone(),
                justification: justification.clone(),
            })
        })
        .collect();
    let mut accepted = 0;
    for first in &steps {
        for second in &steps {
            for premise in 1..=2 {
                let certificate = Certificate {
                    boundaries: vec![],
                    steps: vec![first.clone(), second.clone()],
                    claims: vec![Claim::Answer {
                        query: 1,
                        premises: vec![premise],
                    }],
                };
                let report = check(&p, &certificate).unwrap();
                if report.valid() {
                    accepted += 1;
                    assert_eq!(
                        certificate.steps[premise - 1].atom,
                        expected,
                        "{certificate}"
                    );
                }
            }
        }
    }
    assert_eq!(accepted, 1);
}
