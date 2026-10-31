use eyepl::{check, parse, reason, Certificate, Condition, Limits, Value};
use std::collections::BTreeSet;

fn run(source: &str) -> (eyepl::Program, eyepl::Run) {
    let program = parse(source).unwrap();
    let run = reason(&program, Limits::default()).unwrap();
    let proof = run.certificate(&program);
    assert_eq!(Certificate::parse(&proof.to_string()).unwrap(), proof);
    let report = check(&program, &proof).unwrap();
    assert!(report.valid(), "{report}\n{proof}");
    (program, run)
}
fn answers(source: &str) -> Vec<Vec<Vec<Value>>> {
    run(source)
        .1
        .answers
        .into_iter()
        .map(|a| a.into_iter().map(|a| a.values).collect())
        .collect()
}

#[test]
fn builtin_relations_calculate_and_check_closed_tuples() {
    for (call, expected) in [
        ("X is 2 + 3", 5),
        ("X is 2 - 3", -1),
        ("X is -2 * 3", -6),
        ("X is -7 // 3", -2),
        ("X is -7 rem 3", -1),
        ("X is abs(-7)", 7),
        ("string_length(\"é🙂\", X)", 2),
    ] {
        assert_eq!(
            answers(&format!("?- {call}. ")),
            vec![vec![vec![Value::Integer(expected)]]]
        );
    }
    assert_eq!(
        answers("?- string_concat(\"hello\", \" world\", X)."),
        vec![vec![vec![Value::Text("hello world".into())]]]
    );
    assert_eq!(
        answers("?- atom_concat('https://example.org/', alice, X)."),
        vec![vec![vec![Value::Symbol(
            "https://example.org/alice".into()
        )]]]
    );
    for call in [
        "a = a",
        "1 \\= '1'",
        "-1 < 0",
        "2 =< 2",
        "3 > 2",
        "3 >= 3",
        "5 is 2 + 3",
    ] {
        assert_eq!(
            answers(&format!("?- {call}. ")),
            vec![vec![vec![]]],
            "{call}"
        );
    }
}

#[test]
fn arithmetic_errors_are_errors_and_incompatible_values_fail() {
    for call in [
        "X is 1 // 0",
        "X is 1 rem 0",
        "X is sqrt(-1)",
        "X is \"1\" + 2",
        "a < b",
    ] {
        assert!(
            reason(&parse(&format!("?- {call}. ")).unwrap(), Limits::default()).is_err(),
            "{call}"
        );
    }
    for call in ["1 = '1'", "6 is 2 + 3"] {
        assert!(answers(&format!("?- {call}. "))[0].is_empty());
    }
    assert_eq!(
        answers("?- X is 9223372036854775807+1.")[0][0][0].to_string(),
        "9223372036854775808"
    );
}

#[test]
fn ordinary_predicate_names_keep_their_meaning() {
    assert_eq!(
        answers("add(a,b,c). not(a). ?- add(a,b,X), not(a)."),
        vec![vec![vec![Value::Symbol("c".into())]]]
    );
}

#[test]
fn negative_queries_and_rules_use_completed_strata() {
    let (p,r)=run("edge(a,b). edge(b,c). node(a). node(b). node(c). node(d). path(X,Y):-edge(X,Y). path(X,Z):-path(X,Y),edge(Y,Z). outside(X):-node(X),\\+ path(a,X). ?- outside(X). ?- \\+ path(c,a).");
    let actual: BTreeSet<_> = r.answers[0].iter().map(|a| a.values[0].clone()).collect();
    assert_eq!(
        actual,
        BTreeSet::from([Value::Symbol("a".into()), Value::Symbol("d".into())])
    );
    assert_eq!(r.answers[1].len(), 1);
    assert!(
        check(&p, &r.certificate(&p))
            .unwrap()
            .condition(Condition::C6)
            .checked
            > 0
    );
}

