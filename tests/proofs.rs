use eyepl::{check, parse, reason, Certificate, Claim, Condition, Justification, Limits, Value};

const PROGRAM: &str = "p(a). p(b). edge(a,b). q(X) :- p(X). r(X,Y) :- q(X), edge(X,Y). ?- r(X,Y).";

fn certificate() -> Certificate {
    let p = parse(PROGRAM).unwrap();
    reason(&p, Limits::default()).unwrap().certificate(&p)
}
fn reject(certificate: &Certificate) {
    assert!(
        !check(&parse(PROGRAM).unwrap(), certificate)
            .unwrap()
            .valid(),
        "accepted {certificate}"
    );
}

#[test]
fn unknown_and_zero_source_ids_are_rejected() {
    for id in [0, 999] {
        let mut c = certificate();
        c.steps[0].justification = Justification::Source(id);
        reject(&c);
    }
}
#[test]
fn unknown_and_zero_rules_are_rejected() {
    for id in [0, 999] {
        let mut c = certificate();
        c.steps.last_mut().unwrap().justification = Justification::Rule {
            rule: id,
            premises: vec![1],
        };
        reject(&c);
    }
}
#[test]
fn missing_rule_premises_are_rejected() {
    let mut c = certificate();
    if let Justification::Rule { premises, .. } = &mut c.steps.last_mut().unwrap().justification {
        premises.pop();
    }
    reject(&c);
}
#[test]
fn wrong_head_and_inconsistent_rule_bindings_are_rejected() {
    let p = parse("p(a). edge(b,c). r(X,Y) :- p(X), edge(X,Y). ?- r(X,Y).").unwrap();
    let forged = Certificate::parse("eyepl-proof 1\nstep 1 source 1 : p(a).\nstep 2 source 2 : edge(b,c).\nstep 3 rule 1 [1,2] : r(a,c).\nanswer 1 [3]\n").unwrap();
    assert!(!check(&p, &forged).unwrap().valid());
    let mut c = certificate();
    c.steps.last_mut().unwrap().atom.values.reverse();
    reject(&c);
}
#[test]
fn unknown_claims_and_duplicate_answers_are_rejected() {
    let mut c = certificate();
    c.claims.push(c.claims[0].clone());
    reject(&c);
    for query in [0, 999] {
        let mut c = certificate();
        c.claims[0] = Claim::Answer {
            query,
            premises: vec![1],
        };
        reject(&c);
    }
    let mut c = certificate();
    c.claims[0] = Claim::Derived(1);
    reject(&c);
}
#[test]
fn irrelevant_steps_and_duplicate_steps_are_rejected() {
    let mut c = certificate();
    c.claims.clear();
    reject(&c);
    let mut c = certificate();
    c.steps.push(c.steps[0].clone());
    reject(&c);
}
#[test]
fn missing_and_zero_query_evidence_is_rejected() {
    for id in [0, 999] {
        let mut c = certificate();
        c.claims[0] = Claim::Answer {
            query: 1,
            premises: vec![id],
        };
        reject(&c);
    }
}
#[test]
fn malformed_metadata_and_variable_conclusions_are_rejected() {
    for text in [
        "other-proof 1\nstep 1 source 1 : p(a).\nanswer 1 [1]\n",
        "eyepl-proof 2",
        "eyepl-proof 1\nstep 0 source 1 : p(a).",
        "eyepl-proof 1\nstep 1 trusted 1 : p(a).",
        "eyepl-proof 1\nstep 1 source 1 : p(X).",
        "eyepl-proof 1\nstep 1 source 0 : p(a).",
        "eyepl-proof 1\nstep 1 source 1 extra : p(a).",
        "eyepl-proof 1\nanswer 1 [0]",
        "eyepl-proof 1\nunknown",
    ] {
        assert!(Certificate::parse(text).is_err(), "accepted {text}");
    }
}
#[test]
fn valid_does_not_mean_complete_or_prove_absence() {
    let p = parse(PROGRAM).unwrap();
    let empty = Certificate {
        boundaries: vec![],
        steps: vec![],
        claims: vec![],
    };
    assert_eq!(check(&p, &empty).unwrap().claims, 0);
    assert!(check(&p, &certificate())
        .unwrap()
        .to_string()
        .contains("completeness is not checked"));
}

