% Answer 1
'is-older-than'('pat-h', 80).

% Answer 2
is_a(test, 'passed-check').

% Reason 2
proof_step(2, 1, birthday('pat-h', [1944, 8, 21]), source(1)).
proof_step(2, 2, date(today, [2026, 10, 12]), source(2)).
proof_step(2, 3, person(test, 'pat-h'), source(3)).
proof_step(2, 4, 'age-limit'(test, 80), source(4)).
proof_step(2, 5, is(82, '-'(2026, 1944)), builtin).
proof_step(2, 6, '>'(82, 80), builtin).
proof_step(2, 7, 'is-older-than'('pat-h', 80), rule(1, [1, 2, 5, 6])).
proof_step(2, 8, is_a(test, 'passed-check'), rule(4, [3, 4, 7])).
proof_claim(2, answer(2, [8])).

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
