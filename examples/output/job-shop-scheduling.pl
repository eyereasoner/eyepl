% Answer 1
job_shop_answer(feasible_schedule_count, 35).
job_shop_answer(best_makespan, 9).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 3, 5),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 5, 8)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 4, 6),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 6, 9)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 3, 5),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 6, 9)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 3, 5),
        op(j2_lathe, 1, 3),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 5, 8)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 4, 6),
        op(j2_lathe, 1, 3),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 6, 9)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 3, 5),
        op(j2_lathe, 1, 3),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 6, 9)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 0, 3),
        op(j1_lathe, 4, 6),
        op(j2_lathe, 2, 4),
        op(j2_mill, 5, 9),
        op(j3_mill, 3, 5),
        op(j3_lathe, 6, 9)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 2, 5),
        op(j1_lathe, 6, 8),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 0, 2),
        op(j3_lathe, 2, 5)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 2, 5),
        op(j1_lathe, 5, 7),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 0, 2),
        op(j3_lathe, 2, 5)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 2, 5),
        op(j1_lathe, 6, 8),
        op(j2_lathe, 0, 2),
        op(j2_mill, 5, 9),
        op(j3_mill, 0, 2),
        op(j3_lathe, 3, 6)
    ]
).
job_shop_answer(
    best_schedule,
    [
        op(j1_mill, 2, 5),
        op(j1_lathe, 6, 8),
        op(j2_lathe, 1, 3),
        op(j2_mill, 5, 9),
        op(j3_mill, 0, 2),
        op(j3_lathe, 3, 6)
    ]
).

% Answer 2
job_shop_answer(best_makespan, 9).

