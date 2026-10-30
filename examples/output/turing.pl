% Answer 1
input(case1, [1, 0, 1, 0, 0, 1]).

% Answer 2
input(case2, [1, 0, 1, 1, 1, 1]).

% Answer 3
input(case3, [1, 1, 1, 1, 1, 1]).

% Answer 4
input(case4, []).

% Answer 5
output(case1, [1, 0, 1, 0, 1, 0, blank]).

% Answer 6
output(case2, [1, 1, 0, 0, 0, 0, blank]).

% Answer 7
output(case3, [1, 0, 0, 0, 0, 0, 0, blank]).

% Answer 8
output(case4, [1, blank]).

% Reason 8
proof_step(8, 1, start('add-one', scan), source(1)).
proof_step(8, 2, transition(['add-one', scan, blank], [carry, blank, left]), source(4)).
proof_step(8, 3, transition(['add-one', carry, blank], [halt, 1, stay]), source(7)).
proof_step(8, 4, machine(case4, 'add-one'), source(14)).
proof_step(8, 5, input(case4, []), source(15)).
proof_step(8, 6, runs(case4, [scan, [], blank, []]), rule(2, [4, 1, 5])).
proof_step(8, 7, runs(case4, [carry, [], blank, [blank]]), rule(6, [6, 4, 2])).
proof_step(8, 8, runs(case4, [halt, [], 1, [blank]]), rule(7, [7, 4, 3])).
proof_step(8, 9, 'unfinished-output'(case4, [[], [1, blank]]), rule(8, [8])).
proof_step(8, 10, output(case4, [1, blank]), rule(10, [9])).
proof_claim(8, answer(8, [10])).

% Answer 9
is_a(case4, 'finished-case').
is_a(case1, 'finished-case').
is_a(case2, 'finished-case').
is_a(case3, 'finished-case').

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
