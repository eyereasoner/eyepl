% Answer 1
is_a(milo, 'ready-player').
is_a(rex, 'ready-player').

% Reason 1
proof_step(1, 1, is_a(milo, player), source(1)).
proof_step(1, 2, is_a(luna, player), source(2)).
proof_step(1, 3, is_a(rex, player), source(3)).
proof_step(1, 4, is_a(luna, 'tired-player'), source(4)).
proof_step(1, 5, needs(luna, rest), rule(2, [4])).
proof_step(1, 6, needs(milo, rest), absent(1)).
proof_step(1, 7, is_a(milo, 'ready-player'), rule(1, [1, 6])).
proof_step(1, 8, needs(rex, rest), absent(1)).
proof_step(1, 9, is_a(rex, 'ready-player'), rule(1, [3, 8])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 5).
proof_claim(1, answer(1, [7])).
proof_claim(1, answer(1, [9])).

% Answer 2
is_a(milo, 'eager-player').
is_a(rex, 'eager-player').

% Answer 3
answer(3, []).

% Reason 3
proof_step(3, 1, is_a(milo, player), source(1)).
proof_step(3, 2, is_a(luna, player), source(2)).
proof_step(3, 3, is_a(rex, player), source(3)).
proof_step(3, 4, is_a(luna, 'tired-player'), source(4)).
proof_step(3, 5, needs(luna, rest), rule(2, [4])).
proof_step(3, 6, needs(milo, rest), absent(1)).
proof_boundary(3, 1, 0).
proof_boundary_steps(3, 1, 1, 5).
proof_claim(3, answer(3, [6])).

% Answer 4
no_answer(4).

% Answer 5
answer(5, [
    binding("Result", 2)
]).

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
