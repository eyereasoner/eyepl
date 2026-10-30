% Answer 1
record_shape(temperature(room, 21), temperature, 2).
record_shape(unexpected(on), unexpected, 1).
record_shape(location(sensor, north), location, 2).
record_shape(location(sensor, north, 3), location, 3).

% Answer 2
rejected(unexpected(on), unexpected, 1).
rejected(location(sensor, north), location, 2).

% Reason 2
proof_step(
    2,
    1,
    batch([
        temperature(room, 21),
        location(sensor, north, 3),
        location(sensor, north),
        unexpected(on)
    ]),
    source(1)
).
proof_step(2, 2, schema(temperature, 2), source(2)).
proof_step(2, 3, schema(location, 3), source(3)).
proof_step(2, 4, length([], 0), source(4)).
proof_step(
    2,
    5,
    member(
        temperature(room, 21),
        [
            temperature(room, 21),
            location(sensor, north, 3),
            location(sensor, north),
            unexpected(on)
        ]
    ),
    rule(1, [])
).
proof_step(
    2,
    6,
    member(
        location(sensor, north, 3),
        [location(sensor, north, 3), location(sensor, north), unexpected(on)]
    ),
    rule(1, [])
).
proof_step(
    2,
    7,
    member(location(sensor, north), [location(sensor, north), unexpected(on)]),
    rule(1, [])
).
proof_step(2, 8, member(unexpected(on), [unexpected(on)]), rule(1, [])).
proof_step(2, 9, is(1, '+'(0, 1)), builtin).
proof_step(2, 10, is(2, '+'(1, 1)), builtin).
proof_step(2, 11, '=..'(temperature(room, 21), [temperature, room, 21]), builtin).
proof_step(2, 12, is(3, '+'(2, 1)), builtin).
proof_step(2, 13, '=..'(unexpected(on), [unexpected, on]), builtin).
proof_step(2, 14, '=..'(location(sensor, north), [location, sensor, north]), builtin).
proof_step(
    2,
    15,
    '=..'(
        accepted_record(temperature, [room, 21]),
        [accepted_record, temperature, [room, 21]]
    ),
    builtin
).
proof_step(
    2,
    16,
    '=..'(location(sensor, north, 3), [location, sensor, north, 3]),
    builtin
).
proof_step(
    2,
    17,
    '=..'(
        accepted_record(location, [sensor, north, 3]),
        [accepted_record, location, [sensor, north, 3]]
    ),
    builtin
).
proof_step(
    2,
    18,
    member(
        location(sensor, north, 3),
        [
            temperature(room, 21),
            location(sensor, north, 3),
            location(sensor, north),
            unexpected(on)
        ]
    ),
    rule(2, [6])
).
proof_step(
    2,
    19,
    member(
        location(sensor, north),
        [location(sensor, north, 3), location(sensor, north), unexpected(on)]
    ),
    rule(2, [7])
).
proof_step(
    2,
    20,
    member(unexpected(on), [location(sensor, north), unexpected(on)]),
    rule(2, [8])
).
proof_step(2, 21, length([21], 1), rule(3, [4, 9])).
proof_step(2, 22, length([3], 1), rule(3, [4, 9])).
proof_step(2, 23, length([north], 1), rule(3, [4, 9])).
proof_step(2, 24, length([on], 1), rule(3, [4, 9])).
proof_step(
    2,
    25,
    member(
        location(sensor, north),
        [
            temperature(room, 21),
            location(sensor, north, 3),
            location(sensor, north),
            unexpected(on)
        ]
    ),
    rule(2, [19])
).
proof_step(
    2,
    26,
    member(
        unexpected(on),
        [location(sensor, north, 3), location(sensor, north), unexpected(on)]
    ),
    rule(2, [20])
).
proof_step(2, 27, length([room, 21], 2), rule(3, [21, 10])).
proof_step(2, 28, length([north, 3], 2), rule(3, [22, 10])).
proof_step(2, 29, length([sensor, north], 2), rule(3, [23, 10])).
proof_step(
    2,
    30,
    member(
        unexpected(on),
        [
            temperature(room, 21),
            location(sensor, north, 3),
            location(sensor, north),
            unexpected(on)
        ]
    ),
    rule(2, [26])
).
proof_step(
    2,
    31,
    record_shape(temperature(room, 21), temperature, 2),
    rule(4, [1, 5, 11, 27])
).
proof_step(2, 32, length([sensor, north, 3], 3), rule(3, [28, 12])).
proof_step(
    2,
    33,
    record_shape(location(sensor, north), location, 2),
    rule(4, [1, 25, 14, 29])
).
proof_step(2, 34, record_shape(unexpected(on), unexpected, 1), rule(4, [1, 30, 13, 24])).
proof_step(2, 35, accepted(temperature(room, 21)), rule(5, [31, 2])).
proof_step(
    2,
    36,
    record_shape(location(sensor, north, 3), location, 3),
    rule(4, [1, 18, 16, 32])
).
proof_step(
    2,
    37,
    receipt(temperature(room, 21), accepted_record(temperature, [room, 21])),
    rule(7, [35, 11, 15])
).
proof_step(2, 38, accepted(location(sensor, north, 3)), rule(5, [36, 3])).
proof_step(
    2,
    39,
    receipt(location(sensor, north, 3), accepted_record(location, [sensor, north, 3])),
    rule(7, [38, 16, 17])
).
proof_step(2, 40, schema(unexpected, 1), absent(1)).
proof_step(2, 41, schema(location, 2), absent(1)).
proof_step(2, 42, rejected(unexpected(on), unexpected, 1), rule(6, [34, 40])).
proof_step(2, 43, rejected(location(sensor, north), location, 2), rule(6, [33, 41])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 8).
proof_boundary_steps(2, 1, 18, 39).
proof_boundary_call(2, 1, length([21], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([north, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([north], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([on], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([room, 21], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([sensor, north, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, length([sensor, north], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [])).
proof_boundary_call(
    2,
    1,
    member(variable("_EyeplCall0"), [location(sensor, north), unexpected(on)])
).
proof_boundary_call(
    2,
    1,
    member(
        variable("_EyeplCall0"),
        [location(sensor, north, 3), location(sensor, north), unexpected(on)]
    )
).
proof_boundary_call(
    2,
    1,
    member(
        variable("_EyeplCall0"),
        [
            temperature(room, 21),
            location(sensor, north, 3),
            location(sensor, north),
            unexpected(on)
        ]
    )
).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [unexpected(on)])).
proof_claim(2, answer(2, [42])).
proof_claim(2, answer(2, [43])).

% Answer 3
receipt(temperature(room, 21), accepted_record(temperature, [room, 21])).
receipt(location(sensor, north, 3), accepted_record(location, [sensor, north, 3])).

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

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).

% Goal check 12
check_result(12, true).

% Goal check 13
check_result(13, true).
