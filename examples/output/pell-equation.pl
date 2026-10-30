% Answer 1
pell_answer(solution_5, solution(3363, 2378)).
pell_answer(solution_8, solution(665857, 470832)).
pell_answer(check_8, true).
pell_answer(
    solution_50,
    solution(
        94741125149636933417873079920900017937,
        66992092050551637663438906713182313772
    )
).
pell_answer(y_sum_1_to_8, 568344).

% Answer 2
pell(8, 665857, 470832).

% Reason 2
proof_step(2, 1, pell(0, 1, 0), source(1)).
proof_step(2, 2, '>'(1, 0), builtin).
proof_step(2, 3, is(0, '-'(1, 1)), builtin).
proof_step(2, 4, is(3, '*'(3, 1)), builtin).
proof_step(2, 5, is(0, '*'(4, 0)), builtin).
proof_step(2, 6, is(3, '+'(3, 0)), builtin).
proof_step(2, 7, is(2, '*'(2, 1)), builtin).
proof_step(2, 8, is(0, '*'(3, 0)), builtin).
proof_step(2, 9, is(2, '+'(2, 0)), builtin).
proof_step(2, 10, '>'(2, 0), builtin).
proof_step(2, 11, is(1, '-'(2, 1)), builtin).
proof_step(2, 12, is(9, '*'(3, 3)), builtin).
proof_step(2, 13, is(8, '*'(4, 2)), builtin).
proof_step(2, 14, is(17, '+'(9, 8)), builtin).
proof_step(2, 15, is(6, '*'(2, 3)), builtin).
proof_step(2, 16, is(6, '*'(3, 2)), builtin).
proof_step(2, 17, is(12, '+'(6, 6)), builtin).
proof_step(2, 18, '>'(3, 0), builtin).
proof_step(2, 19, is(2, '-'(3, 1)), builtin).
proof_step(2, 20, is(51, '*'(3, 17)), builtin).
proof_step(2, 21, is(48, '*'(4, 12)), builtin).
proof_step(2, 22, is(99, '+'(51, 48)), builtin).
proof_step(2, 23, is(34, '*'(2, 17)), builtin).
proof_step(2, 24, is(36, '*'(3, 12)), builtin).
proof_step(2, 25, is(70, '+'(34, 36)), builtin).
proof_step(2, 26, '>'(4, 0), builtin).
proof_step(2, 27, is(3, '-'(4, 1)), builtin).
proof_step(2, 28, is(297, '*'(3, 99)), builtin).
proof_step(2, 29, is(280, '*'(4, 70)), builtin).
proof_step(2, 30, is(577, '+'(297, 280)), builtin).
proof_step(2, 31, is(198, '*'(2, 99)), builtin).
proof_step(2, 32, is(210, '*'(3, 70)), builtin).
proof_step(2, 33, is(408, '+'(198, 210)), builtin).
proof_step(2, 34, '>'(5, 0), builtin).
proof_step(2, 35, is(4, '-'(5, 1)), builtin).
proof_step(2, 36, is(1731, '*'(3, 577)), builtin).
proof_step(2, 37, is(1632, '*'(4, 408)), builtin).
proof_step(2, 38, is(3363, '+'(1731, 1632)), builtin).
proof_step(2, 39, is(1154, '*'(2, 577)), builtin).
proof_step(2, 40, is(1224, '*'(3, 408)), builtin).
proof_step(2, 41, is(2378, '+'(1154, 1224)), builtin).
proof_step(2, 42, '>'(6, 0), builtin).
proof_step(2, 43, is(5, '-'(6, 1)), builtin).
proof_step(2, 44, is(10089, '*'(3, 3363)), builtin).
proof_step(2, 45, is(9512, '*'(4, 2378)), builtin).
proof_step(2, 46, is(19601, '+'(10089, 9512)), builtin).
proof_step(2, 47, is(6726, '*'(2, 3363)), builtin).
proof_step(2, 48, is(7134, '*'(3, 2378)), builtin).
proof_step(2, 49, is(13860, '+'(6726, 7134)), builtin).
proof_step(2, 50, '>'(7, 0), builtin).
proof_step(2, 51, is(6, '-'(7, 1)), builtin).
proof_step(2, 52, is(58803, '*'(3, 19601)), builtin).
proof_step(2, 53, is(55440, '*'(4, 13860)), builtin).
proof_step(2, 54, is(114243, '+'(58803, 55440)), builtin).
proof_step(2, 55, is(39202, '*'(2, 19601)), builtin).
proof_step(2, 56, is(41580, '*'(3, 13860)), builtin).
proof_step(2, 57, is(80782, '+'(39202, 41580)), builtin).
proof_step(2, 58, '>'(8, 0), builtin).
proof_step(2, 59, is(7, '-'(8, 1)), builtin).
proof_step(2, 60, is(342729, '*'(3, 114243)), builtin).
proof_step(2, 61, is(323128, '*'(4, 80782)), builtin).
proof_step(2, 62, is(665857, '+'(342729, 323128)), builtin).
proof_step(2, 63, is(228486, '*'(2, 114243)), builtin).
proof_step(2, 64, is(242346, '*'(3, 80782)), builtin).
proof_step(2, 65, is(470832, '+'(228486, 242346)), builtin).
proof_step(2, 66, pell(1, 3, 2), rule(3, [2, 3, 1, 4, 5, 6, 7, 8, 9])).
proof_step(2, 67, pell(2, 17, 12), rule(3, [10, 11, 66, 12, 13, 14, 15, 16, 17])).
proof_step(2, 68, pell(3, 99, 70), rule(3, [18, 19, 67, 20, 21, 22, 23, 24, 25])).
proof_step(2, 69, pell(4, 577, 408), rule(3, [26, 27, 68, 28, 29, 30, 31, 32, 33])).
proof_step(2, 70, pell(5, 3363, 2378), rule(3, [34, 35, 69, 36, 37, 38, 39, 40, 41])).
proof_step(2, 71, pell(6, 19601, 13860), rule(3, [42, 43, 70, 44, 45, 46, 47, 48, 49])).
proof_step(2, 72, pell(7, 114243, 80782), rule(3, [50, 51, 71, 52, 53, 54, 55, 56, 57])).
proof_step(
    2,
    73,
    pell(8, 665857, 470832),
    rule(3, [58, 59, 72, 60, 61, 62, 63, 64, 65])
).
proof_claim(2, answer(2, [73])).

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
