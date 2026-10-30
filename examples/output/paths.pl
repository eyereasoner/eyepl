% Answer 1
reaches(cara, ada).
reaches(ben, ada).

% Answer 2
reaches(ben, ada).

% Reason 2
proof_step(2, 1, follows(ben, cara), source(2)).
proof_step(2, 2, follows(cara, ada), source(3)).
proof_step(2, 3, reaches(ben, cara), rule(1, [1])).
proof_step(2, 4, reaches(ben, ada), rule(2, [3, 2])).
proof_claim(2, answer(2, [4])).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
