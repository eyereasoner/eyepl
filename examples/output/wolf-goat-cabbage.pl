% Answer 1
solution([goat, nothing, wolf, goat, cabbage, nothing, goat], 7).
solution([goat, nothing, cabbage, goat, wolf, nothing, goat], 7).

% Answer 2
solution([goat, nothing, wolf, goat, cabbage, nothing, goat], 7).

% Reason 2
proof_step(2, 1, side(west), source(1)).
proof_step(2, 2, side(east), source(2)).
proof_step(2, 3, change(west, east), source(3)).
proof_step(2, 4, change(east, west), source(4)).
proof_step(2, 5, '='(east, east), builtin).
proof_step(2, 6, '\\='(west, east), builtin).
proof_step(2, 7, '='(west, west), builtin).
proof_step(2, 8, '\\='(east, west), builtin).
proof_step(
    2,
    9,
    member(state(west, west, west, west), [state(west, west, west, west)]),
    rule(9, [])
).
proof_step(
    2,
    10,
    member(
        state(east, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    ),
    rule(9, [])
).
proof_step(
    2,
    11,
    member(
        state(west, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    12,
    member(
        state(east, east, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    13,
    member(
        state(east, west, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    14,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    15,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    16,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    17,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    18,
    crossings(
        state(east, east, east, east),
        state(east, east, east, east),
        [
            state(east, east, east, east),
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [state(east, east, east, east)],
        [],
        0
    ),
    rule(11, [])
).
proof_step(
    2,
    19,
    crossings(
        state(east, east, east, east),
        state(east, east, east, east),
        [
            state(east, east, east, east),
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [state(east, east, east, east)],
        [],
        0
    ),
    rule(11, [])
).
proof_step(
    2,
    20,
    '\\='(state(west, east, west, east), state(east, east, east, east)),
    builtin
).
proof_step(2, 21, is(1, '+'(0, 1)), builtin).
proof_step(
    2,
    22,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    23,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(9, [])
).
proof_step(
    2,
    24,
    '\\='(state(east, east, west, east), state(east, east, east, east)),
    builtin
).
proof_step(2, 25, is(2, '+'(1, 1)), builtin).
proof_step(
    2,
    26,
    '\\='(state(west, east, west, west), state(east, east, east, east)),
    builtin
).
proof_step(2, 27, is(3, '+'(2, 1)), builtin).
proof_step(
    2,
    28,
    '\\='(state(west, west, west, east), state(east, east, east, east)),
    builtin
).
proof_step(
    2,
    29,
    '\\='(state(east, east, east, west), state(east, east, east, east)),
    builtin
).
proof_step(2, 30, is(4, '+'(3, 1)), builtin).
proof_step(
    2,
    31,
    '\\='(state(east, west, east, east), state(east, east, east, east)),
    builtin
).
proof_step(
    2,
    32,
    '\\='(state(west, west, east, west), state(east, east, east, east)),
    builtin
).
proof_step(2, 33, is(5, '+'(4, 1)), builtin).
proof_step(
    2,
    34,
    '\\='(state(east, west, east, west), state(east, east, east, east)),
    builtin
).
proof_step(2, 35, is(6, '+'(5, 1)), builtin).
proof_step(
    2,
    36,
    '\\='(state(west, west, west, west), state(east, east, east, east)),
    builtin
).
proof_step(2, 37, is(7, '+'(6, 1)), builtin).
proof_step(
    2,
    38,
    move(state(west, west, west, west), wolf, state(east, east, west, west)),
    rule(4, [3])
).
proof_step(
    2,
    39,
    move(state(west, west, west, west), goat, state(east, west, east, west)),
    rule(5, [3])
).
proof_step(
    2,
    40,
    move(state(west, west, west, west), cabbage, state(east, west, west, east)),
    rule(6, [3])
).
proof_step(
    2,
    41,
    move(state(west, west, west, west), nothing, state(east, west, west, west)),
    rule(7, [3])
).
proof_step(
    2,
    42,
    move(state(west, west, west, east), wolf, state(east, east, west, east)),
    rule(4, [3])
).
proof_step(
    2,
    43,
    move(state(west, west, west, east), goat, state(east, west, east, east)),
    rule(5, [3])
).
proof_step(
    2,
    44,
    move(state(west, west, west, east), nothing, state(east, west, west, east)),
    rule(7, [3])
).
proof_step(
    2,
    45,
    move(state(west, west, east, west), wolf, state(east, east, east, west)),
    rule(4, [3])
).
proof_step(
    2,
    46,
    move(state(west, west, east, west), cabbage, state(east, west, east, east)),
    rule(6, [3])
).
proof_step(
    2,
    47,
    move(state(west, west, east, west), nothing, state(east, west, east, west)),
    rule(7, [3])
).
proof_step(
    2,
    48,
    move(state(west, east, west, west), goat, state(east, east, east, west)),
    rule(5, [3])
).
proof_step(
    2,
    49,
    move(state(west, east, west, west), cabbage, state(east, east, west, east)),
    rule(6, [3])
).
proof_step(
    2,
    50,
    move(state(west, east, west, west), nothing, state(east, east, west, west)),
    rule(7, [3])
).
proof_step(
    2,
    51,
    move(state(west, east, west, east), goat, state(east, east, east, east)),
    rule(5, [3])
).
proof_step(
    2,
    52,
    move(state(west, east, west, east), nothing, state(east, east, west, east)),
    rule(7, [3])
).
proof_step(
    2,
    53,
    move(state(east, west, east, west), goat, state(west, west, west, west)),
    rule(5, [4])
).
proof_step(
    2,
    54,
    move(state(east, west, east, west), nothing, state(west, west, east, west)),
    rule(7, [4])
).
proof_step(
    2,
    55,
    move(state(east, west, east, east), goat, state(west, west, west, east)),
    rule(5, [4])
).
proof_step(
    2,
    56,
    move(state(east, west, east, east), cabbage, state(west, west, east, west)),
    rule(6, [4])
).
proof_step(
    2,
    57,
    move(state(east, west, east, east), nothing, state(west, west, east, east)),
    rule(7, [4])
).
proof_step(
    2,
    58,
    move(state(east, east, west, east), wolf, state(west, west, west, east)),
    rule(4, [4])
).
proof_step(
    2,
    59,
    move(state(east, east, west, east), cabbage, state(west, east, west, west)),
    rule(6, [4])
).
proof_step(
    2,
    60,
    move(state(east, east, west, east), nothing, state(west, east, west, east)),
    rule(7, [4])
).
proof_step(
    2,
    61,
    move(state(east, east, east, west), wolf, state(west, west, east, west)),
    rule(4, [4])
).
proof_step(
    2,
    62,
    move(state(east, east, east, west), goat, state(west, east, west, west)),
    rule(5, [4])
).
proof_step(
    2,
    63,
    move(state(east, east, east, west), nothing, state(west, east, east, west)),
    rule(7, [4])
).
proof_step(
    2,
    64,
    move(state(east, east, east, east), wolf, state(west, west, east, east)),
    rule(4, [4])
).
proof_step(
    2,
    65,
    move(state(east, east, east, east), goat, state(west, east, west, east)),
    rule(5, [4])
).
proof_step(
    2,
    66,
    move(state(east, east, east, east), cabbage, state(west, east, east, west)),
    rule(6, [4])
).
proof_step(
    2,
    67,
    move(state(east, east, east, east), nothing, state(west, east, east, east)),
    rule(7, [4])
).
proof_step(2, 68, unsafe(state(west, east, east, west)), rule(1, [1, 2, 2, 1, 5, 6])).
proof_step(2, 69, unsafe(state(west, east, east, east)), rule(1, [1, 2, 2, 2, 5, 6])).
proof_step(2, 70, unsafe(state(west, west, east, east)), rule(2, [1, 1, 2, 2, 5, 6])).
proof_step(2, 71, unsafe(state(east, west, west, west)), rule(1, [2, 1, 1, 1, 7, 8])).
proof_step(2, 72, unsafe(state(east, west, west, east)), rule(1, [2, 1, 1, 2, 7, 8])).
proof_step(2, 73, unsafe(state(east, east, west, west)), rule(2, [2, 2, 1, 1, 7, 8])).
proof_step(
    2,
    74,
    member(
        state(west, west, west, west),
        [state(east, west, east, west), state(west, west, west, west)]
    ),
    rule(10, [9])
).
proof_step(
    2,
    75,
    member(
        state(east, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [10])
).
proof_step(
    2,
    76,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [11])
).
proof_step(
    2,
    77,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [11])
).
proof_step(
    2,
    78,
    member(
        state(east, east, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [12])
).
proof_step(
    2,
    79,
    member(
        state(east, west, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [13])
).
proof_step(
    2,
    80,
    member(
        state(west, east, west, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [14])
).
proof_step(
    2,
    81,
    member(
        state(west, west, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [15])
).
proof_step(
    2,
    82,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [16])
).
proof_step(
    2,
    83,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [16])
).
proof_step(
    2,
    84,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [17])
).
proof_step(
    2,
    85,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [17])
).
proof_step(
    2,
    86,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [22])
).
proof_step(
    2,
    87,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [23])
).
proof_step(
    2,
    88,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [76])
).
proof_step(
    2,
    89,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [77])
).
proof_step(
    2,
    90,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [88])
).
proof_step(
    2,
    91,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [89])
).
proof_step(
    2,
    92,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [90])
).
proof_step(
    2,
    93,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [91])
).
proof_step(
    2,
    94,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [92])
).
proof_step(
    2,
    95,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    rule(10, [93])
).
proof_step(2, 96, unsafe(state(west, west, west, west)), absent(1)).
proof_step(2, 97, unsafe(state(west, west, west, east)), absent(1)).
proof_step(2, 98, unsafe(state(west, west, east, west)), absent(1)).
proof_step(2, 99, unsafe(state(west, east, west, west)), absent(1)).
proof_step(2, 100, unsafe(state(west, east, west, east)), absent(1)).
proof_step(2, 101, unsafe(state(east, west, east, west)), absent(1)).
proof_step(2, 102, unsafe(state(east, west, east, east)), absent(1)).
proof_step(2, 103, unsafe(state(east, east, west, east)), absent(1)).
proof_step(2, 104, unsafe(state(east, east, east, west)), absent(1)).
proof_step(2, 105, unsafe(state(east, east, east, east)), absent(1)).
proof_step(
    2,
    106,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    107,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    108,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    109,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    110,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    111,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    112,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    113,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    114,
    member(
        state(east, east, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    115,
    member(
        state(east, west, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    ),
    absent(1)
).
proof_step(
    2,
    116,
    member(
        state(west, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    ),
    absent(1)
).
proof_step(
    2,
    117,
    member(state(east, west, east, west), [state(west, west, west, west)]),
    absent(1)
).
proof_step(2, 118, safe(state(west, west, west, west)), rule(3, [1, 1, 1, 1, 96])).
proof_step(2, 119, safe(state(west, west, west, east)), rule(3, [1, 1, 1, 2, 97])).
proof_step(2, 120, safe(state(west, west, east, west)), rule(3, [1, 1, 2, 1, 98])).
proof_step(2, 121, safe(state(west, east, west, west)), rule(3, [1, 2, 1, 1, 99])).
proof_step(2, 122, safe(state(west, east, west, east)), rule(3, [1, 2, 1, 2, 100])).
proof_step(2, 123, safe(state(east, west, east, west)), rule(3, [2, 1, 2, 1, 101])).
proof_step(2, 124, safe(state(east, west, east, east)), rule(3, [2, 1, 2, 2, 102])).
proof_step(2, 125, safe(state(east, east, west, east)), rule(3, [2, 2, 1, 2, 103])).
proof_step(2, 126, safe(state(east, east, east, west)), rule(3, [2, 2, 2, 1, 104])).
proof_step(2, 127, safe(state(east, east, east, east)), rule(3, [2, 2, 2, 2, 105])).
proof_step(
    2,
    128,
    crossing(state(west, west, west, west), goat, state(east, west, east, west)),
    rule(8, [118, 39, 123])
).
proof_step(
    2,
    129,
    crossing(state(west, west, east, west), nothing, state(east, west, east, west)),
    rule(8, [120, 47, 123])
).
proof_step(
    2,
    130,
    crossing(state(east, west, east, west), goat, state(west, west, west, west)),
    rule(8, [123, 53, 118])
).
proof_step(
    2,
    131,
    crossing(state(east, west, east, west), nothing, state(west, west, east, west)),
    rule(8, [123, 54, 120])
).
proof_step(
    2,
    132,
    crossing(state(west, west, west, east), goat, state(east, west, east, east)),
    rule(8, [119, 43, 124])
).
proof_step(
    2,
    133,
    crossing(state(west, west, east, west), cabbage, state(east, west, east, east)),
    rule(8, [120, 46, 124])
).
proof_step(
    2,
    134,
    crossing(state(east, west, east, east), goat, state(west, west, west, east)),
    rule(8, [124, 55, 119])
).
proof_step(
    2,
    135,
    crossing(state(east, west, east, east), cabbage, state(west, west, east, west)),
    rule(8, [124, 56, 120])
).
proof_step(
    2,
    136,
    crossing(state(west, west, west, east), wolf, state(east, east, west, east)),
    rule(8, [119, 42, 125])
).
proof_step(
    2,
    137,
    crossing(state(west, east, west, west), cabbage, state(east, east, west, east)),
    rule(8, [121, 49, 125])
).
proof_step(
    2,
    138,
    crossing(state(west, east, west, east), nothing, state(east, east, west, east)),
    rule(8, [122, 52, 125])
).
proof_step(
    2,
    139,
    crossing(state(east, east, west, east), wolf, state(west, west, west, east)),
    rule(8, [125, 58, 119])
).
proof_step(
    2,
    140,
    crossing(state(east, east, west, east), cabbage, state(west, east, west, west)),
    rule(8, [125, 59, 121])
).
proof_step(
    2,
    141,
    crossing(state(east, east, west, east), nothing, state(west, east, west, east)),
    rule(8, [125, 60, 122])
).
proof_step(
    2,
    142,
    crossing(state(west, west, east, west), wolf, state(east, east, east, west)),
    rule(8, [120, 45, 126])
).
proof_step(
    2,
    143,
    crossing(state(west, east, west, west), goat, state(east, east, east, west)),
    rule(8, [121, 48, 126])
).
proof_step(
    2,
    144,
    crossing(state(east, east, east, west), wolf, state(west, west, east, west)),
    rule(8, [126, 61, 120])
).
proof_step(
    2,
    145,
    crossing(state(east, east, east, west), goat, state(west, east, west, west)),
    rule(8, [126, 62, 121])
).
proof_step(
    2,
    146,
    crossing(state(west, east, west, east), goat, state(east, east, east, east)),
    rule(8, [122, 51, 127])
).
proof_step(
    2,
    147,
    crossing(state(east, east, east, east), goat, state(west, east, west, east)),
    rule(8, [127, 65, 122])
).
proof_step(
    2,
    148,
    crossings(
        state(west, east, west, east),
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [state(west, east, west, east), state(east, east, east, east)],
        [goat],
        1
    ),
    rule(12, [20, 146, 106, 18, 21])
).
proof_step(
    2,
    149,
    crossings(
        state(west, east, west, east),
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [state(west, east, west, east), state(east, east, east, east)],
        [goat],
        1
    ),
    rule(12, [20, 146, 107, 19, 21])
).
proof_step(
    2,
    150,
    crossings(
        state(east, east, west, east),
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [nothing, goat],
        2
    ),
    rule(12, [24, 141, 108, 148, 25])
).
proof_step(
    2,
    151,
    crossings(
        state(east, east, west, east),
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [nothing, goat],
        2
    ),
    rule(12, [24, 141, 109, 149, 25])
).
proof_step(
    2,
    152,
    crossings(
        state(west, east, west, west),
        state(east, east, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [cabbage, nothing, goat],
        3
    ),
    rule(12, [26, 137, 110, 150, 27])
).
proof_step(
    2,
    153,
    crossings(
        state(west, west, west, east),
        state(east, east, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [wolf, nothing, goat],
        3
    ),
    rule(12, [28, 136, 111, 151, 27])
).
proof_step(
    2,
    154,
    crossings(
        state(east, east, east, west),
        state(east, east, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, cabbage, nothing, goat],
        4
    ),
    rule(12, [29, 145, 112, 152, 30])
).
proof_step(
    2,
    155,
    crossings(
        state(east, west, east, east),
        state(east, east, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, wolf, nothing, goat],
        4
    ),
    rule(12, [31, 134, 113, 153, 30])
).
proof_step(
    2,
    156,
    crossings(
        state(west, west, east, west),
        state(east, east, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(west, west, east, west),
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [wolf, goat, cabbage, nothing, goat],
        5
    ),
    rule(12, [32, 142, 114, 154, 33])
).
proof_step(
    2,
    157,
    crossings(
        state(west, west, east, west),
        state(east, east, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        [
            state(west, west, east, west),
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [cabbage, goat, wolf, nothing, goat],
        5
    ),
    rule(12, [32, 133, 115, 155, 33])
).
proof_step(
    2,
    158,
    crossings(
        state(east, west, east, west),
        state(east, east, east, east),
        [state(east, west, east, west), state(west, west, west, west)],
        [
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [nothing, wolf, goat, cabbage, nothing, goat],
        6
    ),
    rule(12, [34, 131, 116, 156, 35])
).
proof_step(
    2,
    159,
    crossings(
        state(east, west, east, west),
        state(east, east, east, east),
        [state(east, west, east, west), state(west, west, west, west)],
        [
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [nothing, cabbage, goat, wolf, nothing, goat],
        6
    ),
    rule(12, [34, 131, 116, 157, 35])
).
proof_step(
    2,
    160,
    crossings(
        state(west, west, west, west),
        state(east, east, east, east),
        [state(west, west, west, west)],
        [
            state(west, west, west, west),
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, nothing, wolf, goat, cabbage, nothing, goat],
        7
    ),
    rule(12, [36, 128, 117, 158, 37])
).
proof_step(
    2,
    161,
    crossings(
        state(west, west, west, west),
        state(east, east, east, east),
        [state(west, west, west, west)],
        [
            state(west, west, west, west),
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, nothing, cabbage, goat, wolf, nothing, goat],
        7
    ),
    rule(12, [36, 128, 117, 159, 37])
).
proof_step(
    2,
    162,
    route(
        [
            state(west, west, west, west),
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, nothing, wolf, goat, cabbage, nothing, goat],
        7
    ),
    rule(13, [160])
).
proof_step(
    2,
    163,
    route(
        [
            state(west, west, west, west),
            state(east, west, east, west),
            state(west, west, east, west),
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, east),
            state(east, east, east, east)
        ],
        [goat, nothing, cabbage, goat, wolf, nothing, goat],
        7
    ),
    rule(13, [161])
).
proof_step(2, 164, '$aggregate:r14:1'([], 7), aggregate(rule(14), 1, 2)).
proof_step(
    2,
    165,
    solution([goat, nothing, wolf, goat, cabbage, nothing, goat], 7),
    rule(14, [164, 162])
).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 4).
proof_boundary_steps(2, 1, 9, 19).
proof_boundary_steps(2, 1, 22, 23).
proof_boundary_steps(2, 1, 38, 95).
proof_boundary_call(2, 1, member(state(east, east, east, east), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(east, east, east, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(east, east, east, west), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, east, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(east, east, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(east, east, west, east), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(east, east, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(east, west, east, east), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(east, west, east, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(east, west, east, west), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(east, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(east, west, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(west, east, west, east), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(west, east, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(west, east, west, west), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, east, west, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(west, east, west, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(west, west, east, west), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(west, west, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(west, west, west, east), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(west, west, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 1, member(state(west, west, west, west), [])).
proof_boundary_call(
    2,
    1,
    member(
        state(west, west, west, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    1,
    member(state(west, west, west, west), [state(west, west, west, west)])
).
proof_boundary_call(
    2,
    1,
    move(
        state(east, east, east, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(east, east, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(east, east, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(east, west, east, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(east, west, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(west, east, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(west, east, west, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(west, west, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(west, west, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    1,
    move(
        state(west, west, west, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary(2, 2, 1).
proof_boundary_steps(2, 2, 1, 4).
proof_boundary_steps(2, 2, 9, 19).
proof_boundary_steps(2, 2, 22, 23).
proof_boundary_steps(2, 2, 38, 95).
proof_boundary_steps(2, 2, 118, 163).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, east, east),
        state(east, east, east, east),
        [
            state(east, east, east, east),
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, east, east),
        state(east, east, east, east),
        [
            state(east, east, east, east),
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, east, west),
        state(east, east, east, east),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, east, west),
        state(east, east, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, west, east),
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, east, west, east),
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, west, east, east),
        state(east, east, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, west, east, east),
        state(east, east, east, east),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(east, west, east, west),
        state(east, east, east, east),
        [state(east, west, east, west), state(west, west, west, west)],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, east, west, east),
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, east, west, east),
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, east, west, west),
        state(east, east, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, east, west, west),
        state(east, east, east, east),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, west, east, west),
        state(east, east, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, west, west, east),
        state(east, east, east, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, west, west, east),
        state(east, east, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(
    2,
    2,
    crossings(
        state(west, west, west, west),
        state(east, east, east, east),
        [state(west, west, west, west)],
        variable("_EyeplCall0"),
        variable("_EyeplCall1"),
        variable("_EyeplCall2")
    )
).
proof_boundary_call(2, 2, member(state(east, east, east, east), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(east, east, east, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(east, east, east, west), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, east, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(east, east, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(east, east, west, east), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, east),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, east, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(east, east, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(east, west, east, east), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(east, west, east, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(east, west, east, west), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(east, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(east, west, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(west, east, west, east), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(west, east, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(west, east, west, west), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, east, west, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(west, east, west, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(west, west, east, west), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(west, east, west, west),
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, east, west),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(west, west, east, west), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(west, west, west, east), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(east, east, west, east),
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(east, west, east, east),
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, east, west, east),
            state(west, east, west, west),
            state(east, east, east, west),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, east),
        [
            state(west, west, west, east),
            state(east, west, east, east),
            state(west, west, east, west),
            state(east, west, east, west),
            state(west, west, west, west)
        ]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(west, west, west, east), [state(west, west, west, west)])
).
proof_boundary_call(2, 2, member(state(west, west, west, west), [])).
proof_boundary_call(
    2,
    2,
    member(
        state(west, west, west, west),
        [state(east, west, east, west), state(west, west, west, west)]
    )
).
proof_boundary_call(
    2,
    2,
    member(state(west, west, west, west), [state(west, west, west, west)])
).
proof_boundary_call(
    2,
    2,
    move(
        state(east, east, east, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(east, east, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(east, east, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(east, west, east, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(east, west, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(west, east, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(west, east, west, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(west, west, east, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(west, west, west, east),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_boundary_call(
    2,
    2,
    move(
        state(west, west, west, west),
        variable("_EyeplCall0"),
        variable("_EyeplCall1")
    )
).
proof_claim(2, answer(2, [165])).

% Check 2
proof_check(2, checked, [
    steps(165),
    claims(1),
    source_facts(4),
    rule_applications(118),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(122, 0)).
proof_condition(2, c2, "well-foundedness", checked(141, 0)).
proof_condition(2, c3, "justification", checked(168, 0)).
proof_condition(2, c4, "coverage", checked(617, 0)).
proof_condition(2, c5, "re-decision", checked(21, 0)).
proof_condition(2, c6, "boundary consistency", checked(25, 0)).
proof_condition(2, c7, "relevance", checked(167, 0)).
proof_condition(
    2,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(2, c9, "query isolation", checked(1, 0)).

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
