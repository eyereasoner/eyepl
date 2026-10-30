% Answer 1
factorsSmallest(case, [3, 3, 7, 829, 3881]).

% Answer 2
factorsLargest(case, [3881, 829, 7, 3, 3]).

% Answer 3
product(case, 202692987).

% Answer 4
distinctPrimeCount(case, 4).

% Answer 5
factor_smallest(49, [7, 7]).

% Reason 5
proof_step(5, 1, '>'('*'(3, 3), 7), builtin).
proof_step(5, 2, '=<'('*'(2, 2), 7), builtin).
proof_step(5, 3, '=\\='(mod(7, 2), 0), builtin).
proof_step(5, 4, is(3, '+'(2, 1)), builtin).
proof_step(5, 5, is(7, '+'(6, 1)), builtin).
proof_step(5, 6, is(6, '+'(5, 1)), builtin).
proof_step(5, 7, is(5, '+'(4, 1)), builtin).
proof_step(5, 8, is(4, '+'(3, 1)), builtin).
proof_step(5, 9, '>='(7, 2), builtin).
proof_step(5, 10, '=<'('*'(7, 7), 49), builtin).
proof_step(5, 11, '=:='(mod(49, 7), 0), builtin).
proof_step(5, 12, '=<'('*'(6, 6), 49), builtin).
proof_step(5, 13, '=\\='(mod(49, 6), 0), builtin).
proof_step(5, 14, '=<'('*'(5, 5), 49), builtin).
proof_step(5, 15, '=\\='(mod(49, 5), 0), builtin).
proof_step(5, 16, '=<'('*'(4, 4), 49), builtin).
proof_step(5, 17, '=\\='(mod(49, 4), 0), builtin).
proof_step(5, 18, '=<'('*'(3, 3), 49), builtin).
proof_step(5, 19, '=\\='(mod(49, 3), 0), builtin).
proof_step(5, 20, '=<'('*'(2, 2), 49), builtin).
proof_step(5, 21, '=\\='(mod(49, 2), 0), builtin).
proof_step(5, 22, append([], [7], [7]), rule(4, [])).
proof_step(5, 23, '>='(49, 2), builtin).
proof_step(5, 24, '\\='(7, 49), builtin).
proof_step(5, 25, is(7, '//'(49, 7)), builtin).
proof_step(5, 26, smallest_divisor_from(7, 3, 7), rule(1, [1])).
proof_step(5, 27, smallest_divisor_from(49, 7, 7), rule(2, [10, 11])).
proof_step(5, 28, append([7], [7], [7, 7]), rule(5, [22])).
proof_step(5, 29, smallest_divisor_from(7, 2, 7), rule(3, [2, 3, 4, 26])).
proof_step(5, 30, smallest_divisor_from(49, 6, 7), rule(3, [12, 13, 5, 27])).
proof_step(5, 31, factor_smallest(7, [7]), rule(14, [9, 29])).
proof_step(5, 32, smallest_divisor_from(49, 5, 7), rule(3, [14, 15, 6, 30])).
proof_step(5, 33, smallest_divisor_from(49, 4, 7), rule(3, [16, 17, 7, 32])).
proof_step(5, 34, smallest_divisor_from(49, 3, 7), rule(3, [18, 19, 8, 33])).
proof_step(5, 35, smallest_divisor_from(49, 2, 7), rule(3, [20, 21, 4, 34])).
proof_step(5, 36, factor_smallest(49, [7, 7]), rule(15, [23, 35, 24, 25, 31, 31, 28])).
proof_claim(5, answer(5, [36])).

% Check 5
proof_check(5, checked, [
    steps(36),
    claims(1),
    source_facts(0),
    rule_applications(12),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(5, c1, "resolution", checked(12, 0)).
proof_condition(5, c2, "well-foundedness", checked(12, 0)).
proof_condition(5, c3, "justification", checked(37, 0)).
proof_condition(5, c4, "coverage", checked(51, 0)).
proof_condition(5, c5, "re-decision", checked(24, 0)).
proof_condition(5, c6, "boundary consistency", checked(0, 0)).
proof_condition(5, c7, "relevance", checked(36, 0)).
proof_condition(
    5,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(5, c9, "query isolation", checked(1, 0)).

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

% Goal check 12
check_result(12, true).
