% Answer 1
approximation(3, 3.145238095238).
approximation(7, 3.142071817072).
approximation(11, 3.141736099261).

% Answer 2
approximation(3, 3.145238095238).

% Reason 2
proof_step(2, 1, terms(3), source(1)).
proof_step(2, 2, '>'(4, 3), builtin).
proof_step(2, 3, '=<'(3, 3), builtin).
proof_step(2, 4, is(6, '*'(2, 3)), builtin).
proof_step(2, 5, is(336, '*'('*'(6, '+'(6, 1)), '+'(6, 2))), builtin).
proof_step(
    2,
    6,
    is(0.036309523809523805, '+'(0.03333333333333333, '/'(1, 336))),
    builtin
).
proof_step(2, 7, is(-1, '-'(1)), builtin).
proof_step(2, 8, is(4, '+'(3, 1)), builtin).
proof_step(2, 9, '=<'(2, 3), builtin).
proof_step(2, 10, is(4, '*'(2, 2)), builtin).
proof_step(2, 11, is(120, '*'('*'(4, '+'(4, 1)), '+'(4, 2))), builtin).
proof_step(
    2,
    12,
    is(0.03333333333333333, '+'(0.041666666666666664, '/'(-1, 120))),
    builtin
).
proof_step(2, 13, is(1, '-'(-1)), builtin).
proof_step(2, 14, is(3, '+'(2, 1)), builtin).
proof_step(2, 15, '=<'(1, 3), builtin).
proof_step(2, 16, is(2, '*'(2, 1)), builtin).
proof_step(2, 17, is(24, '*'('*'(2, '+'(2, 1)), '+'(2, 2))), builtin).
proof_step(2, 18, is(0.041666666666666664, '+'(0.0, '/'(1, 24))), builtin).
proof_step(2, 19, is(2, '+'(1, 1)), builtin).
proof_step(2, 20, '>='(3, 0), builtin).
proof_step(2, 21, is(3.145238095238095, '+'(3, '*'(4, 0.036309523809523805))), builtin).
proof_step(
    2,
    22,
    is(3.145238095238, '/'(round('*'(3.145238095238095, 1000000000000)), 1000000000000)),
    builtin
).
proof_step(
    2,
    23,
    series(4, 3, 0.036309523809523805, -1, 0.036309523809523805),
    rule(1, [2])
).
proof_step(
    2,
    24,
    series(3, 3, 0.03333333333333333, 1, 0.036309523809523805),
    rule(2, [3, 4, 5, 6, 7, 8, 23])
).
proof_step(
    2,
    25,
    series(2, 3, 0.041666666666666664, -1, 0.036309523809523805),
    rule(2, [9, 10, 11, 12, 13, 14, 24])
).
proof_step(
    2,
    26,
    series(1, 3, 0.0, 1, 0.036309523809523805),
    rule(2, [15, 16, 17, 18, 7, 19, 25])
).
proof_step(2, 27, pi_approximation(3, 3.145238095238095), rule(3, [20, 26, 21])).
proof_step(2, 28, approximation(3, 3.145238095238), rule(4, [1, 27, 22])).
proof_claim(2, answer(2, [28])).

% Check 2
proof_check(2, checked, [
    steps(28),
    claims(1),
    source_facts(1),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(7, 0)).
proof_condition(2, c2, "well-foundedness", checked(6, 0)).
proof_condition(2, c3, "justification", checked(29, 0)).
proof_condition(2, c4, "coverage", checked(37, 0)).
proof_condition(2, c5, "re-decision", checked(21, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(28, 0)).
proof_condition(
    2,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(2, c9, "query isolation", checked(1, 0)).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
