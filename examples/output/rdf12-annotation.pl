% Answer 1
result_rdf(
    iri('https://example.org/alice'),
    iri('https://example.org/name'),
    literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string')),
    default_graph
).
result_rdf(
    iri('https://example.org/claim1'),
    iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
    triple(
        iri('https://example.org/alice'),
        iri('https://example.org/name'),
        literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string'))
    ),
    default_graph
).
result_rdf(
    iri('https://example.org/claim1'),
    iri('https://example.org/statedBy'),
    iri('https://example.org/carol'),
    default_graph
).
result_rdf(
    iri('https://example.org/claim1'),
    iri('https://example.org/recorded'),
    literal('2025-01-15', datatype('http://www.w3.org/2001/XMLSchema#date')),
    default_graph
).

% Reason 1
proof_step(
    1,
    1,
    rdf(
        iri('https://example.org/alice'),
        iri('https://example.org/name'),
        literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string')),
        default_graph
    ),
    source(1)
).
proof_step(
    1,
    2,
    rdf(
        iri('https://example.org/claim1'),
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(
            iri('https://example.org/alice'),
            iri('https://example.org/name'),
            literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string'))
        ),
        default_graph
    ),
    source(2)
).
proof_step(
    1,
    3,
    rdf(
        iri('https://example.org/claim1'),
        iri('https://example.org/statedBy'),
        iri('https://example.org/carol'),
        default_graph
    ),
    source(3)
).
proof_step(
    1,
    4,
    rdf(
        iri('https://example.org/claim1'),
        iri('https://example.org/recorded'),
        literal('2025-01-15', datatype('http://www.w3.org/2001/XMLSchema#date')),
        default_graph
    ),
    source(4)
).
proof_step(
    1,
    5,
    annotated_claim(
        iri('https://example.org/alice'),
        iri('https://example.org/name'),
        literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string')),
        iri('https://example.org/claim1'),
        iri('https://example.org/carol'),
        literal('2025-01-15', datatype('http://www.w3.org/2001/XMLSchema#date'))
    ),
    rule(1, [1, 2, 3, 4])
).
proof_step(
    1,
    6,
    result_rdf(
        iri('https://example.org/alice'),
        iri('https://example.org/name'),
        literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string')),
        default_graph
    ),
    rule(2, [5])
).
proof_step(
    1,
    7,
    result_rdf(
        iri('https://example.org/claim1'),
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(
            iri('https://example.org/alice'),
            iri('https://example.org/name'),
            literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string'))
        ),
        default_graph
    ),
    rule(3, [5])
).
proof_step(
    1,
    8,
    result_rdf(
        iri('https://example.org/claim1'),
        iri('https://example.org/statedBy'),
        iri('https://example.org/carol'),
        default_graph
    ),
    rule(4, [5])
).
proof_step(
    1,
    9,
    result_rdf(
        iri('https://example.org/claim1'),
        iri('https://example.org/recorded'),
        literal('2025-01-15', datatype('http://www.w3.org/2001/XMLSchema#date')),
        default_graph
    ),
    rule(5, [5])
).
proof_claim(1, answer(1, [6])).
proof_claim(1, answer(1, [7])).
proof_claim(1, answer(1, [8])).
proof_claim(1, answer(1, [9])).

% Check 1
proof_check(1, checked, [
    steps(9),
    claims(4),
    source_facts(4),
    rule_applications(5),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(9, 0)).
proof_condition(1, c2, "well-foundedness", checked(5, 0)).
proof_condition(1, c3, "justification", checked(13, 0)).
proof_condition(1, c4, "coverage", checked(25, 0)).
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
proof_condition(1, c7, "relevance", checked(9, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(4, 0)).

% Goal check 2
check_result(2, true).
