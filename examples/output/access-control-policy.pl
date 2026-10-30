% Answer 1
accepted('PolicyX').

% Reason 1
proof_step(1, 1, policy(test1, 'PolicyX'), source(1)).
proof_step(1, 2, has(test1, 'A'), source(2)).
proof_step(1, 3, has(test1, 'B'), source(3)).
proof_step(1, 4, has(test1, 'C'), source(4)).
proof_step(1, 5, policy('PolicyX'), source(5)).
proof_step(1, 6, allOf('PolicyX', 'A'), source(6)).
proof_step(1, 7, allOf('PolicyX', 'B'), source(7)).
proof_step(1, 8, anyOf('PolicyX', 'C'), source(8)).
proof_step(1, 9, noneOf('PolicyX', 'D'), source(9)).
proof_step(1, 10, matched_any('PolicyX'), rule(2, [1, 5, 8, 4])).
proof_step(1, 11, pass('PolicyX', anyOfTest), rule(5, [5, 10])).
proof_step(1, 12, matched_none('PolicyX'), absent(1)).
proof_step(1, 13, pass('PolicyX', noneOfTest), rule(6, [5, 12])).
proof_step(1, 14, missing_all('PolicyX'), absent(2)).
proof_step(1, 15, pass('PolicyX', allOfTest), rule(4, [5, 14])).
proof_step(1, 16, accepted('PolicyX'), rule(7, [5, 15, 11, 13])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 11).
proof_boundary(1, 2, 1).
proof_boundary_steps(1, 2, 1, 11).
proof_boundary_steps(1, 2, 13, 13).
proof_claim(1, answer(1, [16])).

% Answer 2
pass('PolicyX', anyOfTest).
pass('PolicyX', noneOfTest).
pass('PolicyX', allOfTest).

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
