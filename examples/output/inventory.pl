% Answer 1
invoice(28).

% Reason 1
proof_step(1, 1, item(apple, 3, 2), source(1)).
proof_step(1, 2, item(pear, 4, 3), source(2)).
proof_step(1, 3, item(plum, 2, 5), source(3)).
proof_step(1, 4, is(6, '*'(3, 2)), builtin).
proof_step(1, 5, line_total(apple, 6), rule(1, [1, 4])).
proof_step(1, 6, is(12, '*'(4, 3)), builtin).
proof_step(1, 7, line_total(pear, 12), rule(1, [2, 6])).
proof_step(1, 8, is(10, '*'(2, 5)), builtin).
proof_step(1, 9, line_total(plum, 10), rule(1, [3, 8])).
proof_step(1, 10, '$aggregate:r2:1'([], 28), aggregate(rule(2), 1, 1)).
proof_step(1, 11, invoice(28), rule(2, [10])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 3).
proof_boundary_steps(1, 1, 5, 5).
proof_boundary_steps(1, 1, 7, 7).
proof_boundary_steps(1, 1, 9, 9).
proof_claim(1, answer(1, [11])).

% Answer 2
line_total(apple, 6).
line_total(pear, 12).
line_total(plum, 10).

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
