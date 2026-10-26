use wheye::{check, parse, reason, Certificate, Condition, Justification, Limits, Value};

fn checked(source: &str) -> (wheye::Program, wheye::Run) {
    let program = parse(source).unwrap();
    let run = reason(&program, Limits::default()).unwrap();
    let certificate = run.certificate(&program);
    let saved = Certificate::parse(&certificate.to_string()).unwrap();
    assert_eq!(certificate, saved);
    check(&program, &saved).unwrap().require_valid().unwrap();
    (program, run)
}

#[test]
fn safe_aggregate_rules_derive_relations_without_requests() {
    let (program, run) = checked("row(a,5). row(b,5). total(N):-aggregate_all(sum(V),row(K,V),N).");
    assert!(run
        .steps
        .iter()
        .any(|step| step.atom.to_string() == "total(10)"));
    assert_eq!(run.output(&program).unwrap(), "total(10).\n");
}

#[test]
fn calls_and_table_declarations_do_not_capture_aggregate_locals() {
    for declaration in ["", ":- table total/2."] {
        let (_, run) = checked(&format!(
            "{declaration} p(a). p(b). q(a). q(b). \
             total(X,N):-aggregate_all(count,p(X),N),q(X). \
             ?- total(a,N). ?- total(X,N). ?- total(b,2). ?- total(a,1)."
        ));
        assert_eq!(run.answers[0][0].values, vec![Value::Integer(2)]);
        assert_eq!(run.answers[1].len(), 2);
        assert!(run.answers[1]
            .iter()
            .all(|a| a.values[1] == Value::Integer(2)));
        assert_eq!(run.answers[2].len(), 1);
        assert!(run.answers[3].is_empty());
    }
}

#[test]
fn input_modes_still_parameterize_aggregate_producers() {
    let (_, run) = checked(
        "row(a,x). row(a,y). row(b,z). \
         total(G,N):-aggregate_all(count,row(G,X),N). \
         ?- total(a,N). ?- total(b,N).",
    );
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(2)]);
    assert_eq!(run.answers[1][0].values, vec![Value::Integer(1)]);
}

#[test]
fn mode_dependent_aggregate_outputs_cannot_filter_their_producers() {
    let source = "p(1). p(2). total(G,N):-aggregate_all(count,p(N),N),G=G.";
    for declaration in ["", ":- table total/2."] {
        for (query, answers) in [("total(g,N)", 1), ("total(g,2)", 1), ("total(g,1)", 0)] {
            let (_, run) = checked(&format!("{declaration} {source} ?- {query}."));
            assert_eq!(run.answers[0].len(), answers, "{declaration} {query}");
        }
    }
    checked(&format!("{source} ?- total(g,N), \\+ total(g,1)."));
    let (_, run) = checked(
        "p(1). p(2). total(G,N):-aggregate_all(sum(K), \
         (tag(a),aggregate_all(count,p(N),K)),N),G=G. tag(a). ?-total(g,2).",
    );
    assert_eq!(run.answers[0].len(), 1);
    // A preceding goal can still establish a legitimate group binding.
    let (_, run) =
        checked("p(1). p(2). total(G,N):-p(N),aggregate_all(count,p(N),N),G=G. ?-total(g,1).");
    assert_eq!(run.answers[0].len(), 1);
}

#[test]
fn c1_and_c5_reject_result_constraints_disguised_as_call_inputs() {
    let program =
        parse("p(1). p(2). total(G,N):-aggregate_all(count,p(N),N),G=G. ?-total(g,1).").unwrap();
    let forged = Certificate::parse(
        "wheye-proof 1\n\
         step 1 source 1 : p(1).\n\
         step 2 source 2 : p(2).\n\
         step 3 builtin : '='(g,g).\n\
         step 4 aggregate r1 1 1 : '$aggregate:r1:1'([binding('G',g),binding('N',1)],1).\n\
         step 5 rule 1 [4,3] : total(g,1).\n\
         boundary 1 level 0 [1,2]\n\
         answer 1 [5]\n",
    )
    .unwrap();
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid(), "{report}");
    assert!(report.condition(Condition::C1).failed > 0, "{report}");
    assert!(report.condition(Condition::C5).failed > 0, "{report}");
}

