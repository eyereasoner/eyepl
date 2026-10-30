% Answer 1
ripple_report(demo, 0.20833333, 0.35984848, 0.00191409).

% Reason 1
proof_step(1, 1, converter(demo, 24.0, 5.0, 2.0, 500000.0, 2.2e-5, 4.7e-5), source(1)).
proof_step(1, 2, '>'(24.0, 5.0), builtin).
proof_step(1, 3, '>'(5.0, 0), builtin).
proof_step(1, 4, '>'(2.0, 0), builtin).
proof_step(1, 5, '>'(500000.0, 0), builtin).
proof_step(1, 6, '>'(2.2e-5, 0), builtin).
proof_step(1, 7, '>'(4.7e-5, 0), builtin).
proof_step(1, 8, is(0.20833333333333334, '/'(5.0, 24.0)), builtin).
proof_step(
    1,
    9,
    is(
        0.35984848484848486,
        '/'('*'('-'(24.0, 5.0), 0.20833333333333334), '*'(2.2e-5, 500000.0))
    ),
    builtin
).
proof_step(1, 10, '<'(0.35984848484848486, '*'(2, 2.0)), builtin).
proof_step(1, 11, is(0.17992424242424243, '/'(0.35984848484848486, 2.0)), builtin).
proof_step(
    1,
    12,
    is(0.0019140876853642812, '/'(0.35984848484848486, '*'('*'(8, 500000.0), 4.7e-5))),
    builtin
).
proof_step(
    1,
    13,
    ripple(
        demo,
        0.20833333333333334,
        0.35984848484848486,
        0.17992424242424243,
        0.0019140876853642812
    ),
    rule(1, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
).
proof_step(
    1,
    14,
    is(0.20833333, '/'(round('*'(0.20833333333333334, 100000000)), 100000000)),
    builtin
).
proof_step(
    1,
    15,
    is(0.35984848, '/'(round('*'(0.35984848484848486, 100000000)), 100000000)),
    builtin
).
proof_step(
    1,
    16,
    is(0.00191409, '/'(round('*'(0.0019140876853642812, 100000000)), 100000000)),
    builtin
).
proof_step(
    1,
    17,
    ripple_report(demo, 0.20833333, 0.35984848, 0.00191409),
    rule(3, [13, 14, 15, 16])
).
proof_claim(1, answer(1, [17])).

% Answer 2
within_ripple_limits(demo).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).
