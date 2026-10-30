% Answer 1
padovan(1, 1).

% Answer 2
padovan(2, 1).

% Answer 3
padovan(3, 1).

% Answer 4
padovan(4, 2).

% Answer 5
padovan(5, 2).

% Reason 5
proof_step(5, 1, '>'(3, 2), builtin).
proof_step(5, 2, is(2, '-'(3, 1)), builtin).
proof_step(5, 3, is(1, '+'(0, 1)), builtin).
proof_step(5, 4, is(2, '+'(1, 1)), builtin).
proof_step(5, 5, '>'(4, 2), builtin).
proof_step(5, 6, is(3, '-'(4, 1)), builtin).
proof_step(5, 7, padovan(2, 1, 2, 2, 2), rule(4, [])).
proof_step(5, 8, '>'(5, 2), builtin).
proof_step(5, 9, is(4, '-'(5, 1)), builtin).
proof_step(5, 10, padovan(3, 1, 1, 2, 2), rule(5, [1, 2, 4, 7])).
proof_step(5, 11, padovan(4, 1, 1, 1, 2), rule(5, [5, 6, 4, 10])).
proof_step(5, 12, padovan(5, 0, 1, 1, 2), rule(5, [8, 9, 3, 11])).
proof_step(5, 13, padovan(5, 2), rule(1, [12])).
proof_claim(5, answer(5, [13])).

% Answer 6
padovan(91, 70748973084).

% Answer 7
padovan(283, 19834325738278984504790864536272129).

% Answer 8
padovan(
    3674,
    26178594930998300129122144750852069608549403205774929555079079707081575465552356148508452550483580612948221886219497991654772054359076809450166551553886580037212540081075958680409828886869538010195558848488217299128261230125392693494793565831379519817637833179199806547822062027975157112247040373170650000852653450124493609094492793737517355809497791251385318177510845806782564433990788816833563231575956567960805822051433568191271295650424612344171
).

% Answer 9
plastic_ratio(1, 1.0).

% Answer 10
plastic_ratio(10, 1.3333333333333333).

% Answer 11
plastic_ratio(100, 1.324717957244746).

% Answer 12
plastic_ratio(1000, 1.3247179572447458).

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
