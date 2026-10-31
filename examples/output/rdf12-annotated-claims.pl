% Answer 1
result_rdf(
    iri('https://example.org/closed'),
    iri('https://example.org/rank'),
    literal('1', datatype('http://www.w3.org/2001/XMLSchema#integer')),
    default_graph
).
result_rdf(
    iri('https://example.org/closed'),
    iri('https://example.org/assertedBy'),
    iri('https://example.org/transportAuthority'),
    default_graph
).
result_rdf(
    iri('https://example.org/closed'),
    iri('https://example.org/score'),
    literal('9310', datatype('http://www.w3.org/2001/XMLSchema#integer')),
    default_graph
).
result_rdf(
    iri('https://example.org/open'),
    iri('https://example.org/rank'),
    literal('2', datatype('http://www.w3.org/2001/XMLSchema#integer')),
    default_graph
).
result_rdf(
    iri('https://example.org/open'),
    iri('https://example.org/assertedBy'),
    iri('https://example.org/anonymousPost'),
    default_graph
).
result_rdf(
    iri('https://example.org/open'),
    iri('https://example.org/score'),
    literal('700', datatype('http://www.w3.org/2001/XMLSchema#integer')),
    default_graph
).
result_rdf(
    iri('https://example.org/bridge'),
    iri('https://example.org/decision'),
    iri('https://example.org/avoid_bridge'),
    default_graph
).
result_rdf(
    iri('https://example.org/bridge'),
    iri('https://example.org/trustedSource'),
    iri('https://example.org/transportAuthority'),
    default_graph
).
result_rdf(
    iri('https://example.org/bridge'),
    iri('https://example.org/score'),
    literal('9310', datatype('http://www.w3.org/2001/XMLSchema#integer')),
    default_graph
).

