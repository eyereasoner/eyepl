% Answer 1
product(a, b, m(7, 2, 3, 1)).

% Reason 1
proof_step(1, 1, matrix(a, m(1, 2, 0, 1)), source(1)).
proof_step(1, 2, matrix(b, m(1, 0, 3, 1)), source(2)).
proof_step(1, 3, is(7, '+'('*'(1, 1), '*'(2, 3))), builtin).
proof_step(1, 4, is(2, '+'('*'(1, 0), '*'(2, 1))), builtin).
proof_step(1, 5, is(3, '+'('*'(0, 1), '*'(1, 3))), builtin).
proof_step(1, 6, is(1, '+'('*'(0, 0), '*'(1, 1))), builtin).
proof_step(
    1,
    7,
    multiply(m(1, 2, 0, 1), m(1, 0, 3, 1), m(7, 2, 3, 1)),
    rule(1, [3, 4, 5, 6])
).
proof_step(1, 8, product(a, b, m(7, 2, 3, 1)), rule(3, [1, 2, 7])).
proof_claim(1, answer(1, [8])).

% Answer 2
product(b, a, m(1, 2, 3, 7)).

% Answer 3
matrix(a, m(1, 2, 0, 1)).
matrix(b, m(1, 0, 3, 1)).
commutator(m(1, 2, 0, 1), m(1, 0, 3, 1), m(6, 0, 0, -6)).

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
