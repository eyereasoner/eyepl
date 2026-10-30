% Answer 1
potential_impact(bank_primary, payment_service).
potential_impact(bank_backup, payment_service).
potential_impact(catalog_primary, checkout_api).
potential_impact(catalog_replica, checkout_api).
potential_impact(catalog_primary, web_store).
potential_impact(catalog_replica, web_store).
potential_impact(catalog_primary, mobile_app).
potential_impact(catalog_replica, mobile_app).
potential_impact(bank_primary, risk_engine).
potential_impact(bank_backup, risk_engine).
potential_impact(bank_primary, checkout_api).
potential_impact(bank_backup, checkout_api).
potential_impact(bank_primary, web_store).
potential_impact(bank_primary, mobile_app).
potential_impact(bank_backup, web_store).
potential_impact(bank_backup, mobile_app).

% Answer 2
affected_function(place_order).
affected_function(mobile_checkout).

% Answer 3
best_repair([catalog_replica, bank_backup], 3).

% Reason 3
proof_step(3, 1, node(catalog_primary, []), source(1)).
proof_step(3, 2, node(catalog_replica, []), source(2)).
proof_step(3, 3, node(bank_primary, []), source(3)).
proof_step(3, 4, node(bank_backup, []), source(4)).
proof_step(3, 5, node(risk_cache, []), source(5)).
proof_step(3, 6, node(risk_engine, [risk_signal]), source(6)).
proof_step(3, 7, node(payment_service, [bank, risk]), source(7)).
proof_step(3, 8, node(checkout_api, [catalog, payment]), source(8)).
proof_step(3, 9, node(web_store, [checkout]), source(9)).
proof_step(3, 10, node(mobile_app, [checkout]), source(10)).
proof_step(3, 11, provider(catalog, catalog_primary), source(11)).
proof_step(3, 12, provider(catalog, catalog_replica), source(12)).
proof_step(3, 13, provider(bank, bank_primary), source(13)).
proof_step(3, 14, provider(bank, bank_backup), source(14)).
proof_step(3, 15, provider(risk, risk_engine), source(15)).
proof_step(3, 16, provider(risk_signal, risk_cache), source(16)).
proof_step(3, 17, provider(risk_signal, payment_service), source(17)).
proof_step(3, 18, provider(payment, payment_service), source(18)).
proof_step(3, 19, provider(checkout, checkout_api), source(19)).
proof_step(3, 20, failed(catalog_primary), source(20)).
proof_step(3, 21, failed(catalog_replica), source(21)).
proof_step(3, 22, failed(bank_primary), source(22)).
proof_step(3, 23, failed(bank_backup), source(23)).
proof_step(
    3,
    24,
    repair_candidates([catalog_primary, catalog_replica, bank_primary, bank_backup]),
    source(24)
).
proof_step(3, 25, repair_price(catalog_primary, 3), source(25)).
proof_step(3, 26, repair_price(catalog_replica, 2), source(26)).
proof_step(3, 27, repair_price(bank_primary, 4), source(27)).
proof_step(3, 28, repair_price(bank_backup, 1), source(28)).
proof_step(3, 29, critical_services([web_store, mobile_app]), source(29)).
proof_step(3, 30, business_function(place_order, web_store), source(30)).
proof_step(3, 31, business_function(mobile_checkout, mobile_app), source(31)).
proof_step(3, 32, subset([], []), source(32)).
proof_step(3, 33, repair_cost([], 0), source(33)).
proof_step(3, 34, member(risk_signal, [risk_signal]), rule(1, [])).
proof_step(3, 35, member(bank, [bank, risk]), rule(1, [])).
proof_step(3, 36, member(catalog, [catalog, payment]), rule(1, [])).
proof_step(3, 37, member(checkout, [checkout]), rule(1, [])).
proof_step(3, 38, member(risk, [risk]), rule(1, [])).
proof_step(3, 39, member(payment, [payment]), rule(1, [])).
proof_step(
    3,
    40,
    member(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(1, [])
).
proof_step(
    3,
    41,
    member(catalog_replica, [catalog_replica, bank_primary, bank_backup]),
    rule(1, [])
).
proof_step(
    3,
    42,
    member(catalog_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(1, [])
).
proof_step(
    3,
    43,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_backup]),
    rule(1, [])
).
proof_step(3, 44, member(catalog_replica, [catalog_replica, bank_backup]), rule(1, [])).
proof_step(3, 45, member(catalog_primary, [catalog_primary, bank_backup]), rule(1, [])).
proof_step(
    3,
    46,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_primary]),
    rule(1, [])
).
proof_step(3, 47, member(catalog_replica, [catalog_replica, bank_primary]), rule(1, [])).
proof_step(3, 48, member(catalog_primary, [catalog_primary, bank_primary]), rule(1, [])).
proof_step(
    3,
    49,
    member(catalog_primary, [catalog_primary, catalog_replica]),
    rule(1, [])
).
proof_step(3, 50, member(catalog_replica, [catalog_replica]), rule(1, [])).
proof_step(3, 51, member(catalog_primary, [catalog_primary]), rule(1, [])).
proof_step(
    3,
    52,
    all_groups([], [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(9, [])
).
proof_step(
    3,
    53,
    all_groups([], [catalog_replica, bank_primary, bank_backup]),
    rule(9, [])
).
proof_step(
    3,
    54,
    all_groups([], [catalog_primary, bank_primary, bank_backup]),
    rule(9, [])
).
proof_step(
    3,
    55,
    all_groups([], [catalog_primary, catalog_replica, bank_backup]),
    rule(9, [])
).
proof_step(3, 56, all_groups([], [catalog_replica, bank_backup]), rule(9, [])).
proof_step(3, 57, all_groups([], [catalog_primary, bank_backup]), rule(9, [])).
proof_step(
    3,
    58,
    all_groups([], [catalog_primary, catalog_replica, bank_primary]),
    rule(9, [])
).
proof_step(3, 59, all_groups([], [catalog_replica, bank_primary]), rule(9, [])).
proof_step(3, 60, all_groups([], [catalog_primary, bank_primary]), rule(9, [])).
proof_step(3, 61, all_groups([], [catalog_primary, catalog_replica]), rule(9, [])).
proof_step(3, 62, all_groups([], [catalog_replica]), rule(9, [])).
proof_step(3, 63, all_groups([], [catalog_primary]), rule(9, [])).
proof_step(3, 64, member(bank_primary, [bank_primary, bank_backup]), rule(1, [])).
proof_step(3, 65, member(bank_backup, [bank_backup]), rule(1, [])).
proof_step(3, 66, member(bank_primary, [bank_primary]), rule(1, [])).
proof_step(
    3,
    67,
    all_operating([], [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(12, [])
).
proof_step(
    3,
    68,
    all_operating([], [catalog_replica, bank_primary, bank_backup]),
    rule(12, [])
).
proof_step(
    3,
    69,
    all_operating([], [catalog_primary, bank_primary, bank_backup]),
    rule(12, [])
).
proof_step(
    3,
    70,
    all_operating([], [catalog_primary, catalog_replica, bank_backup]),
    rule(12, [])
).
proof_step(3, 71, all_operating([], [catalog_replica, bank_backup]), rule(12, [])).
proof_step(3, 72, all_operating([], [catalog_primary, bank_backup]), rule(12, [])).
proof_step(
    3,
    73,
    all_operating([], [catalog_primary, catalog_replica, bank_primary]),
    rule(12, [])
).
proof_step(3, 74, all_operating([], [catalog_replica, bank_primary]), rule(12, [])).
proof_step(3, 75, all_operating([], [catalog_primary, bank_primary]), rule(12, [])).
proof_step(3, 76, is(1, '+'(1, 0)), builtin).
proof_step(3, 77, is(5, '+'(4, 1)), builtin).
proof_step(3, 78, is(7, '+'(2, 5)), builtin).
proof_step(3, 79, is(10, '+'(3, 7)), builtin).
proof_step(3, 80, is(8, '+'(3, 5)), builtin).
proof_step(3, 81, is(3, '+'(2, 1)), builtin).
proof_step(3, 82, is(6, '+'(3, 3)), builtin).
proof_step(3, 83, is(4, '+'(3, 1)), builtin).
proof_step(3, 84, is(4, '+'(4, 0)), builtin).
proof_step(3, 85, is(6, '+'(2, 4)), builtin).
proof_step(3, 86, is(9, '+'(3, 6)), builtin).
proof_step(3, 87, is(7, '+'(3, 4)), builtin).
proof_step(3, 88, all_groups([], []), rule(9, [])).
proof_step(3, 89, all_groups([], [bank_backup]), rule(9, [])).
proof_step(3, 90, subset([bank_backup], [bank_backup]), rule(3, [32])).
proof_step(3, 91, subset([bank_backup], []), rule(4, [32])).
proof_step(3, 92, depends_on(risk_engine, risk_cache), rule(14, [6, 34, 16])).
proof_step(3, 93, depends_on(risk_engine, payment_service), rule(14, [6, 34, 17])).
proof_step(3, 94, depends_on(payment_service, bank_primary), rule(14, [7, 35, 13])).
proof_step(3, 95, depends_on(payment_service, bank_backup), rule(14, [7, 35, 14])).
proof_step(3, 96, depends_on(checkout_api, catalog_primary), rule(14, [8, 36, 11])).
proof_step(3, 97, depends_on(checkout_api, catalog_replica), rule(14, [8, 36, 12])).
proof_step(3, 98, depends_on(web_store, checkout_api), rule(14, [9, 37, 19])).
proof_step(3, 99, depends_on(mobile_app, checkout_api), rule(14, [10, 37, 19])).
proof_step(3, 100, member(risk, [bank, risk]), rule(2, [38])).
proof_step(3, 101, member(payment, [catalog, payment]), rule(2, [39])).
proof_step(
    3,
    102,
    hardware_available(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(7, [20, 40])
).
proof_step(
    3,
    103,
    member(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(2, [41])
).
proof_step(
    3,
    104,
    hardware_available(catalog_replica, [catalog_replica, bank_primary, bank_backup]),
    rule(7, [21, 41])
).
proof_step(
    3,
    105,
    hardware_available(catalog_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(7, [20, 42])
).
proof_step(
    3,
    106,
    hardware_available(catalog_primary, [catalog_primary, catalog_replica, bank_backup]),
    rule(7, [20, 43])
).
proof_step(
    3,
    107,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_backup]),
    rule(2, [44])
).
proof_step(
    3,
    108,
    hardware_available(catalog_replica, [catalog_replica, bank_backup]),
    rule(7, [21, 44])
).
proof_step(
    3,
    109,
    hardware_available(catalog_primary, [catalog_primary, bank_backup]),
    rule(7, [20, 45])
).
proof_step(
    3,
    110,
    hardware_available(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary]
    ),
    rule(7, [20, 46])
).
proof_step(
    3,
    111,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_primary]),
    rule(2, [47])
).
proof_step(
    3,
    112,
    hardware_available(catalog_replica, [catalog_replica, bank_primary]),
    rule(7, [21, 47])
).
proof_step(
    3,
    113,
    hardware_available(catalog_primary, [catalog_primary, bank_primary]),
    rule(7, [20, 48])
).
proof_step(
    3,
    114,
    hardware_available(catalog_primary, [catalog_primary, catalog_replica]),
    rule(7, [20, 49])
).
proof_step(
    3,
    115,
    member(catalog_replica, [catalog_primary, catalog_replica]),
    rule(2, [50])
).
proof_step(
    3,
    116,
    hardware_available(catalog_replica, [catalog_replica]),
    rule(7, [21, 50])
).
proof_step(
    3,
    117,
    hardware_available(catalog_primary, [catalog_primary]),
    rule(7, [20, 51])
).
proof_step(
    3,
    118,
    member(bank_primary, [catalog_replica, bank_primary, bank_backup]),
    rule(2, [64])
).
proof_step(
    3,
    119,
    member(bank_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(2, [64])
).
proof_step(3, 120, member(bank_backup, [bank_primary, bank_backup]), rule(2, [65])).
proof_step(3, 121, member(bank_backup, [catalog_replica, bank_backup]), rule(2, [65])).
proof_step(3, 122, member(bank_backup, [catalog_primary, bank_backup]), rule(2, [65])).
proof_step(3, 123, hardware_available(bank_backup, [bank_backup]), rule(7, [23, 65])).
proof_step(3, 124, member(bank_primary, [catalog_replica, bank_primary]), rule(2, [66])).
proof_step(3, 125, member(bank_primary, [catalog_primary, bank_primary]), rule(2, [66])).
proof_step(3, 126, repair_cost([bank_backup], 1), rule(20, [28, 33, 76])).
proof_step(3, 127, repair_cost([bank_primary], 4), rule(20, [27, 33, 84])).
proof_step(
    3,
    128,
    subset([bank_primary, bank_backup], [bank_primary, bank_backup]),
    rule(3, [90])
).
proof_step(3, 129, subset([bank_primary, bank_backup], [bank_backup]), rule(4, [90])).
proof_step(3, 130, subset([bank_primary, bank_backup], [bank_primary]), rule(3, [91])).
proof_step(3, 131, subset([bank_primary, bank_backup], []), rule(4, [91])).
proof_step(3, 132, impacted(payment_service, bank_primary), rule(15, [94])).
proof_step(3, 133, impacted(payment_service, bank_backup), rule(15, [95])).
proof_step(3, 134, impacted(checkout_api, catalog_primary), rule(15, [96])).
proof_step(3, 135, impacted(checkout_api, catalog_replica), rule(15, [97])).
proof_step(3, 136, depends_on(payment_service, risk_engine), rule(14, [7, 100, 15])).
proof_step(3, 137, depends_on(checkout_api, payment_service), rule(14, [8, 101, 18])).
proof_step(
    3,
    138,
    operating(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [102, 1, 52])
).
proof_step(
    3,
    139,
    hardware_available(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(7, [21, 103])
).
proof_step(
    3,
    140,
    operating(catalog_replica, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [104, 2, 53])
).
proof_step(
    3,
    141,
    operating(catalog_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [105, 1, 54])
).
proof_step(
    3,
    142,
    operating(catalog_primary, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [106, 1, 55])
).
proof_step(
    3,
    143,
    hardware_available(catalog_replica, [catalog_primary, catalog_replica, bank_backup]),
    rule(7, [21, 107])
).
proof_step(
    3,
    144,
    operating(catalog_replica, [catalog_replica, bank_backup]),
    rule(8, [108, 2, 56])
).
proof_step(
    3,
    145,
    operating(catalog_primary, [catalog_primary, bank_backup]),
    rule(8, [109, 1, 57])
).
proof_step(
    3,
    146,
    operating(catalog_primary, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [110, 1, 58])
).
proof_step(
    3,
    147,
    hardware_available(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary]
    ),
    rule(7, [21, 111])
).
proof_step(
    3,
    148,
    operating(catalog_replica, [catalog_replica, bank_primary]),
    rule(8, [112, 2, 59])
).
proof_step(
    3,
    149,
    operating(catalog_primary, [catalog_primary, bank_primary]),
    rule(8, [113, 1, 60])
).
proof_step(
    3,
    150,
    operating(catalog_primary, [catalog_primary, catalog_replica]),
    rule(8, [114, 1, 61])
).
proof_step(
    3,
    151,
    hardware_available(catalog_replica, [catalog_primary, catalog_replica]),
    rule(7, [21, 115])
).
proof_step(3, 152, operating(catalog_replica, [catalog_replica]), rule(8, [116, 2, 62])).
proof_step(3, 153, operating(catalog_primary, [catalog_primary]), rule(8, [117, 1, 63])).
proof_step(
    3,
    154,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(2, [118])
).
proof_step(
    3,
    155,
    hardware_available(bank_primary, [catalog_replica, bank_primary, bank_backup]),
    rule(7, [22, 118])
).
proof_step(
    3,
    156,
    hardware_available(bank_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(7, [22, 119])
).
proof_step(
    3,
    157,
    member(bank_backup, [catalog_replica, bank_primary, bank_backup]),
    rule(2, [120])
).
proof_step(
    3,
    158,
    member(bank_backup, [catalog_primary, bank_primary, bank_backup]),
    rule(2, [120])
).
proof_step(
    3,
    159,
    member(bank_backup, [catalog_primary, catalog_replica, bank_backup]),
    rule(2, [121])
).
proof_step(
    3,
    160,
    hardware_available(bank_backup, [catalog_replica, bank_backup]),
    rule(7, [23, 121])
).
proof_step(
    3,
    161,
    hardware_available(bank_backup, [catalog_primary, bank_backup]),
    rule(7, [23, 122])
).
proof_step(3, 162, operating(bank_backup, [bank_backup]), rule(8, [123, 4, 89])).
proof_step(
    3,
    163,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary]),
    rule(2, [124])
).
proof_step(
    3,
    164,
    hardware_available(bank_primary, [catalog_replica, bank_primary]),
    rule(7, [22, 124])
).
proof_step(
    3,
    165,
    hardware_available(bank_primary, [catalog_primary, bank_primary]),
    rule(7, [22, 125])
).
proof_step(3, 166, repair_cost([bank_primary, bank_backup], 5), rule(20, [27, 126, 77])).
proof_step(
    3,
    167,
    repair_cost([catalog_replica, bank_backup], 3),
    rule(20, [26, 126, 81])
).
proof_step(
    3,
    168,
    repair_cost([catalog_primary, bank_backup], 4),
    rule(20, [25, 126, 83])
).
proof_step(
    3,
    169,
    repair_cost([catalog_replica, bank_primary], 6),
    rule(20, [26, 127, 85])
).
proof_step(
    3,
    170,
    repair_cost([catalog_primary, bank_primary], 7),
    rule(20, [25, 127, 87])
).
proof_step(
    3,
    171,
    subset(
        [catalog_replica, bank_primary, bank_backup],
        [catalog_replica, bank_primary, bank_backup]
    ),
    rule(3, [128])
).
proof_step(
    3,
    172,
    subset([catalog_replica, bank_primary, bank_backup], [bank_primary, bank_backup]),
    rule(4, [128])
).
proof_step(
    3,
    173,
    subset([catalog_replica, bank_primary, bank_backup], [catalog_replica, bank_backup]),
    rule(3, [129])
).
proof_step(
    3,
    174,
    subset([catalog_replica, bank_primary, bank_backup], [bank_backup]),
    rule(4, [129])
).
proof_step(
    3,
    175,
    subset(
        [catalog_replica, bank_primary, bank_backup],
        [catalog_replica, bank_primary]
    ),
    rule(3, [130])
).
proof_step(
    3,
    176,
    subset([catalog_replica, bank_primary, bank_backup], [bank_primary]),
    rule(4, [130])
).
proof_step(
    3,
    177,
    subset([catalog_replica, bank_primary, bank_backup], [catalog_replica]),
    rule(3, [131])
).
proof_step(
    3,
    178,
    subset([catalog_replica, bank_primary, bank_backup], []),
    rule(4, [131])
).
proof_step(3, 179, impacted(risk_engine, bank_primary), rule(16, [93, 132])).
proof_step(3, 180, potential_impact(bank_primary, payment_service), rule(17, [22, 132])).
proof_step(3, 181, impacted(risk_engine, bank_backup), rule(16, [93, 133])).
proof_step(3, 182, potential_impact(bank_backup, payment_service), rule(17, [23, 133])).
proof_step(3, 183, impacted(web_store, catalog_primary), rule(16, [98, 134])).
proof_step(3, 184, impacted(mobile_app, catalog_primary), rule(16, [99, 134])).
proof_step(3, 185, potential_impact(catalog_primary, checkout_api), rule(17, [20, 134])).
proof_step(3, 186, impacted(web_store, catalog_replica), rule(16, [98, 135])).
proof_step(3, 187, impacted(mobile_app, catalog_replica), rule(16, [99, 135])).
proof_step(3, 188, potential_impact(catalog_replica, checkout_api), rule(17, [21, 135])).
proof_step(3, 189, impacted(checkout_api, bank_primary), rule(16, [137, 132])).
proof_step(3, 190, impacted(checkout_api, bank_backup), rule(16, [137, 133])).
proof_step(
    3,
    191,
    group_operating(
        catalog,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(11, [11, 138])
).
proof_step(
    3,
    192,
    operating(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [139, 2, 52])
).
proof_step(
    3,
    193,
    group_operating(catalog, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [12, 140])
).
proof_step(
    3,
    194,
    group_operating(catalog, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [11, 141])
).
proof_step(
    3,
    195,
    group_operating(catalog, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [11, 142])
).
proof_step(
    3,
    196,
    operating(catalog_replica, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [143, 2, 55])
).
proof_step(
    3,
    197,
    group_operating(catalog, [catalog_replica, bank_backup]),
    rule(11, [12, 144])
).
proof_step(
    3,
    198,
    group_operating(catalog, [catalog_primary, bank_backup]),
    rule(11, [11, 145])
).
proof_step(
    3,
    199,
    group_operating(catalog, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [11, 146])
).
proof_step(
    3,
    200,
    operating(catalog_replica, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [147, 2, 58])
).
proof_step(
    3,
    201,
    group_operating(catalog, [catalog_replica, bank_primary]),
    rule(11, [12, 148])
).
proof_step(
    3,
    202,
    group_operating(catalog, [catalog_primary, bank_primary]),
    rule(11, [11, 149])
).
proof_step(
    3,
    203,
    group_operating(catalog, [catalog_primary, catalog_replica]),
    rule(11, [11, 150])
).
proof_step(
    3,
    204,
    operating(catalog_replica, [catalog_primary, catalog_replica]),
    rule(8, [151, 2, 61])
).
proof_step(3, 205, group_operating(catalog, [catalog_replica]), rule(11, [12, 152])).
proof_step(3, 206, group_operating(catalog, [catalog_primary]), rule(11, [11, 153])).
proof_step(
    3,
    207,
    hardware_available(
        bank_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(7, [22, 154])
).
proof_step(
    3,
    208,
    operating(bank_primary, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [155, 3, 53])
).
proof_step(
    3,
    209,
    operating(bank_primary, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [156, 3, 54])
).
proof_step(
    3,
    210,
    member(bank_backup, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(2, [157])
).
proof_step(
    3,
    211,
    hardware_available(bank_backup, [catalog_replica, bank_primary, bank_backup]),
    rule(7, [23, 157])
).
proof_step(
    3,
    212,
    hardware_available(bank_backup, [catalog_primary, bank_primary, bank_backup]),
    rule(7, [23, 158])
).
proof_step(
    3,
    213,
    hardware_available(bank_backup, [catalog_primary, catalog_replica, bank_backup]),
    rule(7, [23, 159])
).
proof_step(
    3,
    214,
    operating(bank_backup, [catalog_replica, bank_backup]),
    rule(8, [160, 4, 56])
).
proof_step(
    3,
    215,
    operating(bank_backup, [catalog_primary, bank_backup]),
    rule(8, [161, 4, 57])
).
proof_step(3, 216, group_operating(bank, [bank_backup]), rule(11, [14, 162])).
proof_step(
    3,
    217,
    hardware_available(bank_primary, [catalog_primary, catalog_replica, bank_primary]),
    rule(7, [22, 163])
).
proof_step(
    3,
    218,
    operating(bank_primary, [catalog_replica, bank_primary]),
    rule(8, [164, 3, 59])
).
proof_step(
    3,
    219,
    operating(bank_primary, [catalog_primary, bank_primary]),
    rule(8, [165, 3, 60])
).
proof_step(
    3,
    220,
    repair_cost([catalog_replica, bank_primary, bank_backup], 7),
    rule(20, [26, 166, 78])
).
proof_step(
    3,
    221,
    repair_cost([catalog_primary, bank_primary, bank_backup], 8),
    rule(20, [25, 166, 80])
).
proof_step(
    3,
    222,
    repair_cost([catalog_primary, catalog_replica, bank_backup], 6),
    rule(20, [25, 167, 82])
).
proof_step(
    3,
    223,
    repair_cost([catalog_primary, catalog_replica, bank_primary], 9),
    rule(20, [25, 169, 86])
).
proof_step(
    3,
    224,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(3, [171])
).
proof_step(
    3,
    225,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_replica, bank_primary, bank_backup]
    ),
    rule(4, [171])
).
proof_step(
    3,
    226,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, bank_primary, bank_backup]
    ),
    rule(3, [172])
).
proof_step(
    3,
    227,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [bank_primary, bank_backup]
    ),
    rule(4, [172])
).
proof_step(
    3,
    228,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, catalog_replica, bank_backup]
    ),
    rule(3, [173])
).
proof_step(
    3,
    229,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_replica, bank_backup]
    ),
    rule(4, [173])
).
proof_step(
    3,
    230,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, bank_backup]
    ),
    rule(3, [174])
).
proof_step(
    3,
    231,
    subset([catalog_primary, catalog_replica, bank_primary, bank_backup], [bank_backup]),
    rule(4, [174])
).
proof_step(
    3,
    232,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, catalog_replica, bank_primary]
    ),
    rule(3, [175])
).
proof_step(
    3,
    233,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_replica, bank_primary]
    ),
    rule(4, [175])
).
proof_step(
    3,
    234,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, bank_primary]
    ),
    rule(3, [176])
).
proof_step(
    3,
    235,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [bank_primary]
    ),
    rule(4, [176])
).
proof_step(
    3,
    236,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary, catalog_replica]
    ),
    rule(3, [177])
).
proof_step(
    3,
    237,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_replica]
    ),
    rule(4, [177])
).
proof_step(
    3,
    238,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        [catalog_primary]
    ),
    rule(3, [178])
).
proof_step(
    3,
    239,
    subset([catalog_primary, catalog_replica, bank_primary, bank_backup], []),
    rule(4, [178])
).
proof_step(3, 240, potential_impact(bank_primary, risk_engine), rule(17, [22, 179])).
proof_step(3, 241, potential_impact(bank_backup, risk_engine), rule(17, [23, 181])).
proof_step(3, 242, potential_impact(catalog_primary, web_store), rule(17, [20, 183])).
proof_step(3, 243, potential_impact(catalog_primary, mobile_app), rule(17, [20, 184])).
proof_step(3, 244, potential_impact(catalog_replica, web_store), rule(17, [21, 186])).
proof_step(3, 245, potential_impact(catalog_replica, mobile_app), rule(17, [21, 187])).
proof_step(3, 246, impacted(web_store, bank_primary), rule(16, [98, 189])).
proof_step(3, 247, impacted(mobile_app, bank_primary), rule(16, [99, 189])).
proof_step(3, 248, potential_impact(bank_primary, checkout_api), rule(17, [22, 189])).
proof_step(3, 249, impacted(web_store, bank_backup), rule(16, [98, 190])).
proof_step(3, 250, impacted(mobile_app, bank_backup), rule(16, [99, 190])).
proof_step(3, 251, potential_impact(bank_backup, checkout_api), rule(17, [23, 190])).
proof_step(
    3,
    252,
    operating(
        bank_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [207, 3, 52])
).
proof_step(
    3,
    253,
    group_operating(bank, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [13, 208])
).
proof_step(
    3,
    254,
    group_operating(bank, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [13, 209])
).
proof_step(
    3,
    255,
    hardware_available(
        bank_backup,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(7, [23, 210])
).
proof_step(
    3,
    256,
    operating(bank_backup, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [211, 4, 53])
).
proof_step(
    3,
    257,
    operating(bank_backup, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [212, 4, 54])
).
proof_step(
    3,
    258,
    operating(bank_backup, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [213, 4, 55])
).
proof_step(
    3,
    259,
    group_operating(bank, [catalog_replica, bank_backup]),
    rule(11, [14, 214])
).
proof_step(
    3,
    260,
    group_operating(bank, [catalog_primary, bank_backup]),
    rule(11, [14, 215])
).
proof_step(
    3,
    261,
    operating(bank_primary, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [217, 3, 58])
).
proof_step(
    3,
    262,
    group_operating(bank, [catalog_replica, bank_primary]),
    rule(11, [13, 218])
).
proof_step(
    3,
    263,
    group_operating(bank, [catalog_primary, bank_primary]),
    rule(11, [13, 219])
).
proof_step(
    3,
    264,
    repair_cost([catalog_primary, catalog_replica, bank_primary, bank_backup], 10),
    rule(20, [25, 220, 79])
).
proof_step(3, 265, potential_impact(bank_primary, web_store), rule(17, [22, 246])).
proof_step(3, 266, potential_impact(bank_primary, mobile_app), rule(17, [22, 247])).
proof_step(3, 267, potential_impact(bank_backup, web_store), rule(17, [23, 249])).
proof_step(3, 268, potential_impact(bank_backup, mobile_app), rule(17, [23, 250])).
proof_step(
    3,
    269,
    group_operating(bank, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(11, [13, 252])
).
proof_step(
    3,
    270,
    operating(
        bank_backup,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [255, 4, 52])
).
proof_step(
    3,
    271,
    group_operating(bank, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [14, 258])
).
proof_step(
    3,
    272,
    group_operating(bank, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [13, 261])
).
proof_step(3, 273, failed(risk_cache), absent(1)).
proof_step(3, 274, failed(risk_engine), absent(1)).
proof_step(3, 275, failed(payment_service), absent(1)).
proof_step(3, 276, failed(checkout_api), absent(1)).
proof_step(3, 277, failed(web_store), absent(1)).
proof_step(3, 278, failed(mobile_app), absent(1)).
proof_step(3, 279, healthy(risk_cache), rule(5, [5, 273])).
proof_step(3, 280, healthy(risk_engine), rule(5, [6, 274])).
proof_step(3, 281, healthy(payment_service), rule(5, [7, 275])).
proof_step(3, 282, healthy(checkout_api), rule(5, [8, 276])).
proof_step(3, 283, healthy(web_store), rule(5, [9, 277])).
proof_step(3, 284, healthy(mobile_app), rule(5, [10, 278])).
proof_step(
    3,
    285,
    hardware_available(
        risk_cache,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [279])
).
proof_step(
    3,
    286,
    hardware_available(risk_cache, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [279])
).
proof_step(
    3,
    287,
    hardware_available(risk_cache, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [279])
).
proof_step(
    3,
    288,
    hardware_available(risk_cache, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [279])
).
proof_step(
    3,
    289,
    hardware_available(risk_cache, [catalog_replica, bank_backup]),
    rule(6, [279])
).
proof_step(
    3,
    290,
    hardware_available(risk_cache, [catalog_primary, bank_backup]),
    rule(6, [279])
).
proof_step(
    3,
    291,
    hardware_available(risk_cache, [catalog_primary, catalog_replica, bank_primary]),
    rule(6, [279])
).
proof_step(
    3,
    292,
    hardware_available(risk_cache, [catalog_replica, bank_primary]),
    rule(6, [279])
).
proof_step(
    3,
    293,
    hardware_available(risk_cache, [catalog_primary, bank_primary]),
    rule(6, [279])
).
proof_step(3, 294, hardware_available(risk_cache, []), rule(6, [279])).
proof_step(3, 295, hardware_available(risk_cache, [bank_backup]), rule(6, [279])).
proof_step(
    3,
    296,
    hardware_available(
        risk_engine,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [280])
).
proof_step(
    3,
    297,
    hardware_available(risk_engine, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [280])
).
proof_step(
    3,
    298,
    hardware_available(risk_engine, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [280])
).
proof_step(
    3,
    299,
    hardware_available(risk_engine, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [280])
).
proof_step(
    3,
    300,
    hardware_available(risk_engine, [catalog_replica, bank_backup]),
    rule(6, [280])
).
proof_step(
    3,
    301,
    hardware_available(risk_engine, [catalog_primary, bank_backup]),
    rule(6, [280])
).
proof_step(
    3,
    302,
    hardware_available(risk_engine, [catalog_primary, catalog_replica, bank_primary]),
    rule(6, [280])
).
proof_step(
    3,
    303,
    hardware_available(risk_engine, [catalog_replica, bank_primary]),
    rule(6, [280])
).
proof_step(
    3,
    304,
    hardware_available(risk_engine, [catalog_primary, bank_primary]),
    rule(6, [280])
).
proof_step(3, 305, hardware_available(risk_engine, []), rule(6, [280])).
proof_step(3, 306, hardware_available(risk_engine, [bank_backup]), rule(6, [280])).
proof_step(
    3,
    307,
    hardware_available(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [281])
).
proof_step(
    3,
    308,
    hardware_available(payment_service, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [281])
).
proof_step(
    3,
    309,
    hardware_available(payment_service, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [281])
).
proof_step(
    3,
    310,
    hardware_available(payment_service, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [281])
).
proof_step(
    3,
    311,
    hardware_available(payment_service, [catalog_replica, bank_backup]),
    rule(6, [281])
).
proof_step(
    3,
    312,
    hardware_available(payment_service, [catalog_primary, bank_backup]),
    rule(6, [281])
).
proof_step(
    3,
    313,
    hardware_available(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary]
    ),
    rule(6, [281])
).
proof_step(
    3,
    314,
    hardware_available(payment_service, [catalog_replica, bank_primary]),
    rule(6, [281])
).
proof_step(
    3,
    315,
    hardware_available(payment_service, [catalog_primary, bank_primary]),
    rule(6, [281])
).
proof_step(
    3,
    316,
    hardware_available(payment_service, [catalog_primary, catalog_replica]),
    rule(6, [281])
).
proof_step(
    3,
    317,
    hardware_available(payment_service, [catalog_replica]),
    rule(6, [281])
).
proof_step(
    3,
    318,
    hardware_available(payment_service, [catalog_primary]),
    rule(6, [281])
).
proof_step(3, 319, hardware_available(payment_service, []), rule(6, [281])).
proof_step(3, 320, hardware_available(payment_service, [bank_backup]), rule(6, [281])).
proof_step(
    3,
    321,
    hardware_available(
        checkout_api,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [282])
).
proof_step(
    3,
    322,
    hardware_available(checkout_api, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [282])
).
proof_step(
    3,
    323,
    hardware_available(checkout_api, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [282])
).
proof_step(
    3,
    324,
    hardware_available(checkout_api, [bank_primary, bank_backup]),
    rule(6, [282])
).
proof_step(
    3,
    325,
    hardware_available(checkout_api, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [282])
).
proof_step(
    3,
    326,
    hardware_available(checkout_api, [catalog_replica, bank_backup]),
    rule(6, [282])
).
proof_step(
    3,
    327,
    hardware_available(checkout_api, [catalog_primary, bank_backup]),
    rule(6, [282])
).
proof_step(3, 328, hardware_available(checkout_api, [bank_backup]), rule(6, [282])).
proof_step(
    3,
    329,
    hardware_available(checkout_api, [catalog_primary, catalog_replica, bank_primary]),
    rule(6, [282])
).
proof_step(
    3,
    330,
    hardware_available(checkout_api, [catalog_replica, bank_primary]),
    rule(6, [282])
).
proof_step(
    3,
    331,
    hardware_available(checkout_api, [catalog_primary, bank_primary]),
    rule(6, [282])
).
proof_step(3, 332, hardware_available(checkout_api, [bank_primary]), rule(6, [282])).
proof_step(
    3,
    333,
    hardware_available(checkout_api, [catalog_primary, catalog_replica]),
    rule(6, [282])
).
proof_step(3, 334, hardware_available(checkout_api, [catalog_replica]), rule(6, [282])).
proof_step(3, 335, hardware_available(checkout_api, [catalog_primary]), rule(6, [282])).
proof_step(3, 336, hardware_available(checkout_api, []), rule(6, [282])).
proof_step(
    3,
    337,
    hardware_available(
        web_store,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [283])
).
proof_step(
    3,
    338,
    hardware_available(web_store, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [283])
).
proof_step(
    3,
    339,
    hardware_available(web_store, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [283])
).
proof_step(
    3,
    340,
    hardware_available(web_store, [bank_primary, bank_backup]),
    rule(6, [283])
).
proof_step(
    3,
    341,
    hardware_available(web_store, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [283])
).
proof_step(
    3,
    342,
    hardware_available(web_store, [catalog_replica, bank_backup]),
    rule(6, [283])
).
proof_step(
    3,
    343,
    hardware_available(web_store, [catalog_primary, bank_backup]),
    rule(6, [283])
).
proof_step(3, 344, hardware_available(web_store, [bank_backup]), rule(6, [283])).
proof_step(
    3,
    345,
    hardware_available(web_store, [catalog_primary, catalog_replica, bank_primary]),
    rule(6, [283])
).
proof_step(
    3,
    346,
    hardware_available(web_store, [catalog_replica, bank_primary]),
    rule(6, [283])
).
proof_step(
    3,
    347,
    hardware_available(web_store, [catalog_primary, bank_primary]),
    rule(6, [283])
).
proof_step(3, 348, hardware_available(web_store, [bank_primary]), rule(6, [283])).
proof_step(
    3,
    349,
    hardware_available(web_store, [catalog_primary, catalog_replica]),
    rule(6, [283])
).
proof_step(3, 350, hardware_available(web_store, [catalog_replica]), rule(6, [283])).
proof_step(3, 351, hardware_available(web_store, [catalog_primary]), rule(6, [283])).
proof_step(3, 352, hardware_available(web_store, []), rule(6, [283])).
proof_step(
    3,
    353,
    hardware_available(
        mobile_app,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(6, [284])
).
proof_step(
    3,
    354,
    hardware_available(mobile_app, [catalog_replica, bank_primary, bank_backup]),
    rule(6, [284])
).
proof_step(
    3,
    355,
    hardware_available(mobile_app, [catalog_primary, bank_primary, bank_backup]),
    rule(6, [284])
).
proof_step(
    3,
    356,
    hardware_available(mobile_app, [catalog_primary, catalog_replica, bank_backup]),
    rule(6, [284])
).
proof_step(
    3,
    357,
    hardware_available(mobile_app, [catalog_replica, bank_backup]),
    rule(6, [284])
).
proof_step(
    3,
    358,
    hardware_available(mobile_app, [catalog_primary, bank_backup]),
    rule(6, [284])
).
proof_step(
    3,
    359,
    hardware_available(mobile_app, [catalog_primary, catalog_replica, bank_primary]),
    rule(6, [284])
).
proof_step(
    3,
    360,
    hardware_available(mobile_app, [catalog_replica, bank_primary]),
    rule(6, [284])
).
proof_step(
    3,
    361,
    hardware_available(mobile_app, [catalog_primary, bank_primary]),
    rule(6, [284])
).
proof_step(3, 362, hardware_available(mobile_app, []), rule(6, [284])).
proof_step(
    3,
    363,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(8, [285, 5, 52])
).
proof_step(
    3,
    364,
    operating(risk_cache, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [286, 5, 53])
).
proof_step(
    3,
    365,
    operating(risk_cache, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [287, 5, 54])
).
proof_step(
    3,
    366,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [288, 5, 55])
).
proof_step(
    3,
    367,
    operating(risk_cache, [catalog_replica, bank_backup]),
    rule(8, [289, 5, 56])
).
proof_step(
    3,
    368,
    operating(risk_cache, [catalog_primary, bank_backup]),
    rule(8, [290, 5, 57])
).
proof_step(
    3,
    369,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [291, 5, 58])
).
proof_step(
    3,
    370,
    operating(risk_cache, [catalog_replica, bank_primary]),
    rule(8, [292, 5, 59])
).
proof_step(
    3,
    371,
    operating(risk_cache, [catalog_primary, bank_primary]),
    rule(8, [293, 5, 60])
).
proof_step(3, 372, operating(risk_cache, []), rule(8, [294, 5, 88])).
proof_step(3, 373, operating(risk_cache, [bank_backup]), rule(8, [295, 5, 89])).
proof_step(
    3,
    374,
    group_operating(
        risk_signal,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(11, [16, 363])
).
proof_step(
    3,
    375,
    group_operating(risk_signal, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [16, 364])
).
proof_step(
    3,
    376,
    group_operating(risk_signal, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [16, 365])
).
proof_step(
    3,
    377,
    group_operating(risk_signal, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [16, 366])
).
proof_step(
    3,
    378,
    group_operating(risk_signal, [catalog_replica, bank_backup]),
    rule(11, [16, 367])
).
proof_step(
    3,
    379,
    group_operating(risk_signal, [catalog_primary, bank_backup]),
    rule(11, [16, 368])
).
proof_step(
    3,
    380,
    group_operating(risk_signal, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [16, 369])
).
proof_step(
    3,
    381,
    group_operating(risk_signal, [catalog_replica, bank_primary]),
    rule(11, [16, 370])
).
proof_step(
    3,
    382,
    group_operating(risk_signal, [catalog_primary, bank_primary]),
    rule(11, [16, 371])
).
proof_step(3, 383, group_operating(risk_signal, []), rule(11, [16, 372])).
proof_step(3, 384, group_operating(risk_signal, [bank_backup]), rule(11, [16, 373])).
proof_step(
    3,
    385,
    all_groups(
        [risk_signal],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(10, [374, 52])
).
proof_step(
    3,
    386,
    all_groups([risk_signal], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [375, 53])
).
proof_step(
    3,
    387,
    all_groups([risk_signal], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [376, 54])
).
proof_step(
    3,
    388,
    all_groups([risk_signal], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [377, 55])
).
proof_step(
    3,
    389,
    all_groups([risk_signal], [catalog_replica, bank_backup]),
    rule(10, [378, 56])
).
proof_step(
    3,
    390,
    all_groups([risk_signal], [catalog_primary, bank_backup]),
    rule(10, [379, 57])
).
proof_step(
    3,
    391,
    all_groups([risk_signal], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [380, 58])
).
proof_step(
    3,
    392,
    all_groups([risk_signal], [catalog_replica, bank_primary]),
    rule(10, [381, 59])
).
proof_step(
    3,
    393,
    all_groups([risk_signal], [catalog_primary, bank_primary]),
    rule(10, [382, 60])
).
proof_step(3, 394, all_groups([risk_signal], []), rule(10, [383, 88])).
proof_step(3, 395, all_groups([risk_signal], [bank_backup]), rule(10, [384, 89])).
proof_step(
    3,
    396,
    operating(
        risk_engine,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [296, 6, 385])
).
proof_step(
    3,
    397,
    operating(risk_engine, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [297, 6, 386])
).
proof_step(
    3,
    398,
    operating(risk_engine, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [298, 6, 387])
).
proof_step(
    3,
    399,
    operating(risk_engine, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [299, 6, 388])
).
proof_step(
    3,
    400,
    operating(risk_engine, [catalog_replica, bank_backup]),
    rule(8, [300, 6, 389])
).
proof_step(
    3,
    401,
    operating(risk_engine, [catalog_primary, bank_backup]),
    rule(8, [301, 6, 390])
).
proof_step(
    3,
    402,
    operating(risk_engine, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [302, 6, 391])
).
proof_step(
    3,
    403,
    operating(risk_engine, [catalog_replica, bank_primary]),
    rule(8, [303, 6, 392])
).
proof_step(
    3,
    404,
    operating(risk_engine, [catalog_primary, bank_primary]),
    rule(8, [304, 6, 393])
).
proof_step(3, 405, operating(risk_engine, []), rule(8, [305, 6, 394])).
proof_step(3, 406, operating(risk_engine, [bank_backup]), rule(8, [306, 6, 395])).
proof_step(
    3,
    407,
    group_operating(risk, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(11, [15, 396])
).
proof_step(
    3,
    408,
    group_operating(risk, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [15, 397])
).
proof_step(
    3,
    409,
    group_operating(risk, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [15, 398])
).
proof_step(
    3,
    410,
    group_operating(risk, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [15, 399])
).
proof_step(
    3,
    411,
    group_operating(risk, [catalog_replica, bank_backup]),
    rule(11, [15, 400])
).
proof_step(
    3,
    412,
    group_operating(risk, [catalog_primary, bank_backup]),
    rule(11, [15, 401])
).
proof_step(
    3,
    413,
    group_operating(risk, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [15, 402])
).
proof_step(
    3,
    414,
    group_operating(risk, [catalog_replica, bank_primary]),
    rule(11, [15, 403])
).
proof_step(
    3,
    415,
    group_operating(risk, [catalog_primary, bank_primary]),
    rule(11, [15, 404])
).
proof_step(3, 416, group_operating(risk, [bank_backup]), rule(11, [15, 406])).
proof_step(
    3,
    417,
    all_groups([risk], [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(10, [407, 52])
).
proof_step(
    3,
    418,
    all_groups([risk], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [408, 53])
).
proof_step(
    3,
    419,
    all_groups([risk], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [409, 54])
).
proof_step(
    3,
    420,
    all_groups([risk], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [410, 55])
).
proof_step(
    3,
    421,
    all_groups([risk], [catalog_replica, bank_backup]),
    rule(10, [411, 56])
).
proof_step(
    3,
    422,
    all_groups([risk], [catalog_primary, bank_backup]),
    rule(10, [412, 57])
).
proof_step(
    3,
    423,
    all_groups([risk], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [413, 58])
).
proof_step(
    3,
    424,
    all_groups([risk], [catalog_replica, bank_primary]),
    rule(10, [414, 59])
).
proof_step(
    3,
    425,
    all_groups([risk], [catalog_primary, bank_primary]),
    rule(10, [415, 60])
).
proof_step(3, 426, all_groups([risk], [bank_backup]), rule(10, [416, 89])).
proof_step(
    3,
    427,
    all_groups(
        [bank, risk],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(10, [269, 417])
).
proof_step(
    3,
    428,
    all_groups([bank, risk], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [253, 418])
).
proof_step(
    3,
    429,
    all_groups([bank, risk], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [254, 419])
).
proof_step(
    3,
    430,
    all_groups([bank, risk], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [271, 420])
).
proof_step(
    3,
    431,
    all_groups([bank, risk], [catalog_replica, bank_backup]),
    rule(10, [259, 421])
).
proof_step(
    3,
    432,
    all_groups([bank, risk], [catalog_primary, bank_backup]),
    rule(10, [260, 422])
).
proof_step(
    3,
    433,
    all_groups([bank, risk], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [272, 423])
).
proof_step(
    3,
    434,
    all_groups([bank, risk], [catalog_replica, bank_primary]),
    rule(10, [262, 424])
).
proof_step(
    3,
    435,
    all_groups([bank, risk], [catalog_primary, bank_primary]),
    rule(10, [263, 425])
).
proof_step(3, 436, all_groups([bank, risk], [bank_backup]), rule(10, [216, 426])).
proof_step(
    3,
    437,
    operating(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [307, 7, 427])
).
proof_step(
    3,
    438,
    operating(payment_service, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [308, 7, 428])
).
proof_step(
    3,
    439,
    operating(payment_service, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [309, 7, 429])
).
proof_step(
    3,
    440,
    operating(payment_service, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [310, 7, 430])
).
proof_step(
    3,
    441,
    operating(payment_service, [catalog_replica, bank_backup]),
    rule(8, [311, 7, 431])
).
proof_step(
    3,
    442,
    operating(payment_service, [catalog_primary, bank_backup]),
    rule(8, [312, 7, 432])
).
proof_step(
    3,
    443,
    operating(payment_service, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [313, 7, 433])
).
proof_step(
    3,
    444,
    operating(payment_service, [catalog_replica, bank_primary]),
    rule(8, [314, 7, 434])
).
proof_step(
    3,
    445,
    operating(payment_service, [catalog_primary, bank_primary]),
    rule(8, [315, 7, 435])
).
proof_step(3, 446, operating(payment_service, [bank_backup]), rule(8, [320, 7, 436])).
proof_step(
    3,
    447,
    group_operating(
        payment,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(11, [18, 437])
).
proof_step(
    3,
    448,
    group_operating(payment, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [18, 438])
).
proof_step(
    3,
    449,
    group_operating(payment, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [18, 439])
).
proof_step(
    3,
    450,
    group_operating(payment, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [18, 440])
).
proof_step(
    3,
    451,
    group_operating(payment, [catalog_replica, bank_backup]),
    rule(11, [18, 441])
).
proof_step(
    3,
    452,
    group_operating(payment, [catalog_primary, bank_backup]),
    rule(11, [18, 442])
).
proof_step(
    3,
    453,
    group_operating(payment, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [18, 443])
).
proof_step(
    3,
    454,
    group_operating(payment, [catalog_replica, bank_primary]),
    rule(11, [18, 444])
).
proof_step(
    3,
    455,
    group_operating(payment, [catalog_primary, bank_primary]),
    rule(11, [18, 445])
).
proof_step(
    3,
    456,
    all_groups([payment], [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(10, [447, 52])
).
proof_step(
    3,
    457,
    all_groups([payment], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [448, 53])
).
proof_step(
    3,
    458,
    all_groups([payment], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [449, 54])
).
proof_step(
    3,
    459,
    all_groups([payment], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [450, 55])
).
proof_step(
    3,
    460,
    all_groups([payment], [catalog_replica, bank_backup]),
    rule(10, [451, 56])
).
proof_step(
    3,
    461,
    all_groups([payment], [catalog_primary, bank_backup]),
    rule(10, [452, 57])
).
proof_step(
    3,
    462,
    all_groups([payment], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [453, 58])
).
proof_step(
    3,
    463,
    all_groups([payment], [catalog_replica, bank_primary]),
    rule(10, [454, 59])
).
proof_step(
    3,
    464,
    all_groups([payment], [catalog_primary, bank_primary]),
    rule(10, [455, 60])
).
proof_step(
    3,
    465,
    all_groups(
        [catalog, payment],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(10, [191, 456])
).
proof_step(
    3,
    466,
    all_groups([catalog, payment], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [193, 457])
).
proof_step(
    3,
    467,
    all_groups([catalog, payment], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [194, 458])
).
proof_step(
    3,
    468,
    all_groups([catalog, payment], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [195, 459])
).
proof_step(
    3,
    469,
    all_groups([catalog, payment], [catalog_replica, bank_backup]),
    rule(10, [197, 460])
).
proof_step(
    3,
    470,
    all_groups([catalog, payment], [catalog_primary, bank_backup]),
    rule(10, [198, 461])
).
proof_step(
    3,
    471,
    all_groups([catalog, payment], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [199, 462])
).
proof_step(
    3,
    472,
    all_groups([catalog, payment], [catalog_replica, bank_primary]),
    rule(10, [201, 463])
).
proof_step(
    3,
    473,
    all_groups([catalog, payment], [catalog_primary, bank_primary]),
    rule(10, [202, 464])
).
proof_step(
    3,
    474,
    operating(
        checkout_api,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(8, [321, 8, 465])
).
proof_step(
    3,
    475,
    operating(checkout_api, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [322, 8, 466])
).
proof_step(
    3,
    476,
    operating(checkout_api, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [323, 8, 467])
).
proof_step(
    3,
    477,
    operating(checkout_api, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [325, 8, 468])
).
proof_step(
    3,
    478,
    operating(checkout_api, [catalog_replica, bank_backup]),
    rule(8, [326, 8, 469])
).
proof_step(
    3,
    479,
    operating(checkout_api, [catalog_primary, bank_backup]),
    rule(8, [327, 8, 470])
).
proof_step(
    3,
    480,
    operating(checkout_api, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [329, 8, 471])
).
proof_step(
    3,
    481,
    operating(checkout_api, [catalog_replica, bank_primary]),
    rule(8, [330, 8, 472])
).
proof_step(
    3,
    482,
    operating(checkout_api, [catalog_primary, bank_primary]),
    rule(8, [331, 8, 473])
).
proof_step(
    3,
    483,
    group_operating(
        checkout,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(11, [19, 474])
).
proof_step(
    3,
    484,
    group_operating(checkout, [catalog_replica, bank_primary, bank_backup]),
    rule(11, [19, 475])
).
proof_step(
    3,
    485,
    group_operating(checkout, [catalog_primary, bank_primary, bank_backup]),
    rule(11, [19, 476])
).
proof_step(
    3,
    486,
    group_operating(checkout, [catalog_primary, catalog_replica, bank_backup]),
    rule(11, [19, 477])
).
proof_step(
    3,
    487,
    group_operating(checkout, [catalog_replica, bank_backup]),
    rule(11, [19, 478])
).
proof_step(
    3,
    488,
    group_operating(checkout, [catalog_primary, bank_backup]),
    rule(11, [19, 479])
).
proof_step(
    3,
    489,
    group_operating(checkout, [catalog_primary, catalog_replica, bank_primary]),
    rule(11, [19, 480])
).
proof_step(
    3,
    490,
    group_operating(checkout, [catalog_replica, bank_primary]),
    rule(11, [19, 481])
).
proof_step(
    3,
    491,
    group_operating(checkout, [catalog_primary, bank_primary]),
    rule(11, [19, 482])
).
proof_step(
    3,
    492,
    all_groups(
        [checkout],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(10, [483, 52])
).
proof_step(
    3,
    493,
    all_groups([checkout], [catalog_replica, bank_primary, bank_backup]),
    rule(10, [484, 53])
).
proof_step(
    3,
    494,
    all_groups([checkout], [catalog_primary, bank_primary, bank_backup]),
    rule(10, [485, 54])
).
proof_step(
    3,
    495,
    all_groups([checkout], [catalog_primary, catalog_replica, bank_backup]),
    rule(10, [486, 55])
).
proof_step(
    3,
    496,
    all_groups([checkout], [catalog_replica, bank_backup]),
    rule(10, [487, 56])
).
proof_step(
    3,
    497,
    all_groups([checkout], [catalog_primary, bank_backup]),
    rule(10, [488, 57])
).
proof_step(
    3,
    498,
    all_groups([checkout], [catalog_primary, catalog_replica, bank_primary]),
    rule(10, [489, 58])
).
proof_step(
    3,
    499,
    all_groups([checkout], [catalog_replica, bank_primary]),
    rule(10, [490, 59])
).
proof_step(
    3,
    500,
    all_groups([checkout], [catalog_primary, bank_primary]),
    rule(10, [491, 60])
).
proof_step(
    3,
    501,
    operating(web_store, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(8, [337, 9, 492])
).
proof_step(
    3,
    502,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_primary, bank_backup]),
    rule(8, [353, 10, 492])
).
proof_step(
    3,
    503,
    operating(web_store, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [338, 9, 493])
).
proof_step(
    3,
    504,
    operating(mobile_app, [catalog_replica, bank_primary, bank_backup]),
    rule(8, [354, 10, 493])
).
proof_step(
    3,
    505,
    operating(web_store, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [339, 9, 494])
).
proof_step(
    3,
    506,
    operating(mobile_app, [catalog_primary, bank_primary, bank_backup]),
    rule(8, [355, 10, 494])
).
proof_step(
    3,
    507,
    operating(web_store, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [341, 9, 495])
).
proof_step(
    3,
    508,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_backup]),
    rule(8, [356, 10, 495])
).
proof_step(
    3,
    509,
    operating(web_store, [catalog_replica, bank_backup]),
    rule(8, [342, 9, 496])
).
proof_step(
    3,
    510,
    operating(mobile_app, [catalog_replica, bank_backup]),
    rule(8, [357, 10, 496])
).
proof_step(
    3,
    511,
    operating(web_store, [catalog_primary, bank_backup]),
    rule(8, [343, 9, 497])
).
proof_step(
    3,
    512,
    operating(mobile_app, [catalog_primary, bank_backup]),
    rule(8, [358, 10, 497])
).
proof_step(
    3,
    513,
    operating(web_store, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [345, 9, 498])
).
proof_step(
    3,
    514,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_primary]),
    rule(8, [359, 10, 498])
).
proof_step(
    3,
    515,
    operating(web_store, [catalog_replica, bank_primary]),
    rule(8, [346, 9, 499])
).
proof_step(
    3,
    516,
    operating(mobile_app, [catalog_replica, bank_primary]),
    rule(8, [360, 10, 499])
).
proof_step(
    3,
    517,
    operating(web_store, [catalog_primary, bank_primary]),
    rule(8, [347, 9, 500])
).
proof_step(
    3,
    518,
    operating(mobile_app, [catalog_primary, bank_primary]),
    rule(8, [361, 10, 500])
).
proof_step(
    3,
    519,
    all_operating(
        [mobile_app],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(13, [502, 67])
).
proof_step(
    3,
    520,
    all_operating([mobile_app], [catalog_replica, bank_primary, bank_backup]),
    rule(13, [504, 68])
).
proof_step(
    3,
    521,
    all_operating([mobile_app], [catalog_primary, bank_primary, bank_backup]),
    rule(13, [506, 69])
).
proof_step(
    3,
    522,
    all_operating([mobile_app], [catalog_primary, catalog_replica, bank_backup]),
    rule(13, [508, 70])
).
proof_step(
    3,
    523,
    all_operating([mobile_app], [catalog_replica, bank_backup]),
    rule(13, [510, 71])
).
proof_step(
    3,
    524,
    all_operating([mobile_app], [catalog_primary, bank_backup]),
    rule(13, [512, 72])
).
proof_step(
    3,
    525,
    all_operating([mobile_app], [catalog_primary, catalog_replica, bank_primary]),
    rule(13, [514, 73])
).
proof_step(
    3,
    526,
    all_operating([mobile_app], [catalog_replica, bank_primary]),
    rule(13, [516, 74])
).
proof_step(
    3,
    527,
    all_operating([mobile_app], [catalog_primary, bank_primary]),
    rule(13, [518, 75])
).
proof_step(
    3,
    528,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    ),
    rule(13, [501, 519])
).
proof_step(
    3,
    529,
    all_operating([web_store, mobile_app], [catalog_replica, bank_primary, bank_backup]),
    rule(13, [503, 520])
).
proof_step(
    3,
    530,
    all_operating([web_store, mobile_app], [catalog_primary, bank_primary, bank_backup]),
    rule(13, [505, 521])
).
proof_step(
    3,
    531,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_backup]
    ),
    rule(13, [507, 522])
).
proof_step(
    3,
    532,
    all_operating([web_store, mobile_app], [catalog_replica, bank_backup]),
    rule(13, [509, 523])
).
proof_step(
    3,
    533,
    all_operating([web_store, mobile_app], [catalog_primary, bank_backup]),
    rule(13, [511, 524])
).
proof_step(
    3,
    534,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_primary]
    ),
    rule(13, [513, 525])
).
proof_step(
    3,
    535,
    all_operating([web_store, mobile_app], [catalog_replica, bank_primary]),
    rule(13, [515, 526])
).
proof_step(
    3,
    536,
    all_operating([web_store, mobile_app], [catalog_primary, bank_primary]),
    rule(13, [517, 527])
).
proof_step(
    3,
    537,
    feasible_repair([catalog_primary, catalog_replica, bank_primary, bank_backup], 10),
    rule(21, [24, 224, 29, 528, 264])
).
proof_step(
    3,
    538,
    feasible_repair([catalog_replica, bank_primary, bank_backup], 7),
    rule(21, [24, 225, 29, 529, 220])
).
proof_step(
    3,
    539,
    feasible_repair([catalog_primary, bank_primary, bank_backup], 8),
    rule(21, [24, 226, 29, 530, 221])
).
proof_step(
    3,
    540,
    feasible_repair([catalog_primary, catalog_replica, bank_backup], 6),
    rule(21, [24, 228, 29, 531, 222])
).
proof_step(
    3,
    541,
    feasible_repair([catalog_replica, bank_backup], 3),
    rule(21, [24, 229, 29, 532, 167])
).
proof_step(
    3,
    542,
    feasible_repair([catalog_primary, bank_backup], 4),
    rule(21, [24, 230, 29, 533, 168])
).
proof_step(
    3,
    543,
    feasible_repair([catalog_primary, catalog_replica, bank_primary], 9),
    rule(21, [24, 232, 29, 534, 223])
).
proof_step(
    3,
    544,
    feasible_repair([catalog_replica, bank_primary], 6),
    rule(21, [24, 233, 29, 535, 169])
).
proof_step(
    3,
    545,
    feasible_repair([catalog_primary, bank_primary], 7),
    rule(21, [24, 234, 29, 536, 170])
).
proof_step(3, 546, '$aggregate:r22:1'([], 3), aggregate(rule(22), 1, 2)).
proof_step(3, 547, best_repair([catalog_replica, bank_backup], 3), rule(22, [546, 541])).
proof_boundary(3, 1, 0).
proof_boundary_steps(3, 1, 1, 75).
proof_boundary_steps(3, 1, 88, 137).
proof_boundary_steps(3, 1, 139, 139).
proof_boundary_steps(3, 1, 143, 143).
proof_boundary_steps(3, 1, 147, 147).
proof_boundary_steps(3, 1, 151, 151).
proof_boundary_steps(3, 1, 154, 161).
proof_boundary_steps(3, 1, 163, 190).
proof_boundary_steps(3, 1, 207, 207).
proof_boundary_steps(3, 1, 210, 213).
proof_boundary_steps(3, 1, 217, 217).
proof_boundary_steps(3, 1, 220, 251).
proof_boundary_steps(3, 1, 255, 255).
proof_boundary_steps(3, 1, 264, 268).
proof_boundary_call(3, 1, impacted(variable("_EyeplCall0"), bank_backup)).
proof_boundary_call(3, 1, impacted(variable("_EyeplCall0"), bank_primary)).
proof_boundary_call(3, 1, impacted(variable("_EyeplCall0"), catalog_primary)).
proof_boundary_call(3, 1, impacted(variable("_EyeplCall0"), catalog_replica)).
proof_boundary_call(3, 1, impacted(bank_backup, bank_backup)).
proof_boundary_call(3, 1, impacted(bank_backup, bank_primary)).
proof_boundary_call(3, 1, impacted(bank_backup, catalog_primary)).
proof_boundary_call(3, 1, impacted(bank_backup, catalog_replica)).
proof_boundary_call(3, 1, impacted(bank_primary, bank_backup)).
proof_boundary_call(3, 1, impacted(bank_primary, bank_primary)).
proof_boundary_call(3, 1, impacted(bank_primary, catalog_primary)).
proof_boundary_call(3, 1, impacted(bank_primary, catalog_replica)).
proof_boundary_call(3, 1, impacted(catalog_primary, bank_backup)).
proof_boundary_call(3, 1, impacted(catalog_primary, bank_primary)).
proof_boundary_call(3, 1, impacted(catalog_primary, catalog_primary)).
proof_boundary_call(3, 1, impacted(catalog_primary, catalog_replica)).
proof_boundary_call(3, 1, impacted(catalog_replica, bank_backup)).
proof_boundary_call(3, 1, impacted(catalog_replica, bank_primary)).
proof_boundary_call(3, 1, impacted(catalog_replica, catalog_primary)).
proof_boundary_call(3, 1, impacted(catalog_replica, catalog_replica)).
proof_boundary_call(3, 1, impacted(checkout_api, bank_backup)).
proof_boundary_call(3, 1, impacted(checkout_api, bank_primary)).
proof_boundary_call(3, 1, impacted(checkout_api, catalog_primary)).
proof_boundary_call(3, 1, impacted(checkout_api, catalog_replica)).
proof_boundary_call(3, 1, impacted(payment_service, bank_backup)).
proof_boundary_call(3, 1, impacted(payment_service, bank_primary)).
proof_boundary_call(3, 1, impacted(payment_service, catalog_primary)).
proof_boundary_call(3, 1, impacted(payment_service, catalog_replica)).
proof_boundary_call(3, 1, impacted(risk_cache, bank_backup)).
proof_boundary_call(3, 1, impacted(risk_cache, bank_primary)).
proof_boundary_call(3, 1, impacted(risk_cache, catalog_primary)).
proof_boundary_call(3, 1, impacted(risk_cache, catalog_replica)).
proof_boundary_call(3, 1, impacted(risk_engine, bank_backup)).
proof_boundary_call(3, 1, impacted(risk_engine, bank_primary)).
proof_boundary_call(3, 1, impacted(risk_engine, catalog_primary)).
proof_boundary_call(3, 1, impacted(risk_engine, catalog_replica)).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [bank, risk])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [catalog, payment])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [checkout])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [payment])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [risk])).
proof_boundary_call(3, 1, member(variable("_EyeplCall0"), [risk_signal])).
proof_boundary_call(3, 1, member(bank_backup, [])).
proof_boundary_call(3, 1, member(bank_backup, [bank_backup])).
proof_boundary_call(3, 1, member(bank_backup, [bank_primary, bank_backup])).
proof_boundary_call(3, 1, member(bank_backup, [bank_primary])).
proof_boundary_call(3, 1, member(bank_backup, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(bank_backup, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(bank_backup, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    1,
    member(bank_backup, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(bank_backup, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(bank_backup, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 1, member(bank_backup, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 1, member(bank_backup, [catalog_primary])).
proof_boundary_call(3, 1, member(bank_backup, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(bank_backup, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(bank_backup, [catalog_replica, bank_primary])).
proof_boundary_call(3, 1, member(bank_backup, [catalog_replica])).
proof_boundary_call(3, 1, member(bank_primary, [])).
proof_boundary_call(3, 1, member(bank_primary, [bank_backup])).
proof_boundary_call(3, 1, member(bank_primary, [bank_primary, bank_backup])).
proof_boundary_call(3, 1, member(bank_primary, [bank_primary])).
proof_boundary_call(3, 1, member(bank_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(bank_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(bank_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    1,
    member(bank_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 1, member(bank_primary, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 1, member(bank_primary, [catalog_primary])).
proof_boundary_call(3, 1, member(bank_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(bank_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(bank_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 1, member(bank_primary, [catalog_replica])).
proof_boundary_call(3, 1, member(catalog_primary, [])).
proof_boundary_call(3, 1, member(catalog_primary, [bank_backup])).
proof_boundary_call(3, 1, member(catalog_primary, [bank_primary, bank_backup])).
proof_boundary_call(3, 1, member(catalog_primary, [bank_primary])).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(catalog_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    1,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    1,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_primary])).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(catalog_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 1, member(catalog_primary, [catalog_replica])).
proof_boundary_call(3, 1, member(catalog_replica, [])).
proof_boundary_call(3, 1, member(catalog_replica, [bank_backup])).
proof_boundary_call(3, 1, member(catalog_replica, [bank_primary, bank_backup])).
proof_boundary_call(3, 1, member(catalog_replica, [bank_primary])).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(catalog_replica, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    1,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    1,
    member(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    1,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_primary])).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    1,
    member(catalog_replica, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_replica, bank_primary])).
proof_boundary_call(3, 1, member(catalog_replica, [catalog_replica])).
proof_boundary_call(3, 1, repair_cost([], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, repair_cost([bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    1,
    repair_cost([bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(3, 1, repair_cost([bank_primary], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_primary, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_primary, bank_primary], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    1,
    repair_cost(
        [catalog_primary, catalog_replica, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    1,
    repair_cost(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    1,
    repair_cost(
        [catalog_primary, catalog_replica, bank_primary],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_replica, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_replica, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    1,
    repair_cost([catalog_replica, bank_primary], variable("_EyeplCall0"))
).
proof_boundary_call(3, 1, subset([], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, subset([bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, subset([bank_primary, bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    1,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    1,
    subset([catalog_replica, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary(3, 2, 1).
proof_boundary_steps(3, 2, 1, 75).
proof_boundary_steps(3, 2, 88, 272).
proof_boundary_steps(3, 2, 279, 545).
proof_boundary_call(3, 2, all_groups([], [])).
proof_boundary_call(3, 2, all_groups([], [bank_backup])).
proof_boundary_call(3, 2, all_groups([], [catalog_primary, bank_backup])).
proof_boundary_call(3, 2, all_groups([], [catalog_primary, bank_primary, bank_backup])).
proof_boundary_call(3, 2, all_groups([], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([], [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([], [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, all_groups([], [catalog_primary])).
proof_boundary_call(3, 2, all_groups([], [catalog_replica, bank_backup])).
proof_boundary_call(3, 2, all_groups([], [catalog_replica, bank_primary, bank_backup])).
proof_boundary_call(3, 2, all_groups([], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_groups([], [catalog_replica])).
proof_boundary_call(3, 2, all_groups([bank, risk], [])).
proof_boundary_call(3, 2, all_groups([bank, risk], [bank_backup])).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([bank, risk], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([bank, risk], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups(
        [bank, risk],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_groups([bank, risk], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_primary])).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([bank, risk], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_groups([bank, risk], [catalog_replica])).
proof_boundary_call(3, 2, all_groups([catalog, payment], [])).
proof_boundary_call(3, 2, all_groups([catalog, payment], [bank_backup])).
proof_boundary_call(3, 2, all_groups([catalog, payment], [bank_primary, bank_backup])).
proof_boundary_call(3, 2, all_groups([catalog, payment], [bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups(
        [catalog, payment],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, all_groups([catalog, payment], [catalog_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([catalog, payment], [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([catalog, payment], [catalog_replica])).
proof_boundary_call(3, 2, all_groups([checkout], [])).
proof_boundary_call(3, 2, all_groups([checkout], [bank_backup])).
proof_boundary_call(3, 2, all_groups([checkout], [bank_primary, bank_backup])).
proof_boundary_call(3, 2, all_groups([checkout], [bank_primary])).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([checkout], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([checkout], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups(
        [checkout],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_groups([checkout], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_primary])).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([checkout], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_groups([checkout], [catalog_replica])).
proof_boundary_call(3, 2, all_groups([payment], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([payment], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([payment], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([payment], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([payment], [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([payment], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([payment], [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, all_groups([payment], [catalog_primary])).
proof_boundary_call(3, 2, all_groups([payment], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([payment], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([payment], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_groups([payment], [catalog_replica])).
proof_boundary_call(3, 2, all_groups([risk], [bank_backup])).
proof_boundary_call(3, 2, all_groups([risk], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([risk], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([risk], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([risk], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([risk], [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups([risk], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([risk], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([risk], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([risk], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_groups([risk_signal], [])).
proof_boundary_call(3, 2, all_groups([risk_signal], [bank_backup])).
proof_boundary_call(3, 2, all_groups([risk_signal], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([risk_signal], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([risk_signal], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_groups([risk_signal], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_groups(
        [risk_signal],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_groups([risk_signal], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_groups([risk_signal], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_groups([risk_signal], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_groups([risk_signal], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_operating([], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_operating([], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_operating([], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_operating([], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([], [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_operating([], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_operating([], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_operating([], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_operating([mobile_app], [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_operating([mobile_app], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_operating([mobile_app], [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    all_operating([mobile_app], [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating(
        [mobile_app],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_operating([mobile_app], [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_operating([mobile_app], [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    all_operating([mobile_app], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_operating([mobile_app], [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, all_operating([web_store, mobile_app], [])).
proof_boundary_call(3, 2, all_operating([web_store, mobile_app], [bank_backup])).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [bank_primary, bank_backup])
).
proof_boundary_call(3, 2, all_operating([web_store, mobile_app], [bank_primary])).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    all_operating(
        [web_store, mobile_app],
        [catalog_primary, catalog_replica, bank_primary]
    )
).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, all_operating([web_store, mobile_app], [catalog_primary])).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    all_operating([web_store, mobile_app], [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, all_operating([web_store, mobile_app], [catalog_replica])).
proof_boundary_call(3, 2, group_operating(bank, [])).
proof_boundary_call(3, 2, group_operating(bank, [bank_backup])).
proof_boundary_call(3, 2, group_operating(bank, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(bank, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(bank, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(bank, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(bank, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(bank, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(bank, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, group_operating(bank, [catalog_primary])).
proof_boundary_call(3, 2, group_operating(bank, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(bank, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(bank, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, group_operating(bank, [catalog_replica])).
proof_boundary_call(3, 2, group_operating(catalog, [])).
proof_boundary_call(3, 2, group_operating(catalog, [bank_backup])).
proof_boundary_call(3, 2, group_operating(catalog, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, group_operating(catalog, [bank_primary])).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(catalog, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(catalog, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(
        catalog,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    group_operating(catalog, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_primary])).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(catalog, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, group_operating(catalog, [catalog_replica])).
proof_boundary_call(3, 2, group_operating(checkout, [])).
proof_boundary_call(3, 2, group_operating(checkout, [bank_backup])).
proof_boundary_call(3, 2, group_operating(checkout, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, group_operating(checkout, [bank_primary])).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(checkout, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(checkout, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(
        checkout,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    group_operating(checkout, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_primary])).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(checkout, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, group_operating(checkout, [catalog_replica])).
proof_boundary_call(3, 2, group_operating(payment, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(payment, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(payment, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(payment, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(
        payment,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    group_operating(payment, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(payment, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, group_operating(payment, [catalog_primary])).
proof_boundary_call(3, 2, group_operating(payment, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(payment, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(payment, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, group_operating(payment, [catalog_replica])).
proof_boundary_call(3, 2, group_operating(risk, [bank_backup])).
proof_boundary_call(3, 2, group_operating(risk, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(risk, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(risk, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(risk, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(risk, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(risk, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(risk, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(risk, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(risk, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, group_operating(risk_signal, [])).
proof_boundary_call(3, 2, group_operating(risk_signal, [bank_backup])).
proof_boundary_call(3, 2, group_operating(risk_signal, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(risk_signal, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(risk_signal, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    group_operating(risk_signal, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    group_operating(
        risk_signal,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    group_operating(risk_signal, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, group_operating(risk_signal, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    group_operating(risk_signal, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, group_operating(risk_signal, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, hardware_available(bank_backup, [])).
proof_boundary_call(3, 2, hardware_available(bank_backup, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        bank_backup,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(bank_backup, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_backup, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(bank_backup, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(bank_primary, [])).
proof_boundary_call(3, 2, hardware_available(bank_primary, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        bank_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(bank_primary, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(bank_primary, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(bank_primary, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(catalog_primary, [])).
proof_boundary_call(3, 2, hardware_available(catalog_primary, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [bank_primary, bank_backup])
).
proof_boundary_call(3, 2, hardware_available(catalog_primary, [bank_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(catalog_primary, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_primary, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(catalog_primary, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(catalog_replica, [])).
proof_boundary_call(3, 2, hardware_available(catalog_replica, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [bank_primary, bank_backup])
).
proof_boundary_call(3, 2, hardware_available(catalog_replica, [bank_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(catalog_replica, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(catalog_replica, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(catalog_replica, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(checkout_api, [])).
proof_boundary_call(3, 2, hardware_available(checkout_api, [bank_backup])).
proof_boundary_call(3, 2, hardware_available(checkout_api, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, hardware_available(checkout_api, [bank_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        checkout_api,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(checkout_api, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(checkout_api, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(checkout_api, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(mobile_app, [])).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        mobile_app,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(mobile_app, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(payment_service, [])).
proof_boundary_call(3, 2, hardware_available(payment_service, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(payment_service, [catalog_primary])).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(payment_service, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(payment_service, [catalog_replica])).
proof_boundary_call(3, 2, hardware_available(risk_cache, [])).
proof_boundary_call(3, 2, hardware_available(risk_cache, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        risk_cache,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_cache, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(risk_engine, [])).
proof_boundary_call(3, 2, hardware_available(risk_engine, [bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        risk_engine,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(risk_engine, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(web_store, [])).
proof_boundary_call(3, 2, hardware_available(web_store, [bank_backup])).
proof_boundary_call(3, 2, hardware_available(web_store, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, hardware_available(web_store, [bank_primary])).
proof_boundary_call(3, 2, hardware_available(web_store, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_primary, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(
        web_store,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, hardware_available(web_store, [catalog_primary])).
proof_boundary_call(3, 2, hardware_available(web_store, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    hardware_available(web_store, [catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, hardware_available(web_store, [catalog_replica])).
proof_boundary_call(3, 2, impacted(variable("_EyeplCall0"), bank_backup)).
proof_boundary_call(3, 2, impacted(variable("_EyeplCall0"), bank_primary)).
proof_boundary_call(3, 2, impacted(variable("_EyeplCall0"), catalog_primary)).
proof_boundary_call(3, 2, impacted(variable("_EyeplCall0"), catalog_replica)).
proof_boundary_call(3, 2, impacted(bank_backup, bank_backup)).
proof_boundary_call(3, 2, impacted(bank_backup, bank_primary)).
proof_boundary_call(3, 2, impacted(bank_backup, catalog_primary)).
proof_boundary_call(3, 2, impacted(bank_backup, catalog_replica)).
proof_boundary_call(3, 2, impacted(bank_primary, bank_backup)).
proof_boundary_call(3, 2, impacted(bank_primary, bank_primary)).
proof_boundary_call(3, 2, impacted(bank_primary, catalog_primary)).
proof_boundary_call(3, 2, impacted(bank_primary, catalog_replica)).
proof_boundary_call(3, 2, impacted(catalog_primary, bank_backup)).
proof_boundary_call(3, 2, impacted(catalog_primary, bank_primary)).
proof_boundary_call(3, 2, impacted(catalog_primary, catalog_primary)).
proof_boundary_call(3, 2, impacted(catalog_primary, catalog_replica)).
proof_boundary_call(3, 2, impacted(catalog_replica, bank_backup)).
proof_boundary_call(3, 2, impacted(catalog_replica, bank_primary)).
proof_boundary_call(3, 2, impacted(catalog_replica, catalog_primary)).
proof_boundary_call(3, 2, impacted(catalog_replica, catalog_replica)).
proof_boundary_call(3, 2, impacted(checkout_api, bank_backup)).
proof_boundary_call(3, 2, impacted(checkout_api, bank_primary)).
proof_boundary_call(3, 2, impacted(checkout_api, catalog_primary)).
proof_boundary_call(3, 2, impacted(checkout_api, catalog_replica)).
proof_boundary_call(3, 2, impacted(payment_service, bank_backup)).
proof_boundary_call(3, 2, impacted(payment_service, bank_primary)).
proof_boundary_call(3, 2, impacted(payment_service, catalog_primary)).
proof_boundary_call(3, 2, impacted(payment_service, catalog_replica)).
proof_boundary_call(3, 2, impacted(risk_cache, bank_backup)).
proof_boundary_call(3, 2, impacted(risk_cache, bank_primary)).
proof_boundary_call(3, 2, impacted(risk_cache, catalog_primary)).
proof_boundary_call(3, 2, impacted(risk_cache, catalog_replica)).
proof_boundary_call(3, 2, impacted(risk_engine, bank_backup)).
proof_boundary_call(3, 2, impacted(risk_engine, bank_primary)).
proof_boundary_call(3, 2, impacted(risk_engine, catalog_primary)).
proof_boundary_call(3, 2, impacted(risk_engine, catalog_replica)).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [bank, risk])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [catalog, payment])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [checkout])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [payment])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [risk])).
proof_boundary_call(3, 2, member(variable("_EyeplCall0"), [risk_signal])).
proof_boundary_call(3, 2, member(bank_backup, [])).
proof_boundary_call(3, 2, member(bank_backup, [bank_backup])).
proof_boundary_call(3, 2, member(bank_backup, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, member(bank_backup, [bank_primary])).
proof_boundary_call(3, 2, member(bank_backup, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(bank_backup, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(bank_backup, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    member(bank_backup, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(bank_backup, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(bank_backup, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, member(bank_backup, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, member(bank_backup, [catalog_primary])).
proof_boundary_call(3, 2, member(bank_backup, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(bank_backup, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(bank_backup, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, member(bank_backup, [catalog_replica])).
proof_boundary_call(3, 2, member(bank_primary, [])).
proof_boundary_call(3, 2, member(bank_primary, [bank_backup])).
proof_boundary_call(3, 2, member(bank_primary, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, member(bank_primary, [bank_primary])).
proof_boundary_call(3, 2, member(bank_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(bank_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(bank_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    member(bank_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(bank_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, member(bank_primary, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, member(bank_primary, [catalog_primary])).
proof_boundary_call(3, 2, member(bank_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(bank_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(bank_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, member(bank_primary, [catalog_replica])).
proof_boundary_call(3, 2, member(catalog_primary, [])).
proof_boundary_call(3, 2, member(catalog_primary, [bank_backup])).
proof_boundary_call(3, 2, member(catalog_primary, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, member(catalog_primary, [bank_primary])).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(catalog_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    member(catalog_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_primary])).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(catalog_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, member(catalog_primary, [catalog_replica])).
proof_boundary_call(3, 2, member(catalog_replica, [])).
proof_boundary_call(3, 2, member(catalog_replica, [bank_backup])).
proof_boundary_call(3, 2, member(catalog_replica, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, member(catalog_replica, [bank_primary])).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(catalog_replica, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    member(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    member(catalog_replica, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_primary])).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    member(catalog_replica, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, member(catalog_replica, [catalog_replica])).
proof_boundary_call(3, 2, operating(bank_backup, [])).
proof_boundary_call(3, 2, operating(bank_backup, [bank_backup])).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(bank_backup, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(bank_backup, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        bank_backup,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(bank_backup, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_primary])).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(bank_backup, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(bank_backup, [catalog_replica])).
proof_boundary_call(3, 2, operating(bank_primary, [])).
proof_boundary_call(3, 2, operating(bank_primary, [bank_backup])).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(bank_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(bank_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        bank_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(bank_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_primary])).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(bank_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(bank_primary, [catalog_replica])).
proof_boundary_call(3, 2, operating(catalog_primary, [])).
proof_boundary_call(3, 2, operating(catalog_primary, [bank_backup])).
proof_boundary_call(3, 2, operating(catalog_primary, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, operating(catalog_primary, [bank_primary])).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(catalog_primary, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(catalog_primary, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        catalog_primary,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(catalog_primary, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    operating(catalog_primary, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_primary])).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(catalog_primary, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(catalog_primary, [catalog_replica])).
proof_boundary_call(3, 2, operating(catalog_replica, [])).
proof_boundary_call(3, 2, operating(catalog_replica, [bank_backup])).
proof_boundary_call(3, 2, operating(catalog_replica, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, operating(catalog_replica, [bank_primary])).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(catalog_replica, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(catalog_replica, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        catalog_replica,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(catalog_replica, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    operating(catalog_replica, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_primary])).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(catalog_replica, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(catalog_replica, [catalog_replica])).
proof_boundary_call(3, 2, operating(checkout_api, [])).
proof_boundary_call(3, 2, operating(checkout_api, [bank_backup])).
proof_boundary_call(3, 2, operating(checkout_api, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, operating(checkout_api, [bank_primary])).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(checkout_api, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(checkout_api, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        checkout_api,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(checkout_api, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_primary])).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(checkout_api, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(checkout_api, [catalog_replica])).
proof_boundary_call(3, 2, operating(mobile_app, [])).
proof_boundary_call(3, 2, operating(mobile_app, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(mobile_app, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(mobile_app, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(mobile_app, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(mobile_app, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(mobile_app, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(mobile_app, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(payment_service, [])).
proof_boundary_call(3, 2, operating(payment_service, [bank_backup])).
proof_boundary_call(3, 2, operating(payment_service, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(payment_service, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(payment_service, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(payment_service, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        payment_service,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(payment_service, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(
    3,
    2,
    operating(payment_service, [catalog_primary, catalog_replica])
).
proof_boundary_call(3, 2, operating(payment_service, [catalog_primary])).
proof_boundary_call(3, 2, operating(payment_service, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(payment_service, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(payment_service, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(payment_service, [catalog_replica])).
proof_boundary_call(3, 2, operating(risk_cache, [])).
proof_boundary_call(3, 2, operating(risk_cache, [bank_backup])).
proof_boundary_call(3, 2, operating(risk_cache, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(risk_cache, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(risk_cache, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(risk_cache, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(risk_cache, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(risk_cache, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(risk_cache, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(risk_engine, [])).
proof_boundary_call(3, 2, operating(risk_engine, [bank_backup])).
proof_boundary_call(3, 2, operating(risk_engine, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(risk_engine, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(risk_engine, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(risk_engine, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(
        risk_engine,
        [catalog_primary, catalog_replica, bank_primary, bank_backup]
    )
).
proof_boundary_call(
    3,
    2,
    operating(risk_engine, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(risk_engine, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(risk_engine, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(risk_engine, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(web_store, [])).
proof_boundary_call(3, 2, operating(web_store, [bank_backup])).
proof_boundary_call(3, 2, operating(web_store, [bank_primary, bank_backup])).
proof_boundary_call(3, 2, operating(web_store, [bank_primary])).
proof_boundary_call(3, 2, operating(web_store, [catalog_primary, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(web_store, [catalog_primary, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(web_store, [catalog_primary, bank_primary])).
proof_boundary_call(
    3,
    2,
    operating(web_store, [catalog_primary, catalog_replica, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(web_store, [catalog_primary, catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(
    3,
    2,
    operating(web_store, [catalog_primary, catalog_replica, bank_primary])
).
proof_boundary_call(3, 2, operating(web_store, [catalog_primary, catalog_replica])).
proof_boundary_call(3, 2, operating(web_store, [catalog_primary])).
proof_boundary_call(3, 2, operating(web_store, [catalog_replica, bank_backup])).
proof_boundary_call(
    3,
    2,
    operating(web_store, [catalog_replica, bank_primary, bank_backup])
).
proof_boundary_call(3, 2, operating(web_store, [catalog_replica, bank_primary])).
proof_boundary_call(3, 2, operating(web_store, [catalog_replica])).
proof_boundary_call(3, 2, repair_cost([], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, repair_cost([bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    2,
    repair_cost([bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(3, 2, repair_cost([bank_primary], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_primary, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_primary, bank_primary], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    2,
    repair_cost(
        [catalog_primary, catalog_replica, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    2,
    repair_cost(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    2,
    repair_cost(
        [catalog_primary, catalog_replica, bank_primary],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_replica, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_replica, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_boundary_call(
    3,
    2,
    repair_cost([catalog_replica, bank_primary], variable("_EyeplCall0"))
).
proof_boundary_call(3, 2, subset([], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, subset([bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, subset([bank_primary, bank_backup], variable("_EyeplCall0"))).
proof_boundary_call(
    3,
    2,
    subset(
        [catalog_primary, catalog_replica, bank_primary, bank_backup],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    3,
    2,
    subset([catalog_replica, bank_primary, bank_backup], variable("_EyeplCall0"))
).
proof_claim(3, answer(3, [547])).

% Answer 4
restored(catalog_replica).
restored(bank_backup).
restored(payment_service).
restored(checkout_api).
restored(web_store).
restored(mobile_app).

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

% Goal check 14
check_result(14, true).
