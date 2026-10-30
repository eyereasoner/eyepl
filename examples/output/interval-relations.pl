% Answer 1
relation(a, equals, a).
relation(a, before, b).
relation(a, meets, c).
relation(a, overlaps, d).
relation(a, equals, e).
relation(a, during, h).
relation(e, equals, a).
relation(f, starts, a).
relation(g, finishes, a).
relation(b, equals, b).
relation(b, during, h).
relation(c, overlaps, b).
relation(d, meets, b).
relation(e, before, b).
relation(f, before, b).
relation(g, before, b).
relation(c, equals, c).
relation(c, during, h).
relation(d, overlaps, c).
relation(e, meets, c).
relation(f, before, c).
relation(g, meets, c).
relation(d, equals, d).
relation(d, during, h).
relation(e, overlaps, d).
relation(f, meets, d).
relation(g, starts, d).
relation(e, equals, e).
relation(e, during, h).
relation(f, starts, e).
relation(g, finishes, e).
relation(f, equals, f).
relation(f, meets, g).
relation(f, during, h).
relation(g, equals, g).
relation(g, during, h).
relation(h, equals, h).
relation(b, after, a).
relation(c, met_by, a).
relation(d, overlapped_by, a).
relation(h, contains, a).
relation(a, started_by, f).
relation(a, finished_by, g).
relation(h, contains, b).
relation(b, overlapped_by, c).
relation(b, met_by, d).
relation(b, after, e).
relation(b, after, f).
relation(b, after, g).
relation(h, contains, c).
relation(c, overlapped_by, d).
relation(c, met_by, e).
relation(c, after, f).
relation(c, met_by, g).
relation(h, contains, d).
relation(d, overlapped_by, e).
relation(d, met_by, f).
relation(d, started_by, g).
relation(h, contains, e).
relation(e, started_by, f).
relation(e, finished_by, g).
relation(g, met_by, f).
relation(h, contains, f).
relation(h, contains, g).
relation(i, equals, i).
relation(a, before, i).
relation(b, before, i).
relation(c, before, i).
relation(d, before, i).
relation(e, before, i).
relation(f, before, i).
relation(g, before, i).
relation(h, meets, i).
relation(j, meets, i).
relation(j, finishes, h).
relation(j, equals, j).
relation(a, before, j).
relation(b, meets, j).
relation(c, before, j).
relation(d, before, j).
relation(e, before, j).
relation(f, before, j).
relation(g, before, j).
relation(i, after, a).
relation(i, after, b).
relation(i, after, c).
relation(i, after, d).
relation(i, after, e).
relation(i, after, f).
relation(i, after, g).
relation(i, met_by, h).
relation(i, met_by, j).
relation(h, finished_by, j).
relation(j, after, a).
relation(j, met_by, b).
relation(j, after, c).
relation(j, after, d).
relation(j, after, e).
relation(j, after, f).
relation(j, after, g).

% Answer 2
relation(a, overlaps, d).

% Reason 2
proof_step(2, 1, interval(a, 600, 720), source(1)).
proof_step(2, 2, interval(d, 660, 780), source(4)).
proof_step(2, 3, '<'(600, 720), builtin).
proof_step(2, 4, valid_interval(a, 600, 720), rule(3, [1, 3])).
proof_step(2, 5, '<'(660, 780), builtin).
proof_step(2, 6, valid_interval(d, 660, 780), rule(3, [2, 5])).
proof_step(2, 7, '<'(600, 660), builtin).
proof_step(2, 8, '<'(660, 720), builtin).
proof_step(2, 9, pair(a, d, 600, 720, 660, 780), rule(4, [4, 6])).
proof_step(2, 10, '<'(720, 780), builtin).
proof_step(2, 11, relation(a, overlaps, d), rule(7, [9, 7, 8, 10])).
proof_claim(2, answer(2, [11])).

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

% Goal check 12
check_result(12, true).

% Goal check 13
check_result(13, true).

% Goal check 14
check_result(14, true).

% Goal check 15
check_result(15, true).

% Goal check 16
check_result(16, true).

% Goal check 17
check_result(17, true).

% Goal check 18
check_result(18, true).

% Goal check 19
check_result(19, true).
