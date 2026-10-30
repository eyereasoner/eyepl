% Answer 1
metric(bp1, thermal_margin_c, -18.0).
metric(bp1, resistive_heating_w, 16.0).

% Answer 2
diagnosis(bp1, thermal_runaway_precursor).

% Answer 3
action(bp1, isolate_and_cool).

% Answer 4
action(bp1, isolate_and_cool).

% Reason 4
proof_step(4, 1, telemetry(bp1, temperature_c, 78.0), source(1)).
proof_step(4, 2, telemetry(bp1, temperature_rise_c_per_min, 4.2), source(2)).
proof_step(4, 3, telemetry(bp1, current_a, 32.0), source(3)).
proof_step(4, 4, telemetry(bp1, internal_resistance_ohm, 0.015625), source(4)).
proof_step(4, 5, telemetry(bp1, cell_delta_v, 0.19), source(5)).
proof_step(4, 6, redundant_telemetry(bp1, temperature_c, 76.0), source(6)).
proof_step(4, 7, safety_limit(max_safe_temperature_c, 60.0), source(7)).
proof_step(4, 8, safety_limit(max_temperature_rise_c_per_min, 1.5), source(8)).
proof_step(4, 9, safety_limit(max_cell_delta_v, 0.08), source(9)).
proof_step(4, 10, cooling_capacity_w(bp1, 12.0), source(10)).
proof_step(4, 11, '>'(78.0, 60.0), builtin).
proof_step(4, 12, over_temperature(bp1), rule(3, [1, 7, 11])).
proof_step(4, 13, '>'(76.0, 60.0), builtin).
proof_step(4, 14, corroborated_over_temperature(bp1), rule(7, [1, 6, 7, 11, 13])).
proof_step(4, 15, '>'(4.2, 1.5), builtin).
proof_step(4, 16, rapid_heating(bp1), rule(4, [2, 8, 15])).
proof_step(4, 17, is(1024.0, '*'(32.0, 32.0)), builtin).
proof_step(4, 18, is(16.0, '*'(1024.0, 0.015625)), builtin).
proof_step(4, 19, metric(bp1, resistive_heating_w, 16.0), rule(2, [3, 4, 17, 18])).
proof_step(4, 20, '>'(0.19, 0.08), builtin).
proof_step(4, 21, cell_imbalance(bp1), rule(5, [5, 9, 20])).
proof_step(4, 22, '>'(16.0, 12.0), builtin).
proof_step(4, 23, heating_exceeds_cooling(bp1), rule(6, [19, 10, 22])).
proof_step(4, 24, diagnosis(bp1, thermal_runaway_precursor), rule(8, [12, 16, 21, 23])).
proof_step(4, 25, action(bp1, isolate_and_cool), rule(9, [24, 14])).
proof_claim(4, answer(4, [25])).

% Check 4
proof_check(4, checked, [
    steps(25),
    claims(1),
    source_facts(10),
    rule_applications(8),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(4, c1, "resolution", checked(18, 0)).
proof_condition(4, c2, "well-foundedness", checked(8, 0)).
proof_condition(4, c3, "justification", checked(26, 0)).
proof_condition(4, c4, "coverage", checked(47, 0)).
proof_condition(4, c5, "re-decision", checked(7, 0)).
proof_condition(4, c6, "boundary consistency", checked(0, 0)).
proof_condition(4, c7, "relevance", checked(25, 0)).
proof_condition(
    4,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(4, c9, "query isolation", checked(1, 0)).

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
