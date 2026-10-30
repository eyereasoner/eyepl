% Answer 1
answer(c3, 5, 0, 1).
answer(c1, 6, -1, 3).
answer(c5, 9, 1, 1).
answer(c4, 6, 5, -7).
answer(c6, 6, -649, 10155).
answer(c2, 1, 215, -47).

% Answer 2
answer(c5, 9, 1, 1).

% Reason 2
proof_step(2, 1, pair(c5, -27, 36), source(5)).
proof_step(2, 2, is(1, '-'(1, '*'(0, 0))), builtin).
proof_step(2, 3, is(0, '-'(0, '*'(0, 1))), builtin).
proof_step(2, 4, euclid(9, 0, -1, 4, 1, -3, 9, -1, 1), rule(2, [])).
proof_step(2, 5, '>'(9, 0), builtin).
proof_step(2, 6, is(3, div(27, 9)), builtin).
proof_step(2, 7, is(0, '-'(27, '*'(3, 9))), builtin).
proof_step(2, 8, is(4, '-'(1, '*'(3, -1))), builtin).
proof_step(2, 9, is(-3, '-'(0, '*'(3, 1))), builtin).
proof_step(2, 10, is(-1, '-'(0, '*'(1, 1))), builtin).
proof_step(2, 11, '>'(27, 0), builtin).
proof_step(2, 12, is(1, div(36, 27)), builtin).
proof_step(2, 13, is(9, '-'(36, '*'(1, 27))), builtin).
proof_step(2, 14, is(1, '-'(1, '*'(1, 0))), builtin).
proof_step(2, 15, '>'(36, 0), builtin).
proof_step(2, 16, is(0, div(27, 36)), builtin).
proof_step(2, 17, is(27, '-'(27, '*'(0, 36))), builtin).
proof_step(2, 18, '>'('+'(abs(-27), abs(36)), 0), builtin).
proof_step(2, 19, is(27, abs(-27)), builtin).
proof_step(2, 20, is(36, abs(36)), builtin).
proof_step(2, 21, is(1, '*'(sign(-27), -1)), builtin).
proof_step(2, 22, is(1, '*'(sign(36), 1)), builtin).
proof_step(2, 23, euclid(27, 9, 1, -1, 0, 1, 9, -1, 1), rule(3, [5, 6, 7, 8, 9, 4])).
proof_step(
    2,
    24,
    euclid(36, 27, 0, 1, 1, 0, 9, -1, 1),
    rule(3, [11, 12, 13, 10, 14, 23])
).
proof_step(2, 25, euclid(27, 36, 1, 0, 0, 1, 9, -1, 1), rule(3, [15, 16, 17, 2, 3, 24])).
proof_step(2, 26, bezout(-27, 36, 9, 1, 1), rule(1, [18, 19, 20, 25, 21, 22])).
proof_step(2, 27, answer(c5, 9, 1, 1), rule(4, [1, 26])).
proof_claim(2, answer(2, [27])).

% Check 2
proof_check(2, checked, [
    steps(27),
    claims(1),
    source_facts(1),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(7, 0)).
proof_condition(2, c2, "well-foundedness", checked(6, 0)).
proof_condition(2, c3, "justification", checked(28, 0)).
proof_condition(2, c4, "coverage", checked(35, 0)).
proof_condition(2, c5, "re-decision", checked(20, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(27, 0)).
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

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).
