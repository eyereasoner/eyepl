use wheye::{
    check, parse, reason, Boundary, Certificate, Condition, Justification, Limits, Owner, Program,
    Value,
};

fn proof(source: &str) -> (Program, Certificate) {
    let p = parse(source).unwrap();
    let c = reason(&p, Limits::default()).unwrap().certificate(&p);
    assert!(check(&p, &c).unwrap().valid());
    (p, c)
}
fn rejects(p: &Program, c: &Certificate, condition: Condition) {
    let report = check(p, c).unwrap();
    assert!(!report.valid(), "accepted {c}");
    assert!(report.condition(condition).failed > 0, "{report}\n{c}");
}
fn inspect(source: &str, text: &str, condition: Condition) {
    let p = parse(source).unwrap();
    let c = Certificate::parse(text).unwrap();
    rejects(&p, &c, condition);
}

#[test]
fn c1_distinguishes_relational_premises_from_negative_and_builtin_decisions() {
    inspect(
        "p :- eq(a,a). ?- p.",
        "wheye-proof 1\nstep 1 builtin : eq(a,a).\nstep 2 rule 1 [1] : p.\nanswer 1 [2]\n",
        Condition::C1,
    );
    inspect("p :- missing(a). ?- p.","wheye-proof 1\nstep 1 absent 1 : missing(a).\nstep 2 rule 1 [1] : p.\nboundary 1 level 0 []\nanswer 1 [2]\n",Condition::C1);
    inspect(
        "add(2,3,99). p(X):-X is 2 + 3. ?- p(X).",
        "wheye-proof 1\nstep 1 source 1 : add(2,3,99).\nstep 2 rule 1 [1] : p(99).\nanswer 1 [2]\n",
        Condition::C1,
    );
}

#[test]
fn c2_rejects_boundary_evidence_later_than_the_negative_decision() {
    inspect("p(a). q:-\\+ missing. ?- q.","wheye-proof 1\nstep 1 absent 1 : missing.\nstep 2 source 1 : p(a).\nstep 3 rule 1 [1] : q.\nboundary 1 level 0 [2]\nanswer 1 [3]\n",Condition::C2);
}

#[test]
fn c3_rejects_duplicate_boundary_levels_and_wrong_aggregate_goal_kinds() {
    let (p, mut c) = proof("p(a). ?- aggregate_all(count, (p(X)), N).");
    c.boundaries.push(c.boundaries[0].clone());
    rejects(&p, &c, Condition::C3);
    let (p, mut c) = proof("p(a). ?- p(X).");
    c.steps[0].justification = Justification::Aggregate {
        owner: Owner::Query(1),
        position: 1,
        boundary: 1,
    };
    c.boundaries.push(Boundary {
        calls: Vec::new(),
        level: 0,
        steps: vec![],
    });
    rejects(&p, &c, Condition::C3);
}

#[test]
fn c4_checks_boundary_members_owners_and_goal_positions_without_panicking() {
    let (p, original) = proof("p(a). ?- aggregate_all(count, (p(X)), N).");
    for id in [0, 999] {
        let mut c = original.clone();
        c.boundaries[0].steps.push(id);
        rejects(&p, &c, Condition::C4);

        let mut c = original.clone();
        c.steps[0].justification = Justification::Rule {
            rule: id,
            premises: vec![],
        };
        rejects(&p, &c, Condition::C4);
    }
    for replacement in [
        Justification::Aggregate {
            owner: Owner::Query(999),
            position: 1,
            boundary: 1,
        },
        Justification::Aggregate {
            owner: Owner::Query(1),
            position: 999,
            boundary: 1,
        },
        Justification::Aggregate {
            owner: Owner::Query(1),
            position: 1,
            boundary: 999,
        },
    ] {
        let mut c = original.clone();
        c.steps.last_mut().unwrap().justification = replacement;
        rejects(&p, &c, Condition::C4);
    }
}

#[test]
fn c5_recomputes_arithmetic_and_never_trusts_a_recorded_result() {
    let (p, mut c) = proof("q(N):-N is 2 + 3. ?- q(N).");
    c.steps[0].atom.values[0] = Value::Integer(99);
    c.steps[1].atom.values[0] = Value::Integer(99);
    rejects(&p, &c, Condition::C5);
    assert_eq!(check(&p, &c).unwrap().condition(Condition::C1).failed, 0);
    inspect(
        "?- a = b.",
        "wheye-proof 1\nstep 1 builtin : eq(a,b).\nanswer 1 [1]\n",
        Condition::C5,
    );
}

