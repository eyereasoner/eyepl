% Answer 1
type_answer(id, fun(t0, t0)).
type_answer(first_of_pair, bool).
type_answer(const, fun(t0, fun(t1, t0))).
type_answer(apply_id, int).
type_answer(branch, int).
type_answer(compose, fun(fun(t1, t2), fun(fun(t0, t1), fun(t0, t2)))).

% Answer 2
type_answer(compose, fun(fun(t1, t2), fun(fun(t0, t1), fun(t0, t2)))).

% Reason 2
proof_step(
    2,
    1,
    program(
        compose,
        lam(
            f,
            fun(t1, t2),
            lam(g, fun(t0, t1), lam(x, t0, app(var(f), app(var(g), var(x)))))
        )
    ),
    source(4)
).
proof_step(2, 2, lookup(f, [[f, fun(t1, t2)]], fun(t1, t2)), rule(1, [])).
proof_step(2, 3, '\\='(f, g), builtin).
proof_step(2, 4, '\\='(f, x), builtin).
proof_step(
    2,
    5,
    lookup(g, [[g, fun(t0, t1)], [f, fun(t1, t2)]], fun(t0, t1)),
    rule(1, [])
).
proof_step(2, 6, '\\='(g, x), builtin).
proof_step(
    2,
    7,
    lookup(x, [[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], t0),
    rule(1, [])
).
proof_step(
    2,
    8,
    lookup(f, [[g, fun(t0, t1)], [f, fun(t1, t2)]], fun(t1, t2)),
    rule(2, [3, 2])
).
proof_step(
    2,
    9,
    lookup(g, [[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], fun(t0, t1)),
    rule(2, [6, 5])
).
proof_step(
    2,
    10,
    type_expr([[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], var(x), t0),
    rule(5, [7])
).
proof_step(
    2,
    11,
    lookup(f, [[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], fun(t1, t2)),
    rule(2, [4, 8])
).
proof_step(
    2,
    12,
    type_expr([[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], var(g), fun(t0, t1)),
    rule(5, [9])
).
proof_step(
    2,
    13,
    type_expr([[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], var(f), fun(t1, t2)),
    rule(5, [11])
).
proof_step(
    2,
    14,
    type_expr([[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]], app(var(g), var(x)), t1),
    rule(7, [12, 10])
).
proof_step(
    2,
    15,
    type_expr(
        [[x, t0], [g, fun(t0, t1)], [f, fun(t1, t2)]],
        app(var(f), app(var(g), var(x))),
        t2
    ),
    rule(7, [13, 14])
).
proof_step(
    2,
    16,
    type_expr(
        [[g, fun(t0, t1)], [f, fun(t1, t2)]],
        lam(x, t0, app(var(f), app(var(g), var(x)))),
        fun(t0, t2)
    ),
    rule(6, [15])
).
proof_step(
    2,
    17,
    type_expr(
        [[f, fun(t1, t2)]],
        lam(g, fun(t0, t1), lam(x, t0, app(var(f), app(var(g), var(x))))),
        fun(fun(t0, t1), fun(t0, t2))
    ),
    rule(6, [16])
).
proof_step(
    2,
    18,
    type_expr(
        [],
        lam(
            f,
            fun(t1, t2),
            lam(g, fun(t0, t1), lam(x, t0, app(var(f), app(var(g), var(x)))))
        ),
        fun(fun(t1, t2), fun(fun(t0, t1), fun(t0, t2)))
    ),
    rule(6, [17])
).
proof_step(
    2,
    19,
    type_answer(compose, fun(fun(t1, t2), fun(fun(t0, t1), fun(t0, t2)))),
    rule(13, [1, 18])
).
proof_claim(2, answer(2, [19])).

% Answer 3
type_reason(apply_id, "the identity function's parameter type is unified with int").
type_reason(compose, "application unifies f with t1 -> t2 and g with t0 -> t1").

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

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).

% Goal check 12
check_result(12, true).

% Goal check 13
check_result(13, true).

% Goal check 14
check_result(14, true).
