% Answer 1
result_rdf(
    iri('https://example.org/welcome'),
    iri('https://example.org/displayLabel'),
    literal('مرحبا', lang(ar, rtl)),
    default_graph
).
result_rdf(
    iri('https://example.org/welcome'),
    iri('https://example.org/displayLabel'),
    literal('Welcome', lang(en, ltr)),
    default_graph
).

% Reason 1
proof_step(
    1,
    1,
    rdf(
        iri('https://example.org/welcome'),
        iri('https://example.org/label'),
        literal('مرحبا', lang(ar, rtl)),
        default_graph
    ),
    source(1)
).
proof_step(
    1,
    2,
    rdf(
        iri('https://example.org/welcome'),
        iri('https://example.org/label'),
        literal('Welcome', lang(en, ltr)),
        default_graph
    ),
    source(2)
).
proof_step(
    1,
    3,
    result_rdf(
        iri('https://example.org/welcome'),
        iri('https://example.org/displayLabel'),
        literal('مرحبا', lang(ar, rtl)),
        default_graph
    ),
    rule(1, [1])
).
proof_step(
    1,
    4,
    result_rdf(
        iri('https://example.org/welcome'),
        iri('https://example.org/displayLabel'),
        literal('Welcome', lang(en, ltr)),
        default_graph
    ),
    rule(1, [2])
).
proof_claim(1, answer(1, [3])).
proof_claim(1, answer(1, [4])).

% Check 1
proof_check(1, checked, [
    steps(4),
    claims(2),
    source_facts(2),
    rule_applications(2),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(4, 0)).
proof_condition(1, c2, "well-foundedness", checked(2, 0)).
proof_condition(1, c3, "justification", checked(6, 0)).
proof_condition(1, c4, "coverage", checked(10, 0)).
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
proof_condition(1, c7, "relevance", checked(4, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(2, 0)).

% Goal check 2
check_result(2, true).