#[test]
fn generated_deep_terms_and_demand_calls_round_trip() {
    for source in [
        "p(0,z). p(N,f(T)):-p(M,T),M<300,N is M+1. ?-p(300,T).",
        ":- table descend/2. descend(0,T). \
         descend(N,T):-N>0,M is N-1,descend(M,f(T)). \
         size(C):-aggregate_all(count,descend(270,z),C). ?-size(1).",
    ] {
        let program = parse(source).unwrap();
        let run = reason(&program, Limits::default()).unwrap();
        let certificate = run.certificate(&program);
        let text = certificate.to_string();
        let saved = Certificate::parse(&text).unwrap();
        assert_eq!(saved, certificate);
        check(&program, &saved).unwrap().require_valid().unwrap();

        let mut forged = saved;
        let step = forged
            .steps
            .iter_mut()
            .rev()
            .find(|s| matches!(s.justification, Justification::Rule { .. }))
            .unwrap();
        step.atom.values[0] = Value::Integer(999);
        let report = check(&program, &forged).unwrap();
        assert!(!report.valid());
        assert!(report.condition(Condition::C1).failed > 0, "{report}");
    }
}

#[test]
fn wide_witness_contexts_round_trip_and_extra_values_are_rejected() {
    let arguments = vec!["a"; 64].join(",");
    let variables = (0..64)
        .map(|i| format!("X{i}"))
        .collect::<Vec<_>>()
        .join(",");
    let program = parse(&format!(
        "row({arguments}). ticket({variables}):-row({variables}),fresh(W). ?-ticket({variables})."
    ))
    .unwrap();
    let run = reason(&program, Limits::default()).unwrap();
    let certificate = run.certificate(&program);
    let mut saved = Certificate::parse(&certificate.to_string()).unwrap();
    assert_eq!(saved, certificate);
    check(&program, &saved).unwrap().require_valid().unwrap();
    let step = saved
        .steps
        .iter_mut()
        .find(|s| matches!(s.justification, Justification::Fresh { .. }))
        .unwrap();
    assert_eq!(step.atom.values.len(), 65);
    step.atom.values.push(Value::Symbol("extra".into()));
    let forged = Certificate::parse(&saved.to_string()).unwrap();
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C8).failed > 0, "{report}");
}

#[test]
fn source_limits_and_recorded_compound_arity_remain_enforced() {
    let deep = format!("p({}a{}).", "f(".repeat(300), ")".repeat(300));
    assert!(parse(&deep).unwrap_err().to_string().contains("nesting"));
    let recorded = format!("p({}a{}).", "f(".repeat(1024), ")".repeat(1024));
    assert!(eyepl::parse_atom(&recorded).is_ok());
    let unbound = format!("p({}X{}).", "f(".repeat(1024), ")".repeat(1024));
    assert!(eyepl::parse_atom(&unbound).is_err());
    let wide = format!("p({}).", vec!["a"; 65].join(","));
    assert!(parse(&wide).is_err());
    assert!(Certificate::parse(&format!("eyepl-proof 1\nstep 1 source 1 : {wide}\n")).is_err());
    let nested_wide = format!("'$fresh:r1:1'({}).", wide.trim_end_matches('.'));
    assert!(Certificate::parse(&format!(
        "eyepl-proof 1\nstep 1 fresh 1 1 : {nested_wide}\n"
    ))
    .is_err());
    for source in ["p(", "?- X is", "p([a,", "p(-"] {
        assert!(parse(source).is_err(), "accepted {source}");
        assert!(Certificate::parse(&format!("eyepl-proof 1\nstep 1 source 1 : {source}")).is_err());
    }
}