% Reason 1
proof_step(
    1,
    1,
    rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/status'),
        iri('https://example.org/closed'),
        default_graph
    ),
    source(1)
).
proof_step(
    1,
    2,
    rdf(
        iri('https://example.org/authorityClaim'),
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(
            iri('https://example.org/bridge'),
            iri('https://example.org/status'),
            iri('https://example.org/closed')
        ),
        default_graph
    ),
    source(2)
).
proof_step(
    1,
    3,
    rdf(
        iri('https://example.org/authorityClaim'),
        iri('https://example.org/assertedBy'),
        iri('https://example.org/transportAuthority'),
        default_graph
    ),
    source(3)
).
proof_step(
    1,
    4,
    rdf(
        iri('https://example.org/authorityClaim'),
        iri('https://example.org/confidence'),
        literal('98', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    source(4)
).
proof_step(
    1,
    5,
    rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/status'),
        iri('https://example.org/open'),
        default_graph
    ),
    source(5)
).
proof_step(
    1,
    6,
    rdf(
        iri('https://example.org/socialClaim'),
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(
            iri('https://example.org/bridge'),
            iri('https://example.org/status'),
            iri('https://example.org/open')
        ),
        default_graph
    ),
    source(6)
).
proof_step(
    1,
    7,
    rdf(
        iri('https://example.org/socialClaim'),
        iri('https://example.org/assertedBy'),
        iri('https://example.org/anonymousPost'),
        default_graph
    ),
    source(7)
).
proof_step(
    1,
    8,
    rdf(
        iri('https://example.org/socialClaim'),
        iri('https://example.org/confidence'),
        literal('35', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    source(8)
).
proof_step(
    1,
    9,
    rdf(
        iri('https://example.org/transportAuthority'),
        iri('https://example.org/trustScore'),
        literal('95', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    source(9)
).
proof_step(
    1,
    10,
    rdf(
        iri('https://example.org/anonymousPost'),
        iri('https://example.org/trustScore'),
        literal('20', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    source(10)
).
proof_step(1, 11, status_action(closed, avoid_bridge), source(11)).
proof_step(1, 12, status_action(open, cross_bridge), source(12)).
proof_step(1, 13, status_resource(closed, 'https://example.org/closed'), source(13)).
proof_step(1, 14, status_resource(open, 'https://example.org/open'), source(14)).
proof_step(
    1,
    15,
    source_resource(transport_authority, 'https://example.org/transportAuthority'),
    source(15)
).
proof_step(
    1,
    16,
    source_resource(anonymous_post, 'https://example.org/anonymousPost'),
    source(16)
).
proof_step(
    1,
    17,
    source_result_iri(no_trusted_source, 'https://example.org/noTrustedSource'),
    source(17)
).
proof_step(1, 18, atom_chars('98', ['9', '8']), builtin).
proof_step(1, 19, number_chars(98, ['9', '8']), builtin).
proof_step(1, 20, atom_chars('35', ['3', '5']), builtin).
proof_step(1, 21, number_chars(35, ['3', '5']), builtin).
proof_step(1, 22, atom_chars('95', ['9', '5']), builtin).
proof_step(1, 23, number_chars(95, ['9', '5']), builtin).
proof_step(1, 24, atom_chars('20', ['2', '0']), builtin).
proof_step(1, 25, number_chars(20, ['2', '0']), builtin).
proof_step(1, 26, is(9310, '*'(98, 95)), builtin).
proof_step(1, 27, is(700, '*'(35, 20)), builtin).
proof_step(1, 28, '>'(9310, 700), builtin).
proof_step(1, 29, is(1, '+'(0, 1)), builtin).
proof_step(1, 30, is(2, '+'(1, 1)), builtin).
proof_step(1, 31, number_chars(1, ['1']), builtin).
proof_step(1, 32, atom_chars('1', ['1']), builtin).
proof_step(1, 33, number_chars(9310, ['9', '3', '1', '0']), builtin).
proof_step(1, 34, atom_chars('9310', ['9', '3', '1', '0']), builtin).
proof_step(1, 35, number_chars(2, ['2']), builtin).
proof_step(1, 36, atom_chars('2', ['2']), builtin).
proof_step(1, 37, number_chars(700, ['7', '0', '0']), builtin).
proof_step(1, 38, atom_chars('700', ['7', '0', '0']), builtin).
proof_step(1, 39, '>='(9310, 8000), builtin).
proof_step(
    1,
    40,
    atom_concat(
        'https://example.org/',
        avoid_bridge,
        'https://example.org/avoid_bridge'
    ),
    builtin
).
proof_step(
    1,
    41,
    source_result_iri(transport_authority, 'https://example.org/transportAuthority'),
    rule(16, [15])
).
proof_step(
    1,
    42,
    source_result_iri(anonymous_post, 'https://example.org/anonymousPost'),
    rule(16, [16])
).
proof_step(
    1,
    43,
    rdf_number(
        iri('https://example.org/authorityClaim'),
        'https://example.org/confidence',
        98
    ),
    rule(9, [4, 18, 19])
).
proof_step(
    1,
    44,
    rdf_number(
        iri('https://example.org/socialClaim'),
        'https://example.org/confidence',
        35
    ),
    rule(9, [8, 20, 21])
).
proof_step(
    1,
    45,
    rdf_number(
        iri('https://example.org/transportAuthority'),
        'https://example.org/trustScore',
        95
    ),
    rule(9, [9, 22, 23])
).
proof_step(
    1,
    46,
    rdf_number(
        iri('https://example.org/anonymousPost'),
        'https://example.org/trustScore',
        20
    ),
    rule(9, [10, 24, 25])
).
proof_step(1, 47, number_atom(1, '1'), rule(17, [31, 32])).
proof_step(1, 48, number_atom(9310, '9310'), rule(17, [33, 34])).
proof_step(1, 49, number_atom(2, '2'), rule(17, [35, 36])).
proof_step(1, 50, number_atom(700, '700'), rule(17, [37, 38])).
proof_step(
    1,
    51,
    annotated_status_claim(closed, transport_authority, 9310),
    rule(4, [13, 15, 1, 2, 3, 43, 45, 26])
).
proof_step(
    1,
    52,
    annotated_status_claim(open, anonymous_post, 700),
    rule(4, [14, 16, 5, 6, 7, 44, 46, 27])
).
proof_step(1, 53, status_claimed, rule(8, [51])).
proof_step(
    1,
    54,
    claim_ahead(700, open, closed, transport_authority),
    rule(2, [51, 28])
).
proof_step(
    1,
    55,
    '$aggregate:r1:2'(
        [
            binding('Score', 9310),
            binding('Source', transport_authority),
            binding('Status', closed)
        ],
        0
    ),
    aggregate(rule(1), 2, 1)
).
proof_step(
    1,
    56,
    '$aggregate:r1:2'(
        [
            binding('Score', 700),
            binding('Source', anonymous_post),
            binding('Status', open)
        ],
        1
    ),
    aggregate(rule(1), 2, 1)
).
proof_step(
    1,
    57,
    ranked_claim(1, closed, transport_authority, 9310),
    rule(1, [51, 55, 29])
).
proof_step(1, 58, ranked_claim(2, open, anonymous_post, 700), rule(1, [52, 56, 30])).
proof_step(
    1,
    59,
    result_rdf(
        iri('https://example.org/closed'),
        iri('https://example.org/rank'),
        literal('1', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    rule(13, [57, 13, 47])
).
proof_step(
    1,
    60,
    result_rdf(
        iri('https://example.org/closed'),
        iri('https://example.org/assertedBy'),
        iri('https://example.org/transportAuthority'),
        default_graph
    ),
    rule(14, [57, 13, 15])
).
proof_step(
    1,
    61,
    result_rdf(
        iri('https://example.org/closed'),
        iri('https://example.org/score'),
        literal('9310', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    rule(15, [57, 13, 48])
).
proof_step(
    1,
    62,
    bridge_decision(avoid_bridge, transport_authority, 9310),
    rule(5, [57, 39, 11])
).
proof_step(
    1,
    63,
    result_rdf(
        iri('https://example.org/open'),
        iri('https://example.org/rank'),
        literal('2', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    rule(13, [58, 14, 49])
).
proof_step(
    1,
    64,
    result_rdf(
        iri('https://example.org/open'),
        iri('https://example.org/assertedBy'),
        iri('https://example.org/anonymousPost'),
        default_graph
    ),
    rule(14, [58, 14, 16])
).
proof_step(
    1,
    65,
    result_rdf(
        iri('https://example.org/open'),
        iri('https://example.org/score'),
        literal('700', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    rule(15, [58, 14, 50])
).
proof_step(
    1,
    66,
    result_rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/decision'),
        iri('https://example.org/avoid_bridge'),
        default_graph
    ),
    rule(10, [62, 40])
).
proof_step(
    1,
    67,
    result_rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/trustedSource'),
        iri('https://example.org/transportAuthority'),
        default_graph
    ),
    rule(11, [62, 41])
).
proof_step(
    1,
    68,
    result_rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/score'),
        literal('9310', datatype('http://www.w3.org/2001/XMLSchema#integer')),
        default_graph
    ),
    rule(12, [62, 48])
).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 17).
proof_boundary_steps(1, 1, 41, 54).
proof_boundary_call(
    1,
    1,
    claim_ahead(700, open, variable("_EyeplCall0"), variable("_EyeplCall1"))
).
proof_boundary_call(
    1,
    1,
    claim_ahead(9310, closed, variable("_EyeplCall0"), variable("_EyeplCall1"))
).
proof_boundary_call(1, 1, number_atom(1, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, number_atom(2, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, number_atom(700, variable("_EyeplCall0"))).
proof_boundary_call(1, 1, number_atom(9310, variable("_EyeplCall0"))).
proof_claim(1, answer(1, [59])).
proof_claim(1, answer(1, [60])).
proof_claim(1, answer(1, [61])).
proof_claim(1, answer(1, [63])).
proof_claim(1, answer(1, [64])).
proof_claim(1, answer(1, [65])).
proof_claim(1, answer(1, [66])).
proof_claim(1, answer(1, [67])).
proof_claim(1, answer(1, [68])).

% Check 1
proof_check(1, checked, [
    steps(68),
    claims(9),
    source_facts(17),
    rule_applications(26),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(43, 0)).
proof_condition(1, c2, "well-foundedness", checked(28, 0)).
proof_condition(1, c3, "justification", checked(78, 0)).
proof_condition(1, c4, "coverage", checked(172, 0)).
proof_condition(1, c5, "re-decision", checked(25, 0)).
proof_condition(1, c6, "boundary consistency", checked(3, 0)).
proof_condition(1, c7, "relevance", checked(69, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(9, 0)).

% Goal check 2
check_result(2, true).