#[test]
fn aggregate_groups_sets_keys_and_empty_sets_are_explicit() {
    let source="group(a). group(b). row(a,x,5). row(a,y,5). row(a,z,8). distinct(G,V):-row(G,_,V). total(G,N,S,Distinct):-group(G),aggregate_all(count, (row(G,Item,V)), N),aggregate_all(sum(V), (row(G,Item,V)), S),aggregate_all(sum(V), (distinct(G,V)), Distinct). ?- total(G,N,S,Distinct).";
    assert_eq!(
        answers(source)[0],
        vec![
            vec![
                Value::Symbol("a".into()),
                Value::Integer(3),
                Value::Integer(18),
                Value::Integer(13)
            ],
            vec![
                Value::Symbol("b".into()),
                Value::Integer(0),
                Value::Integer(0),
                Value::Integer(0)
            ],
        ]
    );
    assert!(answers("?- aggregate_all(min(V), (missing(V)), N).")[0].is_empty());
    assert!(answers("?- aggregate_all(max(V), (missing(V)), N).")[0].is_empty());
}

#[test]
fn aggregate_local_names_do_not_leak_or_capture_later_goals() {
    let (p, r) = run("p(a). p(b). pick(z). ?- aggregate_all(count, (p(X)), N),pick(X).");
    assert_eq!(p.queries[0].variables, vec!["N", "X"]);
    assert_eq!(
        r.answers[0][0].values,
        vec![Value::Integer(2), Value::Symbol("z".into())]
    );
    assert_eq!(
        answers("p(1). p(2). ?- aggregate_all(sum(Y), (p(X),Y is X + 1), N)."),
        vec![vec![vec![Value::Integer(5)]]]
    );
    assert_eq!(
        answers("p(a). p(b). blocked(b). ?- aggregate_all(count, (p(X),\\+ blocked(X)), N)."),
        vec![vec![vec![Value::Integer(1)]]]
    );
}

#[test]
fn aggregates_reject_type_errors_and_preserve_large_integer_sums() {
    let source = "p(a). ?- aggregate_all(sum(X), (p(X)), N).";
    assert!(reason(&parse(source).unwrap(), Limits::default()).is_err());
    assert_eq!(
        answers("p(9223372036854775807). p(1). ?- aggregate_all(sum(X),p(X),N).")[0][0][0]
            .to_string(),
        "9223372036854775808"
    );
}

#[test]
fn unsafe_modes_non_stratified_cycles_and_invalid_witnesses_are_rejected() {
    for source in [
        "p:-\\+ q. q:-p.",
        "p(N):-aggregate_all(count,p(X),N).",
        "?- fresh(W).",
        "p(W):-fresh(W),ready.",
        "p(W):-q(W),fresh(W).",
        "p(~\"forged\").",
    ] {
        let diagnostic = parse(source).unwrap_err().to_string();
        assert!(!diagnostic.contains("@fresh"), "{diagnostic}");
    }
    for source in ["?- Y is X+1.", "?- \\+ p(X)."] {
        assert!(reason(&parse(source).unwrap(), Limits::default()).is_err());
    }
    let p = parse("p(0). p(N):-p(M),N is M+1.").unwrap();
    assert!(reason(
        &p,
        Limits {
            max_facts: 30,
            max_matches: 1000
        }
    )
    .is_err());
    run("p(1). p(2). q(X):-p(X),X >= 2. p(X):-q(X). ?- q(X).");
}

#[test]
fn witness_identity_is_typed_stable_scoped_and_carried_by_rules() {
    let source="visitor(ada). visitor(bea). ticket(P,W):-visitor(P),fresh(W). copy(P,W):-ticket(P,W). other(P,W):-visitor(P),fresh(W). ?- copy(P,W). ?- other(P,W).";
    let (_, r) = run(source);
    let first = &r.answers[0][0].values[1];
    assert!(matches!(first, Value::Witness(_)));
    assert_ne!(first, &r.answers[0][1].values[1]);
    assert_ne!(first, &r.answers[1][0].values[1]);
    assert_eq!(r.answers, run(source).1.answers);
    assert_eq!(answers("p(W):-fresh(W). ?- p(W).")[0].len(), 1);
}

