% Answer 1
append([], [a, b], [a, b]).
append([a], [b], [a, b]).
append([a, b], [], [a, b]).

% Reason 1
proof_step(1, 1, append([], [a, b], [a, b]), rule(1, [])).
proof_step(1, 2, append([], [b], [b]), rule(1, [])).
proof_step(1, 3, append([], [], []), rule(1, [])).
proof_step(1, 4, append([a], [b], [a, b]), rule(2, [2])).
proof_step(1, 5, append([b], [], [b]), rule(2, [3])).
proof_step(1, 6, append([a, b], [], [a, b]), rule(2, [5])).
proof_claim(1, answer(1, [1])).
proof_claim(1, answer(1, [4])).
proof_claim(1, answer(1, [6])).

% Answer 2
matching_pair(pair(same, same)).

% Reason 2
proof_step(2, 1, matching_pair(pair(same, same)), rule(3, [])).
proof_claim(2, answer(2, [1])).

% Answer 3
no_answer(3).

% Answer 4
head_tail([a, b, c], a, [b, c]).

% Reason 4
proof_step(4, 1, head_tail([a, b, c], a, [b, c]), rule(4, [])).
proof_claim(4, answer(4, [1])).

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
