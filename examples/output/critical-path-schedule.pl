% Answer 1
critical_path_answer(schedule, task(requirements, 0, 2)).
critical_path_answer(schedule, task(architecture, 2, 5)).
critical_path_answer(schedule, task(api_design, 2, 4)).
critical_path_answer(schedule, task(database, 5, 9)).
critical_path_answer(schedule, task(auth, 5, 8)).
critical_path_answer(schedule, task(frontend, 4, 9)).
critical_path_answer(schedule, task(backend, 9, 15)).
critical_path_answer(schedule, task(integration, 15, 19)).
critical_path_answer(schedule, task(security_review, 19, 22)).
critical_path_answer(schedule, task(load_test, 19, 21)).
critical_path_answer(schedule, task(launch, 22, 23)).
critical_path_answer(project_finish, 23).
critical_path_answer(critical_task, launch).
critical_path_answer(critical_task, security_review).
critical_path_answer(critical_task, integration).
critical_path_answer(critical_task, backend).
critical_path_answer(critical_task, database).
critical_path_answer(critical_task, architecture).
critical_path_answer(critical_task, requirements).

% Answer 2
critical_task(launch).

% Reason 2
proof_step(2, 1, task(requirements, 2, []), source(1)).
proof_step(2, 2, task(architecture, 3, [requirements]), source(2)).
proof_step(2, 3, task(api_design, 2, [requirements]), source(3)).
proof_step(2, 4, task(database, 4, [architecture]), source(4)).
proof_step(2, 5, task(backend, 6, [api_design, database]), source(5)).
proof_step(2, 6, task(frontend, 5, [api_design]), source(6)).
proof_step(2, 7, task(auth, 3, [architecture]), source(7)).
proof_step(2, 8, task(integration, 4, [backend, frontend, auth]), source(8)).
proof_step(2, 9, task(security_review, 3, [integration]), source(9)).
proof_step(2, 10, task(load_test, 2, [integration]), source(10)).
proof_step(2, 11, task(launch, 1, [security_review, load_test]), source(11)).
proof_step(2, 12, latest_finish([], 0), source(12)).
proof_step(2, 13, member(requirements, [requirements]), rule(1, [])).
proof_step(2, 14, member(architecture, [architecture]), rule(1, [])).
proof_step(2, 15, member(api_design, [api_design, database]), rule(1, [])).
proof_step(2, 16, member(api_design, [api_design]), rule(1, [])).
proof_step(2, 17, member(backend, [backend, frontend, auth]), rule(1, [])).
proof_step(2, 18, member(integration, [integration]), rule(1, [])).
proof_step(2, 19, member(security_review, [security_review, load_test]), rule(1, [])).
proof_step(2, 20, member(database, [database]), rule(1, [])).
proof_step(2, 21, member(frontend, [frontend, auth]), rule(1, [])).
proof_step(2, 22, member(load_test, [load_test]), rule(1, [])).
proof_step(2, 23, member(auth, [auth]), rule(1, [])).
proof_step(2, 24, is(2, '+'(0, 2)), builtin).
proof_step(2, 25, is(2, max(2, 0)), builtin).
proof_step(2, 26, is(5, '+'(2, 3)), builtin).
proof_step(2, 27, is(4, '+'(2, 2)), builtin).
proof_step(2, 28, is(5, max(5, 0)), builtin).
proof_step(2, 29, is(4, max(4, 0)), builtin).
proof_step(2, 30, is(9, '+'(5, 4)), builtin).
proof_step(2, 31, is(8, '+'(5, 3)), builtin).
proof_step(2, 32, is(9, '+'(4, 5)), builtin).
proof_step(2, 33, is(9, max(9, 0)), builtin).
proof_step(2, 34, is(9, max(4, 9)), builtin).
proof_step(2, 35, is(15, '+'(9, 6)), builtin).
proof_step(2, 36, is(8, max(8, 0)), builtin).
proof_step(2, 37, is(9, max(9, 8)), builtin).
proof_step(2, 38, is(15, max(15, 9)), builtin).
proof_step(2, 39, is(19, '+'(15, 4)), builtin).
proof_step(2, 40, is(19, max(19, 0)), builtin).
proof_step(2, 41, is(22, '+'(19, 3)), builtin).
proof_step(2, 42, is(21, '+'(19, 2)), builtin).
proof_step(2, 43, is(21, max(21, 0)), builtin).
proof_step(2, 44, is(22, max(22, 21)), builtin).
proof_step(2, 45, is(23, '+'(22, 1)), builtin).
proof_step(2, 46, critical_chain(launch, launch), rule(10, [])).
proof_step(2, 47, critical_chain(security_review, security_review), rule(10, [])).
proof_step(2, 48, critical_chain(integration, integration), rule(10, [])).
proof_step(2, 49, critical_chain(backend, backend), rule(10, [])).
proof_step(2, 50, critical_chain(database, database), rule(10, [])).
proof_step(2, 51, critical_chain(architecture, architecture), rule(10, [])).
proof_step(2, 52, critical_chain(requirements, requirements), rule(10, [])).
proof_step(2, 53, earliest_start(requirements, 0), rule(4, [1, 12])).
proof_step(2, 54, depends(architecture, requirements), rule(3, [2, 13])).
proof_step(2, 55, depends(api_design, requirements), rule(3, [3, 13])).
proof_step(2, 56, depends(database, architecture), rule(3, [4, 14])).
proof_step(2, 57, depends(auth, architecture), rule(3, [7, 14])).
proof_step(2, 58, depends(backend, api_design), rule(3, [5, 15])).
proof_step(2, 59, depends(frontend, api_design), rule(3, [6, 16])).
proof_step(2, 60, depends(integration, backend), rule(3, [8, 17])).
proof_step(2, 61, depends(security_review, integration), rule(3, [9, 18])).
proof_step(2, 62, depends(load_test, integration), rule(3, [10, 18])).
proof_step(2, 63, depends(launch, security_review), rule(3, [11, 19])).
proof_step(2, 64, member(database, [api_design, database]), rule(2, [20])).
proof_step(2, 65, member(frontend, [backend, frontend, auth]), rule(2, [21])).
proof_step(2, 66, member(load_test, [security_review, load_test]), rule(2, [22])).
proof_step(2, 67, member(auth, [frontend, auth]), rule(2, [23])).
proof_step(2, 68, finish_time(requirements, 2), rule(6, [1, 53, 24])).
proof_step(2, 69, depends(backend, database), rule(3, [5, 64])).
proof_step(2, 70, depends(integration, frontend), rule(3, [8, 65])).
proof_step(2, 71, depends(launch, load_test), rule(3, [11, 66])).
proof_step(2, 72, member(auth, [backend, frontend, auth]), rule(2, [67])).
proof_step(
    2,
    73,
    critical_path_answer(schedule, task(requirements, 0, 2)),
    rule(15, [1, 53, 68])
).
proof_step(2, 74, latest_finish([requirements], 2), rule(5, [68, 12, 25])).
proof_step(2, 75, depends(integration, auth), rule(3, [8, 72])).
proof_step(2, 76, earliest_start(architecture, 2), rule(4, [2, 74])).
proof_step(2, 77, earliest_start(api_design, 2), rule(4, [3, 74])).
proof_step(
    2,
    78,
    critical_predecessor(architecture, requirements),
    rule(7, [54, 68, 76])
).
proof_step(2, 79, finish_time(architecture, 5), rule(6, [2, 76, 26])).
proof_step(2, 80, critical_predecessor(api_design, requirements), rule(7, [55, 68, 77])).
proof_step(2, 81, finish_time(api_design, 4), rule(6, [3, 77, 27])).
proof_step(2, 82, critical_chain(architecture, requirements), rule(11, [78, 52])).
proof_step(
    2,
    83,
    critical_path_answer(schedule, task(architecture, 2, 5)),
    rule(15, [2, 76, 79])
).
proof_step(2, 84, latest_finish([architecture], 5), rule(5, [79, 12, 28])).
proof_step(
    2,
    85,
    critical_path_answer(schedule, task(api_design, 2, 4)),
    rule(15, [3, 77, 81])
).
proof_step(2, 86, latest_finish([api_design], 4), rule(5, [81, 12, 29])).
proof_step(2, 87, earliest_start(database, 5), rule(4, [4, 84])).
proof_step(2, 88, earliest_start(auth, 5), rule(4, [7, 84])).
proof_step(2, 89, earliest_start(frontend, 4), rule(4, [6, 86])).
proof_step(2, 90, critical_predecessor(database, architecture), rule(7, [56, 79, 87])).
proof_step(2, 91, finish_time(database, 9), rule(6, [4, 87, 30])).
proof_step(2, 92, critical_predecessor(auth, architecture), rule(7, [57, 79, 88])).
proof_step(2, 93, finish_time(auth, 8), rule(6, [7, 88, 31])).
proof_step(2, 94, critical_predecessor(frontend, api_design), rule(7, [59, 81, 89])).
proof_step(2, 95, finish_time(frontend, 9), rule(6, [6, 89, 32])).
proof_step(2, 96, critical_chain(database, architecture), rule(11, [90, 51])).
proof_step(2, 97, critical_chain(database, requirements), rule(11, [90, 82])).
proof_step(
    2,
    98,
    critical_path_answer(schedule, task(database, 5, 9)),
    rule(15, [4, 87, 91])
).
proof_step(2, 99, latest_finish([database], 9), rule(5, [91, 12, 33])).
proof_step(
    2,
    100,
    critical_path_answer(schedule, task(auth, 5, 8)),
    rule(15, [7, 88, 93])
).
proof_step(2, 101, latest_finish([auth], 8), rule(5, [93, 12, 36])).
proof_step(
    2,
    102,
    critical_path_answer(schedule, task(frontend, 4, 9)),
    rule(15, [6, 89, 95])
).
proof_step(2, 103, latest_finish([api_design, database], 9), rule(5, [81, 99, 34])).
proof_step(2, 104, latest_finish([frontend, auth], 9), rule(5, [95, 101, 37])).
proof_step(2, 105, earliest_start(backend, 9), rule(4, [5, 103])).
proof_step(2, 106, critical_predecessor(backend, database), rule(7, [69, 91, 105])).
proof_step(2, 107, finish_time(backend, 15), rule(6, [5, 105, 35])).
proof_step(2, 108, critical_chain(backend, database), rule(11, [106, 50])).
proof_step(2, 109, critical_chain(backend, architecture), rule(11, [106, 96])).
proof_step(2, 110, critical_chain(backend, requirements), rule(11, [106, 97])).
proof_step(
    2,
    111,
    critical_path_answer(schedule, task(backend, 9, 15)),
    rule(15, [5, 105, 107])
).
proof_step(
    2,
    112,
    latest_finish([backend, frontend, auth], 15),
    rule(5, [107, 104, 38])
).
proof_step(2, 113, earliest_start(integration, 15), rule(4, [8, 112])).
proof_step(2, 114, critical_predecessor(integration, backend), rule(7, [60, 107, 113])).
proof_step(2, 115, finish_time(integration, 19), rule(6, [8, 113, 39])).
proof_step(2, 116, critical_chain(integration, backend), rule(11, [114, 49])).
proof_step(2, 117, critical_chain(integration, database), rule(11, [114, 108])).
proof_step(2, 118, critical_chain(integration, architecture), rule(11, [114, 109])).
proof_step(2, 119, critical_chain(integration, requirements), rule(11, [114, 110])).
proof_step(
    2,
    120,
    critical_path_answer(schedule, task(integration, 15, 19)),
    rule(15, [8, 113, 115])
).
proof_step(2, 121, latest_finish([integration], 19), rule(5, [115, 12, 40])).
proof_step(2, 122, earliest_start(security_review, 19), rule(4, [9, 121])).
proof_step(2, 123, earliest_start(load_test, 19), rule(4, [10, 121])).
proof_step(
    2,
    124,
    critical_predecessor(security_review, integration),
    rule(7, [61, 115, 122])
).
proof_step(2, 125, finish_time(security_review, 22), rule(6, [9, 122, 41])).
proof_step(
    2,
    126,
    critical_predecessor(load_test, integration),
    rule(7, [62, 115, 123])
).
proof_step(2, 127, finish_time(load_test, 21), rule(6, [10, 123, 42])).
proof_step(2, 128, critical_chain(security_review, integration), rule(11, [124, 48])).
proof_step(2, 129, critical_chain(security_review, backend), rule(11, [124, 116])).
proof_step(2, 130, critical_chain(security_review, database), rule(11, [124, 117])).
proof_step(2, 131, critical_chain(security_review, architecture), rule(11, [124, 118])).
proof_step(2, 132, critical_chain(security_review, requirements), rule(11, [124, 119])).
proof_step(
    2,
    133,
    critical_path_answer(schedule, task(security_review, 19, 22)),
    rule(15, [9, 122, 125])
).
proof_step(
    2,
    134,
    critical_path_answer(schedule, task(load_test, 19, 21)),
    rule(15, [10, 123, 127])
).
proof_step(2, 135, latest_finish([load_test], 21), rule(5, [127, 12, 43])).
proof_step(
    2,
    136,
    latest_finish([security_review, load_test], 22),
    rule(5, [125, 135, 44])
).
proof_step(2, 137, earliest_start(launch, 22), rule(4, [11, 136])).
proof_step(
    2,
    138,
    critical_predecessor(launch, security_review),
    rule(7, [63, 125, 137])
).
proof_step(2, 139, finish_time(launch, 23), rule(6, [11, 137, 45])).
proof_step(2, 140, critical_chain(launch, security_review), rule(11, [138, 47])).
proof_step(2, 141, critical_chain(launch, integration), rule(11, [138, 128])).
proof_step(2, 142, critical_chain(launch, backend), rule(11, [138, 129])).
proof_step(2, 143, critical_chain(launch, database), rule(11, [138, 130])).
proof_step(2, 144, critical_chain(launch, architecture), rule(11, [138, 131])).
proof_step(2, 145, critical_chain(launch, requirements), rule(11, [138, 132])).
proof_step(
    2,
    146,
    critical_path_answer(schedule, task(launch, 22, 23)),
    rule(15, [11, 137, 139])
).
proof_step(2, 147, '$aggregate:r8:1'([], 23), aggregate(rule(8), 1, 1)).
proof_step(2, 148, project_finish(23), rule(8, [147])).
proof_step(2, 149, final_task(launch), rule(9, [148, 11, 139])).
proof_step(2, 150, critical_task(launch), rule(12, [149, 46])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 23).
proof_boundary_steps(2, 1, 46, 146).
proof_boundary_call(2, 1, critical_chain(architecture, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(backend, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(database, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(integration, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(launch, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(requirements, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, critical_chain(security_review, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(api_design, 2)).
proof_boundary_call(2, 1, earliest_start(api_design, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(architecture, 2)).
proof_boundary_call(2, 1, earliest_start(architecture, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(auth, 5)).
proof_boundary_call(2, 1, earliest_start(auth, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(backend, 4)).
proof_boundary_call(2, 1, earliest_start(backend, 9)).
proof_boundary_call(2, 1, earliest_start(backend, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(database, 5)).
proof_boundary_call(2, 1, earliest_start(database, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(frontend, 4)).
proof_boundary_call(2, 1, earliest_start(frontend, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(integration, 15)).
proof_boundary_call(2, 1, earliest_start(integration, 8)).
proof_boundary_call(2, 1, earliest_start(integration, 9)).
proof_boundary_call(2, 1, earliest_start(integration, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(launch, 21)).
proof_boundary_call(2, 1, earliest_start(launch, 22)).
proof_boundary_call(2, 1, earliest_start(launch, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(load_test, 19)).
proof_boundary_call(2, 1, earliest_start(load_test, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(requirements, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, earliest_start(security_review, 19)).
proof_boundary_call(2, 1, earliest_start(security_review, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(api_design, 23)).
proof_boundary_call(2, 1, finish_time(api_design, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(architecture, 23)).
proof_boundary_call(2, 1, finish_time(architecture, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(auth, 23)).
proof_boundary_call(2, 1, finish_time(auth, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(backend, 23)).
proof_boundary_call(2, 1, finish_time(backend, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(database, 23)).
proof_boundary_call(2, 1, finish_time(database, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(frontend, 23)).
proof_boundary_call(2, 1, finish_time(frontend, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(integration, 23)).
proof_boundary_call(2, 1, finish_time(integration, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(launch, 23)).
proof_boundary_call(2, 1, finish_time(launch, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(load_test, 23)).
proof_boundary_call(2, 1, finish_time(load_test, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(requirements, 23)).
proof_boundary_call(2, 1, finish_time(requirements, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, finish_time(security_review, 23)).
proof_boundary_call(2, 1, finish_time(security_review, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([api_design, database], 4)).
proof_boundary_call(2, 1, latest_finish([api_design, database], 9)).
proof_boundary_call(
    2,
    1,
    latest_finish([api_design, database], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, latest_finish([api_design], 4)).
proof_boundary_call(2, 1, latest_finish([api_design], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([architecture], 5)).
proof_boundary_call(2, 1, latest_finish([architecture], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([auth], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([backend, frontend, auth], 15)).
proof_boundary_call(2, 1, latest_finish([backend, frontend, auth], 8)).
proof_boundary_call(2, 1, latest_finish([backend, frontend, auth], 9)).
proof_boundary_call(
    2,
    1,
    latest_finish([backend, frontend, auth], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, latest_finish([database], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([frontend, auth], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([integration], 19)).
proof_boundary_call(2, 1, latest_finish([integration], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([load_test], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([requirements], 2)).
proof_boundary_call(2, 1, latest_finish([requirements], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, latest_finish([security_review, load_test], 21)).
proof_boundary_call(2, 1, latest_finish([security_review, load_test], 22)).
proof_boundary_call(
    2,
    1,
    latest_finish([security_review, load_test], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [api_design, database])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [api_design])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [architecture])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [auth])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [backend, frontend, auth])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [database])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [frontend, auth])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [integration])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [load_test])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [requirements])).
proof_boundary_call(2, 1, member(variable("_EyeplCall0"), [security_review, load_test])).
proof_claim(2, answer(2, [150])).

% Answer 3
earliest_start(integration, 15).

% Reason 3
proof_step(3, 1, task(requirements, 2, []), source(1)).
proof_step(3, 2, task(architecture, 3, [requirements]), source(2)).
proof_step(3, 3, task(api_design, 2, [requirements]), source(3)).
proof_step(3, 4, task(database, 4, [architecture]), source(4)).
proof_step(3, 5, task(backend, 6, [api_design, database]), source(5)).
proof_step(3, 6, task(frontend, 5, [api_design]), source(6)).
proof_step(3, 7, task(auth, 3, [architecture]), source(7)).
proof_step(3, 8, task(integration, 4, [backend, frontend, auth]), source(8)).
proof_step(3, 9, latest_finish([], 0), source(12)).
proof_step(3, 10, is(2, '+'(0, 2)), builtin).
proof_step(3, 11, is(2, max(2, 0)), builtin).
proof_step(3, 12, is(5, '+'(2, 3)), builtin).
proof_step(3, 13, is(4, '+'(2, 2)), builtin).
proof_step(3, 14, is(5, max(5, 0)), builtin).
proof_step(3, 15, is(4, max(4, 0)), builtin).
proof_step(3, 16, is(9, '+'(5, 4)), builtin).
proof_step(3, 17, is(8, '+'(5, 3)), builtin).
proof_step(3, 18, is(9, '+'(4, 5)), builtin).
proof_step(3, 19, is(9, max(9, 0)), builtin).
proof_step(3, 20, is(9, max(4, 9)), builtin).
proof_step(3, 21, is(15, '+'(9, 6)), builtin).
proof_step(3, 22, is(8, max(8, 0)), builtin).
proof_step(3, 23, is(9, max(9, 8)), builtin).
proof_step(3, 24, is(15, max(15, 9)), builtin).
proof_step(3, 25, earliest_start(requirements, 0), rule(4, [1, 9])).
proof_step(3, 26, finish_time(requirements, 2), rule(6, [1, 25, 10])).
proof_step(3, 27, latest_finish([requirements], 2), rule(5, [26, 9, 11])).
proof_step(3, 28, earliest_start(architecture, 2), rule(4, [2, 27])).
proof_step(3, 29, earliest_start(api_design, 2), rule(4, [3, 27])).
proof_step(3, 30, finish_time(architecture, 5), rule(6, [2, 28, 12])).
proof_step(3, 31, finish_time(api_design, 4), rule(6, [3, 29, 13])).
proof_step(3, 32, latest_finish([architecture], 5), rule(5, [30, 9, 14])).
proof_step(3, 33, latest_finish([api_design], 4), rule(5, [31, 9, 15])).
proof_step(3, 34, earliest_start(database, 5), rule(4, [4, 32])).
proof_step(3, 35, earliest_start(auth, 5), rule(4, [7, 32])).
proof_step(3, 36, earliest_start(frontend, 4), rule(4, [6, 33])).
proof_step(3, 37, finish_time(database, 9), rule(6, [4, 34, 16])).
proof_step(3, 38, finish_time(auth, 8), rule(6, [7, 35, 17])).
proof_step(3, 39, finish_time(frontend, 9), rule(6, [6, 36, 18])).
proof_step(3, 40, latest_finish([database], 9), rule(5, [37, 9, 19])).
proof_step(3, 41, latest_finish([auth], 8), rule(5, [38, 9, 22])).
proof_step(3, 42, latest_finish([api_design, database], 9), rule(5, [31, 40, 20])).
proof_step(3, 43, latest_finish([frontend, auth], 9), rule(5, [39, 41, 23])).
proof_step(3, 44, earliest_start(backend, 9), rule(4, [5, 42])).
proof_step(3, 45, finish_time(backend, 15), rule(6, [5, 44, 21])).
proof_step(3, 46, latest_finish([backend, frontend, auth], 15), rule(5, [45, 43, 24])).
proof_step(3, 47, earliest_start(integration, 15), rule(4, [8, 46])).
proof_claim(3, answer(3, [47])).

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
