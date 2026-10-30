% Answer 1
plan(4, [go(loc3), push(loc1), climb_on, grab]).
plan(5, [go(loc1), go(loc3), push(loc1), climb_on, grab]).
plan(5, [go(loc3), push(loc2), push(loc1), climb_on, grab]).
plan(5, [go(loc3), push(loc1), climb_on, grab, climb_off]).

% Answer 2
plan(4, [go(loc3), push(loc1), climb_on, grab]).

% Reason 2
proof_step(2, 1, location(loc1), source(1)).
proof_step(2, 2, location(loc3), source(3)).
proof_step(2, 3, plan_length(4), source(5)).
proof_step(2, 4, initial_state([loc1, loc2, loc3, n, n]), source(7)).
proof_step(2, 5, '\\='(loc3, loc2), builtin).
proof_step(2, 6, '\\='(loc1, loc3), builtin).
proof_step(
    2,
    7,
    legal_move([loc1, loc1, loc1, n, n], climb_on, [loc1, loc1, loc1, y, n]),
    rule(1, [])
).
proof_step(2, 8, '>'(1, 0), builtin).
proof_step(2, 9, is(0, '-'(1, 1)), builtin).
proof_step(2, 10, '>'(2, 0), builtin).
proof_step(2, 11, is(1, '-'(2, 1)), builtin).
proof_step(
    2,
    12,
    legal_move([loc1, loc1, loc1, y, n], grab, [loc1, loc1, loc1, y, y]),
    rule(3, [])
).
proof_step(2, 13, '>'(3, 0), builtin).
proof_step(2, 14, is(2, '-'(3, 1)), builtin).
proof_step(2, 15, '>'(4, 0), builtin).
proof_step(2, 16, is(3, '-'(4, 1)), builtin).
proof_step(
    2,
    17,
    reachable([loc1, loc1, loc1, y, y], 0, [], [loc1, loc1, loc1, y, y]),
    rule(6, [])
).
proof_step(2, 18, '='([loc1, loc1, loc1, y, y], [loc1, loc1, loc1, y, y]), builtin).
proof_step(
    2,
    19,
    legal_move([loc1, loc2, loc3, n, n], go(loc3), [loc1, loc3, loc3, n, n]),
    rule(5, [2, 5])
).
proof_step(
    2,
    20,
    legal_move([loc1, loc3, loc3, n, n], push(loc1), [loc1, loc1, loc1, n, n]),
    rule(4, [1, 6])
).
proof_step(
    2,
    21,
    reachable([loc1, loc1, loc1, y, n], 1, [grab], [loc1, loc1, loc1, y, y]),
    rule(7, [8, 12, 9, 17])
).
proof_step(
    2,
    22,
    reachable([loc1, loc1, loc1, n, n], 2, [climb_on, grab], [loc1, loc1, loc1, y, y]),
    rule(7, [10, 7, 11, 21])
).
proof_step(
    2,
    23,
    reachable(
        [loc1, loc3, loc3, n, n],
        3,
        [push(loc1), climb_on, grab],
        [loc1, loc1, loc1, y, y]
    ),
    rule(7, [13, 20, 14, 22])
).
proof_step(
    2,
    24,
    reachable(
        [loc1, loc2, loc3, n, n],
        4,
        [go(loc3), push(loc1), climb_on, grab],
        [loc1, loc1, loc1, y, y]
    ),
    rule(7, [15, 19, 16, 23])
).
proof_step(
    2,
    25,
    plan(4, [go(loc3), push(loc1), climb_on, grab]),
    rule(8, [3, 4, 24, 18])
).
proof_claim(2, answer(2, [25])).

% Check 2
proof_check(2, checked, [
    steps(25),
    claims(1),
    source_facts(4),
    rule_applications(10),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(14, 0)).
proof_condition(2, c2, "well-foundedness", checked(10, 0)).
proof_condition(2, c3, "justification", checked(26, 0)).
proof_condition(2, c4, "coverage", checked(40, 0)).
proof_condition(2, c5, "re-decision", checked(11, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(25, 0)).
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
