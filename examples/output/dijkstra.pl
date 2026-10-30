% Answer 1
route(a, f, [a, c, b, d, e, f], 13).

% Reason 1
proof_step(
    1,
    1,
    network([
        edge(a, b, 4),
        edge(a, c, 2),
        edge(b, c, 1),
        edge(b, d, 5),
        edge(c, d, 8),
        edge(c, e, 10),
        edge(d, e, 2),
        edge(d, f, 6),
        edge(e, f, 3)
    ]),
    source(1)
).
proof_step(1, 2, valid_edges([]), source(2)).
proof_step(1, 3, undirected([], []), source(3)).
proof_step(1, 4, '>='(3, 0), builtin).
proof_step(1, 5, '>='(6, 0), builtin).
proof_step(1, 6, '>='(2, 0), builtin).
proof_step(1, 7, '>='(10, 0), builtin).
proof_step(1, 8, '>='(8, 0), builtin).
proof_step(1, 9, '>='(5, 0), builtin).
proof_step(1, 10, '>='(1, 0), builtin).
proof_step(1, 11, '>='(4, 0), builtin).
proof_step(1, 12, unseen(a, []), rule(5, [])).
proof_step(1, 13, unseen(b, []), rule(5, [])).
proof_step(1, 14, '\\='(b, a), builtin).
proof_step(1, 15, insert(entry(4, b, [b, a]), [], [entry(4, b, [b, a])]), rule(18, [])).
proof_step(1, 16, is(4, '+'(0, 4)), builtin).
proof_step(1, 17, unseen(c, []), rule(5, [])).
proof_step(1, 18, '\\='(c, a), builtin).
proof_step(1, 19, '=<'(2, 4), builtin).
proof_step(1, 20, is(2, '+'(0, 2)), builtin).
proof_step(1, 21, '\\='(d, a), builtin).
proof_step(1, 22, '\\='(e, a), builtin).
proof_step(1, 23, '\\='(f, a), builtin).
proof_step(
    1,
    24,
    expand(
        [],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(13, [])
).
proof_step(1, 25, '\\='(a, c), builtin).
proof_step(1, 26, '\\='(b, c), builtin).
proof_step(1, 27, seen(a, [a]), rule(3, [])).
proof_step(1, 28, '=<'(3, 4), builtin).
proof_step(1, 29, is(3, '+'(2, 1)), builtin).
proof_step(1, 30, '\\='(d, c), builtin).
proof_step(1, 31, unseen(d, []), rule(5, [])).
proof_step(
    1,
    32,
    insert(entry(10, d, [d, c, a]), [], [entry(10, d, [d, c, a])]),
    rule(18, [])
).
proof_step(1, 33, '>'(10, 4), builtin).
proof_step(1, 34, '>'(10, 3), builtin).
proof_step(1, 35, is(10, '+'(2, 8)), builtin).
proof_step(1, 36, unseen(e, []), rule(5, [])).
proof_step(1, 37, '\\='(e, c), builtin).
proof_step(
    1,
    38,
    insert(entry(12, e, [e, c, a]), [], [entry(12, e, [e, c, a])]),
    rule(18, [])
).
proof_step(1, 39, '>'(12, 10), builtin).
proof_step(1, 40, '>'(12, 4), builtin).
proof_step(1, 41, '>'(12, 3), builtin).
proof_step(1, 42, is(12, '+'(2, 10)), builtin).
proof_step(1, 43, '\\='(f, c), builtin).
proof_step(
    1,
    44,
    expand(
        [],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(13, [])
).
proof_step(1, 45, '\\='(a, b), builtin).
proof_step(1, 46, '\\='(c, b), builtin).
proof_step(1, 47, seen(c, [c, a]), rule(3, [])).
proof_step(1, 48, '\\='(d, b), builtin).
proof_step(1, 49, '=<'(8, 10), builtin).
proof_step(1, 50, '>'(8, 4), builtin).
proof_step(1, 51, is(8, '+'(3, 5)), builtin).
proof_step(1, 52, '\\='(e, b), builtin).
proof_step(1, 53, '\\='(f, b), builtin).
proof_step(
    1,
    54,
    expand(
        [],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(13, [])
).
proof_step(1, 55, seen(b, [b, c, a]), rule(3, [])).
proof_step(1, 56, '\\='(a, d), builtin).
proof_step(1, 57, '\\='(b, d), builtin).
proof_step(1, 58, '\\='(c, d), builtin).
proof_step(1, 59, '\\='(e, d), builtin).
proof_step(1, 60, '=<'(10, 10), builtin).
proof_step(1, 61, is(10, '+'(8, 2)), builtin).
proof_step(1, 62, unseen(f, []), rule(5, [])).
proof_step(1, 63, '\\='(f, d), builtin).
proof_step(
    1,
    64,
    insert(entry(14, f, [f, d, b, c, a]), [], [entry(14, f, [f, d, b, c, a])]),
    rule(18, [])
).
proof_step(1, 65, '>'(14, 12), builtin).
proof_step(1, 66, '>'(14, 10), builtin).
proof_step(1, 67, is(14, '+'(8, 6)), builtin).
proof_step(
    1,
    68,
    expand(
        [],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(13, [])
).
proof_step(1, 69, '\\='(a, e), builtin).
proof_step(1, 70, '\\='(b, e), builtin).
proof_step(1, 71, '\\='(c, e), builtin).
proof_step(1, 72, '\\='(d, e), builtin).
proof_step(1, 73, seen(d, [d, b, c, a]), rule(3, [])).
proof_step(1, 74, '\\='(f, e), builtin).
proof_step(1, 75, '=<'(13, 14), builtin).
proof_step(1, 76, '>'(13, 12), builtin).
proof_step(1, 77, '>'(13, 10), builtin).
proof_step(1, 78, is(13, '+'(10, 3)), builtin).
proof_step(
    1,
    79,
    expand(
        [],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(13, [])
).
proof_step(1, 80, seen(e, [e, d, b, c, a]), rule(3, [])).
proof_step(1, 81, '\\='(e, f), builtin).
proof_step(1, 82, '\\='(d, f), builtin).
proof_step(1, 83, '\\='(b, f), builtin).
proof_step(1, 84, '\\='(c, f), builtin).
proof_step(1, 85, '\\='(a, f), builtin).
proof_step(1, 86, reverse([], [a, c, b, d, e, f], [a, c, b, d, e, f]), rule(7, [])).
proof_step(
    1,
    87,
    undirected([edge(e, f, 3)], [edge(e, f, 3), edge(f, e, 3)]),
    rule(2, [3])
).
proof_step(1, 88, valid_edges([edge(f, e, 3)]), rule(1, [4, 2])).
proof_step(1, 89, unseen(b, [a]), rule(6, [14, 13])).
proof_step(
    1,
    90,
    add_edge(
        edge(b, a, 4),
        a,
        0,
        [a],
        [a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(15, [14])
).
proof_step(
    1,
    91,
    add_edge(
        edge(b, c, 1),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [14])
).
proof_step(
    1,
    92,
    add_edge(
        edge(b, d, 5),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [14])
).
proof_step(1, 93, unseen(c, [a]), rule(6, [18, 17])).
proof_step(
    1,
    94,
    add_edge(
        edge(c, a, 2),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [18])
).
proof_step(
    1,
    95,
    add_edge(
        edge(c, b, 1),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [18])
).
proof_step(
    1,
    96,
    add_edge(
        edge(c, d, 8),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [18])
).
proof_step(
    1,
    97,
    add_edge(
        edge(c, e, 10),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [18])
).
proof_step(
    1,
    98,
    insert(
        entry(2, c, [c, a]),
        [entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(19, [19])
).
proof_step(
    1,
    99,
    add_edge(
        edge(d, b, 5),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [21])
).
proof_step(
    1,
    100,
    add_edge(
        edge(d, c, 8),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [21])
).
proof_step(
    1,
    101,
    add_edge(
        edge(d, e, 2),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [21])
).
proof_step(
    1,
    102,
    add_edge(
        edge(d, f, 6),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [21])
).
proof_step(
    1,
    103,
    add_edge(
        edge(e, c, 10),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [22])
).
proof_step(
    1,
    104,
    add_edge(
        edge(e, d, 2),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [22])
).
proof_step(
    1,
    105,
    add_edge(
        edge(e, f, 3),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [22])
).
proof_step(
    1,
    106,
    add_edge(
        edge(f, d, 6),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [23])
).
proof_step(
    1,
    107,
    add_edge(
        edge(f, e, 3),
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [23])
).
proof_step(
    1,
    108,
    add_edge(
        edge(a, b, 4),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(15, [25])
).
proof_step(
    1,
    109,
    add_edge(
        edge(a, c, 2),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(15, [25])
).
proof_step(
    1,
    110,
    add_edge(
        edge(b, a, 4),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(15, [26])
).
proof_step(
    1,
    111,
    add_edge(
        edge(b, c, 1),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(15, [26])
).
proof_step(
    1,
    112,
    add_edge(
        edge(b, d, 5),
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [26])
).
proof_step(1, 113, seen(a, [c, a]), rule(4, [27])).
proof_step(
    1,
    114,
    insert(
        entry(3, b, [b, c, a]),
        [entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])]
    ),
    rule(19, [28])
).
proof_step(
    1,
    115,
    add_edge(
        edge(d, b, 5),
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])]
    ),
    rule(15, [30])
).
proof_step(
    1,
    116,
    add_edge(
        edge(d, c, 8),
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])]
    ),
    rule(15, [30])
).
proof_step(
    1,
    117,
    add_edge(
        edge(d, e, 2),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [30])
).
proof_step(
    1,
    118,
    add_edge(
        edge(d, f, 6),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [30])
).
proof_step(1, 119, unseen(d, [a]), rule(6, [21, 31])).
proof_step(
    1,
    120,
    insert(
        entry(10, d, [d, c, a]),
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a])]
    ),
    rule(20, [33, 32])
).
proof_step(1, 121, unseen(e, [a]), rule(6, [22, 36])).
proof_step(
    1,
    122,
    add_edge(
        edge(e, c, 10),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [37])
).
proof_step(
    1,
    123,
    add_edge(
        edge(e, d, 2),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [37])
).
proof_step(
    1,
    124,
    add_edge(
        edge(e, f, 3),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [37])
).
proof_step(
    1,
    125,
    insert(
        entry(12, e, [e, c, a]),
        [entry(10, d, [d, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(20, [39, 38])
).
proof_step(
    1,
    126,
    add_edge(
        edge(f, d, 6),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [43])
).
proof_step(
    1,
    127,
    add_edge(
        edge(f, e, 3),
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [43])
).
proof_step(
    1,
    128,
    add_edge(
        edge(a, b, 4),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [45])
).
proof_step(
    1,
    129,
    add_edge(
        edge(a, c, 2),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [45])
).
proof_step(
    1,
    130,
    add_edge(
        edge(c, a, 2),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [46])
).
proof_step(
    1,
    131,
    add_edge(
        edge(c, b, 1),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [46])
).
proof_step(
    1,
    132,
    add_edge(
        edge(c, d, 8),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [46])
).
proof_step(
    1,
    133,
    add_edge(
        edge(c, e, 10),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [46])
).
proof_step(1, 134, seen(c, [b, c, a]), rule(4, [47])).
proof_step(
    1,
    135,
    add_edge(
        edge(d, b, 5),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [48])
).
proof_step(
    1,
    136,
    add_edge(
        edge(d, c, 8),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [48])
).
proof_step(
    1,
    137,
    add_edge(
        edge(d, e, 2),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [48])
).
proof_step(
    1,
    138,
    add_edge(
        edge(d, f, 6),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [48])
).
proof_step(
    1,
    139,
    insert(
        entry(8, d, [d, b, c, a]),
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(8, d, [d, b, c, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(19, [49])
).
proof_step(
    1,
    140,
    add_edge(
        edge(e, c, 10),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [52])
).
proof_step(
    1,
    141,
    add_edge(
        edge(e, d, 2),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [52])
).
proof_step(
    1,
    142,
    add_edge(
        edge(e, f, 3),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [52])
).
proof_step(
    1,
    143,
    add_edge(
        edge(f, d, 6),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [53])
).
proof_step(
    1,
    144,
    add_edge(
        edge(f, e, 3),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [53])
).
proof_step(1, 145, seen(b, [d, b, c, a]), rule(4, [55])).
proof_step(
    1,
    146,
    add_edge(
        edge(a, b, 4),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [56])
).
proof_step(
    1,
    147,
    add_edge(
        edge(a, c, 2),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [56])
).
proof_step(
    1,
    148,
    add_edge(
        edge(b, a, 4),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [57])
).
proof_step(
    1,
    149,
    add_edge(
        edge(b, c, 1),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [57])
).
proof_step(
    1,
    150,
    add_edge(
        edge(b, d, 5),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [57])
).
proof_step(
    1,
    151,
    add_edge(
        edge(c, a, 2),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [58])
).
proof_step(
    1,
    152,
    add_edge(
        edge(c, b, 1),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [58])
).
proof_step(
    1,
    153,
    add_edge(
        edge(c, d, 8),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [58])
).
proof_step(
    1,
    154,
    add_edge(
        edge(c, e, 10),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [58])
).
proof_step(
    1,
    155,
    add_edge(
        edge(e, c, 10),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(15, [59])
).
proof_step(
    1,
    156,
    add_edge(
        edge(e, d, 2),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(15, [59])
).
proof_step(
    1,
    157,
    add_edge(
        edge(e, f, 3),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [59])
).
proof_step(
    1,
    158,
    insert(
        entry(10, e, [e, d, b, c, a]),
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(19, [60])
).
proof_step(1, 159, unseen(f, [a]), rule(6, [23, 62])).
proof_step(
    1,
    160,
    add_edge(
        edge(f, d, 6),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [63])
).
proof_step(
    1,
    161,
    add_edge(
        edge(f, e, 3),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [63])
).
proof_step(
    1,
    162,
    insert(
        entry(14, f, [f, d, b, c, a]),
        [entry(12, e, [e, c, a])],
        [entry(12, e, [e, c, a]), entry(14, f, [f, d, b, c, a])]
    ),
    rule(20, [65, 64])
).
proof_step(
    1,
    163,
    add_edge(
        edge(a, b, 4),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [69])
).
proof_step(
    1,
    164,
    add_edge(
        edge(a, c, 2),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [69])
).
proof_step(
    1,
    165,
    add_edge(
        edge(b, a, 4),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [70])
).
proof_step(
    1,
    166,
    add_edge(
        edge(b, c, 1),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [70])
).
proof_step(
    1,
    167,
    add_edge(
        edge(b, d, 5),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [70])
).
proof_step(
    1,
    168,
    add_edge(
        edge(c, a, 2),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [71])
).
proof_step(
    1,
    169,
    add_edge(
        edge(c, b, 1),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [71])
).
proof_step(
    1,
    170,
    add_edge(
        edge(c, d, 8),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [71])
).
proof_step(
    1,
    171,
    add_edge(
        edge(c, e, 10),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [71])
).
proof_step(
    1,
    172,
    add_edge(
        edge(d, b, 5),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [72])
).
proof_step(
    1,
    173,
    add_edge(
        edge(d, c, 8),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [72])
).
proof_step(
    1,
    174,
    add_edge(
        edge(d, e, 2),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [72])
).
proof_step(
    1,
    175,
    add_edge(
        edge(d, f, 6),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [72])
).
proof_step(1, 176, seen(d, [e, d, b, c, a]), rule(4, [73])).
proof_step(
    1,
    177,
    add_edge(
        edge(f, d, 6),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [74])
).
proof_step(
    1,
    178,
    add_edge(
        edge(f, e, 3),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(15, [74])
).
proof_step(
    1,
    179,
    insert(
        entry(13, f, [f, e, d, b, c, a]),
        [entry(14, f, [f, d, b, c, a])],
        [entry(13, f, [f, e, d, b, c, a]), entry(14, f, [f, d, b, c, a])]
    ),
    rule(19, [75])
).
proof_step(1, 180, reverse([a], [c, b, d, e, f], [a, c, b, d, e, f]), rule(8, [86])).
proof_step(
    1,
    181,
    undirected(
        [edge(d, f, 6), edge(e, f, 3)],
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)]
    ),
    rule(2, [87])
).
proof_step(1, 182, valid_edges([edge(e, f, 3), edge(f, e, 3)]), rule(1, [4, 88])).
proof_step(
    1,
    183,
    add_edge(edge(a, b, 4), a, 0, [a], [a], [], [entry(4, b, [b, a])]),
    rule(17, [89, 16, 15])
).
proof_step(1, 184, unseen(b, [c, a]), rule(6, [26, 89])).
proof_step(
    1,
    185,
    add_edge(
        edge(a, c, 2),
        a,
        0,
        [a],
        [a],
        [entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(17, [93, 20, 98])
).
proof_step(
    1,
    186,
    expand(
        [edge(f, e, 3)],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [107, 24])
).
proof_step(
    1,
    187,
    add_edge(
        edge(c, a, 2),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(4, b, [b, a])]
    ),
    rule(16, [113])
).
proof_step(1, 188, seen(a, [b, c, a]), rule(4, [113])).
proof_step(1, 189, unseen(d, [c, a]), rule(6, [30, 119])).
proof_step(
    1,
    190,
    insert(
        entry(10, d, [d, c, a]),
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])]
    ),
    rule(20, [34, 120])
).
proof_step(1, 191, unseen(e, [c, a]), rule(6, [37, 121])).
proof_step(
    1,
    192,
    insert(
        entry(12, e, [e, c, a]),
        [entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(20, [40, 125])
).
proof_step(
    1,
    193,
    expand(
        [edge(f, e, 3)],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [127, 44])
).
proof_step(
    1,
    194,
    add_edge(
        edge(b, c, 1),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(16, [134])
).
proof_step(1, 195, seen(c, [d, b, c, a]), rule(4, [134])).
proof_step(
    1,
    196,
    insert(
        entry(8, d, [d, b, c, a]),
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(20, [50, 139])
).
proof_step(
    1,
    197,
    expand(
        [edge(f, e, 3)],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [144, 54])
).
proof_step(
    1,
    198,
    add_edge(
        edge(d, b, 5),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(16, [145])
).
proof_step(1, 199, unseen(f, [c, a]), rule(6, [43, 159])).
proof_step(
    1,
    200,
    expand(
        [edge(f, e, 3)],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [161, 68])
).
proof_step(
    1,
    201,
    insert(
        entry(14, f, [f, d, b, c, a]),
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(20, [66, 162])
).
proof_step(
    1,
    202,
    add_edge(
        edge(e, d, 2),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(16, [176])
).
proof_step(
    1,
    203,
    expand(
        [edge(f, e, 3)],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [178, 79])
).
proof_step(
    1,
    204,
    insert(
        entry(13, f, [f, e, d, b, c, a]),
        [entry(12, e, [e, c, a]), entry(14, f, [f, d, b, c, a])],
        [
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(20, [76, 179])
).
proof_step(1, 205, reverse([c, a], [b, d, e, f], [a, c, b, d, e, f]), rule(8, [180])).
proof_step(
    1,
    206,
    undirected(
        [edge(d, e, 2), edge(d, f, 6), edge(e, f, 3)],
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [181])
).
proof_step(
    1,
    207,
    valid_edges([edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)]),
    rule(1, [5, 182])
).
proof_step(
    1,
    208,
    add_edge(
        edge(c, b, 1),
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])]
    ),
    rule(17, [184, 29, 114])
).
proof_step(
    1,
    209,
    expand(
        [edge(e, f, 3), edge(f, e, 3)],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [105, 186])
).
proof_step(
    1,
    210,
    add_edge(
        edge(b, a, 4),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(16, [188])
).
proof_step(1, 211, unseen(d, [b, c, a]), rule(6, [48, 189])).
proof_step(
    1,
    212,
    add_edge(
        edge(c, d, 8),
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])]
    ),
    rule(17, [189, 35, 190])
).
proof_step(1, 213, unseen(e, [b, c, a]), rule(6, [52, 191])).
proof_step(
    1,
    214,
    insert(
        entry(12, e, [e, c, a]),
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(20, [41, 192])
).
proof_step(
    1,
    215,
    expand(
        [edge(e, f, 3), edge(f, e, 3)],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [124, 193])
).
proof_step(
    1,
    216,
    add_edge(
        edge(d, c, 8),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])]
    ),
    rule(16, [195])
).
proof_step(1, 217, seen(c, [e, d, b, c, a]), rule(4, [195])).
proof_step(
    1,
    218,
    expand(
        [edge(e, f, 3), edge(f, e, 3)],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [142, 197])
).
proof_step(1, 219, unseen(f, [b, c, a]), rule(6, [53, 199])).
proof_step(
    1,
    220,
    expand(
        [edge(e, f, 3), edge(f, e, 3)],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [157, 200])
).
proof_step(
    1,
    221,
    insert(
        entry(14, f, [f, d, b, c, a]),
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(20, [66, 201])
).
proof_step(
    1,
    222,
    insert(
        entry(13, f, [f, e, d, b, c, a]),
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(20, [77, 204])
).
proof_step(1, 223, reverse([b, c, a], [d, e, f], [a, c, b, d, e, f]), rule(8, [205])).
proof_step(
    1,
    224,
    undirected(
        [edge(c, e, 10), edge(d, e, 2), edge(d, f, 6), edge(e, f, 3)],
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [206])
).
proof_step(
    1,
    225,
    valid_edges([edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)]),
    rule(1, [5, 207])
).
proof_step(
    1,
    226,
    expand(
        [edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [106, 209])
).
proof_step(
    1,
    227,
    add_edge(
        edge(b, d, 5),
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(17, [211, 51, 196])
).
proof_step(1, 228, unseen(e, [d, b, c, a]), rule(6, [59, 213])).
proof_step(
    1,
    229,
    add_edge(
        edge(c, e, 10),
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(17, [191, 42, 214])
).
proof_step(
    1,
    230,
    expand(
        [edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [126, 215])
).
proof_step(
    1,
    231,
    add_edge(
        edge(e, c, 10),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(16, [217])
).
proof_step(
    1,
    232,
    expand(
        [edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [143, 218])
).
proof_step(1, 233, unseen(f, [d, b, c, a]), rule(6, [63, 219])).
proof_step(
    1,
    234,
    expand(
        [edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [160, 220])
).
proof_step(1, 235, reverse([d, b, c, a], [e, f], [a, c, b, d, e, f]), rule(8, [223])).
proof_step(
    1,
    236,
    undirected(
        [edge(c, d, 8), edge(c, e, 10), edge(d, e, 2), edge(d, f, 6), edge(e, f, 3)],
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [224])
).
proof_step(
    1,
    237,
    valid_edges([edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)]),
    rule(1, [6, 225])
).
proof_step(
    1,
    238,
    expand(
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [102, 226])
).
proof_step(
    1,
    239,
    add_edge(
        edge(d, e, 2),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(17, [228, 61, 158])
).
proof_step(
    1,
    240,
    expand(
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [118, 230])
).
proof_step(
    1,
    241,
    expand(
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [138, 232])
).
proof_step(
    1,
    242,
    add_edge(
        edge(d, f, 6),
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(17, [233, 67, 221])
).
proof_step(1, 243, unseen(f, [e, d, b, c, a]), rule(6, [74, 233])).
proof_step(1, 244, reverse([e, d, b, c, a], [f], [a, c, b, d, e, f]), rule(8, [235])).
proof_step(
    1,
    245,
    undirected(
        [
            edge(b, d, 5),
            edge(c, d, 8),
            edge(c, e, 10),
            edge(d, e, 2),
            edge(d, f, 6),
            edge(e, f, 3)
        ],
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [236])
).
proof_step(
    1,
    246,
    valid_edges([
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [6, 237])
).
proof_step(
    1,
    247,
    expand(
        [edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [104, 238])
).
proof_step(
    1,
    248,
    expand(
        [edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [123, 240])
).
proof_step(
    1,
    249,
    expand(
        [edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [141, 241])
).
proof_step(
    1,
    250,
    expand(
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [242, 234])
).
proof_step(
    1,
    251,
    add_edge(
        edge(e, f, 3),
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(17, [243, 78, 222])
).
proof_step(
    1,
    252,
    search(
        [entry(13, f, [f, e, d, b, c, a]), entry(14, f, [f, d, b, c, a])],
        f,
        [e, d, b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(10, [243])
).
proof_step(1, 253, reverse([f, e, d, b, c, a], [], [a, c, b, d, e, f]), rule(8, [244])).
proof_step(
    1,
    254,
    undirected(
        [
            edge(b, c, 1),
            edge(b, d, 5),
            edge(c, d, 8),
            edge(c, e, 10),
            edge(d, e, 2),
            edge(d, f, 6),
            edge(e, f, 3)
        ],
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [245])
).
proof_step(
    1,
    255,
    valid_edges([
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [7, 246])
).
proof_step(
    1,
    256,
    expand(
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [101, 247])
).
proof_step(
    1,
    257,
    expand(
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [117, 248])
).
proof_step(
    1,
    258,
    expand(
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [137, 249])
).
proof_step(
    1,
    259,
    expand(
        [edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [156, 250])
).
proof_step(
    1,
    260,
    expand(
        [edge(e, f, 3), edge(f, e, 3)],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [251, 203])
).
proof_step(
    1,
    261,
    search(
        [
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        f,
        [e, d, b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(11, [80, 252])
).
proof_step(
    1,
    262,
    undirected(
        [
            edge(a, c, 2),
            edge(b, c, 1),
            edge(b, d, 5),
            edge(c, d, 8),
            edge(c, e, 10),
            edge(d, e, 2),
            edge(d, f, 6),
            edge(e, f, 3)
        ],
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [254])
).
proof_step(
    1,
    263,
    valid_edges([
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [7, 255])
).
proof_step(
    1,
    264,
    expand(
        [
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [103, 256])
).
proof_step(
    1,
    265,
    expand(
        [
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [122, 257])
).
proof_step(
    1,
    266,
    expand(
        [
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [140, 258])
).
proof_step(
    1,
    267,
    expand(
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [239, 259])
).
proof_step(
    1,
    268,
    expand(
        [edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [177, 260])
).
proof_step(
    1,
    269,
    search(
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        f,
        [e, d, b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(11, [176, 261])
).
proof_step(
    1,
    270,
    undirected(
        [
            edge(a, b, 4),
            edge(a, c, 2),
            edge(b, c, 1),
            edge(b, d, 5),
            edge(c, d, 8),
            edge(c, e, 10),
            edge(d, e, 2),
            edge(d, f, 6),
            edge(e, f, 3)
        ],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ]
    ),
    rule(2, [262])
).
proof_step(
    1,
    271,
    valid_edges([
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [8, 263])
).
proof_step(
    1,
    272,
    expand(
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [97, 264])
).
proof_step(
    1,
    273,
    expand(
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [229, 265])
).
proof_step(
    1,
    274,
    expand(
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [133, 266])
).
proof_step(
    1,
    275,
    expand(
        [
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [155, 267])
).
proof_step(
    1,
    276,
    expand(
        [edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [175, 268])
).
proof_step(
    1,
    277,
    valid_edges([
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [8, 271])
).
proof_step(
    1,
    278,
    expand(
        [
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [100, 272])
).
proof_step(
    1,
    279,
    expand(
        [
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a]), entry(10, d, [d, c, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [116, 273])
).
proof_step(
    1,
    280,
    expand(
        [
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [136, 274])
).
proof_step(
    1,
    281,
    expand(
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [154, 275])
).
proof_step(
    1,
    282,
    expand(
        [edge(e, d, 2), edge(d, f, 6), edge(f, d, 6), edge(e, f, 3), edge(f, e, 3)],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [202, 276])
).
proof_step(
    1,
    283,
    valid_edges([
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [9, 277])
).
proof_step(
    1,
    284,
    expand(
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [96, 278])
).
proof_step(
    1,
    285,
    expand(
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [212, 279])
).
proof_step(
    1,
    286,
    expand(
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [132, 280])
).
proof_step(
    1,
    287,
    expand(
        [
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [216, 281])
).
proof_step(
    1,
    288,
    expand(
        [
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [174, 282])
).
proof_step(
    1,
    289,
    valid_edges([
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [9, 283])
).
proof_step(
    1,
    290,
    expand(
        [
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [99, 284])
).
proof_step(
    1,
    291,
    expand(
        [
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [115, 285])
).
proof_step(
    1,
    292,
    expand(
        [
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [135, 286])
).
proof_step(
    1,
    293,
    expand(
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [153, 287])
).
proof_step(
    1,
    294,
    expand(
        [
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [231, 288])
).
proof_step(
    1,
    295,
    valid_edges([
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [10, 289])
).
proof_step(
    1,
    296,
    expand(
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [92, 290])
).
proof_step(
    1,
    297,
    expand(
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(3, b, [b, c, a]), entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [112, 291])
).
proof_step(
    1,
    298,
    expand(
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [227, 292])
).
proof_step(
    1,
    299,
    expand(
        [
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [198, 293])
).
proof_step(
    1,
    300,
    expand(
        [
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [171, 294])
).
proof_step(
    1,
    301,
    valid_edges([
        edge(b, c, 1),
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [10, 295])
).
proof_step(
    1,
    302,
    expand(
        [
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [95, 296])
).
proof_step(
    1,
    303,
    expand(
        [
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [208, 297])
).
proof_step(
    1,
    304,
    expand(
        [
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [131, 298])
).
proof_step(
    1,
    305,
    expand(
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [150, 299])
).
proof_step(
    1,
    306,
    expand(
        [
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [173, 300])
).
proof_step(
    1,
    307,
    valid_edges([
        edge(c, a, 2),
        edge(b, c, 1),
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [6, 301])
).
proof_step(
    1,
    308,
    expand(
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [91, 302])
).
proof_step(
    1,
    309,
    expand(
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [111, 303])
).
proof_step(
    1,
    310,
    expand(
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [194, 304])
).
proof_step(
    1,
    311,
    expand(
        [
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [152, 305])
).
proof_step(
    1,
    312,
    expand(
        [
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [170, 306])
).
proof_step(
    1,
    313,
    valid_edges([
        edge(a, c, 2),
        edge(c, a, 2),
        edge(b, c, 1),
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [6, 307])
).
proof_step(
    1,
    314,
    expand(
        [
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [94, 308])
).
proof_step(
    1,
    315,
    expand(
        [
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [187, 309])
).
proof_step(
    1,
    316,
    expand(
        [
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [130, 310])
).
proof_step(
    1,
    317,
    expand(
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [149, 311])
).
proof_step(
    1,
    318,
    expand(
        [
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [172, 312])
).
proof_step(
    1,
    319,
    valid_edges([
        edge(b, a, 4),
        edge(a, c, 2),
        edge(c, a, 2),
        edge(b, c, 1),
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [11, 313])
).
proof_step(
    1,
    320,
    expand(
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [185, 314])
).
proof_step(
    1,
    321,
    expand(
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [109, 315])
).
proof_step(
    1,
    322,
    expand(
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [129, 316])
).
proof_step(
    1,
    323,
    expand(
        [
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [151, 317])
).
proof_step(
    1,
    324,
    expand(
        [
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [167, 318])
).
proof_step(
    1,
    325,
    valid_edges([
        edge(a, b, 4),
        edge(b, a, 4),
        edge(a, c, 2),
        edge(c, a, 2),
        edge(b, c, 1),
        edge(c, b, 1),
        edge(b, d, 5),
        edge(d, b, 5),
        edge(c, d, 8),
        edge(d, c, 8),
        edge(c, e, 10),
        edge(e, c, 10),
        edge(d, e, 2),
        edge(e, d, 2),
        edge(d, f, 6),
        edge(f, d, 6),
        edge(e, f, 3),
        edge(f, e, 3)
    ]),
    rule(1, [11, 319])
).
proof_step(
    1,
    326,
    expand(
        [
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [entry(4, b, [b, a])],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [90, 320])
).
proof_step(
    1,
    327,
    expand(
        [
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [110, 321])
).
proof_step(
    1,
    328,
    expand(
        [
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [210, 322])
).
proof_step(
    1,
    329,
    expand(
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [147, 323])
).
proof_step(
    1,
    330,
    expand(
        [
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [169, 324])
).
proof_step(
    1,
    331,
    expand(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        0,
        [a],
        [a],
        [],
        [entry(2, c, [c, a]), entry(4, b, [b, a])]
    ),
    rule(14, [183, 326])
).
proof_step(
    1,
    332,
    expand(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        c,
        2,
        [c, a],
        [c, a],
        [entry(4, b, [b, a])],
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [108, 327])
).
proof_step(
    1,
    333,
    expand(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        b,
        3,
        [b, c, a],
        [b, c, a],
        [entry(4, b, [b, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ]
    ),
    rule(14, [128, 328])
).
proof_step(
    1,
    334,
    expand(
        [
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [148, 329])
).
proof_step(
    1,
    335,
    expand(
        [
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [166, 330])
).
proof_step(
    1,
    336,
    expand(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        d,
        8,
        [d, b, c, a],
        [d, b, c, a],
        [entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [146, 334])
).
proof_step(
    1,
    337,
    expand(
        [
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [168, 335])
).
proof_step(
    1,
    338,
    expand(
        [
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [164, 337])
).
proof_step(
    1,
    339,
    expand(
        [
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [165, 338])
).
proof_step(
    1,
    340,
    expand(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        e,
        10,
        [e, d, b, c, a],
        [e, d, b, c, a],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        [
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(13, f, [f, e, d, b, c, a]),
            entry(14, f, [f, d, b, c, a])
        ]
    ),
    rule(14, [163, 339])
).
proof_step(
    1,
    341,
    search(
        [
            entry(10, e, [e, d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a]),
            entry(14, f, [f, d, b, c, a])
        ],
        f,
        [d, b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(12, [81, 228, 340, 269])
).
proof_step(
    1,
    342,
    search(
        [entry(8, d, [d, b, c, a]), entry(10, d, [d, c, a]), entry(12, e, [e, c, a])],
        f,
        [b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(12, [82, 211, 336, 341])
).
proof_step(
    1,
    343,
    search(
        [
            entry(4, b, [b, a]),
            entry(8, d, [d, b, c, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        f,
        [b, c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(11, [55, 342])
).
proof_step(
    1,
    344,
    search(
        [
            entry(3, b, [b, c, a]),
            entry(4, b, [b, a]),
            entry(10, d, [d, c, a]),
            entry(12, e, [e, c, a])
        ],
        f,
        [c, a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(12, [83, 184, 333, 343])
).
proof_step(
    1,
    345,
    search(
        [entry(2, c, [c, a]), entry(4, b, [b, a])],
        f,
        [a],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(12, [84, 93, 332, 344])
).
proof_step(
    1,
    346,
    search(
        [entry(0, a, [a])],
        f,
        [],
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        [f, e, d, b, c, a],
        13
    ),
    rule(12, [85, 12, 331, 345])
).
proof_step(
    1,
    347,
    dijkstra(
        [
            edge(a, b, 4),
            edge(b, a, 4),
            edge(a, c, 2),
            edge(c, a, 2),
            edge(b, c, 1),
            edge(c, b, 1),
            edge(b, d, 5),
            edge(d, b, 5),
            edge(c, d, 8),
            edge(d, c, 8),
            edge(c, e, 10),
            edge(e, c, 10),
            edge(d, e, 2),
            edge(e, d, 2),
            edge(d, f, 6),
            edge(f, d, 6),
            edge(e, f, 3),
            edge(f, e, 3)
        ],
        a,
        f,
        [a, c, b, d, e, f],
        13
    ),
    rule(9, [325, 346, 253])
).
proof_step(1, 348, route(a, f, [a, c, b, d, e, f], 13), rule(21, [1, 270, 347])).
proof_claim(1, answer(1, [348])).

% Answer 2
route(f, a, [f, e, d, b, c, a], 13).

% Answer 3
route(a, a, [a], 0).

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
