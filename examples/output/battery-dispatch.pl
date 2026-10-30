% Answer 1
dispatch_plan(
    [
        dispatch(1, 1, 3, 3),
        dispatch(2, -2, 1, 1),
        dispatch(3, 2, 0, 3),
        dispatch(4, -1, 2, 2)
    ],
    28
).

% Reason 1
proof_step(1, 1, capacity_kwh(4), source(1)).
proof_step(1, 2, reserve_kwh(1), source(2)).
proof_step(1, 3, power_limit_kw(2), source(3)).
proof_step(1, 4, grid_limit_kw(3), source(4)).
proof_step(1, 5, initial_charge_kwh(2), source(5)).
proof_step(1, 6, final_charge_kwh(2), source(6)).
proof_step(1, 7, last_slot(4), source(7)).
proof_step(1, 8, actions([-2, -1, 0, 1, 2]), source(8)).
proof_step(1, 9, slot(1, 2, 0, 2, 1), source(9)).
proof_step(1, 10, slot(2, 4, 1, 8, 1), source(10)).
proof_step(1, 11, slot(3, 1, 3, 2, 1), source(11)).
proof_step(1, 12, slot(4, 3, 0, 7, 1), source(12)).
proof_step(1, 13, is(5, '+'(4, 1)), builtin).
proof_step(1, 14, member(-2, [-2, -1, 0, 1, 2]), rule(1, [])).
proof_step(1, 15, member(-1, [-1, 0, 1, 2]), rule(1, [])).
proof_step(1, 16, member(1, [1, 2]), rule(1, [])).
proof_step(1, 17, member(2, [2]), rule(1, [])).
proof_step(1, 18, is(0, '+'(2, '*'(-2, 1))), builtin).
proof_step(1, 19, is(0, '+'('-'(2, 0), -2)), builtin).
proof_step(1, 20, is(0, '*'('*'(0, 1), 2)), builtin).
proof_step(1, 21, is(1, '+'(2, '*'(-1, 1))), builtin).
proof_step(1, 22, is(1, '+'('-'(2, 0), -1)), builtin).
proof_step(1, 23, is(2, '*'('*'(1, 1), 2)), builtin).
proof_step(1, 24, is(2, '+'(2, '*'(0, 1))), builtin).
proof_step(1, 25, is(2, '+'('-'(2, 0), 0)), builtin).
proof_step(1, 26, is(4, '*'('*'(2, 1), 2)), builtin).
proof_step(1, 27, is(3, '+'(2, '*'(1, 1))), builtin).
proof_step(1, 28, is(3, '+'('-'(2, 0), 1)), builtin).
proof_step(1, 29, is(6, '*'('*'(3, 1), 2)), builtin).
proof_step(1, 30, is(4, '+'(2, '*'(2, 1))), builtin).
proof_step(1, 31, is(4, '+'('-'(2, 0), 2)), builtin).
proof_step(1, 32, is(8, '*'('*'(4, 1), 2)), builtin).
proof_step(1, 33, '>='(1, 1), builtin).
proof_step(1, 34, '=<'(1, 4), builtin).
proof_step(1, 35, '>='(1, 0), builtin).
proof_step(1, 36, '=<'(1, 3), builtin).
proof_step(1, 37, '=<'(abs(-1), 2), builtin).
proof_step(1, 38, '>='(2, 1), builtin).
proof_step(1, 39, '=<'(2, 4), builtin).
proof_step(1, 40, '>='(2, 0), builtin).
proof_step(1, 41, '=<'(2, 3), builtin).
proof_step(1, 42, '=<'(abs(0), 2), builtin).
proof_step(1, 43, '>='(3, 1), builtin).
proof_step(1, 44, '=<'(3, 4), builtin).
proof_step(1, 45, '>='(3, 0), builtin).
proof_step(1, 46, '=<'(3, 3), builtin).
proof_step(1, 47, '=<'(abs(1), 2), builtin).
proof_step(1, 48, is(-1, '+'(1, '*'(-2, 1))), builtin).
proof_step(1, 49, is(1, '+'('-'(4, 1), -2)), builtin).
proof_step(1, 50, is(8, '*'('*'(1, 1), 8)), builtin).
proof_step(1, 51, '<'(-1, 1), builtin).
proof_step(1, 52, is(1, '+'(3, '*'(-2, 1))), builtin).
proof_step(1, 53, '<'(0, 1), builtin).
proof_step(1, 54, '=<'(abs(-2), 2), builtin).
proof_step(1, 55, is(0, '+'(1, '*'(-1, 1))), builtin).
proof_step(1, 56, is(2, '+'('-'(4, 1), -1)), builtin).
proof_step(1, 57, is(16, '*'('*'(2, 1), 8)), builtin).
proof_step(1, 58, is(-4, '+'('-'(1, 3), -2)), builtin).
proof_step(1, 59, is(-8, '*'('*'(-4, 1), 2)), builtin).
proof_step(1, 60, '<'(-4, 0), builtin).
proof_step(1, 61, is(1, '+'(1, '*'(0, 1))), builtin).
proof_step(1, 62, is(3, '+'('-'(4, 1), 0)), builtin).
proof_step(1, 63, is(24, '*'('*'(3, 1), 8)), builtin).
proof_step(1, 64, is(-3, '+'('-'(1, 3), -1)), builtin).
proof_step(1, 65, is(-6, '*'('*'(-3, 1), 2)), builtin).
proof_step(1, 66, '<'(-3, 0), builtin).
proof_step(1, 67, is(-2, '+'('-'(1, 3), 0)), builtin).
proof_step(1, 68, is(-4, '*'('*'(-2, 1), 2)), builtin).
proof_step(1, 69, '<'(-2, 0), builtin).
proof_step(1, 70, is(2, '+'(1, '*'(1, 1))), builtin).
proof_step(1, 71, is(-1, '+'('-'(1, 3), 1)), builtin).
proof_step(1, 72, is(-2, '*'('*'(-1, 1), 2)), builtin).
proof_step(1, 73, '<'(-1, 0), builtin).
proof_step(1, 74, is(3, '+'(1, '*'(2, 1))), builtin).
proof_step(1, 75, is(0, '+'('-'(1, 3), 2)), builtin).
proof_step(1, 76, '>='(0, 0), builtin).
proof_step(1, 77, '=<'(0, 3), builtin).
proof_step(1, 78, '=<'(abs(2), 2), builtin).
proof_step(1, 79, is(1, '+'('-'(3, 0), -2)), builtin).
proof_step(1, 80, is(7, '*'('*'(1, 1), 7)), builtin).
proof_step(1, 81, '<'(1, 2), builtin).
proof_step(1, 82, add_cost(7, infeasible, infeasible), rule(19, [])).
proof_step(1, 83, is(2, '+'(3, '*'(-1, 1))), builtin).
proof_step(1, 84, is(2, '+'('-'(3, 0), -1)), builtin).
proof_step(1, 85, is(14, '*'('*'(2, 1), 7)), builtin).
proof_step(1, 86, '>='(2, 2), builtin).
proof_step(1, 87, is(14, '+'(14, 0)), builtin).
proof_step(1, 88, is(3, '+'(3, '*'(0, 1))), builtin).
proof_step(1, 89, is(3, '+'('-'(3, 0), 0)), builtin).
proof_step(1, 90, is(21, '*'('*'(3, 1), 7)), builtin).
proof_step(1, 91, '>='(3, 2), builtin).
proof_step(1, 92, is(21, '+'(21, 0)), builtin).
proof_step(1, 93, is(4, '+'(3, '*'(1, 1))), builtin).
proof_step(1, 94, is(4, '+'('-'(3, 0), 1)), builtin).
proof_step(1, 95, is(28, '*'('*'(4, 1), 7)), builtin).
proof_step(1, 96, '>'(4, 3), builtin).
proof_step(1, 97, is(5, '+'(3, '*'(2, 1))), builtin).
proof_step(1, 98, is(5, '+'('-'(3, 0), 2)), builtin).
proof_step(1, 99, is(35, '*'('*'(5, 1), 7)), builtin).
proof_step(1, 100, '>'(5, 4), builtin).
proof_step(1, 101, '>'(5, 3), builtin).
proof_step(1, 102, minimum_actions([], 4, 3, infeasible), rule(15, [])).
proof_step(1, 103, minimum(infeasible, infeasible, infeasible), rule(21, [])).
proof_step(1, 104, minimum(value(21), infeasible, value(21)), rule(22, [])).
proof_step(1, 105, is(14, min(14, 21)), builtin).
proof_step(1, 106, minimum(infeasible, value(14), value(14)), rule(21, [])).
proof_step(1, 107, '=<'(4, 4), builtin).
proof_step(1, 108, '>='(4, 1), builtin).
proof_step(1, 109, is(14, '+'(0, 14)), builtin).
proof_step(1, 110, is(4, '+'(3, 1)), builtin).
proof_step(1, 111, minimum_actions([], 3, 1, infeasible), rule(15, [])).
proof_step(1, 112, minimum(value(14), infeasible, value(14)), rule(22, [])).
proof_step(1, 113, is(22, '+'(8, 14)), builtin).
proof_step(1, 114, is(30, '+'(16, 14)), builtin).
proof_step(1, 115, is(38, '+'(24, 14)), builtin).
proof_step(1, 116, is(3, '+'(2, 1)), builtin).
proof_step(1, 117, is(4, '+'('-'(4, 1), 1)), builtin).
proof_step(1, 118, is(32, '*'('*'(4, 1), 8)), builtin).
proof_step(1, 119, is(5, '+'('-'(4, 1), 2)), builtin).
proof_step(1, 120, is(40, '*'('*'(5, 1), 8)), builtin).
proof_step(1, 121, minimum_actions([], 2, 1, infeasible), rule(15, [])).
proof_step(1, 122, minimum(value(38), infeasible, value(38)), rule(22, [])).
proof_step(1, 123, minimum(infeasible, value(38), value(38)), rule(21, [])).
proof_step(1, 124, is(40, '+'(2, 38)), builtin).
proof_step(1, 125, is(2, '+'(1, 1)), builtin).
proof_step(1, 126, is(2, '+'(4, '*'(-2, 1))), builtin).
proof_step(1, 127, is(7, '+'(7, 0)), builtin).
proof_step(1, 128, is(3, '+'(4, '*'(-1, 1))), builtin).
proof_step(1, 129, is(4, '+'(4, '*'(0, 1))), builtin).
proof_step(1, 130, '>='(4, 2), builtin).
proof_step(1, 131, is(5, '+'(4, '*'(1, 1))), builtin).
proof_step(1, 132, is(6, '+'(4, '*'(2, 1))), builtin).
proof_step(1, 133, '>'(6, 4), builtin).
proof_step(1, 134, minimum_actions([], 4, 4, infeasible), rule(15, [])).
proof_step(1, 135, is(7, min(7, 14)), builtin).
proof_step(1, 136, is(7, '+'(0, 7)), builtin).
proof_step(1, 137, minimum_actions([], 3, 2, infeasible), rule(15, [])).
proof_step(1, 138, minimum(value(7), infeasible, value(7)), rule(22, [])).
proof_step(1, 139, minimum(infeasible, value(7), value(7)), rule(21, [])).
proof_step(1, 140, is(23, '+'(16, 7)), builtin).
proof_step(1, 141, is(31, '+'(24, 7)), builtin).
proof_step(1, 142, minimum_actions([], 2, 2, infeasible), rule(15, [])).
proof_step(1, 143, minimum(value(31), infeasible, value(31)), rule(22, [])).
proof_step(1, 144, is(30, min(30, 31)), builtin).
proof_step(1, 145, minimum(infeasible, value(30), value(30)), rule(21, [])).
proof_step(1, 146, is(34, '+'(4, 30)), builtin).
proof_step(1, 147, minimum_actions([], 3, 3, infeasible), rule(15, [])).
proof_step(1, 148, add_cost(24, infeasible, infeasible), rule(19, [])).
proof_step(1, 149, minimum_actions([], 2, 3, infeasible), rule(15, [])).
proof_step(1, 150, minimum(value(23), infeasible, value(23)), rule(22, [])).
proof_step(1, 151, is(22, min(22, 23)), builtin).
proof_step(1, 152, is(28, '+'(6, 22)), builtin).
proof_step(1, 153, minimum_actions([], 1, 2, infeasible), rule(15, [])).
proof_step(1, 154, minimum(value(28), infeasible, value(28)), rule(22, [])).
proof_step(1, 155, is(28, min(34, 28)), builtin).
proof_step(1, 156, is(28, min(40, 28)), builtin).
proof_step(1, 157, minimum(infeasible, value(28), value(28)), rule(21, [])).
proof_step(1, 158, '=:='(14, '+'(14, 0)), builtin).
proof_step(1, 159, '=:='(14, '+'(0, 14)), builtin).
proof_step(1, 160, '=:='(22, '+'(8, 14)), builtin).
proof_step(1, 161, '=:='(28, '+'(6, 22)), builtin).
proof_step(1, 162, terminal_slot(5), rule(3, [7, 13])).
proof_step(1, 163, member(-1, [-2, -1, 0, 1, 2]), rule(2, [15])).
proof_step(1, 164, member(1, [0, 1, 2]), rule(2, [16])).
proof_step(1, 165, member(2, [1, 2]), rule(2, [17])).
proof_step(1, 166, step_values(1, 2, -2, 0, 0, 0), rule(4, [9, 18, 19, 20])).
proof_step(1, 167, step_values(1, 2, -1, 1, 1, 2), rule(4, [9, 21, 22, 23])).
proof_step(1, 168, step_values(1, 2, 0, 2, 2, 4), rule(4, [9, 24, 25, 26])).
proof_step(1, 169, step_values(1, 2, 1, 3, 3, 6), rule(4, [9, 27, 28, 29])).
proof_step(1, 170, step_values(1, 2, 2, 4, 4, 8), rule(4, [9, 30, 31, 32])).
proof_step(1, 171, step_values(2, 1, -2, -1, 1, 8), rule(4, [10, 48, 49, 50])).
proof_step(1, 172, step_values(2, 2, -2, 0, 1, 8), rule(4, [10, 18, 49, 50])).
proof_step(1, 173, step_problem(-1, 1, -2, below_reserve), rule(5, [2, 51])).
proof_step(1, 174, step_values(2, 3, -2, 1, 1, 8), rule(4, [10, 52, 49, 50])).
proof_step(1, 175, step_problem(0, 1, -2, below_reserve), rule(5, [2, 53])).
proof_step(1, 176, step_problem(0, 2, -1, below_reserve), rule(5, [2, 53])).
proof_step(1, 177, step_problem(0, 0, -2, below_reserve), rule(5, [2, 53])).
proof_step(1, 178, step_values(2, 1, -1, 0, 2, 16), rule(4, [10, 55, 56, 57])).
proof_step(1, 179, step_values(2, 2, -1, 1, 2, 16), rule(4, [10, 21, 56, 57])).
proof_step(1, 180, step_values(3, 1, -2, -1, -4, -8), rule(4, [11, 48, 58, 59])).
proof_step(1, 181, step_values(3, 2, -2, 0, -4, -8), rule(4, [11, 18, 58, 59])).
proof_step(1, 182, step_values(3, 3, -2, 1, -4, -8), rule(4, [11, 52, 58, 59])).
proof_step(1, 183, step_problem(-1, -4, -2, would_export), rule(7, [60])).
proof_step(1, 184, step_problem(0, -4, -2, would_export), rule(7, [60])).
proof_step(1, 185, step_problem(1, -4, -2, would_export), rule(7, [60])).
proof_step(1, 186, step_values(2, 1, 0, 1, 3, 24), rule(4, [10, 61, 62, 63])).
proof_step(1, 187, step_values(2, 2, 0, 2, 3, 24), rule(4, [10, 24, 62, 63])).
proof_step(1, 188, step_values(3, 1, -1, 0, -3, -6), rule(4, [11, 55, 64, 65])).
proof_step(1, 189, step_values(3, 2, -1, 1, -3, -6), rule(4, [11, 21, 64, 65])).
proof_step(1, 190, step_problem(0, -3, -1, would_export), rule(7, [66])).
proof_step(1, 191, step_problem(1, -3, -1, would_export), rule(7, [66])).
proof_step(1, 192, step_problem(2, -3, -1, would_export), rule(7, [66])).
proof_step(1, 193, step_values(3, 1, 0, 1, -2, -4), rule(4, [11, 61, 67, 68])).
proof_step(1, 194, step_values(3, 2, 0, 2, -2, -4), rule(4, [11, 24, 67, 68])).
proof_step(1, 195, step_problem(1, -2, 0, would_export), rule(7, [69])).
proof_step(1, 196, step_problem(2, -2, 0, would_export), rule(7, [69])).
proof_step(1, 197, step_problem(3, -2, 0, would_export), rule(7, [69])).
proof_step(1, 198, step_values(3, 1, 1, 2, -1, -2), rule(4, [11, 70, 71, 72])).
proof_step(1, 199, step_values(3, 2, 1, 3, -1, -2), rule(4, [11, 27, 71, 72])).
proof_step(1, 200, step_problem(2, -1, 1, would_export), rule(7, [73])).
proof_step(1, 201, step_problem(3, -1, 1, would_export), rule(7, [73])).
proof_step(1, 202, step_problem(4, -1, 1, would_export), rule(7, [73])).
proof_step(1, 203, step_values(3, 1, 2, 3, 0, 0), rule(4, [11, 74, 75, 20])).
proof_step(1, 204, step_values(3, 2, 2, 4, 0, 0), rule(4, [11, 30, 75, 20])).
proof_step(1, 205, step_values(4, 3, -2, 1, 1, 7), rule(4, [12, 52, 79, 80])).
proof_step(1, 206, step_values(2, 3, -1, 2, 2, 16), rule(4, [10, 83, 56, 57])).
proof_step(1, 207, step_values(3, 3, -1, 2, -3, -6), rule(4, [11, 83, 64, 65])).
proof_step(1, 208, step_values(4, 3, -1, 2, 2, 14), rule(4, [12, 83, 84, 85])).
proof_step(1, 209, add_cost(14, value(0), value(14)), rule(20, [87])).
proof_step(1, 210, step_values(2, 3, 0, 3, 3, 24), rule(4, [10, 88, 62, 63])).
proof_step(1, 211, step_values(3, 3, 0, 3, -2, -4), rule(4, [11, 88, 67, 68])).
proof_step(1, 212, step_values(4, 3, 0, 3, 3, 21), rule(4, [12, 88, 89, 90])).
proof_step(1, 213, add_cost(21, value(0), value(21)), rule(20, [92])).
proof_step(1, 214, step_values(3, 3, 1, 4, -1, -2), rule(4, [11, 93, 71, 72])).
proof_step(1, 215, step_values(4, 3, 1, 4, 4, 28), rule(4, [12, 93, 94, 95])).
proof_step(1, 216, step_problem(4, 4, 1, grid_limit), rule(8, [4, 96])).
proof_step(1, 217, step_problem(2, 4, 1, grid_limit), rule(8, [4, 96])).
proof_step(1, 218, step_problem(3, 4, 1, grid_limit), rule(8, [4, 96])).
proof_step(1, 219, step_problem(4, 4, 2, grid_limit), rule(8, [4, 96])).
proof_step(1, 220, step_values(3, 3, 2, 5, 0, 0), rule(4, [11, 97, 75, 20])).
proof_step(1, 221, step_values(4, 3, 2, 5, 5, 35), rule(4, [12, 97, 98, 99])).
proof_step(1, 222, step_problem(5, 5, 2, above_capacity), rule(6, [1, 100])).
proof_step(1, 223, step_problem(5, 4, 1, above_capacity), rule(6, [1, 100])).
proof_step(1, 224, step_problem(5, 0, 2, above_capacity), rule(6, [1, 100])).
proof_step(1, 225, step_problem(3, 5, 2, grid_limit), rule(8, [4, 101])).
proof_step(1, 226, step_problem(4, 5, 2, grid_limit), rule(8, [4, 101])).
proof_step(1, 227, minimum(value(14), value(21), value(14)), rule(23, [105])).
proof_step(1, 228, add_cost(0, value(14), value(14)), rule(20, [109])).
proof_step(1, 229, add_cost(8, value(14), value(22)), rule(20, [113])).
proof_step(1, 230, add_cost(16, value(14), value(30)), rule(20, [114])).
proof_step(1, 231, add_cost(24, value(14), value(38)), rule(20, [115])).
proof_step(1, 232, step_values(2, 1, 1, 2, 4, 32), rule(4, [10, 70, 117, 118])).
proof_step(1, 233, step_values(2, 2, 1, 3, 4, 32), rule(4, [10, 27, 117, 118])).
proof_step(1, 234, step_values(2, 3, 1, 4, 4, 32), rule(4, [10, 93, 117, 118])).
proof_step(1, 235, step_values(2, 1, 2, 3, 5, 40), rule(4, [10, 74, 119, 120])).
proof_step(1, 236, step_values(2, 2, 2, 4, 5, 40), rule(4, [10, 30, 119, 120])).
proof_step(1, 237, step_values(2, 3, 2, 5, 5, 40), rule(4, [10, 97, 119, 120])).
proof_step(1, 238, add_cost(2, value(38), value(40)), rule(20, [124])).
proof_step(1, 239, step_values(4, 4, -2, 2, 1, 7), rule(4, [12, 126, 79, 80])).
proof_step(1, 240, add_cost(7, value(0), value(7)), rule(20, [127])).
proof_step(1, 241, step_values(4, 4, -1, 3, 2, 14), rule(4, [12, 128, 84, 85])).
proof_step(1, 242, step_values(4, 4, 0, 4, 3, 21), rule(4, [12, 129, 89, 90])).
proof_step(1, 243, step_values(4, 4, 1, 5, 4, 28), rule(4, [12, 131, 94, 95])).
proof_step(1, 244, step_values(4, 4, 2, 6, 5, 35), rule(4, [12, 132, 98, 99])).
proof_step(1, 245, step_problem(6, 5, 2, above_capacity), rule(6, [1, 133])).
proof_step(1, 246, minimum(value(7), value(14), value(7)), rule(23, [135])).
proof_step(1, 247, add_cost(0, value(7), value(7)), rule(20, [136])).
proof_step(1, 248, add_cost(16, value(7), value(23)), rule(20, [140])).
proof_step(1, 249, add_cost(24, value(7), value(31)), rule(20, [141])).
proof_step(1, 250, minimum(value(30), value(31), value(30)), rule(23, [144])).
proof_step(1, 251, add_cost(4, value(30), value(34)), rule(20, [146])).
proof_step(1, 252, minimum(value(22), value(23), value(22)), rule(23, [151])).
proof_step(1, 253, add_cost(6, value(22), value(28)), rule(20, [152])).
proof_step(1, 254, minimum(value(34), value(28), value(28)), rule(23, [155])).
proof_step(1, 255, minimum(value(40), value(28), value(28)), rule(23, [156])).
proof_step(1, 256, best_cost(5, 1, infeasible), rule(13, [162, 6, 81])).
proof_step(1, 257, best_cost(5, 2, value(0)), rule(12, [162, 6, 1, 86, 39])).
proof_step(1, 258, best_cost(5, 3, value(0)), rule(12, [162, 6, 1, 91, 44])).
proof_step(1, 259, best_cost(5, 4, value(0)), rule(12, [162, 6, 1, 130, 107])).
proof_step(1, 260, member(1, [-1, 0, 1, 2]), rule(2, [164])).
proof_step(1, 261, member(2, [0, 1, 2]), rule(2, [165])).
proof_step(
    1,
    262,
    transition(1, 2, -1, feasible(1, 1, 2)),
    rule(11, [167, 2, 1, 4, 3, 33, 34, 35, 36, 37])
).
proof_step(
    1,
    263,
    transition(1, 2, 0, feasible(2, 2, 4)),
    rule(11, [168, 2, 1, 4, 3, 38, 39, 40, 41, 42])
).
proof_step(
    1,
    264,
    transition(1, 2, 1, feasible(3, 3, 6)),
    rule(11, [169, 2, 1, 4, 3, 43, 44, 45, 46, 47])
).
proof_step(1, 265, transition(2, 1, -2, infeasible), rule(10, [171, 173])).
proof_step(
    1,
    266,
    transition(2, 3, -2, feasible(1, 1, 8)),
    rule(11, [174, 2, 1, 4, 3, 33, 34, 35, 36, 54])
).
proof_step(1, 267, transition(2, 2, -2, infeasible), rule(10, [172, 175])).
proof_step(1, 268, transition(1, 2, -2, infeasible), rule(10, [166, 177])).
proof_step(1, 269, transition(2, 1, -1, infeasible), rule(10, [178, 176])).
proof_step(
    1,
    270,
    transition(2, 2, -1, feasible(1, 2, 16)),
    rule(11, [179, 2, 1, 4, 3, 33, 34, 40, 41, 37])
).
proof_step(1, 271, transition(3, 1, -2, infeasible), rule(10, [180, 183])).
proof_step(1, 272, transition(3, 2, -2, infeasible), rule(10, [181, 184])).
proof_step(1, 273, transition(3, 3, -2, infeasible), rule(10, [182, 185])).
proof_step(
    1,
    274,
    transition(2, 1, 0, feasible(1, 3, 24)),
    rule(11, [186, 2, 1, 4, 3, 33, 34, 45, 46, 42])
).
proof_step(
    1,
    275,
    transition(2, 2, 0, feasible(2, 3, 24)),
    rule(11, [187, 2, 1, 4, 3, 38, 39, 45, 46, 42])
).
proof_step(1, 276, transition(3, 1, -1, infeasible), rule(10, [188, 190])).
proof_step(1, 277, transition(3, 2, -1, infeasible), rule(10, [189, 191])).
proof_step(1, 278, transition(3, 1, 0, infeasible), rule(10, [193, 195])).
proof_step(1, 279, transition(3, 2, 0, infeasible), rule(10, [194, 196])).
proof_step(1, 280, transition(3, 1, 1, infeasible), rule(10, [198, 200])).
proof_step(1, 281, transition(3, 2, 1, infeasible), rule(10, [199, 201])).
proof_step(
    1,
    282,
    transition(3, 1, 2, feasible(3, 0, 0)),
    rule(11, [203, 2, 1, 4, 3, 43, 44, 76, 77, 78])
).
proof_step(
    1,
    283,
    transition(3, 2, 2, feasible(4, 0, 0)),
    rule(11, [204, 2, 1, 4, 3, 108, 107, 76, 77, 78])
).
proof_step(
    1,
    284,
    transition(4, 3, -2, feasible(1, 1, 7)),
    rule(11, [205, 2, 1, 4, 3, 33, 34, 35, 36, 54])
).
proof_step(
    1,
    285,
    transition(2, 3, -1, feasible(2, 2, 16)),
    rule(11, [206, 2, 1, 4, 3, 38, 39, 40, 41, 37])
).
proof_step(1, 286, transition(3, 3, -1, infeasible), rule(10, [207, 192])).
proof_step(
    1,
    287,
    transition(4, 3, -1, feasible(2, 2, 14)),
    rule(11, [208, 2, 1, 4, 3, 38, 39, 40, 41, 37])
).
proof_step(
    1,
    288,
    transition(2, 3, 0, feasible(3, 3, 24)),
    rule(11, [210, 2, 1, 4, 3, 43, 44, 45, 46, 42])
).
proof_step(1, 289, transition(3, 3, 0, infeasible), rule(10, [211, 197])).
proof_step(
    1,
    290,
    transition(4, 3, 0, feasible(3, 3, 21)),
    rule(11, [212, 2, 1, 4, 3, 43, 44, 45, 46, 42])
).
proof_step(1, 291, transition(3, 3, 1, infeasible), rule(10, [214, 202])).
proof_step(1, 292, transition(4, 3, 1, infeasible), rule(10, [215, 216])).
proof_step(1, 293, transition(1, 2, 2, infeasible), rule(10, [170, 219])).
proof_step(1, 294, transition(4, 3, 2, infeasible), rule(10, [221, 222])).
proof_step(1, 295, transition(3, 3, 2, infeasible), rule(10, [220, 224])).
proof_step(1, 296, transition(2, 1, 1, infeasible), rule(10, [232, 217])).
proof_step(1, 297, transition(2, 2, 1, infeasible), rule(10, [233, 218])).
proof_step(1, 298, transition(2, 3, 1, infeasible), rule(10, [234, 216])).
proof_step(1, 299, transition(2, 1, 2, infeasible), rule(10, [235, 225])).
proof_step(1, 300, transition(2, 2, 2, infeasible), rule(10, [236, 226])).
proof_step(1, 301, transition(2, 3, 2, infeasible), rule(10, [237, 222])).
proof_step(
    1,
    302,
    transition(4, 4, -2, feasible(2, 1, 7)),
    rule(11, [239, 2, 1, 4, 3, 38, 39, 35, 36, 54])
).
proof_step(
    1,
    303,
    transition(4, 4, -1, feasible(3, 2, 14)),
    rule(11, [241, 2, 1, 4, 3, 43, 44, 40, 41, 37])
).
proof_step(
    1,
    304,
    transition(4, 4, 0, feasible(4, 3, 21)),
    rule(11, [242, 2, 1, 4, 3, 108, 107, 45, 46, 42])
).
proof_step(1, 305, transition(4, 4, 1, infeasible), rule(10, [243, 223])).
proof_step(1, 306, transition(4, 4, 2, infeasible), rule(10, [244, 245])).
proof_step(1, 307, optimal_from(5, 2, [], 0), rule(24, [162, 257])).
proof_step(1, 308, member(1, [-2, -1, 0, 1, 2]), rule(2, [260])).
proof_step(1, 309, member(2, [-1, 0, 1, 2]), rule(2, [261])).
proof_step(1, 310, candidate_cost(2, 1, -2, infeasible), rule(17, [265])).
proof_step(1, 311, candidate_cost(2, 2, -2, infeasible), rule(17, [267])).
proof_step(1, 312, candidate_cost(1, 2, -2, infeasible), rule(17, [268])).
proof_step(1, 313, candidate_cost(2, 1, -1, infeasible), rule(17, [269])).
proof_step(1, 314, candidate_cost(3, 1, -2, infeasible), rule(17, [271])).
proof_step(1, 315, candidate_cost(3, 2, -2, infeasible), rule(17, [272])).
proof_step(1, 316, candidate_cost(3, 3, -2, infeasible), rule(17, [273])).
proof_step(1, 317, candidate_cost(3, 1, -1, infeasible), rule(17, [276])).
proof_step(1, 318, candidate_cost(3, 2, -1, infeasible), rule(17, [277])).
proof_step(1, 319, candidate_cost(3, 1, 0, infeasible), rule(17, [278])).
proof_step(1, 320, candidate_cost(3, 2, 0, infeasible), rule(17, [279])).
proof_step(1, 321, candidate_cost(3, 1, 1, infeasible), rule(17, [280])).
proof_step(1, 322, candidate_cost(3, 2, 1, infeasible), rule(17, [281])).
proof_step(1, 323, candidate_cost(4, 3, -2, infeasible), rule(18, [284, 13, 256, 82])).
proof_step(1, 324, candidate_cost(3, 3, -1, infeasible), rule(17, [286])).
proof_step(1, 325, candidate_cost(4, 3, -1, value(14)), rule(18, [287, 13, 257, 209])).
proof_step(1, 326, candidate_cost(3, 3, 0, infeasible), rule(17, [289])).
proof_step(1, 327, candidate_cost(4, 3, 0, value(21)), rule(18, [290, 13, 258, 213])).
proof_step(1, 328, candidate_cost(3, 3, 1, infeasible), rule(17, [291])).
proof_step(1, 329, candidate_cost(4, 3, 1, infeasible), rule(17, [292])).
proof_step(1, 330, candidate_cost(1, 2, 2, infeasible), rule(17, [293])).
proof_step(1, 331, candidate_cost(4, 3, 2, infeasible), rule(17, [294])).
proof_step(1, 332, candidate_cost(3, 3, 2, infeasible), rule(17, [295])).
proof_step(1, 333, candidate_cost(2, 1, 1, infeasible), rule(17, [296])).
proof_step(1, 334, candidate_cost(2, 2, 1, infeasible), rule(17, [297])).
proof_step(1, 335, candidate_cost(2, 3, 1, infeasible), rule(17, [298])).
proof_step(1, 336, candidate_cost(2, 1, 2, infeasible), rule(17, [299])).
proof_step(1, 337, candidate_cost(2, 2, 2, infeasible), rule(17, [300])).
proof_step(1, 338, candidate_cost(2, 3, 2, infeasible), rule(17, [301])).
proof_step(1, 339, candidate_cost(4, 4, -2, value(7)), rule(18, [302, 13, 257, 240])).
proof_step(1, 340, candidate_cost(4, 4, -1, value(14)), rule(18, [303, 13, 258, 209])).
proof_step(1, 341, candidate_cost(4, 4, 0, value(21)), rule(18, [304, 13, 259, 213])).
proof_step(1, 342, candidate_cost(4, 4, 1, infeasible), rule(17, [305])).
proof_step(1, 343, candidate_cost(4, 4, 2, infeasible), rule(17, [306])).
proof_step(1, 344, member(2, [-2, -1, 0, 1, 2]), rule(2, [309])).
proof_step(1, 345, minimum_actions([2], 1, 2, infeasible), rule(16, [330, 153, 103])).
proof_step(1, 346, minimum_actions([2], 4, 3, infeasible), rule(16, [331, 102, 103])).
proof_step(1, 347, minimum_actions([2], 3, 3, infeasible), rule(16, [332, 147, 103])).
proof_step(1, 348, minimum_actions([2], 2, 1, infeasible), rule(16, [336, 121, 103])).
proof_step(1, 349, minimum_actions([2], 2, 2, infeasible), rule(16, [337, 142, 103])).
proof_step(1, 350, minimum_actions([2], 2, 3, infeasible), rule(16, [338, 149, 103])).
proof_step(1, 351, minimum_actions([2], 4, 4, infeasible), rule(16, [343, 134, 103])).
proof_step(1, 352, minimum_actions([1, 2], 4, 3, infeasible), rule(16, [329, 346, 103])).
proof_step(1, 353, minimum_actions([1, 2], 3, 3, infeasible), rule(16, [328, 347, 103])).
proof_step(1, 354, minimum_actions([1, 2], 2, 1, infeasible), rule(16, [333, 348, 103])).
proof_step(1, 355, minimum_actions([1, 2], 2, 2, infeasible), rule(16, [334, 349, 103])).
proof_step(1, 356, minimum_actions([1, 2], 2, 3, infeasible), rule(16, [335, 350, 103])).
proof_step(1, 357, minimum_actions([1, 2], 4, 4, infeasible), rule(16, [342, 351, 103])).
proof_step(
    1,
    358,
    minimum_actions([0, 1, 2], 4, 3, value(21)),
    rule(16, [327, 352, 104])
).
proof_step(
    1,
    359,
    minimum_actions([0, 1, 2], 3, 3, infeasible),
    rule(16, [326, 353, 103])
).
proof_step(
    1,
    360,
    minimum_actions([0, 1, 2], 4, 4, value(21)),
    rule(16, [341, 357, 104])
).
proof_step(
    1,
    361,
    minimum_actions([-1, 0, 1, 2], 4, 3, value(14)),
    rule(16, [325, 358, 227])
).
proof_step(
    1,
    362,
    minimum_actions([-1, 0, 1, 2], 3, 3, infeasible),
    rule(16, [324, 359, 103])
).
proof_step(
    1,
    363,
    minimum_actions([-1, 0, 1, 2], 4, 4, value(14)),
    rule(16, [340, 360, 227])
).
proof_step(
    1,
    364,
    minimum_actions([-2, -1, 0, 1, 2], 4, 3, value(14)),
    rule(16, [323, 361, 106])
).
proof_step(
    1,
    365,
    minimum_actions([-2, -1, 0, 1, 2], 3, 3, infeasible),
    rule(16, [316, 362, 103])
).
proof_step(
    1,
    366,
    minimum_actions([-2, -1, 0, 1, 2], 4, 4, value(7)),
    rule(16, [339, 363, 246])
).
proof_step(1, 367, best_cost(4, 3, value(14)), rule(14, [7, 107, 108, 8, 364])).
proof_step(1, 368, best_cost(3, 3, infeasible), rule(14, [7, 44, 43, 8, 365])).
proof_step(1, 369, best_cost(4, 4, value(7)), rule(14, [7, 107, 108, 8, 366])).
proof_step(1, 370, candidate_cost(3, 1, 2, value(14)), rule(18, [282, 110, 367, 228])).
proof_step(
    1,
    371,
    optimal_from(4, 3, [dispatch(4, -1, 2, 2)], 14),
    rule(25, [7, 107, 8, 163, 287, 13, 257, 367, 158, 307])
).
proof_step(1, 372, candidate_cost(2, 3, 0, infeasible), rule(18, [288, 116, 368, 148])).
proof_step(1, 373, candidate_cost(3, 2, 2, value(7)), rule(18, [283, 110, 369, 247])).
proof_step(1, 374, minimum_actions([2], 3, 1, value(14)), rule(16, [370, 111, 112])).
proof_step(
    1,
    375,
    minimum_actions([0, 1, 2], 2, 3, infeasible),
    rule(16, [372, 356, 103])
).
proof_step(1, 376, minimum_actions([2], 3, 2, value(7)), rule(16, [373, 137, 138])).
proof_step(1, 377, minimum_actions([1, 2], 3, 1, value(14)), rule(16, [321, 374, 106])).
proof_step(1, 378, minimum_actions([1, 2], 3, 2, value(7)), rule(16, [322, 376, 139])).
proof_step(
    1,
    379,
    minimum_actions([0, 1, 2], 3, 1, value(14)),
    rule(16, [319, 377, 106])
).
proof_step(
    1,
    380,
    minimum_actions([0, 1, 2], 3, 2, value(7)),
    rule(16, [320, 378, 139])
).
proof_step(
    1,
    381,
    minimum_actions([-1, 0, 1, 2], 3, 1, value(14)),
    rule(16, [317, 379, 106])
).
proof_step(
    1,
    382,
    minimum_actions([-1, 0, 1, 2], 3, 2, value(7)),
    rule(16, [318, 380, 139])
).
proof_step(
    1,
    383,
    minimum_actions([-2, -1, 0, 1, 2], 3, 1, value(14)),
    rule(16, [314, 381, 106])
).
proof_step(
    1,
    384,
    minimum_actions([-2, -1, 0, 1, 2], 3, 2, value(7)),
    rule(16, [315, 382, 139])
).
proof_step(1, 385, best_cost(3, 1, value(14)), rule(14, [7, 44, 43, 8, 383])).
proof_step(1, 386, best_cost(3, 2, value(7)), rule(14, [7, 44, 43, 8, 384])).
proof_step(1, 387, candidate_cost(2, 3, -2, value(22)), rule(18, [266, 116, 385, 229])).
proof_step(1, 388, candidate_cost(2, 2, -1, value(30)), rule(18, [270, 116, 385, 230])).
proof_step(1, 389, candidate_cost(2, 1, 0, value(38)), rule(18, [274, 116, 385, 231])).
proof_step(
    1,
    390,
    optimal_from(3, 1, [dispatch(3, 2, 0, 3), dispatch(4, -1, 2, 2)], 14),
    rule(25, [7, 44, 8, 344, 282, 110, 367, 385, 159, 371])
).
proof_step(1, 391, candidate_cost(2, 3, -1, value(23)), rule(18, [285, 116, 386, 248])).
proof_step(1, 392, candidate_cost(2, 2, 0, value(31)), rule(18, [275, 116, 386, 249])).
proof_step(
    1,
    393,
    minimum_actions([0, 1, 2], 2, 1, value(38)),
    rule(16, [389, 354, 122])
).
proof_step(
    1,
    394,
    minimum_actions([-1, 0, 1, 2], 2, 3, value(23)),
    rule(16, [391, 375, 150])
).
proof_step(
    1,
    395,
    minimum_actions([0, 1, 2], 2, 2, value(31)),
    rule(16, [392, 355, 143])
).
proof_step(
    1,
    396,
    minimum_actions([-1, 0, 1, 2], 2, 1, value(38)),
    rule(16, [313, 393, 123])
).
proof_step(
    1,
    397,
    minimum_actions([-2, -1, 0, 1, 2], 2, 3, value(22)),
    rule(16, [387, 394, 252])
).
proof_step(
    1,
    398,
    minimum_actions([-1, 0, 1, 2], 2, 2, value(30)),
    rule(16, [388, 395, 250])
).
proof_step(
    1,
    399,
    minimum_actions([-2, -1, 0, 1, 2], 2, 1, value(38)),
    rule(16, [310, 396, 123])
).
proof_step(1, 400, best_cost(2, 3, value(22)), rule(14, [7, 39, 38, 8, 397])).
proof_step(
    1,
    401,
    minimum_actions([-2, -1, 0, 1, 2], 2, 2, value(30)),
    rule(16, [311, 398, 145])
).
proof_step(1, 402, best_cost(2, 1, value(38)), rule(14, [7, 39, 38, 8, 399])).
proof_step(1, 403, candidate_cost(1, 2, 1, value(28)), rule(18, [264, 125, 400, 253])).
proof_step(
    1,
    404,
    optimal_from(
        2,
        3,
        [dispatch(2, -2, 1, 1), dispatch(3, 2, 0, 3), dispatch(4, -1, 2, 2)],
        22
    ),
    rule(25, [7, 39, 8, 14, 266, 116, 385, 400, 160, 390])
).
proof_step(1, 405, best_cost(2, 2, value(30)), rule(14, [7, 39, 38, 8, 401])).
proof_step(1, 406, candidate_cost(1, 2, -1, value(40)), rule(18, [262, 125, 402, 238])).
proof_step(1, 407, minimum_actions([1, 2], 1, 2, value(28)), rule(16, [403, 345, 154])).
proof_step(1, 408, candidate_cost(1, 2, 0, value(34)), rule(18, [263, 125, 405, 251])).
proof_step(
    1,
    409,
    minimum_actions([0, 1, 2], 1, 2, value(28)),
    rule(16, [408, 407, 254])
).
proof_step(
    1,
    410,
    minimum_actions([-1, 0, 1, 2], 1, 2, value(28)),
    rule(16, [406, 409, 255])
).
proof_step(
    1,
    411,
    minimum_actions([-2, -1, 0, 1, 2], 1, 2, value(28)),
    rule(16, [312, 410, 157])
).
proof_step(1, 412, best_cost(1, 2, value(28)), rule(14, [7, 34, 33, 8, 411])).
proof_step(
    1,
    413,
    optimal_from(
        1,
        2,
        [
            dispatch(1, 1, 3, 3),
            dispatch(2, -2, 1, 1),
            dispatch(3, 2, 0, 3),
            dispatch(4, -1, 2, 2)
        ],
        28
    ),
    rule(25, [7, 34, 8, 308, 264, 125, 400, 412, 161, 404])
).
proof_step(
    1,
    414,
    dispatch_plan(
        [
            dispatch(1, 1, 3, 3),
            dispatch(2, -2, 1, 1),
            dispatch(3, 2, 0, 3),
            dispatch(4, -1, 2, 2)
        ],
        28
    ),
    rule(26, [5, 413])
).
proof_claim(1, answer(1, [414])).

% Goal check 2
check_result(2, true).

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

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).
