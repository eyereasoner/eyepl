% Answer 1
append([a, b], [c, d], [a, b, c, d]).

% Reason 1
proof_step(1, 1, append([], [c, d], [c, d]), rule(1, [])).
proof_step(1, 2, append([b], [c, d], [b, c, d]), rule(2, [1])).
proof_step(1, 3, append([a, b], [c, d], [a, b, c, d]), rule(2, [2])).
proof_claim(1, answer(1, [3])).

% Answer 2
squares([1, 2, 3, 4], [1, 4, 9, 16]).

% Reason 2
proof_step(2, 1, squares([], []), source(1)).
proof_step(2, 2, is(16, '*'(4, 4)), builtin).
proof_step(2, 3, is(9, '*'(3, 3)), builtin).
proof_step(2, 4, is(4, '*'(2, 2)), builtin).
proof_step(2, 5, is(1, '*'(1, 1)), builtin).
proof_step(2, 6, squares([4], [16]), rule(3, [2, 1])).
proof_step(2, 7, squares([3, 4], [9, 16]), rule(3, [3, 6])).
proof_step(2, 8, squares([2, 3, 4], [4, 9, 16]), rule(3, [4, 7])).
proof_step(2, 9, squares([1, 2, 3, 4], [1, 4, 9, 16]), rule(3, [5, 8])).
proof_claim(2, answer(2, [9])).

% Answer 3
sum([1, 2, 3, 4], 10).

% Reason 3
proof_step(3, 1, sum([], 0), source(2)).
proof_step(3, 2, is(4, '+'(4, 0)), builtin).
proof_step(3, 3, is(7, '+'(3, 4)), builtin).
proof_step(3, 4, is(9, '+'(2, 7)), builtin).
proof_step(3, 5, is(10, '+'(1, 9)), builtin).
proof_step(3, 6, sum([4], 4), rule(4, [1, 2])).
proof_step(3, 7, sum([3, 4], 7), rule(4, [6, 3])).
proof_step(3, 8, sum([2, 3, 4], 9), rule(4, [7, 4])).
proof_step(3, 9, sum([1, 2, 3, 4], 10), rule(4, [8, 5])).
proof_claim(3, answer(3, [9])).

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
