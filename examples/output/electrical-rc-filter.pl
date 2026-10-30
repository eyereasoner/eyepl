% Answer 1
cutoff_hz(filter1, 15.91549431).

% Reason 1
proof_step(1, 1, components(filter1, 10000.0, 1e-6), source(1)).
proof_step(1, 2, '>'(10000.0, 0), builtin).
proof_step(1, 3, '>'(1e-6, 0), builtin).
proof_step(1, 4, is(0.01, '*'(10000.0, 1e-6)), builtin).
proof_step(1, 5, is(15.915494309189533, '/'(1, '*'('*'(2, pi), 0.01))), builtin).
proof_step(1, 6, response(filter1, 0.01, 15.915494309189533), rule(1, [1, 2, 3, 4, 5])).
proof_step(
    1,
    7,
    is(15.91549431, '/'(round('*'(15.915494309189533, 100000000)), 100000000)),
    builtin
).
proof_step(1, 8, cutoff_hz(filter1, 15.91549431), rule(2, [6, 7])).
proof_claim(1, answer(1, [8])).

% Answer 2
answer(2, [
    binding("Filter", filter1),
    binding("Tau", 0.01)
]).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
