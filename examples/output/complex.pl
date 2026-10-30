% Answer 1
real('sqrt-minus-one', 6.123233995736766e-17).

% Answer 2
imaginary('sqrt-minus-one', 1.0).

% Answer 3
real('e-to-i-pi', -1.0).

% Answer 4
imaginary('e-to-i-pi', 1.2246467991473532e-16).

% Answer 5
real('i-to-i', 0.20787957635076193).

% Answer 6
imaginary('i-to-i', 0.0).

% Answer 7
real('e-to-minus-half-pi', 0.20787957635177984).

% Answer 8
imaginary('e-to-minus-half-pi', 0.0).

% Answer 9
real('asin-result', 1.5707963267948966).

% Answer 10
imaginary('asin-result', 2.3363408269090766).

% Answer 11
real('acos-result', 0.0).

% Answer 12
imaginary('acos-result', -2.3363408269090766).

% Reason 12
proof_step(12, 1, real(input, 5.22), source(2)).
proof_step(12, 2, imaginary(input, 0), source(3)).
proof_step(12, 3, is_a('acos-result', 'inverse-cosine'), source(36)).
proof_step(12, 4, input('acos-result', input), source(37)).
proof_step(12, 5, is(6.22, sqrt('+'('^'('+'(1, 5.22), 2), '^'(0, 2)))), builtin).
proof_step(12, 6, is(4.22, sqrt('+'('^'('-'(1, 5.22), 2), '^'(0, 2)))), builtin).
proof_step(12, 7, is(5.22, '/'('+'(6.22, 4.22), 2)), builtin).
proof_step(
    12,
    8,
    is(2.3363408269090766, log('+'(5.22, sqrt('-'('^'(5.22, 2), 1))))),
    builtin
).
proof_step(12, 9, is(-2.3363408269090766, '-'(0, 2.3363408269090766)), builtin).
proof_step(12, 10, 'left-distance'('acos-result', 6.22), rule(12, [4, 1, 2, 5])).
proof_step(12, 11, 'right-distance'('acos-result', 4.22), rule(13, [4, 1, 2, 6])).
proof_step(12, 12, average('acos-result', 5.22), rule(15, [10, 11, 7])).
proof_step(
    12,
    13,
    'imaginary-size'('acos-result', 2.3363408269090766),
    rule(16, [12, 8])
).
proof_step(12, 14, imaginary('acos-result', -2.3363408269090766), rule(20, [3, 13, 9])).
proof_claim(12, answer(12, [14])).

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
