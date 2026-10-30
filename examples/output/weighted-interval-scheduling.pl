% Answer 1
weighted_interval_answer(candidate_count, 8).
weighted_interval_answer(best_value, 13).
weighted_interval_answer(chosen_interval, interval(1, 1, 4, 5)).
weighted_interval_answer(chosen_interval, interval(4, 4, 7, 4)).
weighted_interval_answer(chosen_interval, interval(8, 8, 11, 4)).

% Answer 2
optimal_schedule([1, 4, 8], 13).

% Reason 2
proof_step(2, 1, last_interval(8), source(1)).
proof_step(2, 2, interval(1, 1, 4, 5), source(2)).
proof_step(2, 3, interval(2, 3, 5, 1), source(3)).
proof_step(2, 4, interval(3, 0, 6, 8), source(4)).
proof_step(2, 5, interval(4, 4, 7, 4), source(5)).
proof_step(2, 6, interval(5, 3, 9, 6), source(6)).
proof_step(2, 7, interval(6, 5, 9, 3), source(7)).
proof_step(2, 8, interval(7, 6, 10, 2), source(8)).
proof_step(2, 9, interval(8, 8, 11, 4), source(9)).
proof_step(2, 10, best_to(0, 0), source(10)).
proof_step(2, 11, chosen_to(0, []), source(11)).
proof_step(2, 12, '<'(1, 4), builtin).
proof_step(2, 13, '=<'(4, 4), builtin).
proof_step(2, 14, '<'(1, 6), builtin).
proof_step(2, 15, '=<'(4, 5), builtin).
proof_step(2, 16, '<'(2, 6), builtin).
proof_step(2, 17, '=<'(5, 5), builtin).
proof_step(2, 18, '<'(1, 7), builtin).
proof_step(2, 19, '=<'(4, 6), builtin).
proof_step(2, 20, '<'(2, 7), builtin).
proof_step(2, 21, '=<'(5, 6), builtin).
proof_step(2, 22, '<'(3, 7), builtin).
proof_step(2, 23, '=<'(6, 6), builtin).
proof_step(2, 24, '<'(1, 8), builtin).
proof_step(2, 25, '=<'(4, 8), builtin).
proof_step(2, 26, '<'(2, 8), builtin).
proof_step(2, 27, '=<'(5, 8), builtin).
proof_step(2, 28, '<'(3, 8), builtin).
proof_step(2, 29, '=<'(6, 8), builtin).
proof_step(2, 30, '<'(4, 8), builtin).
proof_step(2, 31, '=<'(7, 8), builtin).
proof_step(2, 32, is(0, '-'(1, 1)), builtin).
proof_step(2, 33, is(5, '+'(5, 0)), builtin).
proof_step(2, 34, '>'(1, 0), builtin).
proof_step(2, 35, is(5, max(5, 0)), builtin).
proof_step(2, 36, is(1, '-'(2, 1)), builtin).
proof_step(2, 37, is(1, '+'(1, 0)), builtin).
proof_step(2, 38, '>'(2, 0), builtin).
proof_step(2, 39, is(5, max(1, 5)), builtin).
proof_step(2, 40, is(2, '-'(3, 1)), builtin).
proof_step(2, 41, is(8, '+'(8, 0)), builtin).
proof_step(2, 42, '>'(3, 0), builtin).
proof_step(2, 43, is(8, max(8, 5)), builtin).
proof_step(2, 44, is(3, '-'(4, 1)), builtin).
proof_step(2, 45, is(9, '+'(4, 5)), builtin).
proof_step(2, 46, '>'(4, 0), builtin).
proof_step(2, 47, is(9, max(9, 8)), builtin).
proof_step(2, 48, is(4, '-'(5, 1)), builtin).
proof_step(2, 49, is(6, '+'(6, 0)), builtin).
proof_step(2, 50, '>'(5, 0), builtin).
proof_step(2, 51, is(9, max(6, 9)), builtin).
proof_step(2, 52, is(5, '-'(6, 1)), builtin).
proof_step(2, 53, is(8, '+'(3, 5)), builtin).
proof_step(2, 54, '>'(6, 0), builtin).
proof_step(2, 55, is(9, max(8, 9)), builtin).
proof_step(2, 56, is(6, '-'(7, 1)), builtin).
proof_step(2, 57, is(10, '+'(2, 8)), builtin).
proof_step(2, 58, '>'(7, 0), builtin).
proof_step(2, 59, is(10, max(10, 9)), builtin).
proof_step(2, 60, is(7, '-'(8, 1)), builtin).
proof_step(2, 61, is(13, '+'(4, 9)), builtin).
proof_step(2, 62, '>'(8, 0), builtin).
proof_step(2, 63, is(13, max(13, 10)), builtin).
proof_step(2, 64, append([], [1], [1]), rule(9, [])).
proof_step(2, 65, '>='(5, 0), builtin).
proof_step(2, 66, append([], [4], [4]), rule(9, [])).
proof_step(2, 67, '>='(9, 8), builtin).
proof_step(2, 68, append([], [8], [8]), rule(9, [])).
proof_step(2, 69, '>='(13, 10), builtin).
proof_step(2, 70, member(1, [1, 4, 8]), rule(11, [])).
proof_step(2, 71, member(4, [4, 8]), rule(11, [])).
proof_step(2, 72, member(8, [8]), rule(11, [])).
proof_step(2, 73, compatible_before(4, 1), rule(1, [5, 2, 12, 13])).
proof_step(2, 74, compatible_before(6, 1), rule(1, [7, 2, 14, 15])).
proof_step(2, 75, compatible_before(6, 2), rule(1, [7, 3, 16, 17])).
proof_step(2, 76, compatible_before(7, 1), rule(1, [8, 2, 18, 19])).
proof_step(2, 77, compatible_before(7, 2), rule(1, [8, 3, 20, 21])).
proof_step(2, 78, compatible_before(7, 3), rule(1, [8, 4, 22, 23])).
proof_step(2, 79, compatible_before(8, 1), rule(1, [9, 2, 24, 25])).
proof_step(2, 80, compatible_before(8, 2), rule(1, [9, 3, 26, 27])).
proof_step(2, 81, compatible_before(8, 3), rule(1, [9, 4, 28, 29])).
proof_step(2, 82, compatible_before(8, 4), rule(1, [9, 5, 30, 31])).
proof_step(2, 83, append([1], [4], [1, 4]), rule(10, [66])).
proof_step(2, 84, append([4], [8], [4, 8]), rule(10, [68])).
proof_step(2, 85, member(4, [1, 4, 8]), rule(12, [71])).
proof_step(2, 86, member(8, [4, 8]), rule(12, [72])).
proof_step(2, 87, has_compatible(4), rule(2, [73])).
proof_step(2, 88, has_compatible(6), rule(2, [74])).
proof_step(2, 89, has_compatible(7), rule(2, [76])).
proof_step(2, 90, has_compatible(8), rule(2, [79])).
proof_step(2, 91, append([1, 4], [8], [1, 4, 8]), rule(10, [84])).
proof_step(2, 92, member(8, [1, 4, 8]), rule(12, [86])).
proof_step(
    2,
    93,
    '$aggregate:r3:2'(
        [binding('I', 4), binding('_$6', 4), binding('_$7', 7), binding('_$8', 4)],
        1
    ),
    aggregate(rule(3), 2, 1)
).
proof_step(
    2,
    94,
    '$aggregate:r3:2'(
        [binding('I', 6), binding('_$6', 5), binding('_$7', 9), binding('_$8', 3)],
        2
    ),
    aggregate(rule(3), 2, 1)
).
proof_step(
    2,
    95,
    '$aggregate:r3:2'(
        [binding('I', 7), binding('_$6', 6), binding('_$7', 10), binding('_$8', 2)],
        3
    ),
    aggregate(rule(3), 2, 1)
).
proof_step(
    2,
    96,
    '$aggregate:r3:2'(
        [binding('I', 8), binding('_$6', 8), binding('_$7', 11), binding('_$8', 4)],
        4
    ),
    aggregate(rule(3), 2, 1)
).
proof_step(2, 97, has_compatible(1), absent(1)).
proof_step(2, 98, has_compatible(2), absent(1)).
proof_step(2, 99, has_compatible(3), absent(1)).
proof_step(2, 100, has_compatible(5), absent(1)).
proof_step(2, 101, previous_compatible(4, 1), rule(3, [5, 93])).
proof_step(2, 102, previous_compatible(6, 2), rule(3, [7, 94])).
proof_step(2, 103, previous_compatible(7, 3), rule(3, [8, 95])).
proof_step(2, 104, previous_compatible(8, 4), rule(3, [9, 96])).
proof_step(2, 105, previous_compatible(1, 0), rule(4, [2, 97])).
proof_step(2, 106, previous_compatible(2, 0), rule(4, [3, 98])).
proof_step(2, 107, previous_compatible(3, 0), rule(4, [4, 99])).
proof_step(2, 108, previous_compatible(5, 0), rule(4, [6, 100])).
proof_step(2, 109, alternatives(1, 0, 5, 0), rule(6, [2, 32, 10, 105, 10, 33])).
proof_step(2, 110, best_to(1, 5), rule(5, [34, 109, 35])).
proof_step(2, 111, chosen_to(1, [1]), rule(7, [34, 109, 65, 11, 64])).
proof_step(2, 112, alternatives(2, 0, 1, 5), rule(6, [3, 36, 110, 106, 10, 37])).
proof_step(2, 113, best_to(2, 5), rule(5, [38, 112, 39])).
proof_step(2, 114, alternatives(3, 0, 8, 5), rule(6, [4, 40, 113, 107, 10, 41])).
proof_step(2, 115, best_to(3, 8), rule(5, [42, 114, 43])).
proof_step(2, 116, alternatives(4, 1, 9, 8), rule(6, [5, 44, 115, 101, 110, 45])).
proof_step(2, 117, best_to(4, 9), rule(5, [46, 116, 47])).
proof_step(2, 118, chosen_to(4, [1, 4]), rule(7, [46, 116, 67, 111, 83])).
proof_step(2, 119, alternatives(5, 0, 6, 9), rule(6, [6, 48, 117, 108, 10, 49])).
proof_step(2, 120, best_to(5, 9), rule(5, [50, 119, 51])).
proof_step(2, 121, alternatives(6, 2, 8, 9), rule(6, [7, 52, 120, 102, 113, 53])).
proof_step(2, 122, best_to(6, 9), rule(5, [54, 121, 55])).
proof_step(2, 123, alternatives(7, 3, 10, 9), rule(6, [8, 56, 122, 103, 115, 57])).
proof_step(2, 124, best_to(7, 10), rule(5, [58, 123, 59])).
proof_step(2, 125, alternatives(8, 4, 13, 10), rule(6, [9, 60, 124, 104, 117, 61])).
proof_step(2, 126, best_to(8, 13), rule(5, [62, 125, 63])).
proof_step(2, 127, chosen_to(8, [1, 4, 8]), rule(7, [62, 125, 69, 118, 91])).
proof_step(2, 128, optimal_schedule([1, 4, 8], 13), rule(13, [1, 126, 127])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 11).
proof_boundary_steps(2, 1, 64, 64).
proof_boundary_steps(2, 1, 66, 66).
proof_boundary_steps(2, 1, 68, 68).
proof_boundary_steps(2, 1, 70, 92).
proof_boundary_call(2, 1, append([1, 4], [8], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, append([1], [4], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, append([4], [8], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, append([], [1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, append([], [4], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, append([], [8], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [1, 4, 8])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [4, 8])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [8])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [])).
proof_claim(2, answer(2, [128])).

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
