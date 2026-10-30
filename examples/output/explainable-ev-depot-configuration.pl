% Answer 1
recommendation(depot_a, fleet22).

% Reason 1
proof_step(1, 1, site(depot_a, 60, 22, ccs2, three_phase), source(1)).
proof_step(1, 2, charger(fleet22, 22, 45, ccs2, three_phase, 600000), source(2)).
proof_step(1, 3, charger(rapid50, 50, 80, ccs2, three_phase, 900000), source(3)).
proof_step(1, 4, charger(budget11, 11, 25, ccs2, three_phase, 220000), source(4)).
proof_step(1, 5, charger(legacy22, 22, 45, type2, three_phase, 350000), source(5)).
proof_step(1, 6, '<'(60, 80), builtin).
proof_step(
    1,
    7,
    blocker(depot_a, rapid50, insufficient_site_power(60, 80)),
    rule(1, [1, 3, 6])
).
proof_step(1, 8, '<'(11, 22), builtin).
proof_step(
    1,
    9,
    blocker(depot_a, budget11, insufficient_charge_rate(11, 22)),
    rule(2, [1, 4, 8])
).
proof_step(1, 10, '\\='(type2, ccs2), builtin).
proof_step(
    1,
    11,
    blocker(depot_a, legacy22, connector_mismatch(type2, ccs2)),
    rule(3, [1, 5, 10])
).
proof_step(1, 12, '>='(50, 22), builtin).
proof_step(1, 13, '>'(80, 60), builtin).
proof_step(1, 14, is(20, '-'(80, 60)), builtin).
proof_step(1, 15, power_upgrade(depot_a, rapid50, 20), rule(13, [1, 3, 12, 13, 14])).
proof_step(1, 16, has_blocker(depot_a, rapid50), rule(5, [7])).
proof_step(
    1,
    17,
    required_change(depot_a, rapid50, increase_site_power_to(80)),
    rule(9, [7])
).
proof_step(1, 18, has_blocker(depot_a, budget11), rule(5, [9])).
proof_step(
    1,
    19,
    required_change(depot_a, budget11, choose_charger_at_least_kw(22)),
    rule(10, [9])
).
proof_step(1, 20, has_blocker(depot_a, legacy22), rule(5, [11])).
proof_step(
    1,
    21,
    required_change(depot_a, legacy22, choose_connector(ccs2)),
    rule(11, [11])
).
proof_step(1, 22, has_blocker(depot_a, fleet22), absent(1)).
proof_step(1, 23, compatible(depot_a, fleet22), rule(6, [1, 2, 22])).
proof_step(1, 24, priced_option(depot_a, fleet22, 600000), rule(7, [23, 2])).
proof_step(
    1,
    25,
    '$aggregate:r8:2'(
        [
            binding('Site', depot_a),
            binding('_$43', 60),
            binding('_$44', 22),
            binding('_$45', ccs2),
            binding('_$46', three_phase)
        ],
        600000
    ),
    aggregate(rule(8), 2, 2)
).
proof_step(1, 26, recommendation(depot_a, fleet22), rule(8, [1, 25, 24])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 5).
proof_boundary_steps(1, 1, 7, 7).
proof_boundary_steps(1, 1, 9, 9).
proof_boundary_steps(1, 1, 11, 11).
proof_boundary_steps(1, 1, 15, 21).
proof_boundary(1, 2, 1).
proof_boundary_steps(1, 2, 1, 5).
proof_boundary_steps(1, 2, 7, 7).
proof_boundary_steps(1, 2, 9, 9).
proof_boundary_steps(1, 2, 11, 11).
proof_boundary_steps(1, 2, 15, 21).
proof_boundary_steps(1, 2, 23, 24).
proof_claim(1, answer(1, [26])).

% Answer 2
blocker(depot_a, rapid50, insufficient_site_power(60, 80)).
blocker(depot_a, budget11, insufficient_charge_rate(11, 22)).
blocker(depot_a, legacy22, connector_mismatch(type2, ccs2)).

% Answer 3
required_change(depot_a, rapid50, increase_site_power_to(80)).
required_change(depot_a, budget11, choose_charger_at_least_kw(22)).
required_change(depot_a, legacy22, choose_connector(ccs2)).

% Answer 4
power_upgrade(depot_a, rapid50, 20).

% Reason 4
proof_step(4, 1, site(depot_a, 60, 22, ccs2, three_phase), source(1)).
proof_step(4, 2, charger(rapid50, 50, 80, ccs2, three_phase, 900000), source(3)).
proof_step(4, 3, '>='(50, 22), builtin).
proof_step(4, 4, '>'(80, 60), builtin).
proof_step(4, 5, is(20, '-'(80, 60)), builtin).
proof_step(4, 6, power_upgrade(depot_a, rapid50, 20), rule(13, [1, 2, 3, 4, 5])).
proof_claim(4, answer(4, [6])).

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
