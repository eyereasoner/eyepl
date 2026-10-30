% Answer 1
route(trip, ['drive-gent-brugge', 'drive-brugge-oostende']).
route(trip, ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende']).

% Answer 2
is_a(direct, 'available-route').
is_a('via-kortrijk', 'available-route').

% Answer 3
duration(direct, 2400).

% Answer 4
cost(direct, 0.01).

% Answer 5
belief(direct, 0.9408).

% Answer 6
comfort(direct, 0.99).

% Answer 7
duration('via-kortrijk', 4100).

% Answer 8
cost('via-kortrijk', 0.018).

% Answer 9
belief('via-kortrijk', 0.903168).

% Answer 10
comfort('via-kortrijk', 0.9801).

% Answer 11
'recommended-route'(trip, direct).

% Answer 12
outcome(trip, "Gent → Brugge → Oostende").

% Reason 12
proof_step(12, 1, location(traveller, gent), source(1)).
proof_step(12, 2, destination(trip, oostende), source(2)).
proof_step(12, 3, road([gent, brugge], 'drive-gent-brugge'), source(3)).
proof_step(12, 4, duration('drive-gent-brugge', 1500), source(4)).
proof_step(12, 5, cost('drive-gent-brugge', 0.006), source(5)).
proof_step(12, 6, belief('drive-gent-brugge', 0.96), source(6)).
proof_step(12, 7, comfort('drive-gent-brugge', 0.99), source(7)).
proof_step(12, 8, road([gent, kortrijk], 'drive-gent-kortrijk'), source(8)).
proof_step(12, 9, duration('drive-gent-kortrijk', 1600), source(9)).
proof_step(12, 10, cost('drive-gent-kortrijk', 0.007), source(10)).
proof_step(12, 11, belief('drive-gent-kortrijk', 0.96), source(11)).
proof_step(12, 12, comfort('drive-gent-kortrijk', 0.99), source(12)).
proof_step(12, 13, road([kortrijk, brugge], 'drive-kortrijk-brugge'), source(13)).
proof_step(12, 14, duration('drive-kortrijk-brugge', 1600), source(14)).
proof_step(12, 15, cost('drive-kortrijk-brugge', 0.007), source(15)).
proof_step(12, 16, belief('drive-kortrijk-brugge', 0.96), source(16)).
proof_step(12, 17, comfort('drive-kortrijk-brugge', 0.99), source(17)).
proof_step(12, 18, road([brugge, oostende], 'drive-brugge-oostende'), source(18)).
proof_step(12, 19, duration('drive-brugge-oostende', 900), source(19)).
proof_step(12, 20, cost('drive-brugge-oostende', 0.004), source(20)).
proof_step(12, 21, belief('drive-brugge-oostende', 0.98), source(21)).
proof_step(12, 22, comfort('drive-brugge-oostende', 1), source(22)).
proof_step(
    12,
    23,
    name(['drive-gent-brugge', 'drive-brugge-oostende'], direct),
    source(23)
).
proof_step(
    12,
    24,
    name(
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende'],
        'via-kortrijk'
    ),
    source(24)
).
proof_step(12, 25, label(direct, "Gent → Brugge → Oostende"), source(25)).
proof_step(12, 26, duration([], 0), source(27)).
proof_step(12, 27, cost([], 0), source(28)).
proof_step(12, 28, belief([], 1), source(29)).
proof_step(12, 29, comfort([], 1), source(30)).
proof_step(12, 30, is(900, '+'(900, 0)), builtin).
proof_step(12, 31, is(2400, '+'(1500, 900)), builtin).
proof_step(12, 32, is(0.004, '+'(0.004, 0)), builtin).
proof_step(12, 33, is(0.01, '+'(0.006, 0.004)), builtin).
proof_step(12, 34, is(0.98, '*'(0.98, 1)), builtin).
proof_step(12, 35, is(0.9408, '*'(0.96, 0.98)), builtin).
proof_step(12, 36, is(1, '*'(1, 1)), builtin).
proof_step(12, 37, is(0.99, '*'(0.99, 1)), builtin).
proof_step(12, 38, is(2500, '+'(1600, 900)), builtin).
proof_step(12, 39, is(4100, '+'(1600, 2500)), builtin).
proof_step(12, 40, is(0.011, '+'(0.007, 0.004)), builtin).
proof_step(12, 41, is(0.018, '+'(0.007, 0.011)), builtin).
proof_step(12, 42, is(0.903168, '*'(0.96, 0.9408)), builtin).
proof_step(12, 43, is(0.9801, '*'(0.99, 0.99)), builtin).
proof_step(12, 44, '<'(2400, 4100), builtin).
proof_step(12, 45, '<'(0.01, 0.018), builtin).
proof_step(12, 46, '>'(0.9408, 0.903168), builtin).
proof_step(12, 47, '>'(0.99, 0.9801), builtin).
proof_step(12, 48, route([brugge, oostende], ['drive-brugge-oostende']), rule(1, [18])).
proof_step(12, 49, duration(['drive-brugge-oostende'], 900), rule(6, [19, 26, 30])).
proof_step(12, 50, cost(['drive-brugge-oostende'], 0.004), rule(7, [20, 27, 32])).
proof_step(12, 51, belief(['drive-brugge-oostende'], 0.98), rule(8, [21, 28, 34])).
proof_step(12, 52, comfort(['drive-brugge-oostende'], 1), rule(9, [22, 29, 36])).
proof_step(
    12,
    53,
    route([kortrijk, oostende], ['drive-kortrijk-brugge', 'drive-brugge-oostende']),
    rule(2, [13, 48])
).
proof_step(
    12,
    54,
    route([gent, oostende], ['drive-gent-brugge', 'drive-brugge-oostende']),
    rule(2, [3, 48])
).
proof_step(
    12,
    55,
    duration(['drive-gent-brugge', 'drive-brugge-oostende'], 2400),
    rule(6, [4, 49, 31])
).
proof_step(
    12,
    56,
    duration(['drive-kortrijk-brugge', 'drive-brugge-oostende'], 2500),
    rule(6, [14, 49, 38])
).
proof_step(
    12,
    57,
    cost(['drive-gent-brugge', 'drive-brugge-oostende'], 0.01),
    rule(7, [5, 50, 33])
).
proof_step(
    12,
    58,
    cost(['drive-kortrijk-brugge', 'drive-brugge-oostende'], 0.011),
    rule(7, [15, 50, 40])
).
proof_step(
    12,
    59,
    belief(['drive-gent-brugge', 'drive-brugge-oostende'], 0.9408),
    rule(8, [6, 51, 35])
).
proof_step(
    12,
    60,
    belief(['drive-kortrijk-brugge', 'drive-brugge-oostende'], 0.9408),
    rule(8, [16, 51, 35])
).
proof_step(
    12,
    61,
    comfort(['drive-gent-brugge', 'drive-brugge-oostende'], 0.99),
    rule(9, [7, 52, 37])
).
proof_step(
    12,
    62,
    comfort(['drive-kortrijk-brugge', 'drive-brugge-oostende'], 0.99),
    rule(9, [17, 52, 37])
).
proof_step(
    12,
    63,
    route(
        [gent, oostende],
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende']
    ),
    rule(2, [8, 53])
).
proof_step(
    12,
    64,
    route(trip, ['drive-gent-brugge', 'drive-brugge-oostende']),
    rule(3, [1, 2, 54])
).
proof_step(
    12,
    65,
    duration(
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende'],
        4100
    ),
    rule(6, [9, 56, 39])
).
proof_step(
    12,
    66,
    cost(
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende'],
        0.018
    ),
    rule(7, [10, 58, 41])
).
proof_step(
    12,
    67,
    belief(
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende'],
        0.903168
    ),
    rule(8, [11, 60, 42])
).
proof_step(
    12,
    68,
    comfort(
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende'],
        0.9801
    ),
    rule(9, [12, 62, 43])
).
proof_step(
    12,
    69,
    route(
        trip,
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende']
    ),
    rule(3, [1, 2, 63])
).
proof_step(
    12,
    70,
    actions(direct, ['drive-gent-brugge', 'drive-brugge-oostende']),
    rule(4, [64, 23])
).
proof_step(
    12,
    71,
    actions(
        'via-kortrijk',
        ['drive-gent-kortrijk', 'drive-kortrijk-brugge', 'drive-brugge-oostende']
    ),
    rule(4, [69, 24])
).
proof_step(12, 72, is_a(direct, 'available-route'), rule(5, [70])).
proof_step(12, 73, duration(direct, 2400), rule(10, [70, 55])).
proof_step(12, 74, cost(direct, 0.01), rule(11, [70, 57])).
proof_step(12, 75, belief(direct, 0.9408), rule(12, [70, 59])).
proof_step(12, 76, comfort(direct, 0.99), rule(13, [70, 61])).
proof_step(12, 77, is_a('via-kortrijk', 'available-route'), rule(5, [71])).
proof_step(12, 78, duration('via-kortrijk', 4100), rule(10, [71, 65])).
proof_step(12, 79, cost('via-kortrijk', 0.018), rule(11, [71, 66])).
proof_step(12, 80, belief('via-kortrijk', 0.903168), rule(12, [71, 67])).
proof_step(12, 81, comfort('via-kortrijk', 0.9801), rule(13, [71, 68])).
proof_step(
    12,
    82,
    beats(direct, 'via-kortrijk'),
    rule(14, [72, 77, 73, 78, 44, 74, 79, 45, 75, 80, 46, 76, 81, 47])
).
proof_step(12, 83, 'recommended-route'(trip, direct), rule(15, [82])).
proof_step(12, 84, outcome(trip, "Gent → Brugge → Oostende"), rule(16, [83, 25])).
proof_claim(12, answer(12, [84])).

% Goal check 13
check_result(13, true).

% Goal check 14
check_result(14, true).

% Goal check 15
check_result(15, true).

% Goal check 16
check_result(16, true).

% Goal check 17
check_result(17, true).

% Goal check 18
check_result(18, true).

% Goal check 19
check_result(19, true).

% Goal check 20
check_result(20, true).

% Goal check 21
check_result(21, true).

% Goal check 22
check_result(22, true).

% Goal check 23
check_result(23, true).

% Goal check 24
check_result(24, true).

% Goal check 25
check_result(25, true).

% Goal check 26
check_result(26, true).

% Goal check 27
check_result(27, true).

% Goal check 28
check_result(28, true).

% Goal check 29
check_result(29, true).
