% Answer 1
catalan_answer(catalan_12, 208012).
catalan_answer(triangulations_14_gon, 208012).
catalan_answer(parenthesizations_13_factors, 208012).
catalan_answer(first_ten_sum, 6918).

% Answer 2
catalan(4, 14).

% Reason 2
proof_step(2, 1, catalan(0, 1), source(1)).
proof_step(2, 2, '>'(1, 0), builtin).
proof_step(2, 3, '=<'(0, 0), builtin).
proof_step(2, 4, is(0, '-'(0, 0)), builtin).
proof_step(2, 5, is(1, '+'(0, 1)), builtin).
proof_step(2, 6, is(1, '+'('*'(1, 1), 0)), builtin).
proof_step(2, 7, is(0, '-'(1, 1)), builtin).
proof_step(2, 8, '>'(2, 1), builtin).
proof_step(2, 9, '=<'(1, 1), builtin).
proof_step(2, 10, is(2, '+'(1, 1)), builtin).
proof_step(2, 11, '=<'(0, 1), builtin).
proof_step(2, 12, is(1, '-'(1, 0)), builtin).
proof_step(2, 13, is(2, '+'('*'(1, 1), 1)), builtin).
proof_step(2, 14, '>'(2, 0), builtin).
proof_step(2, 15, is(1, '-'(2, 1)), builtin).
proof_step(2, 16, '>'(3, 2), builtin).
proof_step(2, 17, '=<'(2, 2), builtin).
proof_step(2, 18, is(0, '-'(2, 2)), builtin).
proof_step(2, 19, is(3, '+'(2, 1)), builtin).
proof_step(2, 20, is(2, '+'('*'(2, 1), 0)), builtin).
proof_step(2, 21, '=<'(1, 2), builtin).
proof_step(2, 22, is(3, '+'('*'(1, 1), 2)), builtin).
proof_step(2, 23, '=<'(0, 2), builtin).
proof_step(2, 24, is(2, '-'(2, 0)), builtin).
proof_step(2, 25, is(5, '+'('*'(1, 2), 3)), builtin).
proof_step(2, 26, '>'(3, 0), builtin).
proof_step(2, 27, is(2, '-'(3, 1)), builtin).
proof_step(2, 28, '>'(4, 3), builtin).
proof_step(2, 29, '=<'(3, 3), builtin).
proof_step(2, 30, is(0, '-'(3, 3)), builtin).
proof_step(2, 31, is(4, '+'(3, 1)), builtin).
proof_step(2, 32, is(5, '+'('*'(5, 1), 0)), builtin).
proof_step(2, 33, '=<'(2, 3), builtin).
proof_step(2, 34, is(1, '-'(3, 2)), builtin).
proof_step(2, 35, is(7, '+'('*'(2, 1), 5)), builtin).
proof_step(2, 36, '=<'(1, 3), builtin).
proof_step(2, 37, is(9, '+'('*'(1, 2), 7)), builtin).
proof_step(2, 38, '=<'(0, 3), builtin).
proof_step(2, 39, is(3, '-'(3, 0)), builtin).
proof_step(2, 40, is(14, '+'('*'(1, 5), 9)), builtin).
proof_step(2, 41, '>'(4, 0), builtin).
proof_step(2, 42, is(3, '-'(4, 1)), builtin).
proof_step(2, 43, convolution(1, 0, 0), rule(2, [2])).
proof_step(2, 44, convolution(2, 1, 0), rule(2, [8])).
proof_step(2, 45, convolution(3, 2, 0), rule(2, [16])).
proof_step(2, 46, convolution(4, 3, 0), rule(2, [28])).
proof_step(2, 47, convolution(0, 0, 1), rule(3, [3, 4, 1, 1, 5, 43, 6])).
proof_step(2, 48, catalan(1, 1), rule(1, [2, 7, 47])).
proof_step(2, 49, convolution(1, 1, 1), rule(3, [9, 7, 48, 1, 10, 44, 6])).
proof_step(2, 50, convolution(0, 1, 2), rule(3, [11, 12, 1, 48, 5, 49, 13])).
proof_step(2, 51, catalan(2, 2), rule(1, [14, 15, 50])).
proof_step(2, 52, convolution(2, 2, 2), rule(3, [17, 18, 51, 1, 19, 45, 20])).
proof_step(2, 53, convolution(1, 2, 3), rule(3, [21, 15, 48, 48, 10, 52, 22])).
proof_step(2, 54, convolution(0, 2, 5), rule(3, [23, 24, 1, 51, 5, 53, 25])).
proof_step(2, 55, catalan(3, 5), rule(1, [26, 27, 54])).
proof_step(2, 56, convolution(3, 3, 5), rule(3, [29, 30, 55, 1, 31, 46, 32])).
proof_step(2, 57, convolution(2, 3, 7), rule(3, [33, 34, 51, 48, 19, 56, 35])).
proof_step(2, 58, convolution(1, 3, 9), rule(3, [36, 27, 48, 51, 10, 57, 37])).
proof_step(2, 59, convolution(0, 3, 14), rule(3, [38, 39, 1, 55, 5, 58, 40])).
proof_step(2, 60, catalan(4, 14), rule(1, [41, 42, 59])).
proof_claim(2, answer(2, [60])).

% Check 2
proof_check(2, checked, [
    steps(60),
    claims(1),
    source_facts(1),
    rule_applications(18),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(19, 0)).
proof_condition(2, c2, "well-foundedness", checked(18, 0)).
proof_condition(2, c3, "justification", checked(61, 0)).
proof_condition(2, c4, "coverage", checked(107, 0)).
proof_condition(2, c5, "re-decision", checked(41, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(60, 0)).
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
