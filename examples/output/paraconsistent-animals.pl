% Answer 1
flies_safely(tweety, undecided).
flies_safely(mythic, undecided).
flies_safely(falco, true).
flies_safely(opus, false).
flies_safely(batsy, true).

% Answer 2
wings_safely(batsy, undecided).
wings_safely(tweety, true).
wings_safely(falco, true).
wings_safely(nemo, false).
wings_safely(mythic, true).

% Answer 3
wings_safely(batsy, undecided).

% Reason 3
proof_step(3, 1, mammal(batsy), source(5)).
proof_step(3, 2, bat(batsy), source(6)).
proof_step(3, 3, wings(batsy, false), rule(4, [1])).
proof_step(3, 4, wings(batsy, true), rule(6, [2])).
proof_step(3, 5, wing_status(batsy, both), rule(13, [4, 3])).
proof_step(3, 6, wings_safely(batsy, undecided), rule(25, [5])).
proof_claim(3, answer(3, [6])).

% Answer 4
needs_review(tweety, flies).
needs_review(batsy, wings).
needs_review(mythic, flies).

% Answer 5
moves_by(tweety, unknown).
moves_by(mythic, unknown).
moves_by(falco, flying).
moves_by(opus, walking).
moves_by(batsy, flying).

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

% Goal check 12
check_result(12, true).

% Goal check 13
check_result(13, true).

% Goal check 14
check_result(14, true).

% Goal check 15
check_result(15, true).

% Goal check 16
check_result(16, true).

% Goal check 17
check_result(17, true).

% Goal check 18
check_result(18, true).

% Goal check 19
check_result(19, true).

% Goal check 20
check_result(20, true).
