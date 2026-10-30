% Answer 1
easter(2021, [4, 4]).
easter(2022, [4, 17]).
easter(2023, [4, 9]).
easter(2024, [3, 31]).
easter(2025, [4, 20]).
easter(2026, [4, 5]).
easter(2027, [3, 28]).
easter(2028, [4, 16]).
easter(2029, [4, 1]).
easter(2030, [4, 21]).
easter(2031, [4, 13]).
easter(2032, [3, 28]).
easter(2033, [4, 17]).
easter(2034, [4, 9]).
easter(2035, [3, 25]).
easter(2036, [4, 13]).
easter(2037, [4, 5]).
easter(2038, [4, 25]).
easter(2039, [4, 10]).
easter(2040, [4, 1]).
easter(2041, [4, 21]).
easter(2042, [4, 6]).
easter(2043, [3, 29]).
easter(2044, [4, 17]).
easter(2045, [4, 9]).
easter(2046, [3, 25]).
easter(2047, [4, 14]).
easter(2048, [4, 5]).
easter(2049, [4, 18]).
easter(2050, [4, 10]).

% Answer 2
easter(2026, [4, 5]).

% Reason 2
proof_step(2, 1, '<'(2021, 2050), builtin).
proof_step(2, 2, is(2022, '+'(2021, 1)), builtin).
proof_step(2, 3, '<'(2022, 2050), builtin).
proof_step(2, 4, is(2023, '+'(2022, 1)), builtin).
proof_step(2, 5, '<'(2023, 2050), builtin).
proof_step(2, 6, is(2024, '+'(2023, 1)), builtin).
proof_step(2, 7, '<'(2024, 2050), builtin).
proof_step(2, 8, is(2025, '+'(2024, 1)), builtin).
proof_step(2, 9, '=<'(2026, 2050), builtin).
proof_step(2, 10, '<'(2025, 2050), builtin).
proof_step(2, 11, is(2026, '+'(2025, 1)), builtin).
proof_step(2, 12, is(12, rem(2026, 19)), builtin).
proof_step(2, 13, is(20, '//'(2026, 100)), builtin).
proof_step(2, 14, is(26, rem(2026, 100)), builtin).
proof_step(
    2,
    15,
    is(
        12,
        rem(
            '+'(
                '-'(
                    '-'('+'('*'(19, 12), 20), '//'(20, 4)),
                    '//'('+'('-'(20, '//'('+'(20, 8), 25)), 1), 3)
                ),
                15
            ),
            30
        )
    ),
    builtin
).
proof_step(
    2,
    16,
    is(
        2,
        rem(
            '-'(
                '-'('+'('+'(32, '*'(2, rem(20, 4))), '*'(2, '//'(26, 4))), 12),
                rem(26, 4)
            ),
            7
        )
    ),
    builtin
).
proof_step(
    2,
    17,
    is(
        128,
        '+'(
            '-'('+'(12, 2), '*'(7, '//'('+'('+'(12, '*'(11, 12)), '*'(22, 2)), 451))),
            114
        )
    ),
    builtin
).
proof_step(2, 18, is(4, '//'(128, 31)), builtin).
proof_step(2, 19, is(5, '+'(rem(128, 31), 1)), builtin).
proof_step(2, 20, in_range(2026, 2050, 2026), rule(2, [9])).
proof_step(2, 21, computus(2026, [4, 5]), rule(1, [12, 13, 14, 15, 16, 17, 18, 19])).
proof_step(2, 22, in_range(2025, 2050, 2026), rule(3, [10, 11, 20])).
proof_step(2, 23, in_range(2024, 2050, 2026), rule(3, [7, 8, 22])).
proof_step(2, 24, in_range(2023, 2050, 2026), rule(3, [5, 6, 23])).
proof_step(2, 25, in_range(2022, 2050, 2026), rule(3, [3, 4, 24])).
proof_step(2, 26, in_range(2021, 2050, 2026), rule(3, [1, 2, 25])).
proof_step(2, 27, easter(2026, [4, 5]), rule(4, [26, 21])).
proof_claim(2, answer(2, [27])).

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

% Goal check 9
check_result(9, true).