#[test]
fn witnesses_are_lean_and_depend_only_on_the_frontier() {
    // Premise substitutions that differ only outside the head share a witness.
    let found = answers("p(a,1). p(a,2). p(b,1). t(X,W):-p(X,Y),fresh(W). ?- t(X,W).");
    assert_eq!(found[0].len(), 2);
    // A source fact already satisfies t(a,_), so only b gets a witness.
    let found = answers("t(a,k). q(a). q(b). t(X,W):-q(X),fresh(W). ?- t(X,W).");
    assert_eq!(found[0].len(), 2);
    assert!(found[0].contains(&vec![Value::Symbol("a".into()), Value::Symbol("k".into())]));
    assert!(found[0]
        .iter()
        .any(|a| a[0] == Value::Symbol("b".into()) && matches!(a[1], Value::Witness(_))));
    // A lower stratum's conclusion satisfies it as well, including through a
    // demand-driven producer of the witness relation.
    let lower = "r(a). q(a). q(b). t(X,k):-r(X),\\+ s(X). t(X,W):-q(X),fresh(W). ?- t(X,W).";
    assert_eq!(answers(lower)[0].len(), 2);
    assert_eq!(answers(&format!(":- table t/2. {lower}"))[0].len(), 2);
    // The witness rule's own conclusions never satisfy its test.
    assert_eq!(
        answers("q(a). t(X,W):-q(X),fresh(W). ?- t(X,W).")[0].len(),
        1
    );
}

#[test]
fn lean_helpers_are_reserved_and_stay_distinct_across_inputs() {
    let error = parse("'$lean:1'(a).").unwrap_err().to_string();
    assert!(error.contains("reserved"), "{error}");
    assert!(parse("p :- '$satisfied:1'.").is_err());
    assert!(parse(":- table '$lean:1'/1.").is_err());
    let mut program = parse("q(a). t(X,W):-q(X),fresh(W).").unwrap();
    program.extend(parse("r(b). u(X,W):-r(X),fresh(W). ?- t(X,W), u(Y,V).").unwrap());
    let heads: BTreeSet<_> = program
        .rules
        .iter()
        .map(|r| r.head.predicate.to_string())
        .collect();
    assert!(heads.contains("$lean:2") && heads.contains("$satisfied:2"));
    let run = reason(&program, Limits::default()).unwrap();
    assert_eq!(run.answers[0].len(), 1);
    check(&program, &run.certificate(&program))
        .unwrap()
        .require_valid()
        .unwrap();
}

#[test]
fn full_example_exercises_every_condition_with_no_not_applicable_entries() {
    let (p, r) = run(include_str!("../examples/orders.pl"));
    let report = check(&p, &r.certificate(&p)).unwrap();
    for c in &report.conditions {
        assert_eq!(c.not_applicable, None, "{report}");
        assert!(c.checked > 0, "{report}");
        assert_eq!(c.failed, 0);
    }
    assert_eq!(r.answers[0].len(), 1);
    assert_eq!(r.answers[0][0].values[0], Value::Symbol("ada".into()));
    assert_eq!(r.answers[0][0].values[2], Value::Integer(15));
}

#[test]
fn negative_reachability_and_aggregates_agree_with_an_independent_graph_oracle() {
    for mask in 0..512 {
        let mut reach = [[false; 3]; 3];
        let mut source=String::from("node(n0). node(n1). node(n2). path(X,Y):-edge(X,Y). path(X,Z):-path(X,Y),edge(Y,Z). outside(X):-node(X),\\+ path(n0,X). size(N):-aggregate_all(count, (path(n0,X)), N). ?- outside(X). ?- size(N). ");
        for (i, row) in reach.iter_mut().enumerate() {
            for (j, cell) in row.iter_mut().enumerate() {
                if mask & (1 << (i * 3 + j)) != 0 {
                    *cell = true;
                    source.push_str(&format!("edge(n{i},n{j}). "));
                }
            }
        }
        for k in 0..3 {
            for i in 0..3 {
                for j in 0..3 {
                    reach[i][j] |= reach[i][k] && reach[k][j];
                }
            }
        }
        let (_, r) = run(&source);
        let expected: BTreeSet<_> = (0..3)
            .filter(|i| !reach[0][*i])
            .map(|i| Value::Symbol(format!("n{i}").into()))
            .collect();
        let actual: BTreeSet<_> = r.answers[0].iter().map(|a| a.values[0].clone()).collect();
        assert_eq!(actual, expected, "graph {mask}");
        assert_eq!(
            r.answers[1][0].values,
            vec![Value::Integer(
                reach[0].iter().filter(|v| **v).count() as i64
            )],
            "graph {mask}"
        );
    }
}

