% Answer 1
pow_mod(7, 560, 561, 1).

% Reason 1
proof_step(1, 1, '>'(561, 0), builtin).
proof_step(1, 2, is(1, mod(1, 561)), builtin).
proof_step(1, 3, '>'(1, 0), builtin).
proof_step(1, 4, '=:='(mod(1, 2), 1), builtin).
proof_step(1, 5, is(0, '//'(1, 2)), builtin).
proof_step(1, 6, is(7, mod('*'('*'(7, 1), 1), 561)), builtin).
proof_step(1, 7, '>'(2, 0), builtin).
proof_step(1, 8, '=:='(mod(2, 2), 0), builtin).
proof_step(1, 9, is(1, '//'(2, 2)), builtin).
proof_step(1, 10, is(49, mod('*'(7, 7), 561)), builtin).
proof_step(1, 11, '>'(4, 0), builtin).
proof_step(1, 12, '=:='(mod(4, 2), 0), builtin).
proof_step(1, 13, is(2, '//'(4, 2)), builtin).
proof_step(1, 14, is(157, mod('*'(49, 49), 561)), builtin).
proof_step(1, 15, '>'(8, 0), builtin).
proof_step(1, 16, '=:='(mod(8, 2), 0), builtin).
proof_step(1, 17, is(4, '//'(8, 2)), builtin).
proof_step(1, 18, is(526, mod('*'(157, 157), 561)), builtin).
proof_step(1, 19, '>'(17, 0), builtin).
proof_step(1, 20, '=:='(mod(17, 2), 1), builtin).
proof_step(1, 21, is(8, '//'(17, 2)), builtin).
proof_step(1, 22, is(160, mod('*'('*'(7, 526), 526), 561)), builtin).
proof_step(1, 23, '>'(35, 0), builtin).
proof_step(1, 24, '=:='(mod(35, 2), 1), builtin).
proof_step(1, 25, is(17, '//'(35, 2)), builtin).
proof_step(1, 26, is(241, mod('*'('*'(7, 160), 160), 561)), builtin).
proof_step(1, 27, '>'(70, 0), builtin).
proof_step(1, 28, '=:='(mod(70, 2), 0), builtin).
proof_step(1, 29, is(35, '//'(70, 2)), builtin).
proof_step(1, 30, is(298, mod('*'(241, 241), 561)), builtin).
proof_step(1, 31, '>'(140, 0), builtin).
proof_step(1, 32, '=:='(mod(140, 2), 0), builtin).
proof_step(1, 33, is(70, '//'(140, 2)), builtin).
proof_step(1, 34, is(166, mod('*'(298, 298), 561)), builtin).
proof_step(1, 35, '>'(280, 0), builtin).
proof_step(1, 36, '=:='(mod(280, 2), 0), builtin).
proof_step(1, 37, is(140, '//'(280, 2)), builtin).
proof_step(1, 38, is(67, mod('*'(166, 166), 561)), builtin).
proof_step(1, 39, '>'(560, 0), builtin).
proof_step(1, 40, '=:='(mod(560, 2), 0), builtin).
proof_step(1, 41, is(280, '//'(560, 2)), builtin).
proof_step(1, 42, is(1, mod('*'(67, 67), 561)), builtin).
proof_step(1, 43, pow_mod(7, 0, 561, 1), rule(1, [1, 2])).
proof_step(1, 44, pow_mod(7, 1, 561, 7), rule(3, [3, 1, 4, 5, 43, 6])).
proof_step(1, 45, pow_mod(7, 2, 561, 49), rule(2, [7, 1, 8, 9, 44, 10])).
proof_step(1, 46, pow_mod(7, 4, 561, 157), rule(2, [11, 1, 12, 13, 45, 14])).
proof_step(1, 47, pow_mod(7, 8, 561, 526), rule(2, [15, 1, 16, 17, 46, 18])).
proof_step(1, 48, pow_mod(7, 17, 561, 160), rule(3, [19, 1, 20, 21, 47, 22])).
proof_step(1, 49, pow_mod(7, 35, 561, 241), rule(3, [23, 1, 24, 25, 48, 26])).
proof_step(1, 50, pow_mod(7, 70, 561, 298), rule(2, [27, 1, 28, 29, 49, 30])).
proof_step(1, 51, pow_mod(7, 140, 561, 166), rule(2, [31, 1, 32, 33, 50, 34])).
proof_step(1, 52, pow_mod(7, 280, 561, 67), rule(2, [35, 1, 36, 37, 51, 38])).
proof_step(1, 53, pow_mod(7, 560, 561, 1), rule(2, [39, 1, 40, 41, 52, 42])).
proof_claim(1, answer(1, [53])).

% Answer 2
pow_mod(2, 1000, 1009, 942).

% Answer 3
pow_mod(12345678901234567890, 12345, 1000000007, 418431219).

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
