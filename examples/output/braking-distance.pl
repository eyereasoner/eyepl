% Answer 1
gap_status(city_dry, sufficient_in_model).
gap_status(highway_short_gap, insufficient_in_model).
gap_status(city_wet, sufficient_in_model).
gap_status(city_ice, insufficient_in_model).

% Reason 1
proof_step(1, 1, gravity(9.8), source(1)).
proof_step(1, 2, reaction_time(1.0), source(2)).
proof_step(1, 3, scenario(city_dry, 13.9, 0.8, 40.0), source(3)).
proof_step(1, 4, scenario(highway_short_gap, 27.8, 0.8, 60.0), source(4)).
proof_step(1, 5, scenario(city_wet, 13.9, 0.4, 40.0), source(5)).
proof_step(1, 6, scenario(city_ice, 13.9, 0.2, 30.0), source(6)).
proof_step(1, 7, '>='(13.9, 0), builtin).
proof_step(1, 8, '>'(0.8, 0), builtin).
proof_step(1, 9, '=<'(0.8, 1), builtin).
proof_step(1, 10, '>'(9.8, 0), builtin).
proof_step(1, 11, '>='(1.0, 0), builtin).
proof_step(1, 12, is(13.9, '*'(13.9, 1.0)), builtin).
proof_step(
    1,
    13,
    is(12.322066326530612, '/'('*'(13.9, 13.9), '*'('*'(2, 0.8), 9.8))),
    builtin
).
proof_step(1, 14, is(26.222066326530612, '+'(13.9, 12.322066326530612)), builtin).
proof_step(
    1,
    15,
    distance(city_dry, 13.9, 12.322066326530612, 26.222066326530612),
    rule(1, [3, 1, 2, 7, 8, 9, 10, 11, 12, 13, 14])
).
proof_step(1, 16, '>='(27.8, 0), builtin).
proof_step(1, 17, is(27.8, '*'(27.8, 1.0)), builtin).
proof_step(
    1,
    18,
    is(49.28826530612245, '/'('*'(27.8, 27.8), '*'('*'(2, 0.8), 9.8))),
    builtin
).
proof_step(1, 19, is(77.08826530612245, '+'(27.8, 49.28826530612245)), builtin).
proof_step(
    1,
    20,
    distance(highway_short_gap, 27.8, 49.28826530612245, 77.08826530612245),
    rule(1, [4, 1, 2, 16, 8, 9, 10, 11, 17, 18, 19])
).
proof_step(1, 21, '>'(0.4, 0), builtin).
proof_step(1, 22, '=<'(0.4, 1), builtin).
proof_step(
    1,
    23,
    is(24.644132653061224, '/'('*'(13.9, 13.9), '*'('*'(2, 0.4), 9.8))),
    builtin
).
proof_step(1, 24, is(38.544132653061226, '+'(13.9, 24.644132653061224)), builtin).
proof_step(
    1,
    25,
    distance(city_wet, 13.9, 24.644132653061224, 38.544132653061226),
    rule(1, [5, 1, 2, 7, 21, 22, 10, 11, 12, 23, 24])
).
proof_step(1, 26, '>'(0.2, 0), builtin).
proof_step(1, 27, '=<'(0.2, 1), builtin).
proof_step(
    1,
    28,
    is(49.28826530612245, '/'('*'(13.9, 13.9), '*'('*'(2, 0.2), 9.8))),
    builtin
).
proof_step(1, 29, is(63.188265306122446, '+'(13.9, 49.28826530612245)), builtin).
proof_step(
    1,
    30,
    distance(city_ice, 13.9, 49.28826530612245, 63.188265306122446),
    rule(1, [6, 1, 2, 7, 26, 27, 10, 11, 12, 28, 29])
).
proof_step(1, 31, '=<'(26.222066326530612, 40.0), builtin).
proof_step(1, 32, gap_status(city_dry, sufficient_in_model), rule(2, [15, 3, 31])).
proof_step(1, 33, '>'(77.08826530612245, 60.0), builtin).
proof_step(
    1,
    34,
    gap_status(highway_short_gap, insufficient_in_model),
    rule(3, [20, 4, 33])
).
proof_step(1, 35, '=<'(38.544132653061226, 40.0), builtin).
proof_step(1, 36, gap_status(city_wet, sufficient_in_model), rule(2, [25, 5, 35])).
proof_step(1, 37, '>'(63.188265306122446, 30.0), builtin).
proof_step(1, 38, gap_status(city_ice, insufficient_in_model), rule(3, [30, 6, 37])).
proof_claim(1, answer(1, [32])).
proof_claim(1, answer(1, [34])).
proof_claim(1, answer(1, [36])).
proof_claim(1, answer(1, [38])).

% Answer 2
stopping_distance_m(city_dry, 26.222066).
stopping_distance_m(highway_short_gap, 77.088265).
stopping_distance_m(city_wet, 38.544133).
stopping_distance_m(city_ice, 63.188265).

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
