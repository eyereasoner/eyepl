% Answer 1
pick_list(alpha, [item(bolts, 4), item(nuts, 4), item(bolts, 4)]).
pick_list(beta, [item(washers, 12)]).
pick_list(empty, []).

% Reason 1
proof_step(1, 1, order(alpha), source(1)).
proof_step(1, 2, order(beta), source(2)).
proof_step(1, 3, order(empty), source(3)).
proof_step(1, 4, line(alpha, 1, bolts, 4), source(4)).
proof_step(1, 5, line(alpha, 2, nuts, 4), source(5)).
proof_step(1, 6, line(alpha, 3, bolts, 4), source(6)).
proof_step(1, 7, line(beta, 1, washers, 12), source(8)).
proof_step(1, 8, occurrences(item(bolts, 4), [], 0), rule(3, [])).
proof_step(1, 9, is(1, '+'(0, 1)), builtin).
proof_step(1, 10, '\\='(item(bolts, 4), item(nuts, 4)), builtin).
proof_step(1, 11, is(2, '+'(1, 1)), builtin).
proof_step(1, 12, occurrences(item(nuts, 4), [], 0), rule(3, [])).
proof_step(1, 13, '\\='(item(nuts, 4), item(bolts, 4)), builtin).
proof_step(1, 14, occurrences(item(bolts, 4), [item(bolts, 4)], 1), rule(4, [8, 9])).
proof_step(1, 15, occurrences(item(nuts, 4), [item(bolts, 4)], 0), rule(5, [13, 12])).
proof_step(
    1,
    16,
    occurrences(item(bolts, 4), [item(nuts, 4), item(bolts, 4)], 1),
    rule(5, [10, 14])
).
proof_step(
    1,
    17,
    occurrences(item(nuts, 4), [item(nuts, 4), item(bolts, 4)], 1),
    rule(4, [15, 9])
).
proof_step(
    1,
    18,
    occurrences(item(bolts, 4), [item(bolts, 4), item(nuts, 4), item(bolts, 4)], 2),
    rule(4, [16, 11])
).
proof_step(
    1,
    19,
    occurrences(item(nuts, 4), [item(bolts, 4), item(nuts, 4), item(bolts, 4)], 1),
    rule(5, [13, 17])
).
proof_step(
    1,
    20,
    '$aggregate:r1:2'(
        [binding('Order', alpha)],
        [item(bolts, 4), item(nuts, 4), item(bolts, 4)]
    ),
    aggregate(rule(1), 2, 1)
).
proof_step(
    1,
    21,
    '$aggregate:r1:2'([binding('Order', beta)], [item(washers, 12)]),
    aggregate(rule(1), 2, 1)
).
proof_step(
    1,
    22,
    '$aggregate:r1:2'([binding('Order', empty)], []),
    aggregate(rule(1), 2, 1)
).
proof_step(
    1,
    23,
    pick_list(alpha, [item(bolts, 4), item(nuts, 4), item(bolts, 4)]),
    rule(1, [1, 20])
).
proof_step(1, 24, pick_list(beta, [item(washers, 12)]), rule(1, [2, 21])).
proof_step(1, 25, pick_list(empty, []), rule(1, [3, 22])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 8).
proof_boundary_steps(1, 1, 12, 12).
proof_boundary_steps(1, 1, 14, 19).
proof_boundary_call(1, 1, occurrences(item(bolts, 4), [], variable("_EyeplCall0"))).
proof_boundary_call(
    1,
    1,
    occurrences(item(bolts, 4), [item(bolts, 4), item(nuts, 4), item(bolts, 4)], 2)
).
proof_boundary_call(
    1,
    1,
    occurrences(item(bolts, 4), [item(bolts, 4)], variable("_EyeplCall0"))
).
proof_boundary_call(
    1,
    1,
    occurrences(
        item(bolts, 4),
        [item(nuts, 4), item(bolts, 4)],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(1, 1, occurrences(item(nuts, 4), [], variable("_EyeplCall0"))).
proof_boundary_call(
    1,
    1,
    occurrences(item(nuts, 4), [item(bolts, 4), item(nuts, 4), item(bolts, 4)], 1)
).
proof_boundary_call(
    1,
    1,
    occurrences(item(nuts, 4), [item(bolts, 4)], variable("_EyeplCall0"))
).
proof_boundary_call(
    1,
    1,
    occurrences(item(nuts, 4), [item(nuts, 4), item(bolts, 4)], 1)
).
proof_claim(1, answer(1, [23])).
proof_claim(1, answer(1, [24])).
proof_claim(1, answer(1, [25])).

% Answer 2
answer(2, [
    binding("Quantities", [4, 4, 4])
]).

% Answer 3
bulk_list(alpha, []).
bulk_list(beta, [item(washers, 12)]).
bulk_list(empty, []).

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
