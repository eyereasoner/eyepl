% Answer 1
decoded(packet1, 5, [1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 0]).

% Reason 1
proof_step(1, 1, received(packet1, [1, 0, 1, 1, 1, 1, 0]), source(1)).
proof_step(1, 2, bit(0), source(2)).
proof_step(1, 3, bit(1), source(3)).
proof_step(1, 4, '=\\='(1, 5), builtin).
proof_step(1, 5, '=\\='(2, 5), builtin).
proof_step(1, 6, '=\\='(3, 5), builtin).
proof_step(1, 7, '=\\='(4, 5), builtin).
proof_step(1, 8, '=:='(5, 5), builtin).
proof_step(1, 9, is(0, '-'(1, 1)), builtin).
proof_step(1, 10, '=\\='(6, 5), builtin).
proof_step(1, 11, '=\\='(7, 5), builtin).
proof_step(1, 12, correct([], 8, 5, []), rule(2, [])).
proof_step(1, 13, is(8, '+'(7, 1)), builtin).
proof_step(1, 14, is(7, '+'(6, 1)), builtin).
proof_step(1, 15, is(6, '+'(5, 1)), builtin).
proof_step(1, 16, is(5, '+'(4, 1)), builtin).
proof_step(1, 17, is(4, '+'(3, 1)), builtin).
proof_step(1, 18, is(3, '+'(2, 1)), builtin).
proof_step(1, 19, is(2, '+'(1, 1)), builtin).
proof_step(1, 20, is(1, mod('+'('+'('+'(1, 1), 1), 0), 2)), builtin).
proof_step(1, 21, is(0, mod('+'('+'('+'(0, 1), 1), 0), 2)), builtin).
proof_step(1, 22, is(5, '+'('+'(1, '*'(2, 0)), '*'(4, 1))), builtin).
proof_step(1, 23, '='([1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 1, 0, 1, 0]), builtin).
proof_step(1, 24, correct_bit(1, 5, 1, 1), rule(5, [4])).
proof_step(1, 25, correct_bit(2, 5, 0, 0), rule(5, [5])).
proof_step(1, 26, correct_bit(3, 5, 1, 1), rule(5, [6])).
proof_step(1, 27, correct_bit(4, 5, 1, 1), rule(5, [7])).
proof_step(1, 28, correct_bit(5, 5, 1, 0), rule(4, [8, 9])).
proof_step(1, 29, correct_bit(6, 5, 1, 1), rule(5, [10])).
proof_step(1, 30, correct_bit(7, 5, 0, 0), rule(5, [11])).
proof_step(1, 31, correct([0], 7, 5, [0]), rule(3, [30, 13, 12])).
proof_step(1, 32, correct([1, 0], 6, 5, [1, 0]), rule(3, [29, 14, 31])).
proof_step(1, 33, correct([1, 1, 0], 5, 5, [0, 1, 0]), rule(3, [28, 15, 32])).
proof_step(1, 34, correct([1, 1, 1, 0], 4, 5, [1, 0, 1, 0]), rule(3, [27, 16, 33])).
proof_step(
    1,
    35,
    correct([1, 1, 1, 1, 0], 3, 5, [1, 1, 0, 1, 0]),
    rule(3, [26, 17, 34])
).
proof_step(
    1,
    36,
    correct([0, 1, 1, 1, 1, 0], 2, 5, [0, 1, 1, 0, 1, 0]),
    rule(3, [25, 18, 35])
).
proof_step(
    1,
    37,
    correct([1, 0, 1, 1, 1, 1, 0], 1, 5, [1, 0, 1, 1, 0, 1, 0]),
    rule(3, [24, 19, 36])
).
proof_step(
    1,
    38,
    decode([1, 0, 1, 1, 1, 1, 0], 5, [1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 0]),
    rule(1, [3, 2, 3, 3, 3, 3, 2, 20, 21, 20, 22, 37, 23])
).
proof_step(
    1,
    39,
    decoded(packet1, 5, [1, 0, 1, 1, 0, 1, 0], [1, 0, 1, 0]),
    rule(6, [1, 38])
).
proof_claim(1, answer(1, [39])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).
