% Answer 1
path(a, d, 7).
path(a, d, 10).
path(a, d, 6).

% Answer 2
shortest(a, d, 6).

% Reason 2
proof_step(2, 1, edge(a, b, 4), source(1)).
proof_step(2, 2, edge(a, c, 2), source(2)).
proof_step(2, 3, edge(c, b, 1), source(3)).
proof_step(2, 4, edge(b, d, 3), source(4)).
proof_step(2, 5, edge(c, d, 8), source(5)).
proof_step(2, 6, is(7, '+'(4, 3)), builtin).
proof_step(2, 7, is(3, '+'(2, 1)), builtin).
proof_step(2, 8, is(10, '+'(2, 8)), builtin).
proof_step(2, 9, is(4, '+'(1, 3)), builtin).
proof_step(2, 10, is(6, '+'(3, 3)), builtin).
proof_step(2, 11, '<'(3, 4), builtin).
proof_step(2, 12, '<'(4, 8), builtin).
proof_step(2, 13, '<'(6, 7), builtin).
proof_step(2, 14, '<'(7, 10), builtin).
proof_step(2, 15, path(a, b, 4), rule(1, [1])).
proof_step(2, 16, path(a, c, 2), rule(1, [2])).
proof_step(2, 17, path(c, b, 1), rule(1, [3])).
proof_step(2, 18, path(b, d, 3), rule(1, [4])).
proof_step(2, 19, path(c, d, 8), rule(1, [5])).
proof_step(2, 20, path(a, d, 7), rule(2, [15, 4, 6])).
proof_step(2, 21, path(a, b, 3), rule(2, [16, 3, 7])).
proof_step(2, 22, path(a, d, 10), rule(2, [16, 5, 8])).
proof_step(2, 23, path(c, d, 4), rule(2, [17, 4, 9])).
proof_step(2, 24, cheaper(a, d, 10), rule(3, [20, 14])).
proof_step(2, 25, path(a, d, 6), rule(2, [21, 4, 10])).
proof_step(2, 26, cheaper(a, b, 4), rule(3, [21, 11])).
proof_step(2, 27, cheaper(c, d, 8), rule(3, [23, 12])).
proof_step(2, 28, cheaper(a, d, 7), rule(3, [25, 13])).
proof_step(2, 29, cheaper(a, d, 6), absent(1)).
proof_step(2, 30, shortest(a, d, 6), rule(4, [25, 29])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 5).
proof_boundary_steps(2, 1, 15, 28).
proof_boundary_call(2, 1, cheaper(a, b, 3)).
proof_boundary_call(2, 1, cheaper(a, b, 4)).
proof_boundary_call(2, 1, cheaper(a, c, 2)).
proof_boundary_call(2, 1, cheaper(a, d, 10)).
proof_boundary_call(2, 1, cheaper(a, d, 6)).
proof_boundary_call(2, 1, cheaper(a, d, 7)).
proof_boundary_call(2, 1, cheaper(b, d, 3)).
proof_boundary_call(2, 1, cheaper(c, b, 1)).
proof_boundary_call(2, 1, cheaper(c, d, 4)).
proof_boundary_call(2, 1, cheaper(c, d, 8)).
proof_claim(2, answer(2, [30])).

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
