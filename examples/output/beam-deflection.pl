% Answer 1
deflection_mm(demo, 3.90625).

% Reason 1
proof_step(1, 1, beam(demo, 1200.0, 2.5, 200000000000.0, 8e-6, 5.0), source(1)).
proof_step(1, 2, '>='(1200.0, 0), builtin).
proof_step(1, 3, '>'(2.5, 0), builtin).
proof_step(1, 4, '>'(200000000000.0, 0), builtin).
proof_step(1, 5, '>'(8e-6, 0), builtin).
proof_step(
    1,
    6,
    is(
        3.90625,
        '/'('*'('*'(1000, 1200.0), '**'(2.5, 3)), '*'('*'(3, 200000000000.0), 8e-6))
    ),
    builtin
).
proof_step(1, 7, deflection_mm(demo, 3.90625), rule(1, [1, 2, 3, 4, 5, 6])).
proof_claim(1, answer(1, [7])).

% Answer 2
within_limit(demo).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
