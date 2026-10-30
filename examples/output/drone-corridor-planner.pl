% Answer 1
gps_plan(
    d1,
    plan(
        [fly_gent_brugge, public_coastline_brugge_oostende],
        2800.0,
        0.012,
        0.9602999999999999,
        0.9503999999999999,
        low,
        none,
        [t, t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [train_gent_brugge, public_coastline_brugge_oostende],
        2900.0,
        0.018000000000000002,
        0.974025,
        0.9551999999999999,
        mid,
        none,
        [t, t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [fly_gent_brugge, topup_brugge, public_coastline_brugge_oostende],
        3100.0,
        0.015000000000000001,
        0.96428475,
        0.931392,
        mid,
        none,
        [t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [train_gent_brugge, buy_permit_brugge, cross_corridor_brugge_oostende],
        3050.0,
        0.018000000000000002,
        0.9594396,
        0.995,
        mid,
        yes,
        [t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [fly_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende],
        3250.0,
        0.014,
        0.941094,
        0.9503999999999999,
        low,
        yes,
        [t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [train_gent_brugge, buy_permit_brugge, public_coastline_brugge_oostende],
        3350.0,
        0.02,
        0.9545445,
        0.9551999999999999,
        mid,
        yes,
        [t, t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_brugge, topup_brugge, buy_permit_brugge,
            cross_corridor_brugge_oostende
        ],
        3250.0,
        0.015000000000000001,
        0.9498452039999999,
        0.9702,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_brugge, buy_permit_brugge, topup_brugge,
            cross_corridor_brugge_oostende
        ],
        3250.0,
        0.015000000000000001,
        0.9498452039999999,
        0.9702,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_brugge, topup_brugge, buy_permit_brugge,
            public_coastline_brugge_oostende
        ],
        3550.0,
        0.017,
        0.944999055,
        0.931392,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_brugge, buy_permit_brugge, topup_brugge,
            public_coastline_brugge_oostende
        ],
        3550.0,
        0.017,
        0.944999055,
        0.931392,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge,
            public_coastline_brugge_oostende
        ],
        5000.0,
        0.024,
        0.9546419025,
        0.9126691199999999,
        mid,
        none,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, get_zone_permit_kortrijk, emergency_charge_kortrijk,
            direct_corridor_kortrijk_oostende
        ],
        3500.0,
        0.02,
        0.9435600454499999,
        0.86526,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, emergency_charge_kortrijk, get_zone_permit_kortrijk,
            direct_corridor_kortrijk_oostende
        ],
        3500.0,
        0.019999999999999997,
        0.9435600454499999,
        0.86526,
        mid,
        yes,
        [t, t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, fly_kortrijk_brugge, quick_charge_brugge,
            buy_permit_brugge, cross_corridor_brugge_oostende
        ],
        5150.0,
        0.024,
        0.94034675196,
        0.9506969999999999,
        mid,
        yes,
        [t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, fly_kortrijk_brugge, buy_permit_brugge,
            quick_charge_brugge, cross_corridor_brugge_oostende
        ],
        5150.0,
        0.024,
        0.94034675196,
        0.9506969999999999,
        mid,
        yes,
        [t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge,
            quick_charge_brugge, cross_corridor_brugge_oostende
        ],
        5000.0,
        0.023,
        0.958577964498,
        0.9506969999999999,
        mid,
        yes,
        [t, t]
    )
).
gps_plan(
    d1,
    plan(
        [
            fly_gent_kortrijk, get_zone_permit_kortrijk, fly_kortrijk_brugge,
            quick_charge_brugge, public_coastline_brugge_oostende
        ],
        5300.0,
        0.025,
        0.9536872605975,
        0.9126691199999999,
        mid,
        yes,
        [t, t]
    )
).

% Answer 2
surviving_plan(
    [fly_gent_brugge, public_coastline_brugge_oostende],
    2800.0,
    0.012,
    0.9602999999999999,
    0.9503999999999999,
    low,
    none,
    [t, t, t, t, t]
).

% Reason 2
proof_step(2, 1, fuel(fuel7, [t, t, t, t, t, t, t]), source(1)).
proof_step(
    2,
    2,
    step(
        state(gent, full, none),
        state(brugge, mid, none),
        fly_gent_brugge,
        1500.0,
        0.006,
        0.99,
        0.99
    ),
    rule(1, [])
).
proof_step(
    2,
    3,
    step(
        state(brugge, mid, none),
        state(oostende, low, none),
        public_coastline_brugge_oostende,
        1300.0,
        0.006,
        0.97,
        0.96
    ),
    rule(11, [])
).
proof_step(
    2,
    4,
    '='(
        [fly_gent_brugge, public_coastline_brugge_oostende],
        [fly_gent_brugge, public_coastline_brugge_oostende]
    ),
    builtin
).
proof_step(2, 5, is(2800.0, '+'(1500.0, 1300.0)), builtin).
proof_step(2, 6, is(0.012, '+'(0.006, 0.006)), builtin).
proof_step(2, 7, is(0.9602999999999999, '*'(0.99, 0.97)), builtin).
proof_step(2, 8, is(0.9503999999999999, '*'(0.99, 0.96)), builtin).
proof_step(2, 9, '>'(0.9602999999999999, 0.94), builtin).
proof_step(2, 10, '<'(0.012, 0.03), builtin).
proof_step(
    2,
    11,
    path(
        state(brugge, mid, none),
        state(oostende, low, none),
        [public_coastline_brugge_oostende],
        1300.0,
        0.006,
        0.97,
        0.96,
        [t, t, t, t, t, t],
        [t, t, t, t, t]
    ),
    rule(13, [3])
).
proof_step(
    2,
    12,
    path(
        state(gent, full, none),
        state(oostende, low, none),
        [fly_gent_brugge, public_coastline_brugge_oostende],
        2800.0,
        0.012,
        0.9602999999999999,
        0.9503999999999999,
        [t, t, t, t, t, t, t],
        [t, t, t, t, t]
    ),
    rule(14, [2, 11, 4, 5, 6, 7, 8])
).
proof_step(
    2,
    13,
    surviving_plan(
        [fly_gent_brugge, public_coastline_brugge_oostende],
        2800.0,
        0.012,
        0.9602999999999999,
        0.9503999999999999,
        low,
        none,
        [t, t, t, t, t]
    ),
    rule(15, [1, 12, 9, 10])
).
proof_claim(2, answer(2, [13])).

% Check 2
proof_check(2, checked, [
    steps(13),
    claims(1),
    source_facts(1),
    rule_applications(5),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(6, 0)).
proof_condition(2, c2, "well-foundedness", checked(5, 0)).
proof_condition(2, c3, "justification", checked(14, 0)).
proof_condition(2, c4, "coverage", checked(20, 0)).
proof_condition(2, c5, "re-decision", checked(7, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(13, 0)).
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