% Reason 2
proof_step(2, 1, '=<'(0, 6), builtin).
proof_step(2, 2, '=<'(1, 6), builtin).
proof_step(2, 3, '<'(0, 6), builtin).
proof_step(2, 4, is(1, '+'(0, 1)), builtin).
proof_step(2, 5, '=<'(2, 6), builtin).
proof_step(2, 6, '<'(1, 6), builtin).
proof_step(2, 7, is(2, '+'(1, 1)), builtin).
proof_step(2, 8, '=<'(3, 6), builtin).
proof_step(2, 9, '<'(2, 6), builtin).
proof_step(2, 10, is(3, '+'(2, 1)), builtin).
proof_step(2, 11, '=<'(4, 6), builtin).
proof_step(2, 12, '<'(3, 6), builtin).
proof_step(2, 13, is(4, '+'(3, 1)), builtin).
proof_step(2, 14, '=<'(5, 6), builtin).
proof_step(2, 15, '<'(4, 6), builtin).
proof_step(2, 16, is(5, '+'(4, 1)), builtin).
proof_step(2, 17, '=<'(6, 6), builtin).
proof_step(2, 18, '<'(5, 6), builtin).
proof_step(2, 19, is(6, '+'(5, 1)), builtin).
proof_step(2, 20, '=<'(3, 3), builtin).
proof_step(2, 21, '=<'(3, 4), builtin).
proof_step(2, 22, '=<'(3, 5), builtin).
proof_step(2, 23, '=<'(4, 4), builtin).
proof_step(2, 24, '=<'(4, 5), builtin).
proof_step(2, 25, '=<'(5, 5), builtin).
proof_step(2, 26, '=<'(2, 5), builtin).
proof_step(2, 27, '=<'(2, 4), builtin).
proof_step(2, 28, '=<'(2, 3), builtin).
proof_step(2, 29, '=<'(2, 2), builtin).
proof_step(2, 30, is(3, '+'(0, 3)), builtin).
proof_step(2, 31, is(5, '+'(3, 2)), builtin).
proof_step(2, 32, is(2, '+'(0, 2)), builtin).
proof_step(2, 33, is(10, '+'(6, 4)), builtin).
proof_step(2, 34, is(8, '+'(5, 3)), builtin).
proof_step(2, 35, is(10, max(5, max(10, 8))), builtin).
proof_step(2, 36, is(9, '+'(5, 4)), builtin).
proof_step(2, 37, is(9, max(5, max(9, 8))), builtin).
proof_step(2, 38, is(9, '+'(6, 3)), builtin).
proof_step(2, 39, is(10, max(5, max(10, 9))), builtin).
proof_step(2, 40, is(6, '+'(4, 2)), builtin).
proof_step(2, 41, is(10, max(6, max(10, 9))), builtin).
proof_step(2, 42, is(4, '+'(1, 3)), builtin).
proof_step(2, 43, is(9, max(6, max(9, 9))), builtin).
proof_step(2, 44, is(9, max(5, max(9, 9))), builtin).
proof_step(2, 45, is(3, '+'(1, 2)), builtin).
proof_step(2, 46, is(4, '+'(2, 2)), builtin).
proof_step(2, 47, is(5, '+'(2, 3)), builtin).
proof_step(2, 48, is(8, '+'(6, 2)), builtin).
proof_step(2, 49, is(9, max(8, max(9, 5))), builtin).
proof_step(2, 50, is(10, max(8, max(10, 5))), builtin).
proof_step(2, 51, is(7, '+'(5, 2)), builtin).
proof_step(2, 52, is(9, max(7, max(9, 5))), builtin).
proof_step(2, 53, is(10, max(7, max(10, 5))), builtin).
proof_step(2, 54, is(6, '+'(3, 3)), builtin).
proof_step(2, 55, is(9, max(8, max(9, 6))), builtin).
proof_step(2, 56, is(10, max(8, max(10, 6))), builtin).
proof_step(2, 57, between(0, 6, 0), rule(1, [1])).
proof_step(2, 58, between(1, 6, 1), rule(1, [2])).
proof_step(2, 59, between(2, 6, 2), rule(1, [5])).
proof_step(2, 60, nonoverlap(6, 10, 0, 2), rule(4, [5])).
proof_step(2, 61, nonoverlap(6, 8, 0, 2), rule(4, [5])).
proof_step(2, 62, nonoverlap(0, 2, 6, 9), rule(3, [5])).
proof_step(2, 63, between(3, 6, 3), rule(1, [8])).
proof_step(2, 64, nonoverlap(0, 3, 6, 10), rule(3, [8])).
proof_step(2, 65, nonoverlap(6, 8, 1, 3), rule(4, [8])).
proof_step(2, 66, nonoverlap(1, 3, 6, 9), rule(3, [8])).
proof_step(2, 67, nonoverlap(6, 10, 1, 3), rule(4, [8])).
proof_step(2, 68, between(4, 6, 4), rule(1, [11])).
proof_step(2, 69, nonoverlap(1, 4, 6, 10), rule(3, [11])).
proof_step(2, 70, nonoverlap(6, 8, 2, 4), rule(4, [11])).
proof_step(2, 71, nonoverlap(2, 4, 6, 9), rule(3, [11])).
proof_step(2, 72, between(5, 6, 5), rule(1, [14])).
proof_step(2, 73, nonoverlap(2, 5, 6, 10), rule(3, [14])).
proof_step(2, 74, nonoverlap(6, 10, 3, 5), rule(4, [14])).
proof_step(2, 75, nonoverlap(3, 5, 6, 9), rule(3, [14])).
proof_step(2, 76, nonoverlap(6, 8, 3, 5), rule(4, [14])).
proof_step(2, 77, nonoverlap(6, 8, 2, 5), rule(4, [14])).
proof_step(2, 78, between(6, 6, 6), rule(1, [17])).
proof_step(2, 79, nonoverlap(6, 10, 4, 6), rule(4, [17])).
proof_step(2, 80, nonoverlap(3, 6, 6, 10), rule(3, [17])).
proof_step(2, 81, nonoverlap(4, 6, 6, 9), rule(3, [17])).
proof_step(2, 82, nonoverlap(6, 8, 4, 6), rule(4, [17])).
proof_step(2, 83, nonoverlap(6, 8, 3, 6), rule(4, [17])).
proof_step(2, 84, nonoverlap(0, 3, 3, 7), rule(3, [20])).
proof_step(2, 85, nonoverlap(0, 3, 3, 5), rule(3, [20])).
proof_step(2, 86, nonoverlap(3, 5, 1, 3), rule(4, [20])).
proof_step(2, 87, nonoverlap(3, 6, 1, 3), rule(4, [20])).
proof_step(2, 88, nonoverlap(1, 3, 3, 6), rule(3, [20])).
proof_step(2, 89, nonoverlap(0, 3, 4, 8), rule(3, [21])).
proof_step(2, 90, nonoverlap(0, 3, 4, 6), rule(3, [21])).
proof_step(2, 91, nonoverlap(4, 6, 1, 3), rule(4, [21])).
proof_step(2, 92, nonoverlap(0, 3, 5, 9), rule(3, [22])).
proof_step(2, 93, nonoverlap(5, 7, 1, 3), rule(4, [22])).
proof_step(2, 94, nonoverlap(1, 3, 5, 8), rule(3, [22])).
proof_step(2, 95, nonoverlap(1, 4, 4, 8), rule(3, [23])).
proof_step(2, 96, nonoverlap(1, 4, 4, 6), rule(3, [23])).
proof_step(2, 97, nonoverlap(4, 6, 2, 4), rule(4, [23])).
proof_step(2, 98, nonoverlap(1, 4, 5, 9), rule(3, [24])).
proof_step(2, 99, nonoverlap(5, 7, 2, 4), rule(4, [24])).
proof_step(2, 100, nonoverlap(5, 9, 3, 5), rule(4, [25])).
proof_step(2, 101, nonoverlap(2, 5, 5, 9), rule(3, [25])).
proof_step(2, 102, nonoverlap(5, 7, 3, 5), rule(4, [25])).
proof_step(2, 103, nonoverlap(3, 5, 5, 8), rule(3, [25])).
proof_step(2, 104, nonoverlap(5, 7, 2, 5), rule(4, [25])).
proof_step(2, 105, nonoverlap(5, 7, 0, 2), rule(4, [26])).
proof_step(2, 106, nonoverlap(5, 9, 0, 2), rule(4, [26])).
proof_step(2, 107, nonoverlap(0, 2, 5, 8), rule(3, [26])).
proof_step(2, 108, nonoverlap(4, 6, 0, 2), rule(4, [27])).
proof_step(2, 109, nonoverlap(3, 5, 0, 2), rule(4, [28])).
proof_step(2, 110, nonoverlap(3, 6, 0, 2), rule(4, [28])).
proof_step(2, 111, nonoverlap(0, 2, 3, 6), rule(3, [28])).
proof_step(2, 112, nonoverlap(2, 5, 0, 2), rule(4, [29])).
proof_step(2, 113, nonoverlap(0, 2, 2, 5), rule(3, [29])).
proof_step(2, 114, between(0, 6, 1), rule(2, [3, 4, 58])).
proof_step(2, 115, between(1, 6, 2), rule(2, [6, 7, 59])).
proof_step(2, 116, between(2, 6, 3), rule(2, [9, 10, 63])).
proof_step(2, 117, between(3, 6, 4), rule(2, [12, 13, 68])).
proof_step(2, 118, between(4, 6, 5), rule(2, [15, 16, 72])).
proof_step(2, 119, between(5, 6, 6), rule(2, [18, 19, 78])).
proof_step(2, 120, between(0, 6, 2), rule(2, [3, 4, 115])).
proof_step(2, 121, between(1, 6, 3), rule(2, [6, 7, 116])).
proof_step(2, 122, between(2, 6, 4), rule(2, [9, 10, 117])).
proof_step(2, 123, between(3, 6, 5), rule(2, [12, 13, 118])).
proof_step(2, 124, between(4, 6, 6), rule(2, [15, 16, 119])).
proof_step(2, 125, between(0, 6, 3), rule(2, [3, 4, 121])).
proof_step(2, 126, between(1, 6, 4), rule(2, [6, 7, 122])).
proof_step(2, 127, between(2, 6, 5), rule(2, [9, 10, 123])).
proof_step(2, 128, between(3, 6, 6), rule(2, [12, 13, 124])).
proof_step(2, 129, between(0, 6, 4), rule(2, [3, 4, 126])).
proof_step(2, 130, between(1, 6, 5), rule(2, [6, 7, 127])).
proof_step(2, 131, between(2, 6, 6), rule(2, [9, 10, 128])).
proof_step(2, 132, between(0, 6, 5), rule(2, [3, 4, 130])).
proof_step(2, 133, between(1, 6, 6), rule(2, [6, 7, 131])).
proof_step(
    2,
    134,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 5, 8)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 57, 32, 132, 36, 26, 125, 31, 132, 34, 25, 92, 85, 100,
            109, 103, 107, 37
        ]
    )
).
proof_step(
    2,
    135,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 1, 3),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 5, 8)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 114, 45, 132, 36, 22, 125, 31, 132, 34, 25, 92, 85,
            100, 86, 103, 94, 37
        ]
    )
).
proof_step(
    2,
    136,
    feasible_schedule(
        9,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 5, 7),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 0, 2),
            op(j3_lathe, 2, 5)
        ]
    ),
    rule(
        5,
        [
            120, 47, 132, 51, 25, 57, 32, 132, 36, 26, 57, 32, 120, 47, 29, 101, 112,
            106, 105, 104, 113, 52
        ]
    )
).
proof_step(2, 137, between(0, 6, 6), rule(2, [3, 4, 133])).
proof_step(
    2,
    138,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 5, 8)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 57, 32, 137, 33, 5, 125, 31, 132, 34, 25, 64, 85, 74,
            109, 103, 107, 35
        ]
    )
).
proof_step(
    2,
    139,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 57, 32, 137, 33, 5, 125, 31, 137, 38, 14, 64, 85, 74,
            109, 75, 62, 39
        ]
    )
).
proof_step(
    2,
    140,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 57, 32, 137, 33, 5, 125, 31, 137, 38, 14, 64, 85, 74,
            108, 81, 62, 41
        ]
    )
).
proof_step(
    2,
    141,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 57, 32, 137, 33, 5, 129, 40, 137, 38, 17, 64, 90, 79,
            109, 75, 62, 39
        ]
    )
).
proof_step(
    2,
    142,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 57, 32, 137, 33, 5, 129, 40, 137, 38, 17, 64, 90, 79,
            108, 81, 62, 41
        ]
    )
).
proof_step(
    2,
    143,
    feasible_schedule(
        10,
        [
            op(j1_mill, 1, 4),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            114, 42, 129, 40, 23, 57, 32, 137, 33, 5, 129, 40, 137, 38, 17, 69, 96, 79,
            108, 81, 62, 41
        ]
    )
).
proof_step(
    2,
    144,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 57, 32, 132, 36, 26, 125, 31, 137, 38, 14, 92, 85, 100,
            108, 81, 62, 43
        ]
    )
).
proof_step(
    2,
    145,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 57, 32, 132, 36, 26, 125, 31, 137, 38, 14, 92, 85, 100,
            109, 75, 62, 44
        ]
    )
).
proof_step(
    2,
    146,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 5, 8)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 114, 45, 137, 33, 8, 125, 31, 132, 34, 25, 64, 85, 74,
            86, 103, 94, 35
        ]
    )
).
proof_step(
    2,
    147,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 114, 45, 137, 33, 8, 125, 31, 137, 38, 14, 64, 85, 74,
            86, 75, 66, 39
        ]
    )
).
proof_step(
    2,
    148,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 114, 45, 137, 33, 8, 125, 31, 137, 38, 14, 64, 85, 74,
            91, 81, 66, 41
        ]
    )
).
proof_step(
    2,
    149,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 114, 45, 137, 33, 8, 129, 40, 137, 38, 17, 64, 90, 79,
            86, 75, 66, 39
        ]
    )
).
proof_step(
    2,
    150,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 114, 45, 137, 33, 8, 129, 40, 137, 38, 17, 64, 90, 79,
            91, 81, 66, 41
        ]
    )
).
proof_step(
    2,
    151,
    feasible_schedule(
        10,
        [
            op(j1_mill, 1, 4),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            114, 42, 129, 40, 23, 114, 45, 137, 33, 8, 129, 40, 137, 38, 17, 69, 96, 79,
            91, 81, 66, 41
        ]
    )
).
proof_step(
    2,
    152,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 1, 3),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 114, 45, 132, 36, 22, 125, 31, 137, 38, 14, 92, 85,
            100, 91, 81, 66, 43
        ]
    )
).
proof_step(
    2,
    153,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 1, 3),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 125, 31, 20, 114, 45, 132, 36, 22, 125, 31, 137, 38, 14, 92, 85,
            100, 86, 75, 66, 44
        ]
    )
).
proof_step(
    2,
    154,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 2, 4),
            op(j2_mill, 6, 10),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 120, 46, 137, 33, 11, 125, 31, 137, 38, 14, 64, 85, 74,
            97, 81, 71, 41
        ]
    )
).
proof_step(
    2,
    155,
    feasible_schedule(
        10,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 2, 4),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 120, 46, 137, 33, 11, 129, 40, 137, 38, 17, 64, 90, 79,
            97, 81, 71, 41
        ]
    )
).
proof_step(
    2,
    156,
    feasible_schedule(
        10,
        [
            op(j1_mill, 1, 4),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 2, 4),
            op(j2_mill, 6, 10),
            op(j3_mill, 4, 6),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            114, 42, 129, 40, 23, 120, 46, 137, 33, 11, 129, 40, 137, 38, 17, 69, 96,
            79, 97, 81, 71, 41
        ]
    )
).
proof_step(
    2,
    157,
    feasible_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 4, 6),
            op(j2_lathe, 2, 4),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 6, 9)
        ]
    ),
    rule(
        5,
        [
            57, 30, 129, 40, 21, 120, 46, 132, 36, 24, 125, 31, 137, 38, 14, 92, 85,
            100, 97, 81, 71, 43
        ]
    )
).
proof_step(
    2,
    158,
    feasible_schedule(
        9,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 0, 2),
            op(j3_lathe, 2, 5)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 57, 32, 132, 36, 26, 57, 32, 120, 47, 29, 101, 112,
            106, 61, 77, 113, 49
        ]
    )
).
proof_step(
    2,
    159,
    feasible_schedule(
        10,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 2, 5)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 57, 32, 137, 33, 5, 57, 32, 120, 47, 29, 73, 112, 60,
            61, 77, 113, 50
        ]
    )
).
proof_step(
    2,
    160,
    feasible_schedule(
        10,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 5, 7),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 2, 5)
        ]
    ),
    rule(
        5,
        [
            120, 47, 132, 51, 25, 57, 32, 137, 33, 5, 57, 32, 120, 47, 29, 73, 112, 60,
            105, 104, 113, 53
        ]
    )
).
proof_step(
    2,
    161,
    feasible_schedule(
        10,
        [
            op(j1_mill, 3, 6),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 2, 5)
        ]
    ),
    rule(
        5,
        [
            125, 54, 137, 48, 17, 57, 32, 137, 33, 5, 57, 32, 120, 47, 29, 80, 110, 60,
            61, 77, 113, 50
        ]
    )
).
proof_step(
    2,
    162,
    feasible_schedule(
        9,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 57, 32, 132, 36, 26, 57, 32, 125, 54, 28, 101, 112,
            106, 61, 83, 111, 55
        ]
    )
).
proof_step(
    2,
    163,
    feasible_schedule(
        10,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 57, 32, 137, 33, 5, 57, 32, 125, 54, 28, 73, 112, 60,
            61, 83, 111, 56
        ]
    )
).
proof_step(
    2,
    164,
    feasible_schedule(
        10,
        [
            op(j1_mill, 3, 6),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            125, 54, 137, 48, 17, 57, 32, 137, 33, 5, 57, 32, 125, 54, 28, 80, 110, 60,
            61, 83, 111, 56
        ]
    )
).
proof_step(
    2,
    165,
    feasible_schedule(
        9,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 1, 3),
            op(j2_mill, 5, 9),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 114, 45, 132, 36, 22, 57, 32, 125, 54, 28, 101, 112,
            106, 65, 83, 88, 55
        ]
    )
).
proof_step(
    2,
    166,
    feasible_schedule(
        10,
        [
            op(j1_mill, 2, 5),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            120, 47, 137, 48, 14, 114, 45, 137, 33, 8, 57, 32, 125, 54, 28, 73, 112, 60,
            65, 83, 88, 56
        ]
    )
).
proof_step(
    2,
    167,
    feasible_schedule(
        10,
        [
            op(j1_mill, 3, 6),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 0, 2),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            125, 54, 137, 48, 17, 114, 45, 137, 33, 8, 57, 32, 125, 54, 28, 80, 110, 60,
            65, 83, 88, 56
        ]
    )
).
proof_step(
    2,
    168,
    feasible_schedule(
        10,
        [
            op(j1_mill, 3, 6),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 0, 2),
            op(j2_mill, 6, 10),
            op(j3_mill, 1, 3),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            125, 54, 137, 48, 17, 57, 32, 137, 33, 5, 114, 45, 125, 54, 20, 80, 87, 67,
            61, 83, 111, 56
        ]
    )
).
proof_step(
    2,
    169,
    feasible_schedule(
        10,
        [
            op(j1_mill, 3, 6),
            op(j1_lathe, 6, 8),
            op(j2_lathe, 1, 3),
            op(j2_mill, 6, 10),
            op(j3_mill, 1, 3),
            op(j3_lathe, 3, 6)
        ]
    ),
    rule(
        5,
        [
            125, 54, 137, 48, 17, 114, 45, 137, 33, 8, 114, 45, 125, 54, 20, 80, 87, 67,
            65, 83, 88, 56
        ]
    )
).
proof_step(2, 170, '$aggregate:r6:1'([], 9), aggregate(rule(6), 1, 1)).
proof_step(
    2,
    171,
    best_schedule(
        9,
        [
            op(j1_mill, 0, 3),
            op(j1_lathe, 3, 5),
            op(j2_lathe, 0, 2),
            op(j2_mill, 5, 9),
            op(j3_mill, 3, 5),
            op(j3_lathe, 5, 8)
        ]
    ),
    rule(6, [170, 134])
).
proof_step(2, 172, job_shop_answer(best_makespan, 9), rule(7, [171])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 57, 169).
proof_boundary_call(2, 1, between(0, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(1, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(2, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(3, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(4, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(5, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(6, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, nonoverlap(0, 2, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(0, 2, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(0, 2, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(0, 2, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 2, 6)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 3, 7)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 4, 8)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 5, 9)).
proof_boundary_call(2, 1, nonoverlap(0, 3, 6, 10)).
proof_boundary_call(2, 1, nonoverlap(1, 3, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(1, 3, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(1, 3, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(1, 3, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 2, 6)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 3, 7)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 4, 8)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 5, 9)).
proof_boundary_call(2, 1, nonoverlap(1, 4, 6, 10)).
proof_boundary_call(2, 1, nonoverlap(2, 4, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(2, 4, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(2, 4, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 2, 6)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 3, 7)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 4, 8)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 5, 9)).
proof_boundary_call(2, 1, nonoverlap(2, 5, 6, 10)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(3, 5, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 2, 6)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 3, 7)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 4, 8)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 5, 9)).
proof_boundary_call(2, 1, nonoverlap(3, 6, 6, 10)).
proof_boundary_call(2, 1, nonoverlap(3, 7, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(3, 7, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(4, 6, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(4, 8, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(4, 8, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 4, 7)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(5, 7, 6, 9)).
proof_boundary_call(2, 1, nonoverlap(5, 9, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(5, 9, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(5, 9, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(6, 10, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(6, 10, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(6, 10, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(6, 10, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 0, 2)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 1, 3)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 2, 4)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 2, 5)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 3, 5)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 3, 6)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 4, 6)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 4, 7)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 5, 8)).
proof_boundary_call(2, 1, nonoverlap(6, 8, 6, 9)).
proof_claim(2, answer(2, [172])).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