#[test]
fn empty_models_and_builtin_only_aggregates_have_valid_closed_boundaries() {
    assert_eq!(answers("?- \\+ missing."), vec![vec![vec![]]]);
    assert_eq!(answers("q:-\\+ missing. ?- q."), vec![vec![vec![]]]);
    assert_eq!(
        answers("total(N):-aggregate_all(sum(V), (V is 1 + 2), N). ?- total(N)."),
        vec![vec![vec![Value::Integer(3)]]]
    );
}

#[test]
fn strata_are_independent_of_source_order_and_merged_files() {
    let rules="eligible(X):-person(X),\\+ blocked(X). blocked(X):-banned(X). total(N):-aggregate_all(count, (eligible(X)), N). ?- total(N).";
    let facts = "person(a). person(b). banned(b).";
    let expected = answers(&format!("{rules} {facts}"));
    assert_eq!(expected, answers(&format!("{facts} {rules}")));
    let mut p = parse(rules).unwrap();
    p.extend(parse(facts).unwrap());
    let r = reason(&p, Limits::default()).unwrap();
    assert_eq!(r.answers[0][0].values, vec![Value::Integer(1)]);
    assert!(check(&p, &r.certificate(&p)).unwrap().valid());
}

#[test]
fn explicit_checker_limits_cover_evidence_and_closed_model_matching() {
    let (p, r) = run(include_str!("../examples/orders.pl"));
    let c = r.certificate(&p);
    assert!(eyepl::check_with_limits(
        &p,
        &c,
        Limits {
            max_facts: 1,
            ..Limits::default()
        }
    )
    .is_err());
    assert!(eyepl::check_with_limits(
        &p,
        &c,
        Limits {
            max_matches: 1,
            ..Limits::default()
        }
    )
    .is_err());
}

#[test]
fn witnesses_flow_through_negation_and_aggregation_across_multiple_boundaries() {
    let (p,r)=run("visitor(a). ticket(P,W):-visitor(P),fresh(W). valid(W):-ticket(P,W),\\+ revoked(W). total(N):-aggregate_all(count, (valid(W)), N). ?- total(N).");
    assert_eq!(r.answers[0][0].values, vec![Value::Integer(1)]);
    let c = r.certificate(&p);
    assert_eq!(c.boundaries.len(), 2);
    let report = check(&p, &c).unwrap();
    assert!(report.valid(), "{report}");
    for condition in &report.conditions {
        assert!(condition.checked > 0, "{report}");
        assert_eq!(condition.not_applicable, None);
    }
}

