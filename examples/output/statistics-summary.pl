% Answer 1
count(scores, 8).

% Answer 2
mean(scores, 5.0).

% Answer 3
populationVariance(scores, 4.0).

% Answer 4
populationStddev(scores, 2.0).

% Reason 4
proof_step(4, 1, sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]), source(1)).
proof_step(4, 2, sum([], 0.0), source(2)).
proof_step(4, 3, length([], 0), source(3)).
proof_step(4, 4, is(9.0, '+'(9.0, 0.0)), builtin).
proof_step(4, 5, is(1, '+'(0, 1)), builtin).
proof_step(4, 6, is(16.0, '+'(7.0, 9.0)), builtin).
proof_step(4, 7, is(2, '+'(1, 1)), builtin).
proof_step(4, 8, is(21.0, '+'(5.0, 16.0)), builtin).
proof_step(4, 9, is(3, '+'(2, 1)), builtin).
proof_step(4, 10, is(26.0, '+'(5.0, 21.0)), builtin).
proof_step(4, 11, is(4, '+'(3, 1)), builtin).
proof_step(4, 12, is(30.0, '+'(4.0, 26.0)), builtin).
proof_step(4, 13, is(5, '+'(4, 1)), builtin).
proof_step(4, 14, is(34.0, '+'(4.0, 30.0)), builtin).
proof_step(4, 15, is(6, '+'(5, 1)), builtin).
proof_step(4, 16, is(38.0, '+'(4.0, 34.0)), builtin).
proof_step(4, 17, is(7, '+'(6, 1)), builtin).
proof_step(4, 18, is(40.0, '+'(2.0, 38.0)), builtin).
proof_step(4, 19, is(8, '+'(7, 1)), builtin).
proof_step(4, 20, is(5.0, '/'(40.0, 8)), builtin).
proof_step(4, 21, squared_error_sum([], 5.0, 0.0), rule(3, [])).
proof_step(4, 22, is(4.0, '-'(9.0, 5.0)), builtin).
proof_step(4, 23, is(16.0, '**'(4.0, 2)), builtin).
proof_step(4, 24, is(16.0, '+'(16.0, 0.0)), builtin).
proof_step(4, 25, is(2.0, '-'(7.0, 5.0)), builtin).
proof_step(4, 26, is(4.0, '**'(2.0, 2)), builtin).
proof_step(4, 27, is(20.0, '+'(4.0, 16.0)), builtin).
proof_step(4, 28, is(0.0, '-'(5.0, 5.0)), builtin).
proof_step(4, 29, is(0.0, '**'(0.0, 2)), builtin).
proof_step(4, 30, is(20.0, '+'(0.0, 20.0)), builtin).
proof_step(4, 31, is(-1.0, '-'(4.0, 5.0)), builtin).
proof_step(4, 32, is(1.0, '**'(-1.0, 2)), builtin).
proof_step(4, 33, is(21.0, '+'(1.0, 20.0)), builtin).
proof_step(4, 34, is(22.0, '+'(1.0, 21.0)), builtin).
proof_step(4, 35, is(23.0, '+'(1.0, 22.0)), builtin).
proof_step(4, 36, is(-3.0, '-'(2.0, 5.0)), builtin).
proof_step(4, 37, is(9.0, '**'(-3.0, 2)), builtin).
proof_step(4, 38, is(32.0, '+'(9.0, 23.0)), builtin).
proof_step(4, 39, is(4.0, '/'(32.0, 8)), builtin).
proof_step(4, 40, is(2.0, '**'(4.0, 0.5)), builtin).
proof_step(4, 41, sum([9.0], 9.0), rule(1, [2, 4])).
proof_step(4, 42, length([9.0], 1), rule(10, [3, 5])).
proof_step(4, 43, squared_error_sum([9.0], 5.0, 16.0), rule(4, [22, 23, 21, 24])).
proof_step(4, 44, sum([7.0, 9.0], 16.0), rule(1, [41, 6])).
proof_step(4, 45, length([7.0, 9.0], 2), rule(10, [42, 7])).
proof_step(4, 46, squared_error_sum([7.0, 9.0], 5.0, 20.0), rule(4, [25, 26, 43, 27])).
proof_step(4, 47, sum([5.0, 7.0, 9.0], 21.0), rule(1, [44, 8])).
proof_step(4, 48, length([5.0, 7.0, 9.0], 3), rule(10, [45, 9])).
proof_step(
    4,
    49,
    squared_error_sum([5.0, 7.0, 9.0], 5.0, 20.0),
    rule(4, [28, 29, 46, 30])
).
proof_step(4, 50, sum([5.0, 5.0, 7.0, 9.0], 26.0), rule(1, [47, 10])).
proof_step(4, 51, length([5.0, 5.0, 7.0, 9.0], 4), rule(10, [48, 11])).
proof_step(
    4,
    52,
    squared_error_sum([5.0, 5.0, 7.0, 9.0], 5.0, 20.0),
    rule(4, [28, 29, 49, 30])
).
proof_step(4, 53, sum([4.0, 5.0, 5.0, 7.0, 9.0], 30.0), rule(1, [50, 12])).
proof_step(4, 54, length([4.0, 5.0, 5.0, 7.0, 9.0], 5), rule(10, [51, 13])).
proof_step(
    4,
    55,
    squared_error_sum([4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 21.0),
    rule(4, [31, 32, 52, 33])
).
proof_step(4, 56, sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 34.0), rule(1, [53, 14])).
proof_step(4, 57, length([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 6), rule(10, [54, 15])).
proof_step(
    4,
    58,
    squared_error_sum([4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 22.0),
    rule(4, [31, 32, 55, 34])
).
proof_step(4, 59, sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 38.0), rule(1, [56, 16])).
proof_step(4, 60, length([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 7), rule(10, [57, 17])).
proof_step(
    4,
    61,
    squared_error_sum([4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 23.0),
    rule(4, [31, 32, 58, 35])
).
proof_step(
    4,
    62,
    sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 40.0),
    rule(1, [59, 18])
).
proof_step(
    4,
    63,
    length([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 8),
    rule(10, [60, 19])
).
proof_step(
    4,
    64,
    squared_error_sum([2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0], 5.0, 32.0),
    rule(4, [36, 37, 61, 38])
).
proof_step(4, 65, mean(scores, 5.0), rule(2, [1, 62, 63, 20])).
proof_step(4, 66, population_variance(scores, 4.0), rule(5, [1, 65, 64, 63, 39])).
proof_step(4, 67, population_stddev(scores, 2.0), rule(6, [66, 40])).
proof_step(4, 68, populationStddev(scores, 2.0), rule(9, [67])).
proof_claim(4, answer(4, [68])).

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

% Goal check 12
check_result(12, true).
