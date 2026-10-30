% Answer 1
moves(
    3,
    left,
    right,
    center,
    [
        move(left, right),
        move(left, center),
        move(right, center),
        move(left, right),
        move(center, left),
        move(center, right),
        move(left, right)
    ]
).

% Reason 1
proof_step(1, 1, moves(1, left, right, center, [move(left, right)]), rule(3, [])).
proof_step(1, 2, moves(1, right, center, left, [move(right, center)]), rule(3, [])).
proof_step(
    1,
    3,
    append(
        [],
        [move(left, center), move(right, center)],
        [move(left, center), move(right, center)]
    ),
    rule(1, [])
).
proof_step(1, 4, '>'(2, 1), builtin).
proof_step(1, 5, is(1, '-'(2, 1)), builtin).
proof_step(1, 6, moves(1, center, left, right, [move(center, left)]), rule(3, [])).
proof_step(
    1,
    7,
    append(
        [],
        [move(center, right), move(left, right)],
        [move(center, right), move(left, right)]
    ),
    rule(1, [])
).
proof_step(
    1,
    8,
    append(
        [],
        [move(left, right), move(center, left), move(center, right), move(left, right)],
        [move(left, right), move(center, left), move(center, right), move(left, right)]
    ),
    rule(1, [])
).
proof_step(1, 9, '>'(3, 1), builtin).
proof_step(1, 10, is(2, '-'(3, 1)), builtin).
proof_step(
    1,
    11,
    append(
        [move(left, right)],
        [move(left, center), move(right, center)],
        [move(left, right), move(left, center), move(right, center)]
    ),
    rule(2, [3])
).
proof_step(
    1,
    12,
    append(
        [move(center, left)],
        [move(center, right), move(left, right)],
        [move(center, left), move(center, right), move(left, right)]
    ),
    rule(2, [7])
).
proof_step(
    1,
    13,
    append(
        [move(right, center)],
        [move(left, right), move(center, left), move(center, right), move(left, right)],
        [
            move(right, center),
            move(left, right),
            move(center, left),
            move(center, right),
            move(left, right)
        ]
    ),
    rule(2, [8])
).
proof_step(
    1,
    14,
    moves(
        2,
        left,
        center,
        right,
        [move(left, right), move(left, center), move(right, center)]
    ),
    rule(4, [4, 5, 1, 2, 11])
).
proof_step(
    1,
    15,
    moves(
        2,
        center,
        right,
        left,
        [move(center, left), move(center, right), move(left, right)]
    ),
    rule(4, [4, 5, 6, 1, 12])
).
proof_step(
    1,
    16,
    append(
        [move(left, center), move(right, center)],
        [move(left, right), move(center, left), move(center, right), move(left, right)],
        [
            move(left, center),
            move(right, center),
            move(left, right),
            move(center, left),
            move(center, right),
            move(left, right)
        ]
    ),
    rule(2, [13])
).
proof_step(
    1,
    17,
    append(
        [move(left, right), move(left, center), move(right, center)],
        [move(left, right), move(center, left), move(center, right), move(left, right)],
        [
            move(left, right),
            move(left, center),
            move(right, center),
            move(left, right),
            move(center, left),
            move(center, right),
            move(left, right)
        ]
    ),
    rule(2, [16])
).
proof_step(
    1,
    18,
    moves(
        3,
        left,
        right,
        center,
        [
            move(left, right),
            move(left, center),
            move(right, center),
            move(left, right),
            move(center, left),
            move(center, right),
            move(left, right)
        ]
    ),
    rule(4, [9, 10, 14, 15, 17])
).
proof_claim(1, answer(1, [18])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).
