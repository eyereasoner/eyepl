use eyepl::{check, parse, parse_atom, reason, Limits, Program, Value};
use std::collections::BTreeSet;

fn output(source: &str) -> String {
    let program = parse(source).unwrap();
    reason(&program, Limits::default())
        .unwrap()
        .output(&program)
        .unwrap()
}

#[test]
fn socrates_has_one_exact_answer() {
    assert_eq!(
        output(include_str!("fixtures/minimal.pl")),
        "?- mortal(Who).\nWho = socrates.\n"
    );
}

#[test]
fn recursion_cycles_and_rule_order_preserve_reachability() {
    let facts = "edge(a,b). edge(b,c). edge(c,b). edge(c,d).";
    let rules = [
        "path(X,Y) :- edge(X,Y).",
        "path(X,Z) :- path(X,Y), edge(Y,Z).",
    ];
    let results: Vec<BTreeSet<_>> = [
        format!("{facts} {} {} ?- path(a, To). ", rules[0], rules[1]),
        format!("{} {} {facts} ?- path(a, To). ", rules[1], rules[0]),
    ]
    .iter()
    .map(|source| {
        let p = parse(source).unwrap();
        let run = reason(&p, Limits::default()).unwrap();
        assert!(check(&p, &run.certificate(&p)).unwrap().valid());
        run.answers[0]
            .iter()
            .map(|a| a.values[0].to_string())
            .collect()
    })
    .collect();
    assert_eq!(
        results[0],
        BTreeSet::from(["b".into(), "c".into(), "d".into()])
    );
    assert_eq!(results[0], results[1]);
}

#[test]
fn joins_require_consistent_bindings_and_keep_anonymous_variables_fresh() {
    assert_eq!(
        output("p(a,b). p(c,c). ?- p(X,X). ?- p(_, _). ?- p(a,X), p(X,Y)."),
        "?- p(X, X).\nX = c.\n\n?- p(_, _).\ntrue.\n\n?- p(a, X), p(X, Y).\nfalse.\n"
    );
}

#[test]
fn clauses_and_files_have_separate_variable_scopes() {
    let mut program = parse("p(a). q(X) :- p(X). ?- q(X).").unwrap();
    program.extend(parse("p(b). r(X) :- q(X). ?- r(X).").unwrap());
    let result = reason(&program, Limits::default()).unwrap();
    assert_eq!(
        result.answers.iter().map(Vec::len).collect::<Vec<_>>(),
        vec![2, 2]
    );
    assert!(check(&program, &result.certificate(&program))
        .unwrap()
        .valid());
}

#[test]
fn duplicate_facts_and_derivations_do_not_duplicate_answers() {
    let p = parse("p(a). p(a). q(X) :- p(X). q(X) :- p(X). ?- q(X).").unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    assert_eq!(run.steps.len(), 2);
    assert_eq!(run.answers[0].len(), 1);
}

#[test]
fn relation_arity_and_value_types_are_distinct() {
    assert_eq!(
        output("p. p(1). p('1'). p(\"1\"). ?- p(X). ?- p."),
        "?- p(X).\nX = 1.\nX = '1'.\nX = \"1\".\n\n?- p.\ntrue.\n"
    );
}

#[test]
fn zero_arity_rules_and_queries() {
    assert_eq!(
        output("ready. done :- ready. ?- done."),
        "?- done.\ntrue.\n"
    );
    assert_eq!(output("?- ready."), "?- ready.\nfalse.\n");
}

#[test]
fn without_queries_output_contains_only_new_facts() {
    assert_eq!(output("p(a). q(X) :- p(X)."), "q(a).\n");
    let p = parse("p(a). q(X) :- p(X).").unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    let report = check(&p, &run.certificate(&p)).unwrap();
    assert!(report.valid(), "{report}");
    assert_eq!(report.claims, 1);
}

#[test]
fn query_only_source_facts_have_a_checkable_certificate() {
    let p = parse("p(a). irrelevant(b). ?- p(X).").unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    let certificate = run.certificate(&p);
    assert_eq!(certificate.steps.len(), 1);
    let report = check(&p, &certificate).unwrap();
    assert!(report.valid(), "{report}");
    assert_eq!(report.rule_applications, 0);
}

