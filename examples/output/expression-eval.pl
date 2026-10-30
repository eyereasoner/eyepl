% Answer 1
result(example, 12).

% Reason 1
proof_step(1, 1, literal(n2, 2), source(1)).
proof_step(1, 2, literal(n3, 3), source(2)).
proof_step(1, 3, literal(n10, 10), source(3)).
proof_step(1, 4, literal(n4, 4), source(4)).
proof_step(1, 5, expression(product, mul, n2, n3), source(5)).
proof_step(1, 6, expression(difference, sub, n10, n4), source(6)).
proof_step(1, 7, expression(total, add, product, difference), source(7)).
proof_step(1, 8, root(example, total), source(8)).
proof_step(1, 9, is(6, '*'(2, 3)), builtin).
proof_step(1, 10, is(6, '-'(10, 4)), builtin).
proof_step(1, 11, is(12, '+'(6, 6)), builtin).
proof_step(1, 12, value(n2, 2), rule(1, [1])).
proof_step(1, 13, value(n3, 3), rule(1, [2])).
proof_step(1, 14, value(n10, 10), rule(1, [3])).
proof_step(1, 15, value(n4, 4), rule(1, [4])).
proof_step(1, 16, calculate(mul, 2, 3, 6), rule(5, [9])).
proof_step(1, 17, calculate(sub, 10, 4, 6), rule(4, [10])).
proof_step(1, 18, calculate(add, 6, 6, 12), rule(3, [11])).
proof_step(1, 19, value(product, 6), rule(2, [5, 12, 13, 16])).
proof_step(1, 20, value(difference, 6), rule(2, [6, 14, 15, 17])).
proof_step(1, 21, value(total, 12), rule(2, [7, 19, 20, 18])).
proof_step(1, 22, result(example, 12), rule(6, [8, 21])).
proof_claim(1, answer(1, [22])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
