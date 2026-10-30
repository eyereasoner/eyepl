% Answer 1
solution(sandy).

% Reason 1
proof_step(1, 1, person(chris), source(1)).
proof_step(1, 2, person(sandy), source(2)).
proof_step(1, 3, person(pat), source(3)).
proof_step(1, 4, '\\='(chris, sandy), builtin).
proof_step(1, 5, '\\='(chris, pat), builtin).
proof_step(1, 6, '\\='(sandy, pat), builtin).
proof_step(1, 7, '\\='(pat, sandy), builtin).
proof_step(1, 8, uniq_people(chris, pat, sandy), rule(2, [1, 3, 2, 5, 4, 7])).
proof_step(1, 9, '\\='(sandy, chris), builtin).
proof_step(1, 10, '\\='(pat, chris), builtin).
proof_step(1, 11, uniq_people(pat, chris, sandy), rule(2, [3, 1, 2, 10, 7, 4])).
proof_step(1, 12, '='(chris, chris), builtin).
proof_step(1, 13, '='(pat, pat), builtin).
proof_step(1, 14, solution(sandy), rule(1, [11, 8, 5, 12, 9, 13, 6])).
proof_claim(1, answer(1, [14])).

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
