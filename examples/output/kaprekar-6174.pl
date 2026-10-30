% Answer 1
trajectory(6174, [6174]).
trajectory(3524, [3087, 8352, 6174]).
trajectory(1000, [999, 8991, 8082, 8532, 6174]).
trajectory(2111, [999, 8991, 8082, 8532, 6174]).

% Answer 2
trajectory(3524, [3087, 8352, 6174]).

% Reason 2
proof_step(2, 1, start(3524), source(1)).
proof_step(2, 2, sort_digits([], []), source(6)).
proof_step(2, 3, insert(4, [], [4]), rule(1, [])).
proof_step(2, 4, '=<'(2, 4), builtin).
proof_step(2, 5, insert(5, [], [5]), rule(1, [])).
proof_step(2, 6, '>'(5, 4), builtin).
proof_step(2, 7, '>'(5, 2), builtin).
proof_step(2, 8, insert(2, [], [2]), rule(1, [])).
proof_step(2, 9, '=<'(3, 4), builtin).
proof_step(2, 10, '>'(3, 2), builtin).
proof_step(2, 11, '>='(3524, 0), builtin).
proof_step(2, 12, '=<'(3524, 9999), builtin).
proof_step(2, 13, is(3, div(3524, 1000)), builtin).
proof_step(2, 14, is(5, mod(div(3524, 100), 10)), builtin).
proof_step(2, 15, is(2, mod(div(3524, 10), 10)), builtin).
proof_step(2, 16, is(4, mod(3524, 10)), builtin).
proof_step(2, 17, is(3087, '+'('*'(999, '-'(5, 2)), '*'(90, '-'(4, 3)))), builtin).
proof_step(2, 18, insert(7, [], [7]), rule(1, [])).
proof_step(2, 19, insert(8, [], [8]), rule(1, [])).
proof_step(2, 20, '>'(8, 7), builtin).
proof_step(2, 21, '=<'(0, 7), builtin).
proof_step(2, 22, '=<'(3, 7), builtin).
proof_step(2, 23, '>'(3, 0), builtin).
proof_step(2, 24, '>='(3087, 0), builtin).
proof_step(2, 25, '=<'(3087, 9999), builtin).
proof_step(2, 26, is(3, div(3087, 1000)), builtin).
proof_step(2, 27, is(0, mod(div(3087, 100), 10)), builtin).
proof_step(2, 28, is(8, mod(div(3087, 10), 10)), builtin).
proof_step(2, 29, is(7, mod(3087, 10)), builtin).
proof_step(2, 30, is(8352, '+'('*'(999, '-'(8, 0)), '*'(90, '-'(7, 3)))), builtin).
proof_step(2, 31, '=<'(3, 5), builtin).
proof_step(2, 32, '>'(8, 2), builtin).
proof_step(2, 33, '>'(8, 5), builtin).
proof_step(2, 34, '>'(8, 3), builtin).
proof_step(2, 35, '>='(8352, 0), builtin).
proof_step(2, 36, '=<'(8352, 9999), builtin).
proof_step(2, 37, is(8, div(8352, 1000)), builtin).
proof_step(2, 38, is(3, mod(div(8352, 100), 10)), builtin).
proof_step(2, 39, is(5, mod(div(8352, 10), 10)), builtin).
proof_step(2, 40, is(2, mod(8352, 10)), builtin).
proof_step(2, 41, is(6174, '+'('*'(999, '-'(8, 2)), '*'(90, '-'(5, 3)))), builtin).
proof_step(2, 42, '=\\='(8352, 6174), builtin).
proof_step(2, 43, '=\\='(3087, 6174), builtin).
proof_step(2, 44, '>'(8352, 0), builtin).
proof_step(2, 45, '=\\='(3524, 6174), builtin).
proof_step(2, 46, '>'(3087, 0), builtin).
proof_step(2, 47, sort_digits([4], [4]), rule(4, [2, 3])).
proof_step(2, 48, insert(2, [4], [2, 4]), rule(2, [4])).
proof_step(2, 49, insert(5, [4], [4, 5]), rule(3, [6, 5])).
proof_step(2, 50, insert(5, [2], [2, 5]), rule(3, [7, 5])).
proof_step(2, 51, sort_digits([2], [2]), rule(4, [2, 8])).
proof_step(2, 52, insert(3, [4, 5], [3, 4, 5]), rule(2, [9])).
proof_step(2, 53, sort_digits([7], [7]), rule(4, [2, 18])).
proof_step(2, 54, insert(8, [7], [7, 8]), rule(3, [20, 19])).
proof_step(2, 55, insert(0, [7, 8], [0, 7, 8]), rule(2, [21])).
proof_step(2, 56, insert(3, [7, 8], [3, 7, 8]), rule(2, [22])).
proof_step(2, 57, insert(3, [5], [3, 5]), rule(2, [31])).
proof_step(2, 58, insert(8, [5], [5, 8]), rule(3, [33, 19])).
proof_step(2, 59, sort_digits([2, 4], [2, 4]), rule(4, [47, 48])).
proof_step(2, 60, insert(5, [2, 4], [2, 4, 5]), rule(3, [7, 49])).
proof_step(2, 61, sort_digits([5, 2], [2, 5]), rule(4, [51, 50])).
proof_step(2, 62, insert(3, [2, 4, 5], [2, 3, 4, 5]), rule(3, [10, 52])).
proof_step(2, 63, sort_digits([8, 7], [7, 8]), rule(4, [53, 54])).
proof_step(2, 64, insert(3, [0, 7, 8], [0, 3, 7, 8]), rule(3, [23, 56])).
proof_step(2, 65, insert(3, [2, 5], [2, 3, 5]), rule(3, [10, 57])).
proof_step(2, 66, insert(8, [3, 5], [3, 5, 8]), rule(3, [34, 58])).
proof_step(2, 67, sort_digits([5, 2, 4], [2, 4, 5]), rule(4, [59, 60])).
proof_step(2, 68, sort_digits([0, 8, 7], [0, 7, 8]), rule(4, [63, 55])).
proof_step(2, 69, sort_digits([3, 5, 2], [2, 3, 5]), rule(4, [61, 65])).
proof_step(2, 70, insert(8, [2, 3, 5], [2, 3, 5, 8]), rule(3, [32, 66])).
proof_step(2, 71, sort_digits([3, 5, 2, 4], [2, 3, 4, 5]), rule(4, [67, 62])).
proof_step(2, 72, sort_digits([3, 0, 8, 7], [0, 3, 7, 8]), rule(4, [68, 64])).
proof_step(2, 73, sort_digits([8, 3, 5, 2], [2, 3, 5, 8]), rule(4, [69, 70])).
proof_step(2, 74, step(3524, 3087), rule(5, [11, 12, 13, 14, 15, 16, 71, 17])).
proof_step(2, 75, step(3087, 8352), rule(5, [24, 25, 26, 27, 28, 29, 72, 30])).
proof_step(2, 76, step(8352, 6174), rule(5, [35, 36, 37, 38, 39, 40, 73, 41])).
proof_step(2, 77, kaprekar(8352, [6174]), rule(6, [42, 76])).
proof_step(2, 78, kaprekar(3087, [8352, 6174]), rule(7, [43, 75, 44, 42, 77])).
proof_step(2, 79, kaprekar(3524, [3087, 8352, 6174]), rule(7, [45, 74, 46, 43, 78])).
proof_step(2, 80, trajectory(3524, [3087, 8352, 6174]), rule(8, [1, 79])).
proof_claim(2, answer(2, [80])).

% Check 2
proof_check(2, checked, [
    steps(80),
    claims(1),
    source_facts(2),
    rule_applications(39),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(41, 0)).
proof_condition(2, c2, "well-foundedness", checked(39, 0)).
proof_condition(2, c3, "justification", checked(81, 0)).
proof_condition(2, c4, "coverage", checked(130, 0)).
proof_condition(2, c5, "re-decision", checked(39, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(80, 0)).
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
