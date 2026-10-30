% Answer 1
absolute(magnitude, 9007199254740993).

% Answer 2
result(division, [-2, -3, -1, 2]).

% Answer 3
result(rounding, [-3, -2, -2, -2, -2.0, -0.5]).

% Answer 4
result(extrema, [1e21, 1000000000000000000001]).

% Answer 5
result(gcd, 6).

% Answer 6
result(bits, [4, 15, 11, -14, 104, 1]).

% Answer 7
constants(mathematics, [3.141592653589793, 2.718281828459045]).

% Answer 8
circumference(circle, 18.84955592153876).

% Answer 9
'round-trip'(trigonometry, 0.9999999999999999).

% Answer 10
result(division, [-2, -3, -1, 2]).

% Reason 10
proof_step(10, 1, inputs(division, [-7, 3]), source(3)).
proof_step(10, 2, is(-2, '//'(-7, 3)), builtin).
proof_step(10, 3, is(-3, div(-7, 3)), builtin).
proof_step(10, 4, is(-1, rem(-7, 3)), builtin).
proof_step(10, 5, is(2, mod(-7, 3)), builtin).
proof_step(10, 6, result(division, [-2, -3, -1, 2]), rule(2, [1, 2, 3, 4, 5])).
proof_claim(10, answer(10, [6])).

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

% Goal check 21
check_result(21, true).

% Goal check 22
check_result(22, true).

% Goal check 23
check_result(23, true).

% Goal check 24
check_result(24, true).
