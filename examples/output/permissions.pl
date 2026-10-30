% Answer 1
allowed(alice, read).
allowed(alice, write).
allowed(bob, read).

% Reason 1
proof_step(1, 1, role(alice, editor), source(1)).
proof_step(1, 2, role(bob, viewer), source(2)).
proof_step(1, 3, role(carol, editor), source(3)).
proof_step(1, 4, permits(editor, read), source(4)).
proof_step(1, 5, permits(editor, write), source(5)).
proof_step(1, 6, permits(viewer, read), source(6)).
proof_step(1, 7, suspended(carol), source(7)).
proof_step(1, 8, candidate(alice, read), rule(1, [1, 4])).
proof_step(1, 9, candidate(alice, write), rule(1, [1, 5])).
proof_step(1, 10, candidate(bob, read), rule(1, [2, 6])).
proof_step(1, 11, candidate(carol, read), rule(1, [3, 4])).
proof_step(1, 12, candidate(carol, write), rule(1, [3, 5])).
proof_step(1, 13, suspended(alice), absent(1)).
proof_step(1, 14, allowed(alice, read), rule(2, [8, 13])).
proof_step(1, 15, allowed(alice, write), rule(2, [9, 13])).
proof_step(1, 16, suspended(bob), absent(1)).
proof_step(1, 17, allowed(bob, read), rule(2, [10, 16])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 12).
proof_claim(1, answer(1, [14])).
proof_claim(1, answer(1, [15])).
proof_claim(1, answer(1, [17])).

% Answer 2
candidate(carol, read).
candidate(carol, write).

% Reason 2
proof_step(2, 1, role(carol, editor), source(3)).
proof_step(2, 2, permits(editor, read), source(4)).
proof_step(2, 3, permits(editor, write), source(5)).
proof_step(2, 4, candidate(carol, read), rule(1, [1, 2])).
proof_step(2, 5, candidate(carol, write), rule(1, [1, 3])).
proof_claim(2, answer(2, [4])).
proof_claim(2, answer(2, [5])).

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
