% Answer 1
partition(4, 2, 2).
partition(6, 3, 3).
partition(8, 3, 5).
partition(10, 3, 7).
partition(10, 5, 5).
partition(12, 5, 7).
partition(20, 3, 17).
partition(20, 7, 13).
partition(50, 3, 47).
partition(28, 5, 23).
partition(50, 7, 43).
partition(28, 11, 17).
partition(50, 13, 37).
partition(50, 19, 31).

% Answer 2
partition(50, 19, 31).

% Reason 2
proof_step(2, 1, even(50), source(8)).
proof_step(2, 2, is(3, '+'(2, 1)), builtin).
proof_step(2, 3, '<'(2, 25), builtin).
proof_step(2, 4, is(4, '+'(3, 1)), builtin).
proof_step(2, 5, '<'(3, 25), builtin).
proof_step(2, 6, is(5, '+'(4, 1)), builtin).
proof_step(2, 7, '<'(4, 25), builtin).
proof_step(2, 8, is(6, '+'(5, 1)), builtin).
proof_step(2, 9, '<'(5, 25), builtin).
proof_step(2, 10, is(7, '+'(6, 1)), builtin).
proof_step(2, 11, '<'(6, 25), builtin).
proof_step(2, 12, is(8, '+'(7, 1)), builtin).
proof_step(2, 13, '<'(7, 25), builtin).
proof_step(2, 14, is(9, '+'(8, 1)), builtin).
proof_step(2, 15, '<'(8, 25), builtin).
proof_step(2, 16, is(10, '+'(9, 1)), builtin).
proof_step(2, 17, '<'(9, 25), builtin).
proof_step(2, 18, is(11, '+'(10, 1)), builtin).
proof_step(2, 19, '<'(10, 25), builtin).
proof_step(2, 20, is(12, '+'(11, 1)), builtin).
proof_step(2, 21, '<'(11, 25), builtin).
proof_step(2, 22, is(13, '+'(12, 1)), builtin).
proof_step(2, 23, '<'(12, 25), builtin).
proof_step(2, 24, is(14, '+'(13, 1)), builtin).
proof_step(2, 25, '<'(13, 25), builtin).
proof_step(2, 26, '<'(14, 25), builtin).
proof_step(2, 27, is(15, '+'(14, 1)), builtin).
proof_step(2, 28, '<'(15, 25), builtin).
proof_step(2, 29, is(16, '+'(15, 1)), builtin).
proof_step(2, 30, '<'(16, 25), builtin).
proof_step(2, 31, is(17, '+'(16, 1)), builtin).
proof_step(2, 32, '<'(17, 25), builtin).
proof_step(2, 33, is(18, '+'(17, 1)), builtin).
proof_step(2, 34, '=<'(19, 25), builtin).
proof_step(2, 35, '<'(18, 25), builtin).
proof_step(2, 36, is(19, '+'(18, 1)), builtin).
proof_step(2, 37, is(25, div(50, 2)), builtin).
proof_step(2, 38, '>'('*'(5, 5), 19), builtin).
proof_step(2, 39, '=<'('*'(4, 4), 19), builtin).
proof_step(2, 40, '=\\='(mod(19, 4), 0), builtin).
proof_step(2, 41, '=<'('*'(3, 3), 19), builtin).
proof_step(2, 42, '=\\='(mod(19, 3), 0), builtin).
proof_step(2, 43, '=<'('*'(2, 2), 19), builtin).
proof_step(2, 44, '=\\='(mod(19, 2), 0), builtin).
proof_step(2, 45, '>'(19, 1), builtin).
proof_step(2, 46, '>'('*'(6, 6), 31), builtin).
proof_step(2, 47, '=<'('*'(5, 5), 31), builtin).
proof_step(2, 48, '=\\='(mod(31, 5), 0), builtin).
proof_step(2, 49, '=<'('*'(4, 4), 31), builtin).
proof_step(2, 50, '=\\='(mod(31, 4), 0), builtin).
proof_step(2, 51, '=<'('*'(3, 3), 31), builtin).
proof_step(2, 52, '=\\='(mod(31, 3), 0), builtin).
proof_step(2, 53, '=<'('*'(2, 2), 31), builtin).
proof_step(2, 54, '=\\='(mod(31, 2), 0), builtin).
proof_step(2, 55, '>'(31, 1), builtin).
proof_step(2, 56, is(31, '-'(50, 19)), builtin).
proof_step(2, 57, in_range(19, 25, 19), rule(1, [34])).
proof_step(2, 58, no_factor(19, 5), rule(3, [38])).
proof_step(2, 59, no_factor(31, 6), rule(3, [46])).
proof_step(2, 60, in_range(18, 25, 19), rule(2, [35, 36, 57])).
proof_step(2, 61, no_factor(19, 4), rule(4, [39, 40, 6, 58])).
proof_step(2, 62, no_factor(31, 5), rule(4, [47, 48, 8, 59])).
proof_step(2, 63, in_range(17, 25, 19), rule(2, [32, 33, 60])).
proof_step(2, 64, no_factor(19, 3), rule(4, [41, 42, 4, 61])).
proof_step(2, 65, no_factor(31, 4), rule(4, [49, 50, 6, 62])).
proof_step(2, 66, in_range(16, 25, 19), rule(2, [30, 31, 63])).
proof_step(2, 67, no_factor(19, 2), rule(4, [43, 44, 2, 64])).
proof_step(2, 68, no_factor(31, 3), rule(4, [51, 52, 4, 65])).
proof_step(2, 69, in_range(15, 25, 19), rule(2, [28, 29, 66])).
proof_step(2, 70, prime(19), rule(5, [45, 67])).
proof_step(2, 71, no_factor(31, 2), rule(4, [53, 54, 2, 68])).
proof_step(2, 72, in_range(14, 25, 19), rule(2, [26, 27, 69])).
proof_step(2, 73, prime(31), rule(5, [55, 71])).
proof_step(2, 74, in_range(13, 25, 19), rule(2, [25, 24, 72])).
proof_step(2, 75, in_range(12, 25, 19), rule(2, [23, 22, 74])).
proof_step(2, 76, in_range(11, 25, 19), rule(2, [21, 20, 75])).
proof_step(2, 77, in_range(10, 25, 19), rule(2, [19, 18, 76])).
proof_step(2, 78, in_range(9, 25, 19), rule(2, [17, 16, 77])).
proof_step(2, 79, in_range(8, 25, 19), rule(2, [15, 14, 78])).
proof_step(2, 80, in_range(7, 25, 19), rule(2, [13, 12, 79])).
proof_step(2, 81, in_range(6, 25, 19), rule(2, [11, 10, 80])).
proof_step(2, 82, in_range(5, 25, 19), rule(2, [9, 8, 81])).
proof_step(2, 83, in_range(4, 25, 19), rule(2, [7, 6, 82])).
proof_step(2, 84, in_range(3, 25, 19), rule(2, [5, 4, 83])).
proof_step(2, 85, in_range(2, 25, 19), rule(2, [3, 2, 84])).
proof_step(2, 86, partition(50, 19, 31), rule(6, [1, 37, 85, 56, 70, 73])).
proof_claim(2, answer(2, [86])).

% Check 2
proof_check(2, checked, [
    steps(86),
    claims(1),
    source_facts(1),
    rule_applications(30),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(31, 0)).
proof_condition(2, c2, "well-foundedness", checked(30, 0)).
proof_condition(2, c3, "justification", checked(87, 0)).
proof_condition(2, c4, "coverage", checked(125, 0)).
proof_condition(2, c5, "re-decision", checked(55, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(86, 0)).
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
