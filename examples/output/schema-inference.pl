% Answer 1
type(koko, cat).
type(koko, mammal).
type(koko, animal).
type(alice, person).
type(bob, person).

% Answer 2
type(koko, animal).

% Reason 2
proof_step(2, 1, subclass(cat, mammal), source(1)).
proof_step(2, 2, subclass(mammal, animal), source(2)).
proof_step(2, 3, type(koko, cat), source(7)).
proof_step(2, 4, type(koko, mammal), rule(3, [3, 1])).
proof_step(2, 5, type(koko, animal), rule(3, [4, 2])).
proof_claim(2, answer(2, [5])).

% Answer 3
triple(alice, parent_of, bob).
triple(alice, related_to, bob).
triple(alice, connected_to, bob).

% Answer 4
triple(alice, connected_to, bob).

% Reason 4
proof_step(4, 1, subproperty(parent_of, related_to), source(3)).
proof_step(4, 2, subproperty(related_to, connected_to), source(4)).
proof_step(4, 3, triple(alice, parent_of, bob), source(8)).
proof_step(4, 4, triple(alice, related_to, bob), rule(4, [3, 1])).
proof_step(4, 5, triple(alice, connected_to, bob), rule(4, [4, 2])).
proof_claim(4, answer(4, [5])).

% Answer 5
type(alice, person).

% Reason 5
proof_step(5, 1, domain(parent_of, person), source(5)).
proof_step(5, 2, triple(alice, parent_of, bob), source(8)).
proof_step(5, 3, type(alice, person), rule(5, [2, 1])).
proof_claim(5, answer(5, [3])).

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

% Goal check 15
check_result(15, true).