#[test]
fn nested_aggregates_and_demanded_boundaries_keep_lexical_scope() {
    checked(
        ":- table total/2. p(a). p(b). q(a). q(b). \
         total(X,N):-aggregate_all(count,p(X),N),q(X). \
         size(N):-aggregate_all(count,total(a,Value),N). \
         ?- size(1). ?- \\+ total(a,1).",
    );
    let (_, run) = checked(
        ":- table total/2. group(g). row(g,a). row(g,b). q(a). \
         total(X,N):-aggregate_all(sum(K), \
           (group(G),aggregate_all(count,row(G,X),K)),N),q(X). \
         ?- total(a,N).",
    );
    assert_eq!(run.answers[0][0].values, vec![Value::Integer(2)]);
}

#[test]
fn non_unifiability_does_not_turn_unbound_variables_into_outputs() {
    let (_, run) = checked("p(X):-f(X)\\=g(X). ?- p(a).");
    assert_eq!(run.answers[0].len(), 1);
    let (_, run) = checked("q(b). p(X):-X\\=a,q(X). ?- p(b).");
    assert_eq!(run.answers[0].len(), 1);
}

#[test]
fn tabled_witnesses_use_closed_prefix_values_and_survive_closed_boundaries() {
    let (_, run) = checked(
        ":- table ticket/2. visitor(ada). visitor(bea). \
         ticket(T,W):-visitor(V),T=pair(V),fresh(W). \
         mirror(T,W):-ticket(T,W),ticket(T,W). \
         total(N):-aggregate_all(count,ticket(T,W),N). \
         ?- ticket(T,W). ?- ticket(pair(ada),W). ?- mirror(T,W). ?- total(2). \
         ?- ticket(pair(ada),W), \\+ ticket(pair(bea),W).",
    );
    assert_eq!(run.answers[0].len(), 2);
    assert_eq!(run.answers[1].len(), 1);
    assert_eq!(run.answers[2].len(), 2);
    assert_eq!(run.answers[3].len(), 1);
    assert_eq!(run.answers[4].len(), 1);
    let ada = run.answers[0]
        .iter()
        .find(|a| a.values[0].to_string() == "pair(ada)")
        .unwrap();
    assert_eq!(ada.values[1], run.answers[1][0].values[0]);
    checked(":- table p/1. p(W):-fresh(W). ?- p(W).");
}

#[test]
fn c8_rejects_an_identity_with_caller_bindings_in_the_firing_context() {
    let (program, run) = checked(
        ":- table ticket/2. visitor(ada). ticket(V,W):-visitor(V),fresh(W). ?- ticket(V,W).",
    );
    let mut forged = run.certificate(&program);
    let step = forged
        .steps
        .iter_mut()
        .find(|s| matches!(s.justification, Justification::Fresh { .. }))
        .unwrap();
    *step.atom.values.last_mut().unwrap() = Value::Witness("r1:g2:caller-variable-alias".into());
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C8).failed > 0, "{report}");
}

#[test]
fn c1_and_c5_reject_caller_injected_aggregate_groups() {
    let program = parse(
        ":- table total/2. p(a). p(b). q(a). \
         total(X,N):-aggregate_all(count,p(X),N),q(X). ?- total(a,N).",
    )
    .unwrap();
    let forged = Certificate::parse(
        "wheye-proof 1\n\
         step 1 source 1 : p(a).\n\
         step 2 source 2 : p(b).\n\
         step 3 source 3 : q(a).\n\
         step 4 aggregate r1 1 1 : '$aggregate:r1:1'([binding('X',a)],1).\n\
         step 5 rule 1 [4,3] : total(a,1).\n\
         boundary 1 level 0 [1,2,3]\n\
         answer 1 [5]\n",
    )
    .unwrap();
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C1).failed > 0, "{report}");
    assert!(report.condition(Condition::C5).failed > 0, "{report}");
}

#[test]
fn c6_requires_undemanded_safe_aggregate_conclusions_in_closed_models() {
    let program = parse("p(a). total(N):-aggregate_all(count,p(X),N). ?- \\+ total(2).").unwrap();
    let forged = Certificate::parse(
        "wheye-proof 1\n\
         step 1 source 1 : p(a).\n\
         step 2 absent 1 : total(2).\n\
         boundary 1 level 1 [1]\n\
         answer 1 [2]\n",
    )
    .unwrap();
    let report = check(&program, &forged).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C6).failed > 0, "{report}");
    assert!(
        report
            .to_string()
            .contains("omits rule 1 conclusion total(1)"),
        "{report}"
    );
}
