% Answer 1
derivative_result(square, add(mul(const(1), var(x)), mul(var(x), const(1)))).
derivative_result(nested_log, divide(divide(const(1), var(x)), log(var(x)))).
derivative_result(linear_plus_const, add(const(1), const(0))).
derivative_result(
    product,
    add(
        mul(
            add(const(1), const(0)),
            mul(add(pow(var(x), 2), const(2)), add(pow(var(x), 3), const(3)))
        ),
        mul(
            add(var(x), const(1)),
            add(
                mul(
                    add(mul(mul(const(2), pow(var(x), 1)), const(1)), const(0)),
                    add(pow(var(x), 3), const(3))
                ),
                mul(
                    add(pow(var(x), 2), const(2)),
                    add(mul(mul(const(3), pow(var(x), 2)), const(1)), const(0))
                )
            )
        )
    )
).

% Answer 2
derivative_result(square, add(mul(const(1), var(x)), mul(var(x), const(1)))).

% Reason 2
proof_step(2, 1, expr(square, mul(var(x), var(x))), source(1)).
proof_step(2, 2, d(var(x), x, const(1)), rule(2, [])).
proof_step(
    2,
    3,
    d(mul(var(x), var(x)), x, add(mul(const(1), var(x)), mul(var(x), const(1)))),
    rule(6, [2, 2])
).
proof_step(
    2,
    4,
    derivative_result(square, add(mul(const(1), var(x)), mul(var(x), const(1)))),
    rule(10, [1, 3])
).
proof_claim(2, answer(2, [4])).

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