#[test]
fn atom_concat_decides_any_two_bound_atoms_and_rejects_other_types_and_modes() {
    let atom = |name: &str| Value::Symbol(name.into());
    assert_eq!(answers("?- atom_concat(ab, cd, abcd)."), vec![vec![vec![]]]);
    assert_eq!(
        answers("?- atom_concat(ab, cd, ab)."),
        vec![Vec::<Vec<Value>>::new()]
    );
    assert_eq!(
        answers("?- atom_concat('https://e/', N, 'https://e/bob')."),
        vec![vec![vec![atom("bob")]]]
    );
    assert_eq!(
        answers("?- atom_concat(P, bob, 'https://e/bob')."),
        vec![vec![vec![atom("https://e/")]]]
    );
    assert_eq!(
        answers("?- atom_concat('http://x/', N, 'https://e/bob')."),
        vec![Vec::<Vec<Value>>::new()]
    );
    // A rule maps a known IRI back to its local name.
    assert_eq!(
        answers("iri(N, I) :- atom_concat('https://e/', N, I). ?- iri(N, 'https://e/bob')."),
        vec![vec![vec![atom("bob")]]]
    );
    for source in [
        "?- atom_concat(\"ab\", cd, X).",
        "?- atom_concat(1, cd, X).",
        "?- atom_concat(ab, cd, 5).",
    ] {
        let error = reason(&parse(source).unwrap(), Limits::default()).unwrap_err();
        assert!(error
            .to_string()
            .contains("atom_concat arguments must be atoms"));
    }
    // Splitting a lone bound atom would enumerate; it is not a supported mode.
    let error = parse("p(X, Y) :- atom_concat(X, Y, ab). ?- p(A, B).")
        .and_then(|p| reason(&p, Limits::default()).map(|_| ()))
        .unwrap_err();
    assert!(
        error
            .to_string()
            .contains("atom_concat needs two bound atoms"),
        "{error}"
    );

    // C5 re-decides the concatenation recorded in a certificate.
    let source = "iri(N, I) :- atom_concat('https://e/', N, I). ?- iri(x, I).";
    let (program, run) = run(source);
    let forged = run
        .certificate(&program)
        .to_string()
        .replace("'https://e/x'", "'https://e/y'");
    let report = check(&program, &Certificate::parse(&forged).unwrap()).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C5).failed > 0, "{report}");
}

#[test]
fn atom_chars_and_number_chars_convert_in_both_directions() {
    let atom = |name: &str| Value::Symbol(name.into());
    let chars = |text: &str| {
        text.chars().rev().fold(Value::Nil, |tail, c| {
            Value::Compound(".".into(), vec![atom(&c.to_string()), tail])
        })
    };
    assert_eq!(
        answers("?- atom_chars(abc, L)."),
        vec![vec![vec![chars("abc")]]]
    );
    assert_eq!(
        answers("?- atom_chars(A, [a, b, c])."),
        vec![vec![vec![atom("abc")]]]
    );
    assert_eq!(
        answers("?- atom_chars(abc, [a, b, c])."),
        vec![vec![vec![]]]
    );
    assert_eq!(
        answers("?- number_chars(42, L)."),
        vec![vec![vec![chars("42")]]]
    );
    assert_eq!(
        answers("?- number_chars(N, ['-', '1', '.', '5'])."),
        vec![vec![vec![answers("?- X is -1.5.")[0][0][0].clone()]]]
    );
    assert_eq!(
        answers("?- number_chars(N, [' ', '7'])."),
        vec![vec![vec![Value::Integer(7)]]]
    );
    // A bound list is read, so a different spelling of the same number holds.
    assert_eq!(
        answers("?- number_chars(1, ['0', '1'])."),
        vec![vec![vec![]]]
    );
    // Text that is not a number fails instead of raising an error.
    assert!(answers("?- number_chars(N, [a]).")[0].is_empty());
    assert!(answers("?- number_chars(N, ['1', ' ']).")[0].is_empty());
    // Literal text from RDF becomes a number, and a literal that is not
    // numeric is passed over.
    assert_eq!(
        answers("t('42'). t(abc). n(N) :- t(T), atom_chars(T, C), number_chars(N, C). ?- n(N)."),
        vec![vec![vec![Value::Integer(42)]]]
    );
    for (source, message) in [
        ("?- atom_chars(A, [a, bc]).", "one-character atoms"),
        ("?- number_chars(abc, L).", "number_chars needs a number"),
    ] {
        let error = reason(&parse(source).unwrap(), Limits::default()).unwrap_err();
        assert!(error.to_string().contains(message), "{source}: {error}");
    }
    // C5 re-reads the number recorded in a certificate.
    let (program, run) =
        run("t('42'). n(N) :- t(T), atom_chars(T, C), number_chars(N, C). ?- n(N).");
    let forged = run
        .certificate(&program)
        .to_string()
        .replace("number_chars(42,", "number_chars(43,");
    assert_ne!(forged, run.certificate(&program).to_string());
    let report = check(&program, &Certificate::parse(&forged).unwrap()).unwrap();
    assert!(!report.valid());
    assert!(report.condition(Condition::C5).failed > 0, "{report}");
}
