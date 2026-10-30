% Answer 1
fit(demo, 0.8, 1.5, 0.64).

% Reason 1
proof_step(
    1,
    1,
    dataset(demo, [point(1, 2), point(2, 3), point(3, 5), point(4, 4)]),
    source(1)
).
proof_step(1, 2, stats([], 0, 0, 0, 0, 0, 0), source(2)).
proof_step(1, 3, is(1, '+'(0, 1)), builtin).
proof_step(1, 4, is(4, '+'(0, 4)), builtin).
proof_step(1, 5, is(16, '+'(0, '*'(4, 4))), builtin).
proof_step(1, 6, is(2, '+'(1, 1)), builtin).
proof_step(1, 7, is(7, '+'(4, 3)), builtin).
proof_step(1, 8, is(9, '+'(4, 5)), builtin).
proof_step(1, 9, is(25, '+'(16, '*'(3, 3))), builtin).
proof_step(1, 10, is(31, '+'(16, '*'(3, 5))), builtin).
proof_step(1, 11, is(41, '+'(16, '*'(5, 5))), builtin).
proof_step(1, 12, is(3, '+'(2, 1)), builtin).
proof_step(1, 13, is(9, '+'(7, 2)), builtin).
proof_step(1, 14, is(12, '+'(9, 3)), builtin).
proof_step(1, 15, is(29, '+'(25, '*'(2, 2))), builtin).
proof_step(1, 16, is(37, '+'(31, '*'(2, 3))), builtin).
proof_step(1, 17, is(50, '+'(41, '*'(3, 3))), builtin).
proof_step(1, 18, is(4, '+'(3, 1)), builtin).
proof_step(1, 19, is(10, '+'(9, 1)), builtin).
proof_step(1, 20, is(14, '+'(12, 2)), builtin).
proof_step(1, 21, is(30, '+'(29, '*'(1, 1))), builtin).
proof_step(1, 22, is(39, '+'(37, '*'(1, 2))), builtin).
proof_step(1, 23, is(54, '+'(50, '*'(2, 2))), builtin).
proof_step(1, 24, '>='(4, 2), builtin).
proof_step(1, 25, is(20, '-'('*'(4, 30), '*'(10, 10))), builtin).
proof_step(1, 26, is(20, '-'('*'(4, 54), '*'(14, 14))), builtin).
proof_step(1, 27, '>'(20, 0), builtin).
proof_step(1, 28, is(16, '-'('*'(4, 39), '*'(10, 14))), builtin).
proof_step(1, 29, is(0.8, '/'(16, 20)), builtin).
proof_step(1, 30, is(1.5, '/'('-'(14, '*'(0.8, 10)), 4)), builtin).
proof_step(1, 31, is(0.64, '/'('*'(16, 16), '*'(20, 20))), builtin).
proof_step(
    1,
    32,
    stats([point(4, 4)], 1, 4, 4, 16, 16, 16),
    rule(1, [2, 3, 4, 4, 5, 5, 5])
).
proof_step(
    1,
    33,
    stats([point(3, 5), point(4, 4)], 2, 7, 9, 25, 31, 41),
    rule(1, [32, 6, 7, 8, 9, 10, 11])
).
proof_step(
    1,
    34,
    stats([point(2, 3), point(3, 5), point(4, 4)], 3, 9, 12, 29, 37, 50),
    rule(1, [33, 12, 13, 14, 15, 16, 17])
).
proof_step(
    1,
    35,
    stats([point(1, 2), point(2, 3), point(3, 5), point(4, 4)], 4, 10, 14, 30, 39, 54),
    rule(1, [34, 18, 19, 20, 21, 22, 23])
).
proof_step(
    1,
    36,
    regression([point(1, 2), point(2, 3), point(3, 5), point(4, 4)], 0.8, 1.5, 0.64),
    rule(2, [35, 24, 25, 26, 27, 27, 28, 29, 30, 31])
).
proof_step(1, 37, fit(demo, 0.8, 1.5, 0.64), rule(3, [1, 36])).
proof_claim(1, answer(1, [37])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
