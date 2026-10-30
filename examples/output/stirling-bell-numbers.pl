% Answer 1
stirling_bell_answer(bell_10, 115975).
stirling_bell_answer(bell_12, 4213597).
stirling_bell_answer(stirling_10_4, 34105).
stirling_bell_answer(stirling_12_5, 1379400).

% Answer 2
bell(4, 15).

% Reason 2
proof_step(2, 1, binomial(0, 0, 1), source(2)).
proof_step(2, 2, bell(0, 1), source(4)).
proof_step(2, 3, '>'(4, 0), builtin).
proof_step(2, 4, '>'(3, 0), builtin).
proof_step(2, 5, '>'(2, 0), builtin).
proof_step(2, 6, '>'(1, 0), builtin).
proof_step(2, 7, '<'(1, 2), builtin).
proof_step(2, 8, is(1, '-'(2, 1)), builtin).
proof_step(2, 9, is(0, '-'(1, 1)), builtin).
proof_step(2, 10, is(2, '+'(1, 1)), builtin).
proof_step(2, 11, '<'(1, 3), builtin).
proof_step(2, 12, is(2, '-'(3, 1)), builtin).
proof_step(2, 13, is(3, '+'(1, 2)), builtin).
proof_step(2, 14, is(3, '-'(4, 1)), builtin).
proof_step(2, 15, '=<'(0, 0), builtin).
proof_step(2, 16, is(1, '+'(0, 1)), builtin).
proof_step(2, 17, is(1, '+'('*'(1, 1), 0)), builtin).
proof_step(2, 18, '<'(2, 3), builtin).
proof_step(2, 19, is(3, '+'(2, 1)), builtin).
proof_step(2, 20, '>'(2, 1), builtin).
proof_step(2, 21, '=<'(1, 1), builtin).
proof_step(2, 22, '=<'(0, 1), builtin).
proof_step(2, 23, is(2, '+'('*'(1, 1), 1)), builtin).
proof_step(2, 24, is(4, '+'(3, 1)), builtin).
proof_step(2, 25, '>'(3, 2), builtin).
proof_step(2, 26, '=<'(2, 2), builtin).
proof_step(2, 27, is(2, '+'('*'(1, 2), 0)), builtin).
proof_step(2, 28, '=<'(1, 2), builtin).
proof_step(2, 29, is(4, '+'('*'(2, 1), 2)), builtin).
proof_step(2, 30, '=<'(0, 2), builtin).
proof_step(2, 31, is(5, '+'('*'(1, 1), 4)), builtin).
proof_step(2, 32, '>'(4, 3), builtin).
proof_step(2, 33, '=<'(3, 3), builtin).
proof_step(2, 34, is(5, '+'('*'(1, 5), 0)), builtin).
proof_step(2, 35, '=<'(2, 3), builtin).
proof_step(2, 36, is(11, '+'('*'(3, 2), 5)), builtin).
proof_step(2, 37, '=<'(1, 3), builtin).
proof_step(2, 38, is(14, '+'('*'(3, 1), 11)), builtin).
proof_step(2, 39, '=<'(0, 3), builtin).
proof_step(2, 40, is(15, '+'('*'(1, 1), 14)), builtin).
proof_step(2, 41, binomial(3, 0, 1), rule(2, [4])).
proof_step(2, 42, binomial(3, 3, 1), rule(3, [4])).
proof_step(2, 43, binomial(2, 0, 1), rule(2, [5])).
proof_step(2, 44, binomial(2, 2, 1), rule(3, [5])).
proof_step(2, 45, binomial(1, 0, 1), rule(2, [6])).
proof_step(2, 46, binomial(1, 1, 1), rule(3, [6])).
proof_step(2, 47, bell_sum(1, 0, 0, 0), rule(12, [6])).
proof_step(2, 48, bell_sum(2, 1, 1, 0), rule(12, [20])).
proof_step(2, 49, bell_sum(3, 2, 2, 0), rule(12, [25])).
proof_step(2, 50, bell_sum(4, 3, 3, 0), rule(12, [32])).
proof_step(2, 51, binomial(2, 1, 2), rule(4, [5, 6, 7, 8, 9, 45, 46, 10])).
proof_step(2, 52, bell_sum(0, 0, 0, 1), rule(13, [15, 1, 2, 16, 47, 17])).
proof_step(2, 53, binomial(3, 1, 3), rule(4, [4, 6, 11, 12, 9, 43, 51, 13])).
proof_step(2, 54, binomial(3, 2, 3), rule(4, [4, 5, 18, 12, 8, 51, 44, 19])).
proof_step(2, 55, bell(1, 1), rule(11, [6, 9, 52])).
proof_step(2, 56, bell_sum(1, 1, 1, 1), rule(13, [21, 46, 55, 10, 48, 17])).
proof_step(2, 57, bell_sum(0, 1, 1, 2), rule(13, [22, 45, 2, 16, 56, 23])).
proof_step(2, 58, bell(2, 2), rule(11, [5, 8, 57])).
proof_step(2, 59, bell_sum(2, 2, 2, 2), rule(13, [26, 44, 58, 19, 49, 27])).
proof_step(2, 60, bell_sum(1, 2, 2, 4), rule(13, [28, 51, 55, 10, 59, 29])).
proof_step(2, 61, bell_sum(0, 2, 2, 5), rule(13, [30, 43, 2, 16, 60, 31])).
proof_step(2, 62, bell(3, 5), rule(11, [4, 12, 61])).
proof_step(2, 63, bell_sum(3, 3, 3, 5), rule(13, [33, 42, 62, 24, 50, 34])).
proof_step(2, 64, bell_sum(2, 3, 3, 11), rule(13, [35, 54, 58, 19, 63, 36])).
proof_step(2, 65, bell_sum(1, 3, 3, 14), rule(13, [37, 53, 55, 10, 64, 38])).
proof_step(2, 66, bell_sum(0, 3, 3, 15), rule(13, [39, 41, 2, 16, 65, 40])).
proof_step(2, 67, bell(4, 15), rule(11, [3, 14, 66])).
proof_claim(2, answer(2, [67])).

% Check 2
proof_check(2, checked, [
    steps(67),
    claims(1),
    source_facts(2),
    rule_applications(27),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(29, 0)).
proof_condition(2, c2, "well-foundedness", checked(27, 0)).
proof_condition(2, c3, "justification", checked(68, 0)).
proof_condition(2, c4, "coverage", checked(137, 0)).
proof_condition(2, c5, "re-decision", checked(38, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(67, 0)).
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
