use eyepl::{check, parse, reason, Certificate, Condition, Limits, Value};

const DEPTHS: [usize; 5] = [10, 100, 1_000, 10_000, 100_000];
fn source(depth: usize) -> String {
    let mut text = String::from("isa(ind,n000000). test(true):-isa(ind,a2). ");
    text.push_str(&format!("isa(X,a2):-isa(X,n{depth:06}). "));
    for level in 1..=depth {
        for prefix in ["n", "i", "j"] {
            text.push_str(&format!(
                "isa(X,{prefix}{level:06}):-isa(X,n{:06}). ",
                level - 1
            ));
        }
    }
    text.push_str("?- test(Result). ");
    text
}

#[test]
fn packaged_taxonomies_have_linear_work_and_complete_checked_chains() {
    for depth in DEPTHS {
        let program = parse(&source(depth)).unwrap();
        assert_eq!(program.rules.len(), 3 * depth + 2);
        let run = reason(&program, Limits::default()).unwrap();
        assert_eq!(run.steps.len(), 3 * depth + 3);
        assert_eq!(run.answers[0][0].values, vec![Value::Symbol("true".into())]);
        assert_eq!(run.answers[0].len(), 1);
        // This counts attempted dispatches as well as tuple matches. A scan
        // of every isa/2 rule for every fact fails this bound quadratically.
        assert!(
            run.matches <= 8 * depth + 32,
            "depth {depth}: {} matches",
            run.matches
        );
        let proof = run.certificate(&program);
        assert_eq!(proof.steps.len(), depth + 3);
        assert_eq!(proof.claims.len(), 1);
        let report = check(&program, &proof).unwrap();
        assert!(report.valid(), "depth {depth}: {report}");
        assert_eq!(report.rule_applications, depth + 2);
        assert_eq!(report.condition(Condition::C1).checked, depth + 3);
        assert_eq!(report.condition(Condition::C7).checked, depth + 3);
        assert!(report.condition(Condition::C4).checked <= 4 * depth + 32);
        let text = proof.to_string();
        assert_eq!(Certificate::parse(&text).unwrap(), proof);
    }
}

#[test]
fn triggers_keep_variable_goals_multiple_constants_and_arities_complete() {
    let source = "p(a,x). p(b,x). p(a,y). p(a,x,z). any(A,B):-p(A,B). first(B):-p(a,B). last(A):-p(A,x). both:-p(a,x). join(A):-p(A,x),p(A,y). arity(C):-p(a,x,C). ?- any(A,B). ?- first(B). ?- last(A). ?- both. ?- join(A). ?- arity(C).";
    let p = parse(source).unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    assert_eq!(
        run.answers.iter().map(Vec::len).collect::<Vec<_>>(),
        vec![3, 2, 2, 1, 1, 1]
    );
    assert_eq!(run.answers[4][0].values, vec![Value::Symbol("a".into())]);
    assert_eq!(run.answers[5][0].values, vec![Value::Symbol("z".into())]);
    assert!(check(&p, &run.certificate(&p)).unwrap().valid());
}

#[test]
fn deep_classifications_do_not_depend_on_rule_order() {
    let original = parse(&source(1_000)).unwrap();
    let mut reversed = original.clone();
    reversed.rules.reverse();
    for p in [&original, &reversed] {
        let run = reason(p, Limits::default()).unwrap();
        assert_eq!(run.answers[0][0].values, vec![Value::Symbol("true".into())]);
        assert!(run.matches <= 8_032);
        let proof = run.certificate(p);
        assert_eq!(proof.steps.len(), 1_003);
        assert!(check(p, &proof).unwrap().valid());
    }
}

#[test]
fn a_forged_deep_conclusion_is_rejected_without_recursive_traversal() {
    let p = parse(&source(10_000)).unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    let mut proof = run.certificate(&p);
    proof.steps.last_mut().unwrap().atom.values[0] = Value::Symbol("forged".into());
    let report = check(&p, &proof).unwrap();
    assert!(!report.valid());
    assert_eq!(report.condition(Condition::C1).failed, 1);
}

#[test]
fn ground_taxonomies_remain_linear_with_the_class_in_the_first_argument() {
    let depth = 100;
    let mut source = String::from("isa(n000000, ind).\n");
    for level in 1..=depth {
        for prefix in ["n", "i", "j"] {
            source.push_str(&format!(
                "isa({prefix}{level:06}, ind) :- isa(n{:06}, ind).\n",
                level - 1
            ));
        }
    }
    source.push_str(&format!("?- isa(n{depth:06}, ind). "));
    let program = parse(&source).unwrap();
    let run = reason(&program, Limits::default()).unwrap();
    assert!(run.matches <= 8 * depth + 32, "{} matches", run.matches);
    assert_eq!(run.answers[0].len(), 1);
    assert!(check(&program, &run.certificate(&program)).unwrap().valid());
}
