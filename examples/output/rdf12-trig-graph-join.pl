% Answer 1
result_rdf(
    iri('https://example.org/sensor1'),
    iri('https://example.org/reportedBy'),
    iri('https://example.org/station7'),
    default_graph
).

% Reason 1
proof_step(
    1,
    1,
    rdf(
        iri('https://example.org/sensorGraph'),
        iri('https://example.org/reportedBy'),
        iri('https://example.org/station7'),
        default_graph
    ),
    source(1)
).
proof_step(
    1,
    2,
    rdf(
        iri('https://example.org/sensor1'),
        iri('https://example.org/temperature'),
        literal('21.5', datatype('http://www.w3.org/2001/XMLSchema#string')),
        iri('https://example.org/sensorGraph')
    ),
    source(2)
).
proof_step(
    1,
    3,
    result_rdf(
        iri('https://example.org/sensor1'),
        iri('https://example.org/reportedBy'),
        iri('https://example.org/station7'),
        default_graph
    ),
    rule(1, [1, 2])
).
proof_claim(1, answer(1, [3])).

% Check 1
proof_check(1, checked, [
    steps(3),
    claims(1),
    source_facts(2),
    rule_applications(1),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(3, 0)).
proof_condition(1, c2, "well-foundedness", checked(1, 0)).
proof_condition(1, c3, "justification", checked(4, 0)).
proof_condition(1, c4, "coverage", checked(7, 0)).
proof_condition(
    1,
    c5,
    "re-decision",
    not_applicable("program uses no built-ins or aggregates")
).
proof_condition(
    1,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(1, c7, "relevance", checked(3, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(1, 0)).

% Goal check 2
check_result(2, true).