#[test]
fn c5_recomputes_aggregate_results_including_distinct_tuple_keys() {
    let (p, mut c) =
        proof("row(x,5). row(y,5). total(N):-aggregate_all(sum(V), (row(I,V)), N). ?- total(N).");
    for s in &mut c.steps {
        match s.justification {
            Justification::Aggregate { .. } => {
                *s.atom.values.last_mut().unwrap() = Value::Integer(5)
            }
            Justification::Rule { .. } => s.atom.values[0] = Value::Integer(5),
            _ => {}
        }
    }
    rejects(&p, &c, Condition::C5);
    assert_eq!(check(&p, &c).unwrap().condition(Condition::C1).failed, 0);
}

#[test]
fn c6_rejects_a_negative_claim_that_hides_a_derivable_counterexample() {
    inspect("seed(a). blocked(X):-seed(X). allowed(X):-seed(X),\\+ blocked(X). ?- allowed(X).",
        "wheye-proof 1\nstep 1 source 1 : seed(a).\nstep 2 absent 1 : blocked(a).\nstep 3 rule 2 [1,2] : allowed(a).\nboundary 1 level 0 [1]\nanswer 1 [3]\n",Condition::C6);
}

#[test]
fn c6_rejects_a_negative_claim_that_hides_an_input_fact() {
    inspect("blocked(a). allowed:-\\+ blocked(a). ?- allowed.",
        "wheye-proof 1\nstep 1 absent 1 : blocked(a).\nstep 2 rule 1 [1] : allowed.\nboundary 1 level 0 []\nanswer 1 [2]\n",Condition::C6);
}

#[test]
fn c6_rejects_an_aggregate_over_an_incomplete_but_locally_consistent_boundary() {
    let (p, mut c) = proof("p(a). p(b). total(N):-aggregate_all(count, (p(X)), N). ?- total(N).");
    c.boundaries[0]
        .steps
        .retain(|id| c.steps[id - 1].atom.values != vec![Value::Symbol("b".into())]);
    for s in &mut c.steps {
        match s.justification {
            Justification::Aggregate { .. } => {
                *s.atom.values.last_mut().unwrap() = Value::Integer(1)
            }
            Justification::Rule { .. } => s.atom.values[0] = Value::Integer(1),
            _ => {}
        }
    }
    rejects(&p, &c, Condition::C6);
    let report = check(&p, &c).unwrap();
    assert_eq!(report.condition(Condition::C5).failed, 0);
    assert_eq!(report.condition(Condition::C1).failed, 0);
}

#[test]
fn c6_detects_missing_derived_members_in_aggregate_boundaries() {
    inspect("p(a). p(b). q(X):-p(X). total(N):-aggregate_all(count, (q(X)), N). ?- total(N).",
        "wheye-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : p(b).\nstep 3 rule 1 [1] : q(a).\nstep 4 aggregate r2 1 1 : '$aggregate:r2:1'(1).\nstep 5 rule 2 [4] : total(1).\nboundary 1 level 0 [1,2,3]\nanswer 1 [5]\n",Condition::C6);
}

#[test]
fn c6_rejects_wrong_levels_decisions_and_negative_contradictions_in_boundaries() {
    let (p, original) = proof("p(a). q(X):-p(X),\\+ blocked(X). ?- q(X).");
    let mut c = original.clone();
    c.boundaries[0].level = 99;
    rejects(&p, &c, Condition::C6);
    let mut c = original.clone();
    let decision = c
        .steps
        .iter()
        .position(|s| matches!(s.justification, Justification::Absent { .. }))
        .unwrap()
        + 1;
    c.boundaries[0].steps.push(decision);
    rejects(&p, &c, Condition::C6);
    let mut c = original;
    c.steps[decision - 1].atom.predicate = "p".into();
    rejects(&p, &c, Condition::C6);
}

#[test]
fn c7_requires_every_boundary_and_decision_to_support_a_claim() {
    let (p, mut c) = proof("p(a). ?- p(X).");
    c.boundaries.push(Boundary {
        calls: Vec::new(),
        level: 0,
        steps: vec![1],
    });
    rejects(&p, &c, Condition::C7);
    let (p, mut c) = proof("?- N is 1 + 2.");
    c.claims.clear();
    rejects(&p, &c, Condition::C7);
}

#[test]
fn c8_rejects_forged_witnesses_even_when_all_rule_matches_are_consistent() {
    let (p, mut c) = proof("visitor(a). ticket(P,W):-visitor(P),fresh(W). ?- ticket(P,W).");
    for step in &mut c.steps {
        for v in &mut step.atom.values {
            if matches!(v, Value::Witness(_)) {
                *v = Value::Witness("forged".into());
            }
        }
    }
    rejects(&p, &c, Condition::C8);
    assert_eq!(check(&p, &c).unwrap().condition(Condition::C1).failed, 0);
}

