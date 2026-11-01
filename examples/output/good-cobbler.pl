% Answer 1
good_at(joe, cobbler).
good_at(jane, carpenter).

% Reason 1
proof_step(1, 1, description(joe, [good, cobbler]), source(1)).
proof_step(1, 2, description(jane, [good, carpenter]), source(2)).
proof_step(1, 3, good_at(joe, cobbler), rule(1, [1])).
proof_step(1, 4, good_at(jane, carpenter), rule(1, [2])).
proof_claim(1, answer(1, [3])).
proof_claim(1, answer(1, [4])).

% Answer 2
classified_as(joe, cobbler).
classified_as(jane, carpenter).
classified_as(sam, cobbler).

% Reason 2
proof_step(2, 1, description(joe, [good, cobbler]), source(1)).
proof_step(2, 2, description(jane, [good, carpenter]), source(2)).
proof_step(2, 3, description(sam, [novice, cobbler]), source(3)).
proof_step(2, 4, classified_as(joe, cobbler), rule(2, [1])).
proof_step(2, 5, classified_as(jane, carpenter), rule(2, [2])).
proof_step(2, 6, classified_as(sam, cobbler), rule(2, [3])).
proof_claim(2, answer(2, [4])).
proof_claim(2, answer(2, [5])).
proof_claim(2, answer(2, [6])).

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

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).
