% Answer 1
cousin(dave, frank).
cousin(dave, grace).
cousin(frank, dave).
cousin(grace, dave).
cousin(eve, frank).
cousin(eve, grace).
cousin(frank, eve).
cousin(grace, eve).
cousin(heidi, judy).
cousin(judy, heidi).
cousin(ivan, judy).
cousin(judy, ivan).

% Answer 2
cousin(heidi, judy).

% Reason 2
proof_step(2, 1, parent(adam, bob), source(1)).
proof_step(2, 2, parent(adam, carol), source(2)).
proof_step(2, 3, parent(bob, dave), source(3)).
proof_step(2, 4, parent(carol, frank), source(5)).
proof_step(2, 5, parent(dave, heidi), source(7)).
proof_step(2, 6, parent(frank, judy), source(9)).
proof_step(2, 7, generation(adam, 0), source(10)).
proof_step(2, 8, branch(dave, b), source(11)).
proof_step(2, 9, branch(frank, c), source(13)).
proof_step(2, 10, is(1, '+'(0, 1)), builtin).
proof_step(2, 11, generation(bob, 1), rule(1, [1, 7, 10])).
proof_step(2, 12, generation(carol, 1), rule(1, [2, 7, 10])).
proof_step(2, 13, is(2, '+'(1, 1)), builtin).
proof_step(2, 14, generation(dave, 2), rule(1, [3, 11, 13])).
proof_step(2, 15, generation(frank, 2), rule(1, [4, 12, 13])).
proof_step(2, 16, is(3, '+'(2, 1)), builtin).
proof_step(2, 17, generation(heidi, 3), rule(1, [5, 14, 16])).
proof_step(2, 18, branch(heidi, b), rule(2, [5, 8])).
proof_step(2, 19, generation(judy, 3), rule(1, [6, 15, 16])).
proof_step(2, 20, branch(judy, c), rule(2, [6, 9])).
proof_step(2, 21, '\\='(b, c), builtin).
proof_step(2, 22, cousin(heidi, judy), rule(3, [17, 19, 18, 20, 21])).
proof_claim(2, answer(2, [22])).

% Answer 3
generation(heidi, 3).

% Answer 4
branch(judy, c).

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

% Goal check 13
check_result(13, true).

% Goal check 14
check_result(14, true).
