% Answer 1
status(low_input, under).
status(balanced_loam, balanced).
status(high_input, over).
status(sandy_high_input, over).

% Reason 1
proof_step(1, 1, field(low_input, 40.0, 60.0, 0.15, 130.0), source(1)).
proof_step(1, 2, field(balanced_loam, 50.0, 90.0, 0.15, 130.0), source(2)).
proof_step(1, 3, field(high_input, 60.0, 180.0, 0.25, 160.0), source(3)).
proof_step(1, 4, field(sandy_high_input, 40.0, 240.0, 0.4, 150.0), source(4)).
proof_step(1, 5, '>='(40.0, 0), builtin).
proof_step(1, 6, '>='(60.0, 0), builtin).
proof_step(1, 7, '>='(0.15, 0), builtin).
proof_step(1, 8, '=<'(0.15, 1), builtin).
proof_step(1, 9, '>='(130.0, 0), builtin).
proof_step(1, 10, is(100.0, '+'(40.0, 60.0)), builtin).
proof_step(1, 11, is(15.0, '*'(100.0, 0.15)), builtin).
proof_step(1, 12, is(85.0, '-'(100.0, 15.0)), builtin).
proof_step(1, 13, is(45.0, max(0.0, '-'(130.0, 85.0))), builtin).
proof_step(1, 14, is(0.0, max(0.0, '-'(85.0, 130.0))), builtin).
proof_step(1, 15, is(0.0, '*'(0.0, 0.15)), builtin).
proof_step(
    1,
    16,
    balance(low_input, 100.0, 15.0, 85.0, 45.0, 0.0, 0.0),
    rule(1, [1, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
).
proof_step(1, 17, '<'(85.0, '*'(0.9, 130.0)), builtin).
proof_step(1, 18, status(low_input, under), rule(2, [16, 1, 17])).
proof_step(1, 19, '>='(50.0, 0), builtin).
proof_step(1, 20, '>='(90.0, 0), builtin).
proof_step(1, 21, is(140.0, '+'(50.0, 90.0)), builtin).
proof_step(1, 22, is(21.0, '*'(140.0, 0.15)), builtin).
proof_step(1, 23, is(119.0, '-'(140.0, 21.0)), builtin).
proof_step(1, 24, is(11.0, max(0.0, '-'(130.0, 119.0))), builtin).
proof_step(1, 25, is(0.0, max(0.0, '-'(119.0, 130.0))), builtin).
proof_step(
    1,
    26,
    balance(balanced_loam, 140.0, 21.0, 119.0, 11.0, 0.0, 0.0),
    rule(1, [2, 19, 20, 7, 8, 9, 21, 22, 23, 24, 25, 15])
).
proof_step(1, 27, '>='(119.0, '*'(0.9, 130.0)), builtin).
proof_step(1, 28, '=<'(119.0, '*'(1.1, 130.0)), builtin).
proof_step(1, 29, status(balanced_loam, balanced), rule(3, [26, 2, 27, 28])).
proof_step(1, 30, '>='(180.0, 0), builtin).
proof_step(1, 31, '>='(0.25, 0), builtin).
proof_step(1, 32, '=<'(0.25, 1), builtin).
proof_step(1, 33, '>='(160.0, 0), builtin).
proof_step(1, 34, is(240.0, '+'(60.0, 180.0)), builtin).
proof_step(1, 35, is(60.0, '*'(240.0, 0.25)), builtin).
proof_step(1, 36, is(180.0, '-'(240.0, 60.0)), builtin).
proof_step(1, 37, is(0.0, max(0.0, '-'(160.0, 180.0))), builtin).
proof_step(1, 38, is(20.0, max(0.0, '-'(180.0, 160.0))), builtin).
proof_step(1, 39, is(5.0, '*'(20.0, 0.25)), builtin).
proof_step(
    1,
    40,
    balance(high_input, 240.0, 60.0, 180.0, 0.0, 20.0, 5.0),
    rule(1, [3, 6, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39])
).
proof_step(1, 41, '>'(180.0, '*'(1.1, 160.0)), builtin).
proof_step(1, 42, status(high_input, over), rule(4, [40, 3, 41])).
proof_step(1, 43, '>='(240.0, 0), builtin).
proof_step(1, 44, '>='(0.4, 0), builtin).
proof_step(1, 45, '=<'(0.4, 1), builtin).
proof_step(1, 46, '>='(150.0, 0), builtin).
proof_step(1, 47, is(280.0, '+'(40.0, 240.0)), builtin).
proof_step(1, 48, is(112.0, '*'(280.0, 0.4)), builtin).
proof_step(1, 49, is(168.0, '-'(280.0, 112.0)), builtin).
proof_step(1, 50, is(0.0, max(0.0, '-'(150.0, 168.0))), builtin).
proof_step(1, 51, is(18.0, max(0.0, '-'(168.0, 150.0))), builtin).
proof_step(1, 52, is(7.2, '*'(18.0, 0.4)), builtin).
proof_step(
    1,
    53,
    balance(sandy_high_input, 280.0, 112.0, 168.0, 0.0, 18.0, 7.2),
    rule(1, [4, 5, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52])
).
proof_step(1, 54, '>'(168.0, '*'(1.1, 150.0)), builtin).
proof_step(1, 55, status(sandy_high_input, over), rule(4, [53, 4, 54])).
proof_claim(1, answer(1, [18])).
proof_claim(1, answer(1, [29])).
proof_claim(1, answer(1, [42])).
proof_claim(1, answer(1, [55])).

% Answer 2
balance(low_input, 100.0, 15.0, 85.0, 45.0, 0.0, 0.0).
balance(balanced_loam, 140.0, 21.0, 119.0, 11.0, 0.0, 0.0).
balance(high_input, 240.0, 60.0, 180.0, 0.0, 20.0, 5.0).
balance(sandy_high_input, 280.0, 112.0, 168.0, 0.0, 18.0, 7.2).

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