#[test]
fn c6_rejects_a_witness_introduced_although_a_fact_satisfies_its_conclusion() {
    let source = "t(a,k). q(a). t(X,W):-q(X),fresh(W). ?- t(X,W).";
    let witness = r#"~"r1:g2:{\"X\": Symbol(\"a\")}""#;
    let forged = |boundary: &str| {
        format!(
            "wheye-proof 1\nstep 1 source 1 : t(a, k).\nstep 2 source 2 : q(a).\n\
             step 3 absent 1 : '$satisfied:1'(a).\nstep 4 rule 3 [2,3] : '$lean:1'(a).\n\
             step 5 fresh 1 2 : '$fresh:r1:2'(a, {witness}).\n\
             step 6 rule 1 [4,5] : t(a, {witness}).\nboundary 1 level 0 {boundary}\nanswer 1 [6]\n"
        )
    };
    // The boundary omits the satisfaction fact that t(a, k) entails.
    let p = parse(source).unwrap();
    let c = Certificate::parse(&forged("[1,2]")).unwrap();
    rejects(&p, &c, Condition::C6);
    let report = check(&p, &c).unwrap();
    assert!(
        report
            .to_string()
            .contains("omits rule 2 conclusion '$satisfied:1'(a)"),
        "{report}"
    );
    for condition in [Condition::C1, Condition::C2, Condition::C5, Condition::C8] {
        assert_eq!(report.condition(condition).failed, 0, "{report}");
    }
    // Omitting the satisfying fact itself leaves the boundary incomplete.
    inspect(source, &forged("[2]"), Condition::C6);
}

#[test]
fn c8_prevents_reuse_of_a_witness_from_a_different_firing() {
    let (p, mut c) =
        proof("visitor(a). visitor(b). ticket(P,W):-visitor(P),fresh(W). ?- ticket(P,W).");
    let identities: Vec<_> = c
        .steps
        .iter()
        .filter(|s| matches!(s.justification, Justification::Fresh { .. }))
        .map(|s| s.atom.values.last().unwrap().clone())
        .collect();
    assert_ne!(identities[0], identities[1]);
    for step in &mut c.steps {
        for v in &mut step.atom.values {
            if *v == identities[1] {
                *v = identities[0].clone();
            }
        }
    }
    rejects(&p, &c, Condition::C8);
    assert_eq!(check(&p, &c).unwrap().condition(Condition::C1).failed, 0);
}

#[test]
fn c9_never_selects_a_test_as_an_ordinary_query_fact() {
    inspect(
        "?- eq(a,a).",
        "wheye-proof 1\nstep 1 builtin : eq(a,a).\nanswer 1 [1]\n",
        Condition::C9,
    );
    inspect(
        "?- missing(a).",
        "wheye-proof 1\nstep 1 absent 1 : missing(a).\nboundary 1 level 0 []\nanswer 1 [1]\n",
        Condition::C9,
    );
}

#[test]
fn c9_does_not_allow_a_query_aggregate_to_become_rule_evidence() {
    let (p, mut c) = proof(
        "p(a). q(N):-aggregate_all(count, (p(X)), N). ?- q(N). ?- aggregate_all(count, (p(X)), N).",
    );
    let query_decision = c
        .steps
        .iter()
        .position(|s| {
            matches!(
                s.justification,
                Justification::Aggregate {
                    owner: Owner::Query(2),
                    ..
                }
            )
        })
        .unwrap()
        + 1;
    let rule = c
        .steps
        .iter_mut()
        .find(|s| matches!(s.justification, Justification::Rule { .. }))
        .unwrap();
    if let Justification::Rule { premises, .. } = &mut rule.justification {
        premises[0] = query_decision;
    }
    rejects(&p, &c, Condition::C1);
}

#[test]
fn c6_detects_removal_of_any_member_of_a_completed_recursive_boundary() {
    let (p, c) = proof(include_str!("../examples/negation.pl"));
    assert!(c.boundaries[0]
        .steps
        .iter()
        .any(|id| matches!(c.steps[id - 1].justification, Justification::Rule { .. })));
    for position in 0..c.boundaries[0].steps.len() {
        let mut forged = c.clone();
        forged.boundaries[0].steps.remove(position);
        rejects(&p, &forged, Condition::C6);
    }
}
