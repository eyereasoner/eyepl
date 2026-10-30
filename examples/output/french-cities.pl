% Answer 1
reaches(angers, nantes).
reaches(lemans, nantes).
reaches(chartres, nantes).
reaches(paris, nantes).

% Answer 2
reaches(paris, nantes).

% Reason 2
proof_step(2, 1, connects(paris, chartres), source(2)).
proof_step(2, 2, connects(chartres, lemans), source(7)).
proof_step(2, 3, connects(lemans, angers), source(8)).
proof_step(2, 4, connects(angers, nantes), source(10)).
proof_step(2, 5, reaches(angers, nantes), rule(1, [4])).
proof_step(2, 6, reaches(lemans, nantes), rule(2, [3, 5])).
proof_step(2, 7, reaches(chartres, nantes), rule(2, [2, 6])).
proof_step(2, 8, reaches(paris, nantes), rule(2, [1, 7])).
proof_claim(2, answer(2, [8])).

% Answer 3
reaches(paris, tours).

% Reason 3
proof_step(3, 1, connects(paris, orleans), source(1)).
proof_step(3, 2, connects(orleans, blois), source(4)).
proof_step(3, 3, connects(blois, tours), source(6)).
proof_step(3, 4, reaches(blois, tours), rule(1, [3])).
proof_step(3, 5, reaches(orleans, tours), rule(2, [2, 4])).
proof_step(3, 6, reaches(paris, tours), rule(2, [1, 5])).
proof_claim(3, answer(3, [6])).

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

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).