#[test]
fn limits_fail_without_reporting_complete_answers() {
    let p = parse("p(a). q(X) :- p(X). ?- q(X).").unwrap();
    assert!(reason(
        &p,
        Limits {
            max_facts: 1,
            ..Limits::default()
        }
    )
    .unwrap_err()
    .to_string()
    .contains("Incomplete: fact limit"));
    assert!(reason(
        &p,
        Limits {
            max_matches: 1,
            ..Limits::default()
        }
    )
    .unwrap_err()
    .to_string()
    .contains("Incomplete: match limit"));
}

#[test]
fn unsafe_and_unsupported_programs_are_specific_errors() {
    for source in ["p :- q", "?- .", "p()."] {
        assert!(parse(source).is_err(), "accepted {source}");
    }
    assert!(reason(&parse("p(X). ?- p(X).").unwrap(), Limits::default()).is_err());
    assert!(parse("% one\n% two\np(.")
        .unwrap_err()
        .to_string()
        .contains("Line 3"));
}

#[test]
fn values_round_trip_without_losing_identity() {
    let atoms = [
        "p('Élodie', \"line\\nquote\\\"\\\\\", -9223372036854775808).",
        "'two words'('42', 42, \"42\").",
        "p('can\\'t', 'https://example.org/a#b', 0001).",
    ];
    for source in atoms {
        let atom = parse_atom(source).unwrap();
        assert_eq!(parse_atom(&format!("{atom}. ")).unwrap(), atom);
    }
    assert_eq!(
        parse_atom("p(-0).").unwrap().values,
        vec![Value::Integer(0)]
    );
}

#[test]
fn library_cannot_bypass_safe_rule_validation() {
    let mut p = Program::default();
    let mut rule = parse("p(X) :- q(X).").unwrap().rules.remove(0);
    rule.head.terms[0] = eyepl::Term::Constant(Value::Witness("forged".into()));
    p.rules.push(rule);
    assert!(reason(&p, Limits::default()).is_err());
}

#[test]
fn long_derivations_have_iterative_proof_traversal() {
    let mut source = String::from("p0(a). ");
    const DEPTH: usize = 100_000;
    for index in 1..=DEPTH {
        source.push_str(&format!("p{index}(X) :- p{}(X). ", index - 1));
    }
    source.push_str(&format!("?- p{DEPTH}(Who). "));
    let p = parse(&source).unwrap();
    let run = reason(&p, Limits::default()).unwrap();
    assert_eq!(run.answers[0][0].values, vec![Value::Symbol("a".into())]);
    let certificate = run.certificate(&p);
    assert_eq!(certificate.steps.len(), DEPTH + 1);
    assert!(run.matches <= 2 * DEPTH + 2);
    let report = check(&p, &certificate).unwrap();
    assert!(report.valid(), "{report}");
    assert_eq!(report.rule_applications, DEPTH);
}

#[test]
fn positive_closure_agrees_with_an_independent_graph_search() {
    // Exhaust all directed graphs on three nodes, including self loops.
    for mask in 0..512 {
        let mut reach = [[false; 3]; 3];
        let mut source = String::from(
            "path(X,Y) :- edge(X,Y). path(X,Z) :- path(X,Y), edge(Y,Z). ?- path(X,Y). ",
        );
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
        let p = parse(&source).unwrap();
        let run = reason(&p, Limits::default()).unwrap();
        let actual: BTreeSet<_> = run.answers[0]
            .iter()
            .map(|a| (a.values[0].to_string(), a.values[1].to_string()))
            .collect();
        let expected: BTreeSet<_> = (0..3)
            .flat_map(|i| (0..3).map(move |j| (i, j)))
            .filter(|(i, j)| reach[*i][*j])
            .map(|(i, j)| (format!("n{i}"), format!("n{j}")))
            .collect();
        assert_eq!(actual, expected, "graph {mask}");
        assert!(check(&p, &run.certificate(&p)).unwrap().valid());
    }
}
