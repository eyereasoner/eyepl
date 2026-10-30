% Answer 1
temperature_difference(wall1, 25.0).

% Answer 2
thermal_resistance(wall1, 0.020833333333333332).

% Answer 3
heat_loss(wall1, 1200.0).

% Answer 4
status(wall1, high_heat_loss).

% Answer 5
status(wall1, high_heat_loss).

% Reason 5
proof_step(5, 1, wall(wall1, conductivity_W_mK, 0.8), source(1)).
proof_step(5, 2, wall(wall1, area_m2, 12.0), source(2)).
proof_step(5, 3, wall(wall1, thickness_m, 0.2), source(3)).
proof_step(5, 4, wall(wall1, indoor_C, 21.0), source(4)).
proof_step(5, 5, wall(wall1, outdoor_C, -4.0), source(5)).
proof_step(5, 6, is(9.600000000000001, '*'(0.8, 12.0)), builtin).
proof_step(5, 7, is(0.020833333333333332, '/'(0.2, 9.600000000000001)), builtin).
proof_step(
    5,
    8,
    thermal_resistance(wall1, 0.020833333333333332),
    rule(2, [3, 1, 2, 6, 7])
).
proof_step(5, 9, is(25.0, '-'(21.0, -4.0)), builtin).
proof_step(5, 10, temperature_difference(wall1, 25.0), rule(1, [4, 5, 9])).
proof_step(5, 11, is(1200.0, '/'(25.0, 0.020833333333333332)), builtin).
proof_step(5, 12, heat_loss(wall1, 1200.0), rule(3, [10, 8, 11])).
proof_step(5, 13, '>'(1200.0, 1000.0), builtin).
proof_step(5, 14, status(wall1, high_heat_loss), rule(8, [12, 13])).
proof_claim(5, answer(5, [14])).

% Check 5
proof_check(5, checked, [
    steps(14),
    claims(1),
    source_facts(5),
    rule_applications(4),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(5, c1, "resolution", checked(9, 0)).
proof_condition(5, c2, "well-foundedness", checked(4, 0)).
proof_condition(5, c3, "justification", checked(15, 0)).
proof_condition(5, c4, "coverage", checked(24, 0)).
proof_condition(5, c5, "re-decision", checked(5, 0)).
proof_condition(
    5,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(5, c7, "relevance", checked(14, 0)).
proof_condition(
    5,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(5, c9, "query isolation", checked(1, 0)).

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).
