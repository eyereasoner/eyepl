% Answer 1
is_a(milo, friend).

% Answer 2
likes(milo, luna).

% Answer 3
likes(milo, luna).

% Answer 4
is_a(milo, friend).

% Reason 4
proof_step(4, 1, likes(milo, luna), source(1)).
proof_step(4, 2, is_a(luna, cat), source(2)).
proof_step(4, 3, is_a(milo, friend), rule(1, [1, 2])).
proof_claim(4, answer(4, [3])).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).
