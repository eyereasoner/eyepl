% Answer 1
dotProduct(pair1, 12.0).

% Answer 2
normA(pair1, 3.7416573867739413).

% Answer 3
normB(pair1, 8.774964387392123).

% Answer 4
cosineSimilarity(pair1, 0.3654869423239036).

% Reason 4
proof_step(4, 1, vector(pair1, a, [1.0, 2.0, 3.0]), source(1)).
proof_step(4, 2, vector(pair1, b, [4.0, -5.0, 6.0]), source(2)).
proof_step(4, 3, dot([], [], 0.0), source(3)).
proof_step(4, 4, sum_squares([], 0.0), source(4)).
proof_step(4, 5, is(18.0, '*'(3.0, 6.0)), builtin).
proof_step(4, 6, is(18.0, '+'(18.0, 0.0)), builtin).
proof_step(4, 7, is(9.0, '**'(3.0, 2)), builtin).
proof_step(4, 8, is(9.0, '+'(9.0, 0.0)), builtin).
proof_step(4, 9, is(36.0, '**'(6.0, 2)), builtin).
proof_step(4, 10, is(36.0, '+'(36.0, 0.0)), builtin).
proof_step(4, 11, is(-10.0, '*'(2.0, -5.0)), builtin).
proof_step(4, 12, is(8.0, '+'(-10.0, 18.0)), builtin).
proof_step(4, 13, is(4.0, '**'(2.0, 2)), builtin).
proof_step(4, 14, is(13.0, '+'(4.0, 9.0)), builtin).
proof_step(4, 15, is(25.0, '**'(-5.0, 2)), builtin).
proof_step(4, 16, is(61.0, '+'(25.0, 36.0)), builtin).
proof_step(4, 17, is(4.0, '*'(1.0, 4.0)), builtin).
proof_step(4, 18, is(12.0, '+'(4.0, 8.0)), builtin).
proof_step(4, 19, is(1.0, '**'(1.0, 2)), builtin).
proof_step(4, 20, is(14.0, '+'(1.0, 13.0)), builtin).
proof_step(4, 21, is(16.0, '**'(4.0, 2)), builtin).
proof_step(4, 22, is(77.0, '+'(16.0, 61.0)), builtin).
proof_step(4, 23, is(3.7416573867739413, '**'(14.0, 0.5)), builtin).
proof_step(4, 24, is(8.774964387392123, '**'(77.0, 0.5)), builtin).
proof_step(
    4,
    25,
    is(32.83291031876401, '*'(3.7416573867739413, 8.774964387392123)),
    builtin
).
proof_step(4, 26, is(0.3654869423239036, '/'(12.0, 32.83291031876401)), builtin).
proof_step(4, 27, dot([3.0], [6.0], 18.0), rule(1, [5, 3, 6])).
proof_step(4, 28, sum_squares([3.0], 9.0), rule(2, [7, 4, 8])).
proof_step(4, 29, sum_squares([6.0], 36.0), rule(2, [9, 4, 10])).
proof_step(4, 30, dot([2.0, 3.0], [-5.0, 6.0], 8.0), rule(1, [11, 27, 12])).
proof_step(4, 31, sum_squares([2.0, 3.0], 13.0), rule(2, [13, 28, 14])).
proof_step(4, 32, sum_squares([-5.0, 6.0], 61.0), rule(2, [15, 29, 16])).
proof_step(4, 33, dot([1.0, 2.0, 3.0], [4.0, -5.0, 6.0], 12.0), rule(1, [17, 30, 18])).
proof_step(4, 34, sum_squares([1.0, 2.0, 3.0], 14.0), rule(2, [19, 31, 20])).
proof_step(4, 35, sum_squares([4.0, -5.0, 6.0], 77.0), rule(2, [21, 32, 22])).
proof_step(4, 36, norm([1.0, 2.0, 3.0], 3.7416573867739413), rule(3, [34, 23])).
proof_step(4, 37, norm([4.0, -5.0, 6.0], 8.774964387392123), rule(3, [35, 24])).
proof_step(
    4,
    38,
    cosine_similarity(pair1, 0.3654869423239036),
    rule(4, [1, 2, 33, 36, 37, 25, 26])
).
proof_step(4, 39, cosineSimilarity(pair1, 0.3654869423239036), rule(8, [38])).
proof_claim(4, answer(4, [39])).

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
