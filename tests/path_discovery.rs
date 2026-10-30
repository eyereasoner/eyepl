use eyepl::{check, parse, reason, Certificate, Condition, Limits, Program, Value};
use std::collections::{BTreeMap, BTreeSet};

const SOURCE: &str = include_str!("../examples/path-discovery.pl");

type Routes = BTreeSet<(String, String, i64, String)>;

fn label(value: &Value) -> String {
    match value {
        Value::Symbol(s) | Value::Text(s) => s.to_string(),
        _ => panic!("expected airport ID or label"),
    }
}

// Independent bounded DFS: visit an airport at most once and stop on arrival.
fn expected(program: &Program, from: &str, to: &str, limit: usize) -> Routes {
    let labels: BTreeMap<_, _> = program
        .facts
        .iter()
        .filter(|f| f.predicate == "airport")
        .map(|f| (label(&f.values[0]), label(&f.values[1])))
        .collect();
    let mut links: BTreeMap<String, Vec<String>> = BTreeMap::new();
    for fact in &program.facts {
        if fact.predicate == "flight" {
            links
                .entry(label(&fact.values[0]))
                .or_default()
                .push(label(&fact.values[1]));
        }
    }
    let mut results = Routes::new();
    for (start, name) in &labels {
        if name != from {
            continue;
        }
        let mut pending = vec![vec![start.clone()]];
        while let Some(path) = pending.pop() {
            let tail = path.last().unwrap();
            if labels[tail] == to {
                if !path.is_empty() {
                    let text = path
                        .iter()
                        .map(|id| labels[id].as_str())
                        .collect::<Vec<_>>()
                        .join(" -> ");
                    results.insert((from.into(), to.into(), limit as i64, text));
                }
                continue;
            }
            if path.len() >= limit + 2 {
                continue;
            }
            for next in links.get(tail).into_iter().flatten() {
                if !path.contains(next) {
                    let mut extended = path.clone();
                    extended.push(next.clone());
                    pending.push(extended);
                }
            }
        }
    }
    results
}

fn actual(program: &Program) -> Routes {
    let run = reason(program, Limits::default()).unwrap();
    let proof = run.certificate(program);
    let restored = Certificate::parse(&proof.to_string()).unwrap();
    let report = check(program, &restored).unwrap();
    assert!(report.valid(), "{report}");
    run.answers[0]
        .iter()
        .map(|answer| {
            let [from, to, Value::Integer(stops), route] = answer.values.as_slice() else {
                panic!("expected endpoints, stop count, and route text");
            };
            (label(from), label(to), *stops, label(route))
        })
        .collect()
}

#[test]
fn full_airport_graph_matches_an_independent_route_search_and_checks() {
    let program = parse(SOURCE).unwrap();
    assert_eq!(
        program
            .facts
            .iter()
            .filter(|f| f.predicate == "airport")
            .count(),
        7_698
    );
    assert_eq!(
        program
            .facts
            .iter()
            .filter(|f| f.predicate == "flight")
            .count(),
        37_274
    );
    let from = "Ostend-Bruges International Airport";
    let to = "Václav Havel Airport Prague";
    let routes = expected(&program, from, to, 2);
    assert_eq!(routes.len(), 3);
    for via in [
        "Heraklion International Nikos Kazantzakis Airport",
        "Diagoras Airport",
        "Palma De Mallorca Airport",
    ] {
        assert!(routes.contains(&(
            from.into(),
            to.into(),
            2,
            format!("{from} -> Liège Airport -> {via} -> {to}")
        )));
    }
    assert_eq!(actual(&program), routes);
    let run = reason(&program, Limits::default()).unwrap();
    let report = check(&program, &run.certificate(&program)).unwrap();
    assert!(report.condition(Condition::C5).checked > 0);
    assert!(report.condition(Condition::C9).checked >= 3);
}

fn helpers() -> Program {
    let mut program = parse(
        SOURCE
            .split("% Airport names and directed routes")
            .next()
            .unwrap(),
    )
    .unwrap();
    program.facts.clear();
    program.extend(parse("?- airroute(From,To,Stopovers,Route).").unwrap());
    program
}

#[test]
fn bounded_routes_match_all_small_directed_graphs_including_self_loops() {
    let helpers = helpers();
    for mask in 0..512 {
        for limit in 0..=2 {
            let mut text = format!(
                "airport(a, 'Aé'). airport(b, 'B -> depot'). airport(c, 'C'). route_request('Aé', 'C', {limit}). "
            );
            for i in 0..3 {
                for j in 0..3 {
                    if mask & (1 << (i * 3 + j)) != 0 {
                        let ids = ['a', 'b', 'c'];
                        text.push_str(&format!("flight({}, {}). ", ids[i], ids[j]));
                    }
                }
            }
            let mut program = helpers.clone();
            program.extend(parse(&text).unwrap());
            assert_eq!(
                actual(&program),
                expected(&program, "Aé", "C", limit),
                "graph {mask}, stop limit {limit}"
            );
        }
    }
}

#[test]
fn negative_limits_and_unknown_airports_produce_no_routes() {
    for request in [
        "route_request('A', 'C', -1).",
        "route_request('Unknown', 'C', 2).",
    ] {
        let mut program = helpers();
        program.extend(parse(&format!(
            "airport(a, 'A'). airport(b, 'B'). airport(c, 'C'). flight(a,a). flight(a,b). flight(b,a). flight(b,c). {request}"
        )).unwrap());
        assert!(actual(&program).is_empty(), "{request}");
    }
}
