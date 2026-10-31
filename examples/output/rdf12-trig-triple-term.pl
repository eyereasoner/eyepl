% Answer 1
result_rdf(
    iri('https://example.org/bob'),
    iri('https://example.org/knows'),
    iri('https://example.org/carol'),
    iri('https://example.org/claimsGraph')
).

% Reason 1
proof_step(
    1,
    1,
    rdf(
        iri('https://example.org/alice'),
        iri('https://example.org/claims'),
        triple(
            iri('https://example.org/bob'),
            iri('https://example.org/knows'),
            iri('https://example.org/carol')
        ),
        iri('https://example.org/claimsGraph')
    ),
    source(1)
).
proof_step(
    1,
    2,
    result_rdf(
        iri('https://example.org/bob'),
        iri('https://example.org/knows'),
        iri('https://example.org/carol'),
        iri('https://example.org/claimsGraph')
    ),
    rule(1, [1])
).
proof_claim(1, answer(1, [2])).

% Check 1
proof_check(1, checked, [
    steps(2),
    claims(1),
    source_facts(1),
    rule_applications(1),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(2, 0)).
proof_condition(1, c2, "well-foundedness", checked(1, 0)).
proof_condition(1, c3, "justification", checked(3, 0)).
proof_condition(1, c4, "coverage", checked(5, 0)).
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
proof_condition(1, c7, "relevance", checked(2, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(1, 0)).

% Goal check 2
check_result(2, true).
