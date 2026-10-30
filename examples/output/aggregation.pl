% Answer 1
answer(1, [
    binding("Result", 3)
]).

% Answer 2
answer(2, [
    binding("Result", 3)
]).

% Answer 3
answer(3, [
    binding("Result", 24)
]).

% Reason 3
proof_step(3, 1, is_a(milo, player), source(1)).
proof_step(3, 2, is_a(luna, player), source(2)).
proof_step(3, 3, is_a(rex, player), source(3)).
proof_step(3, 4, score(milo, 7), source(4)).
proof_step(3, 5, score(luna, 7), source(5)).
proof_step(3, 6, score(rex, 10), source(6)).
proof_step(3, 7, is_a(milo, 'team-member'), rule(1, [1])).
proof_step(3, 8, is_a(luna, 'team-member'), rule(1, [2])).
proof_step(3, 9, is_a(rex, 'team-member'), rule(1, [3])).
proof_step(3, 10, '$aggregate:q3:1'([], 24), aggregate(query(3), 1, 1)).
proof_boundary(3, 1, 0).
proof_boundary_steps(3, 1, 1, 9).
proof_claim(3, answer(3, [10])).

% Answer 4
answer(4, [
    binding("Result", 7)
]).

% Answer 5
answer(5, [
    binding("Result", 10)
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
