% Answer 1
balance(3, 65).

% Reason 1
proof_step(1, 1, opening_balance(100), source(1)).
proof_step(1, 2, event(1, deposit, 25), source(2)).
proof_step(1, 3, event(2, withdraw, 40), source(3)).
proof_step(1, 4, event(3, withdraw, 20), source(4)).
proof_step(1, 5, '>'(1, 0), builtin).
proof_step(1, 6, is(0, '-'(1, 1)), builtin).
proof_step(1, 7, is(125, '+'(100, 25)), builtin).
proof_step(1, 8, '>'(2, 0), builtin).
proof_step(1, 9, is(1, '-'(2, 1)), builtin).
proof_step(1, 10, is(85, '-'(125, 40)), builtin).
proof_step(1, 11, '>'(3, 0), builtin).
proof_step(1, 12, is(2, '-'(3, 1)), builtin).
proof_step(1, 13, is(65, '-'(85, 20)), builtin).
proof_step(1, 14, balance(0, 100), rule(3, [1])).
proof_step(1, 15, balance(1, 125), rule(4, [5, 2, 6, 14, 7])).
proof_step(1, 16, balance(2, 85), rule(5, [8, 3, 9, 15, 10])).
proof_step(1, 17, balance(3, 65), rule(5, [11, 4, 12, 16, 13])).
proof_claim(1, answer(1, [17])).

% Answer 2
between(0, 3, 0).
balance(0, 100).
between(0, 3, 1).
balance(1, 125).
between(0, 3, 2).
balance(2, 85).
between(0, 3, 3).
balance(3, 65).

% Reason 2
proof_step(2, 1, opening_balance(100), source(1)).
proof_step(2, 2, event(1, deposit, 25), source(2)).
proof_step(2, 3, event(2, withdraw, 40), source(3)).
proof_step(2, 4, event(3, withdraw, 20), source(4)).
proof_step(2, 5, '>'(1, 0), builtin).
proof_step(2, 6, is(0, '-'(1, 1)), builtin).
proof_step(2, 7, is(125, '+'(100, 25)), builtin).
proof_step(2, 8, '>'(2, 0), builtin).
proof_step(2, 9, is(1, '-'(2, 1)), builtin).
proof_step(2, 10, is(85, '-'(125, 40)), builtin).
proof_step(2, 11, '>'(3, 0), builtin).
proof_step(2, 12, is(2, '-'(3, 1)), builtin).
proof_step(2, 13, is(65, '-'(85, 20)), builtin).
proof_step(2, 14, '=<'(0, 3), builtin).
proof_step(2, 15, '=<'(1, 3), builtin).
proof_step(2, 16, '<'(0, 3), builtin).
proof_step(2, 17, is(1, '+'(0, 1)), builtin).
proof_step(2, 18, '=<'(2, 3), builtin).
proof_step(2, 19, '<'(1, 3), builtin).
proof_step(2, 20, is(2, '+'(1, 1)), builtin).
proof_step(2, 21, '=<'(3, 3), builtin).
proof_step(2, 22, '<'(2, 3), builtin).
proof_step(2, 23, is(3, '+'(2, 1)), builtin).
proof_step(2, 24, balance(0, 100), rule(3, [1])).
proof_step(2, 25, between(0, 3, 0), rule(1, [14])).
proof_step(2, 26, between(1, 3, 1), rule(1, [15])).
proof_step(2, 27, between(2, 3, 2), rule(1, [18])).
proof_step(2, 28, between(3, 3, 3), rule(1, [21])).
proof_step(2, 29, balance(1, 125), rule(4, [5, 2, 6, 24, 7])).
proof_step(2, 30, between(0, 3, 1), rule(2, [16, 17, 26])).
proof_step(2, 31, between(1, 3, 2), rule(2, [19, 20, 27])).
proof_step(2, 32, between(2, 3, 3), rule(2, [22, 23, 28])).
proof_step(2, 33, balance(2, 85), rule(5, [8, 3, 9, 29, 10])).
proof_step(2, 34, between(0, 3, 2), rule(2, [16, 17, 31])).
proof_step(2, 35, between(1, 3, 3), rule(2, [19, 20, 32])).
proof_step(2, 36, balance(3, 65), rule(5, [11, 4, 12, 33, 13])).
proof_step(2, 37, between(0, 3, 3), rule(2, [16, 17, 35])).
proof_claim(2, answer(2, [25, 24])).
proof_claim(2, answer(2, [30, 29])).
proof_claim(2, answer(2, [34, 33])).
proof_claim(2, answer(2, [37, 36])).

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
