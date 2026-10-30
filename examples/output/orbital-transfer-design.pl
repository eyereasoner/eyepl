% Answer 1
transfer_report(earth_mars, 5.593588, 258.865827).

% Reason 1
proof_step(
    1,
    1,
    transfer(earth_mars, 132712440018.0, 149597870.7, 227939200.0),
    source(1)
).
proof_step(1, 2, '>'(132712440018.0, 0), builtin).
proof_step(1, 3, '>'(149597870.7, 0), builtin).
proof_step(1, 4, '>'(227939200.0, 0), builtin).
proof_step(1, 5, is(188768535.35, '/'('+'(149597870.7, 227939200.0), 2)), builtin).
proof_step(
    1,
    6,
    is(
        2.9446911328430403,
        abs('-'(
            sqrt('*'(132712440018.0, '-'('/'(2, 149597870.7), '/'(1, 188768535.35)))),
            sqrt('/'(132712440018.0, 149597870.7))
        ))
    ),
    builtin
).
proof_step(
    1,
    7,
    is(
        2.6488967223855973,
        abs('-'(
            sqrt('/'(132712440018.0, 227939200.0)),
            sqrt('*'(132712440018.0, '-'('/'(2, 227939200.0), '/'(1, 188768535.35))))
        ))
    ),
    builtin
).
proof_step(
    1,
    8,
    is(
        258.865826767963,
        '/'('*'(pi, sqrt('/'('**'(188768535.35, 3), 132712440018.0))), 86400)
    ),
    builtin
).
proof_step(
    1,
    9,
    hohmann(earth_mars, 2.9446911328430403, 2.6488967223855973, 258.865826767963),
    rule(1, [1, 2, 3, 4, 5, 6, 7, 8])
).
proof_step(
    1,
    10,
    is(
        5.593588,
        '/'(round('*'('+'(2.9446911328430403, 2.6488967223855973), 1000000)), 1000000)
    ),
    builtin
).
proof_step(
    1,
    11,
    is(258.865827, '/'(round('*'(258.865826767963, 1000000)), 1000000)),
    builtin
).
proof_step(
    1,
    12,
    transfer_report(earth_mars, 5.593588, 258.865827),
    rule(2, [9, 10, 11])
).
proof_claim(1, answer(1, [12])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).
