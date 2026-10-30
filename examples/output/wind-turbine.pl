% Answer 1
needs_maintenance(t456, time_based_maintenance).
needs_maintenance(t456, age_based_maintenance).
needs_maintenance(t456, problem_based_maintenance).
needs_maintenance(t456, performance_based_maintenance).
needs_maintenance(t789, problem_based_maintenance).
needs_maintenance(t101, performance_based_maintenance).

% Reason 1
proof_step(1, 1, turbine(t456, 12, 15, [vibration], 78), source(2)).
proof_step(1, 2, turbine(t789, 8, 7, [noise], 85), source(3)).
proof_step(1, 3, turbine(t101, 15, 5, [], 65), source(4)).
proof_step(1, 4, '>='(15, 12), builtin).
proof_step(1, 5, needs_maintenance(t456, time_based_maintenance), rule(1, [1, 4])).
proof_step(1, 6, '>'(12, 10), builtin).
proof_step(1, 7, '>='(15, 6), builtin).
proof_step(1, 8, needs_maintenance(t456, age_based_maintenance), rule(2, [1, 6, 7])).
proof_step(1, 9, needs_maintenance(t456, problem_based_maintenance), rule(3, [1])).
proof_step(1, 10, '<'(78, 80), builtin).
proof_step(
    1,
    11,
    needs_maintenance(t456, performance_based_maintenance),
    rule(4, [1, 10])
).
proof_step(1, 12, needs_maintenance(t789, problem_based_maintenance), rule(3, [2])).
proof_step(1, 13, '<'(65, 80), builtin).
proof_step(
    1,
    14,
    needs_maintenance(t101, performance_based_maintenance),
    rule(4, [3, 13])
).
proof_claim(1, answer(1, [5])).
proof_claim(1, answer(1, [8])).
proof_claim(1, answer(1, [9])).
proof_claim(1, answer(1, [11])).
proof_claim(1, answer(1, [12])).
proof_claim(1, answer(1, [14])).

% Answer 2
no_answer(2).

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

% Goal check 11
check_result(11, true).
