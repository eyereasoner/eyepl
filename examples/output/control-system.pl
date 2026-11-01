% Answer 1
control1(actuator1, 39.27346198678276).
control1(actuator2, 26.08).

% Reason 1
proof_step(1, 1, measurement1(input1, [6, 11]), source(1)).
proof_step(1, 2, measurement2(input2, true), source(3)).
proof_step(1, 3, measurement3(disturbance1, 35766), source(5)).
proof_step(1, 4, measurement4(output2, 24), source(6)).
proof_step(1, 5, observation3(state3, 22), source(9)).
proof_step(1, 6, target2(output2, 29), source(10)).
proof_step(1, 7, '<'(6, 11), builtin).
proof_step(1, 8, is(5, '-'(11, 6)), builtin).
proof_step(1, 9, is(2.23606797749979, sqrt(5)), builtin).
proof_step(1, 10, '=\\='(5, 0), builtin).
proof_step(1, 11, is(1.46, '/'(7.3, 5)), builtin).
proof_step(1, 12, is(-2.92, '*'(1.46, -2)), builtin).
proof_step(1, 13, '>'(35766, 0), builtin).
proof_step(1, 14, is(43.82693235899588, '*'(2.23606797749979, 19.6)), builtin).
proof_step(1, 15, is(4.553470372213121, '/'(log(35766), log(10))), builtin).
proof_step(
    1,
    16,
    is(39.27346198678276, '-'(43.82693235899588, 4.553470372213121)),
    builtin
).
proof_step(1, 17, is(5, '-'(29, 24)), builtin).
proof_step(1, 18, is(-2, '-'(22, 24)), builtin).
proof_step(1, 19, is(29.0, '*'(5.8, 5)), builtin).
proof_step(1, 20, is(26.08, '+'(29.0, -2.92)), builtin).
proof_step(1, 21, measurement10(input1, 2.23606797749979), rule(5, [1, 7, 8, 9])).
proof_step(1, 22, nonlinear_part(5, -2, -2.92), rule(3, [10, 11, 12])).
proof_step(
    1,
    23,
    control1(actuator1, 39.27346198678276),
    rule(1, [21, 2, 3, 13, 14, 15, 16])
).
proof_step(1, 24, control1(actuator2, 26.08), rule(2, [5, 4, 6, 17, 18, 19, 22, 20])).
proof_claim(1, answer(1, [23])).
proof_claim(1, answer(1, [24])).

% Answer 2
measurement10(disturbance2, 45).

% Reason 2
proof_step(2, 1, measurement1(disturbance2, [45, 39]), source(2)).
proof_step(2, 2, '>='(45, 39), builtin).
proof_step(2, 3, measurement10(disturbance2, 45), rule(6, [1, 2])).
proof_claim(2, answer(2, [3])).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
