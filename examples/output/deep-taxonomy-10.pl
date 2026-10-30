% Answer 1
is_a(ind, a2).

% Reason 1
proof_step(1, 1, is_a(ind, n0), source(1)).
proof_step(1, 2, is_a(ind, n1), rule(2, [1])).
proof_step(1, 3, is_a(ind, n2), rule(5, [2])).
proof_step(1, 4, is_a(ind, n3), rule(8, [3])).
proof_step(1, 5, is_a(ind, n4), rule(11, [4])).
proof_step(1, 6, is_a(ind, n5), rule(14, [5])).
proof_step(1, 7, is_a(ind, n6), rule(17, [6])).
proof_step(1, 8, is_a(ind, n7), rule(20, [7])).
proof_step(1, 9, is_a(ind, n8), rule(23, [8])).
proof_step(1, 10, is_a(ind, n9), rule(26, [9])).
proof_step(1, 11, is_a(ind, n10), rule(29, [10])).
proof_step(1, 12, is_a(ind, a2), rule(1, [11])).
proof_claim(1, answer(1, [12])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
