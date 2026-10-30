% Answer 1
decay(demo, 2.0, 20.0, 60.0).

% Reason 1
proof_step(1, 1, sample(demo, 80.0, 8.0, 16.0), source(1)).
proof_step(1, 2, '>='(80.0, 0), builtin).
proof_step(1, 3, '>'(8.0, 0), builtin).
proof_step(1, 4, '>='(16.0, 0), builtin).
proof_step(1, 5, is(2.0, '/'(16.0, 8.0)), builtin).
proof_step(1, 6, is(20.0, '*'(80.0, '**'(0.5, 2.0))), builtin).
proof_step(1, 7, is(60.0, '-'(80.0, 20.0)), builtin).
proof_step(1, 8, decay(demo, 2.0, 20.0, 60.0), rule(1, [1, 2, 3, 4, 5, 6, 7])).
proof_claim(1, answer(1, [8])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).
