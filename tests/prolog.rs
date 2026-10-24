use wheye::{check, parse, reason, Certificate, Condition, Justification, Limits, Value};

fn checked(source: &str) -> (wheye::Program, wheye::Run, Certificate) {
    let program = parse(source).unwrap();
    let run = reason(&program, Limits::default()).unwrap();
    let certificate = run.certificate(&program);
    let roundtrip = Certificate::parse(&certificate.to_string()).unwrap();
    assert_eq!(certificate, roundtrip);
    let report = check(&program, &roundtrip).unwrap();
    assert!(report.valid(), "{report}");
    (program, run, certificate)
}

#[test]
fn prolog_terms_unification_aliases_and_occurs_check_are_structural() {
    let (_, run, _) = checked("?- X=Y,Y=f([a,b]),X=f([A|Rest]). ?- X=f(X). ?- 1=1.0. ?- 1=:=1.0.");
    assert_eq!(
        run.answers.iter().map(Vec::len).collect::<Vec<_>>(),
        vec![1, 0, 0, 1]
    );
    assert_eq!(run.answers[0][0].values[2], Value::Symbol("a".into()));
    assert_eq!(run.answers[0][0].values[3].to_string(), "[b]");
    checked("?- Term=..[reading,V],V=42,Term=reading(42). ?- string_codes(\"é🙂\",[233,128578]).");
}

#[test]
fn aggregation_uses_producer_tuples_not_distinct_projected_values() {
    let (_,run,_) = checked("row(a,5). row(b,5). row(b,5). ?- aggregate_all(sum(V),row(K,V),N). ?- aggregate_all(count,row(_,V),N). ?- aggregate_all(list(V),row(K,V),Items). ?- aggregate_all(count,missing(X),0).");
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(10)]);
    assert_eq!(run.answers[1][0].values, vec![Value::Integer(2)]);
    assert_eq!(run.answers[2][0].values[0].to_string(), "[5, 5]");
}

#[test]
fn c6_rejects_missing_demand_calls_and_omitted_recursive_answers() {
    let source = ":- table chain/2. chain(0,a). chain(N,b):-N>0,M is N-1,chain(M,_). total(N):-aggregate_all(count,chain(2,X),N). ?- total(N).";
    let (program, _, certificate) = checked(source);
    let boundary = certificate
        .boundaries
        .iter()
        .position(|b| !b.calls.is_empty())
        .unwrap();
    let mut forged = certificate.clone();
    forged.boundaries[boundary]
        .calls
        .retain(|g| !g.to_string().starts_with("chain(1,"));
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C6).failed > 0);
    let mut forged = certificate.clone();
    let id = forged
        .steps
        .iter()
        .position(|s| s.atom.to_string() == "chain(1, b)")
        .unwrap()
        + 1;
    forged.boundaries[boundary]
        .steps
        .retain(|member| *member != id);
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C6).failed > 0);
}

#[test]
fn c1_rejects_a_forged_universal_unit_clause_instance() {
    let (program, _, mut certificate) = checked("same(X,X). ?- same(a,a).");
    certificate.steps[0].atom.values[1] = Value::Symbol("b".into());
    let report = check(&program, &certificate).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C1).failed > 0);
}

#[test]
fn c5_recomputes_compound_arithmetic_and_negated_tests() {
    let (program, _, mut certificate) = checked("p(V):-V is 2^100. ?- p(V),\\+ (1=2).");
    let step = certificate
        .steps
        .iter_mut()
        .find(|s| s.justification == Justification::Builtin)
        .unwrap();
    step.atom.values[0] = Value::Integer(3);
    let report = check(&program, &certificate).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C5).failed > 0);
    let (program, _, mut certificate) = checked("?- \\+ (1=2).");
    certificate.steps[0].atom.values[1] = Value::Integer(1);
    let report = check(&program, &certificate).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C5).failed > 0);
}

#[test]
fn lexical_escapes_and_proper_lists_follow_prolog_syntax() {
    checked(r#"?- string_codes("\uD83D\uDE42",[128578]). ?- 'can''t'='can\'t'."#);
    for source in [
        "/*",
        "p(a).p(b).",
        "p([a|bad]).",
        "p('.'(a,bad)).",
        "p(~\"source witness\").",
    ] {
        assert!(parse(source).is_err(), "accepted {source}");
    }
    assert!(reason(
        &parse("?- Tail=bad,List=[a|Tail].").unwrap(),
        Limits::default()
    )
    .is_err());
}

#[test]
fn nested_collections_complete_their_tabled_producers() {
    let (_,run,_)=checked(":- table score/2. base(a,5). base(b,5). base(c,9). score(K,V):-base(K,V). total(N):-aggregate_all(sum(S),(group(G),aggregate_all(sum(V),score(G,V),S)),N). group(a). group(b). ?- total(N).");
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(10)]);
}

#[test]
fn aggregate_results_and_producer_locals_have_independent_scopes() {
    let (_,run,_)=checked("p(a). p(b). total(N):-aggregate_all(count,p(N),N). ?- total(N). ?- X=Y,aggregate_all(count,p(X),N),Y=z.");
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(2)]);
    assert_eq!(
        run.answers[1][0].values,
        vec![
            Value::Symbol("z".into()),
            Value::Symbol("z".into()),
            Value::Integer(2)
        ]
    );
    let (_, run, _) = checked(
        "p(a). p(b). q(a). q(b). total(X,N):-aggregate_all(count,p(X),N),q(X). ?- total(X,N).",
    );
    assert_eq!(run.answers[0].len(), 2);
    assert_eq!(run.answers[0][0].values[1], Value::Integer(2));
    let (_, run, _) = checked(
        "p(a). p(b). q(a). q(b). total(X,N):-aggregate_all(count,p(X),N),q(X). ?- total(a,N).",
    );
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(1)]);
}

#[test]
fn c8_rejects_an_uncreated_witness_in_a_universal_clause() {
    let program = parse("anything(X). ?- anything(X).").unwrap();
    let certificate = Certificate::parse(
        "wheye-proof 1\nstep 1 rule 1 [] : anything(~\"forged\").\nanswer 1 [1]\n",
    )
    .unwrap();
    let report = check(&program, &certificate).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C8).failed > 0);
}

#[test]
fn c1_rejects_dropping_an_already_bound_aggregate_parameter() {
    let (program,_,mut certificate)=checked("group(a). group(b). row(a,x). row(b,y). size(G,N):-group(G),aggregate_all(count,row(G,X),N). ?- size(a,N).");
    let step = certificate
        .steps
        .iter_mut()
        .find(|s| matches!(s.justification, Justification::Aggregate { .. }))
        .unwrap();
    step.atom.values = vec![Value::Nil, Value::Integer(2)];
    let head = certificate
        .steps
        .iter_mut()
        .find(|s| s.atom.predicate == "size")
        .unwrap();
    head.atom.values[1] = Value::Integer(2);
    let report = check(&program, &certificate).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C1).failed > 0);
    assert_eq!(report.condition(Condition::C5).failed, 0);
}
