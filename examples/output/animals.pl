% Answer 1
is_a(milo, animal).
is_a(luna, animal).

% Answer 2
is_a(milo, animal).

% Answer 3
is_a(milo, animal).

% Reason 3
proof_step(3, 1, is_a(milo, cat), source(1)).
proof_step(3, 2, is_a(milo, animal), rule(1, [1])).
proof_claim(3, answer(3, [2])).

% Answer 4
no_answer(4).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).
