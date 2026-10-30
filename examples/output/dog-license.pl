% Answer 1
dog_count(alice, 5).
dog_count(bob, 2).
dog_count(carol, 4).
dog_count(dana, 0).

% Reason 1
proof_step(1, 1, owns(alice, dog1), source(1)).
proof_step(1, 2, owns(alice, dog2), source(2)).
proof_step(1, 3, owns(alice, dog3), source(3)).
proof_step(1, 4, owns(alice, dog4), source(4)).
proof_step(1, 5, owns(alice, dog5), source(5)).
proof_step(1, 6, owns(bob, dog6), source(6)).
proof_step(1, 7, owns(bob, dog7), source(7)).
proof_step(1, 8, owns(carol, dog8), source(8)).
proof_step(1, 9, owns(carol, dog9), source(9)).
proof_step(1, 10, owns(carol, dog10), source(10)).
proof_step(1, 11, owns(carol, dog11), source(11)).
proof_step(1, 12, owner(alice), source(12)).
proof_step(1, 13, owner(bob), source(13)).
proof_step(1, 14, owner(carol), source(14)).
proof_step(1, 15, owner(dana), source(15)).
proof_step(
    1,
    16,
    '$aggregate:r1:2'([binding('Owner', alice)], 5),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 17, dog_count(alice, 5), rule(1, [12, 16])).
proof_step(
    1,
    18,
    '$aggregate:r1:2'([binding('Owner', bob)], 2),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 19, dog_count(bob, 2), rule(1, [13, 18])).
proof_step(
    1,
    20,
    '$aggregate:r1:2'([binding('Owner', carol)], 4),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 21, dog_count(carol, 4), rule(1, [14, 20])).
proof_step(
    1,
    22,
    '$aggregate:r1:2'([binding('Owner', dana)], 0),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 23, dog_count(dana, 0), rule(1, [15, 22])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 15).
proof_claim(1, answer(1, [17])).
proof_claim(1, answer(1, [19])).
proof_claim(1, answer(1, [21])).
proof_claim(1, answer(1, [23])).

% Answer 2
requires(alice, dog_license).

% Reason 2
proof_step(2, 1, owns(alice, dog1), source(1)).
proof_step(2, 2, owns(alice, dog2), source(2)).
proof_step(2, 3, owns(alice, dog3), source(3)).
proof_step(2, 4, owns(alice, dog4), source(4)).
proof_step(2, 5, owns(alice, dog5), source(5)).
proof_step(2, 6, owns(bob, dog6), source(6)).
proof_step(2, 7, owns(bob, dog7), source(7)).
proof_step(2, 8, owns(carol, dog8), source(8)).
proof_step(2, 9, owns(carol, dog9), source(9)).
proof_step(2, 10, owns(carol, dog10), source(10)).
proof_step(2, 11, owns(carol, dog11), source(11)).
proof_step(2, 12, owner(alice), source(12)).
proof_step(2, 13, owner(bob), source(13)).
proof_step(2, 14, owner(carol), source(14)).
proof_step(2, 15, owner(dana), source(15)).
proof_step(
    2,
    16,
    '$aggregate:r1:2'([binding('Owner', alice)], 5),
    aggregate(rule(1), 2, 1)
).
proof_step(2, 17, dog_count(alice, 5), rule(1, [12, 16])).
proof_step(2, 18, '>'(5, 4), builtin).
proof_step(2, 19, requires(alice, dog_license), rule(2, [17, 18])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 15).
proof_claim(2, answer(2, [19])).

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
