% Answer 1
in_range(1, 20, 1).
trajectory(1, [1]).
in_range(1, 20, 2).
trajectory(2, [2, 1]).
in_range(1, 20, 3).
trajectory(3, [3, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 4).
trajectory(4, [4, 2, 1]).
in_range(1, 20, 5).
trajectory(5, [5, 16, 8, 4, 2, 1]).
in_range(1, 20, 6).
trajectory(6, [6, 3, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 7).
trajectory(7, [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 8).
trajectory(8, [8, 4, 2, 1]).
in_range(1, 20, 9).
trajectory(9, [9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 10).
trajectory(10, [10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 11).
trajectory(11, [11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 12).
trajectory(12, [12, 6, 3, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 13).
trajectory(13, [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 14).
trajectory(14, [14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 15).
trajectory(15, [15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 16).
trajectory(16, [16, 8, 4, 2, 1]).
in_range(1, 20, 17).
trajectory(17, [17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]).
in_range(1, 20, 18).
trajectory(
    18,
    [18, 9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
).
in_range(1, 20, 19).
trajectory(
    19,
    [19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
).
in_range(1, 20, 20).
trajectory(20, [20, 10, 5, 16, 8, 4, 2, 1]).

% Reason 1
proof_step(1, 1, trajectory(1, [1]), source(1)).
proof_step(1, 2, '=<'(1, 20), builtin).
proof_step(1, 3, '=<'(2, 20), builtin).
proof_step(1, 4, '<'(1, 20), builtin).
proof_step(1, 5, is(2, '+'(1, 1)), builtin).
proof_step(1, 6, '=<'(3, 20), builtin).
proof_step(1, 7, '<'(2, 20), builtin).
proof_step(1, 8, is(3, '+'(2, 1)), builtin).
proof_step(1, 9, '=<'(4, 20), builtin).
proof_step(1, 10, '<'(3, 20), builtin).
proof_step(1, 11, is(4, '+'(3, 1)), builtin).
proof_step(1, 12, '=<'(5, 20), builtin).
proof_step(1, 13, '<'(4, 20), builtin).
proof_step(1, 14, is(5, '+'(4, 1)), builtin).
proof_step(1, 15, '=<'(6, 20), builtin).
proof_step(1, 16, '<'(5, 20), builtin).
proof_step(1, 17, is(6, '+'(5, 1)), builtin).
proof_step(1, 18, '=<'(7, 20), builtin).
proof_step(1, 19, '<'(6, 20), builtin).
proof_step(1, 20, is(7, '+'(6, 1)), builtin).
proof_step(1, 21, '=<'(8, 20), builtin).
proof_step(1, 22, '<'(7, 20), builtin).
proof_step(1, 23, is(8, '+'(7, 1)), builtin).
proof_step(1, 24, '=<'(9, 20), builtin).
proof_step(1, 25, '<'(8, 20), builtin).
proof_step(1, 26, is(9, '+'(8, 1)), builtin).
proof_step(1, 27, '=<'(10, 20), builtin).
proof_step(1, 28, '<'(9, 20), builtin).
proof_step(1, 29, is(10, '+'(9, 1)), builtin).
proof_step(1, 30, '=<'(11, 20), builtin).
proof_step(1, 31, '<'(10, 20), builtin).
proof_step(1, 32, is(11, '+'(10, 1)), builtin).
proof_step(1, 33, '=<'(12, 20), builtin).
proof_step(1, 34, '<'(11, 20), builtin).
proof_step(1, 35, is(12, '+'(11, 1)), builtin).
proof_step(1, 36, '=<'(13, 20), builtin).
proof_step(1, 37, '<'(12, 20), builtin).
proof_step(1, 38, is(13, '+'(12, 1)), builtin).
proof_step(1, 39, '=<'(14, 20), builtin).
proof_step(1, 40, '<'(13, 20), builtin).
proof_step(1, 41, is(14, '+'(13, 1)), builtin).
proof_step(1, 42, '=<'(15, 20), builtin).
proof_step(1, 43, '<'(14, 20), builtin).
proof_step(1, 44, is(15, '+'(14, 1)), builtin).
proof_step(1, 45, '=<'(16, 20), builtin).
proof_step(1, 46, '<'(15, 20), builtin).
proof_step(1, 47, is(16, '+'(15, 1)), builtin).
proof_step(1, 48, '=<'(17, 20), builtin).
proof_step(1, 49, '<'(16, 20), builtin).
proof_step(1, 50, is(17, '+'(16, 1)), builtin).
proof_step(1, 51, '=<'(18, 20), builtin).
proof_step(1, 52, '<'(17, 20), builtin).
proof_step(1, 53, is(18, '+'(17, 1)), builtin).
proof_step(1, 54, '=<'(19, 20), builtin).
proof_step(1, 55, '<'(18, 20), builtin).
proof_step(1, 56, is(19, '+'(18, 1)), builtin).
proof_step(1, 57, '=<'(20, 20), builtin).
proof_step(1, 58, '<'(19, 20), builtin).
proof_step(1, 59, is(20, '+'(19, 1)), builtin).
proof_step(1, 60, '>'(2, 1), builtin).
proof_step(1, 61, '=:='(0, mod(2, 2)), builtin).
proof_step(1, 62, is(1, '//'(2, 2)), builtin).
proof_step(1, 63, '>'(4, 1), builtin).
proof_step(1, 64, '=:='(0, mod(4, 2)), builtin).
proof_step(1, 65, is(2, '//'(4, 2)), builtin).
proof_step(1, 66, '>'(8, 1), builtin).
proof_step(1, 67, '=:='(0, mod(8, 2)), builtin).
proof_step(1, 68, is(4, '//'(8, 2)), builtin).
proof_step(1, 69, '>'(16, 1), builtin).
proof_step(1, 70, '=:='(0, mod(16, 2)), builtin).
proof_step(1, 71, is(8, '//'(16, 2)), builtin).
proof_step(1, 72, '>'(5, 1), builtin).
proof_step(1, 73, '=:='(1, mod(5, 2)), builtin).
proof_step(1, 74, is(16, '+'('*'(3, 5), 1)), builtin).
proof_step(1, 75, '>'(10, 1), builtin).
proof_step(1, 76, '=:='(0, mod(10, 2)), builtin).
proof_step(1, 77, is(5, '//'(10, 2)), builtin).
proof_step(1, 78, '>'(3, 1), builtin).
proof_step(1, 79, '=:='(1, mod(3, 2)), builtin).
proof_step(1, 80, is(10, '+'('*'(3, 3), 1)), builtin).
proof_step(1, 81, '>'(6, 1), builtin).
proof_step(1, 82, '=:='(0, mod(6, 2)), builtin).
proof_step(1, 83, is(3, '//'(6, 2)), builtin).
proof_step(1, 84, '>'(20, 1), builtin).
proof_step(1, 85, '=:='(0, mod(20, 2)), builtin).
proof_step(1, 86, is(10, '//'(20, 2)), builtin).
proof_step(1, 87, '>'(40, 1), builtin).
proof_step(1, 88, '=:='(0, mod(40, 2)), builtin).
proof_step(1, 89, is(20, '//'(40, 2)), builtin).
proof_step(1, 90, '>'(13, 1), builtin).
proof_step(1, 91, '=:='(1, mod(13, 2)), builtin).
proof_step(1, 92, is(40, '+'('*'(3, 13), 1)), builtin).
proof_step(1, 93, '>'(26, 1), builtin).
proof_step(1, 94, '=:='(0, mod(26, 2)), builtin).
proof_step(1, 95, is(13, '//'(26, 2)), builtin).
proof_step(1, 96, '>'(52, 1), builtin).
proof_step(1, 97, '=:='(0, mod(52, 2)), builtin).
proof_step(1, 98, is(26, '//'(52, 2)), builtin).
proof_step(1, 99, '>'(17, 1), builtin).
proof_step(1, 100, '=:='(1, mod(17, 2)), builtin).
proof_step(1, 101, is(52, '+'('*'(3, 17), 1)), builtin).
proof_step(1, 102, '>'(34, 1), builtin).
proof_step(1, 103, '=:='(0, mod(34, 2)), builtin).
proof_step(1, 104, is(17, '//'(34, 2)), builtin).
proof_step(1, 105, '>'(11, 1), builtin).
proof_step(1, 106, '=:='(1, mod(11, 2)), builtin).
proof_step(1, 107, is(34, '+'('*'(3, 11), 1)), builtin).
proof_step(1, 108, '>'(22, 1), builtin).
proof_step(1, 109, '=:='(0, mod(22, 2)), builtin).
proof_step(1, 110, is(11, '//'(22, 2)), builtin).
proof_step(1, 111, '>'(7, 1), builtin).
proof_step(1, 112, '=:='(1, mod(7, 2)), builtin).
proof_step(1, 113, is(22, '+'('*'(3, 7), 1)), builtin).
proof_step(1, 114, '>'(14, 1), builtin).
proof_step(1, 115, '=:='(0, mod(14, 2)), builtin).
proof_step(1, 116, is(7, '//'(14, 2)), builtin).
proof_step(1, 117, '>'(28, 1), builtin).
proof_step(1, 118, '=:='(0, mod(28, 2)), builtin).
proof_step(1, 119, is(14, '//'(28, 2)), builtin).
proof_step(1, 120, '>'(9, 1), builtin).
proof_step(1, 121, '=:='(1, mod(9, 2)), builtin).
proof_step(1, 122, is(28, '+'('*'(3, 9), 1)), builtin).
proof_step(1, 123, '>'(12, 1), builtin).
proof_step(1, 124, '=:='(0, mod(12, 2)), builtin).
proof_step(1, 125, is(6, '//'(12, 2)), builtin).
proof_step(1, 126, '>'(80, 1), builtin).
proof_step(1, 127, '=:='(0, mod(80, 2)), builtin).
proof_step(1, 128, is(40, '//'(80, 2)), builtin).
proof_step(1, 129, '>'(160, 1), builtin).
proof_step(1, 130, '=:='(0, mod(160, 2)), builtin).
proof_step(1, 131, is(80, '//'(160, 2)), builtin).
proof_step(1, 132, '>'(53, 1), builtin).
proof_step(1, 133, '=:='(1, mod(53, 2)), builtin).
proof_step(1, 134, is(160, '+'('*'(3, 53), 1)), builtin).
proof_step(1, 135, '>'(106, 1), builtin).
proof_step(1, 136, '=:='(0, mod(106, 2)), builtin).
proof_step(1, 137, is(53, '//'(106, 2)), builtin).
proof_step(1, 138, '>'(35, 1), builtin).
proof_step(1, 139, '=:='(1, mod(35, 2)), builtin).
proof_step(1, 140, is(106, '+'('*'(3, 35), 1)), builtin).
proof_step(1, 141, '>'(70, 1), builtin).
proof_step(1, 142, '=:='(0, mod(70, 2)), builtin).
proof_step(1, 143, is(35, '//'(70, 2)), builtin).
proof_step(1, 144, '>'(23, 1), builtin).
proof_step(1, 145, '=:='(1, mod(23, 2)), builtin).
proof_step(1, 146, is(70, '+'('*'(3, 23), 1)), builtin).
proof_step(1, 147, '>'(46, 1), builtin).
proof_step(1, 148, '=:='(0, mod(46, 2)), builtin).
proof_step(1, 149, is(23, '//'(46, 2)), builtin).
proof_step(1, 150, '>'(15, 1), builtin).
proof_step(1, 151, '=:='(1, mod(15, 2)), builtin).
proof_step(1, 152, is(46, '+'('*'(3, 15), 1)), builtin).
proof_step(1, 153, '>'(18, 1), builtin).
proof_step(1, 154, '=:='(0, mod(18, 2)), builtin).
proof_step(1, 155, is(9, '//'(18, 2)), builtin).
proof_step(1, 156, '>'(44, 1), builtin).
proof_step(1, 157, '=:='(0, mod(44, 2)), builtin).
proof_step(1, 158, is(22, '//'(44, 2)), builtin).
proof_step(1, 159, '>'(88, 1), builtin).
proof_step(1, 160, '=:='(0, mod(88, 2)), builtin).
proof_step(1, 161, is(44, '//'(88, 2)), builtin).
proof_step(1, 162, '>'(29, 1), builtin).
proof_step(1, 163, '=:='(1, mod(29, 2)), builtin).
proof_step(1, 164, is(88, '+'('*'(3, 29), 1)), builtin).
proof_step(1, 165, '>'(58, 1), builtin).
proof_step(1, 166, '=:='(0, mod(58, 2)), builtin).
proof_step(1, 167, is(29, '//'(58, 2)), builtin).
proof_step(1, 168, '>'(19, 1), builtin).
proof_step(1, 169, '=:='(1, mod(19, 2)), builtin).
proof_step(1, 170, is(58, '+'('*'(3, 19), 1)), builtin).
proof_step(1, 171, in_range(1, 20, 1), rule(3, [2])).
proof_step(1, 172, in_range(2, 20, 2), rule(3, [3])).
proof_step(1, 173, in_range(3, 20, 3), rule(3, [6])).
proof_step(1, 174, in_range(4, 20, 4), rule(3, [9])).
proof_step(1, 175, in_range(5, 20, 5), rule(3, [12])).
proof_step(1, 176, in_range(6, 20, 6), rule(3, [15])).
proof_step(1, 177, in_range(7, 20, 7), rule(3, [18])).
proof_step(1, 178, in_range(8, 20, 8), rule(3, [21])).
proof_step(1, 179, in_range(9, 20, 9), rule(3, [24])).
proof_step(1, 180, in_range(10, 20, 10), rule(3, [27])).
proof_step(1, 181, in_range(11, 20, 11), rule(3, [30])).
proof_step(1, 182, in_range(12, 20, 12), rule(3, [33])).
proof_step(1, 183, in_range(13, 20, 13), rule(3, [36])).
proof_step(1, 184, in_range(14, 20, 14), rule(3, [39])).
proof_step(1, 185, in_range(15, 20, 15), rule(3, [42])).
proof_step(1, 186, in_range(16, 20, 16), rule(3, [45])).
proof_step(1, 187, in_range(17, 20, 17), rule(3, [48])).
proof_step(1, 188, in_range(18, 20, 18), rule(3, [51])).
proof_step(1, 189, in_range(19, 20, 19), rule(3, [54])).
proof_step(1, 190, in_range(20, 20, 20), rule(3, [57])).
proof_step(1, 191, trajectory(2, [2, 1]), rule(1, [60, 61, 62, 1])).
proof_step(1, 192, in_range(1, 20, 2), rule(4, [4, 5, 172])).
proof_step(1, 193, in_range(2, 20, 3), rule(4, [7, 8, 173])).
proof_step(1, 194, in_range(3, 20, 4), rule(4, [10, 11, 174])).
proof_step(1, 195, in_range(4, 20, 5), rule(4, [13, 14, 175])).
proof_step(1, 196, in_range(5, 20, 6), rule(4, [16, 17, 176])).
proof_step(1, 197, in_range(6, 20, 7), rule(4, [19, 20, 177])).
proof_step(1, 198, in_range(7, 20, 8), rule(4, [22, 23, 178])).
proof_step(1, 199, in_range(8, 20, 9), rule(4, [25, 26, 179])).
proof_step(1, 200, in_range(9, 20, 10), rule(4, [28, 29, 180])).
proof_step(1, 201, in_range(10, 20, 11), rule(4, [31, 32, 181])).
proof_step(1, 202, in_range(11, 20, 12), rule(4, [34, 35, 182])).
proof_step(1, 203, in_range(12, 20, 13), rule(4, [37, 38, 183])).
proof_step(1, 204, in_range(13, 20, 14), rule(4, [40, 41, 184])).
proof_step(1, 205, in_range(14, 20, 15), rule(4, [43, 44, 185])).
proof_step(1, 206, in_range(15, 20, 16), rule(4, [46, 47, 186])).
proof_step(1, 207, in_range(16, 20, 17), rule(4, [49, 50, 187])).
proof_step(1, 208, in_range(17, 20, 18), rule(4, [52, 53, 188])).
proof_step(1, 209, in_range(18, 20, 19), rule(4, [55, 56, 189])).
proof_step(1, 210, in_range(19, 20, 20), rule(4, [58, 59, 190])).
proof_step(1, 211, trajectory(4, [4, 2, 1]), rule(1, [63, 64, 65, 191])).
proof_step(1, 212, in_range(1, 20, 3), rule(4, [4, 5, 193])).
proof_step(1, 213, in_range(2, 20, 4), rule(4, [7, 8, 194])).
proof_step(1, 214, in_range(3, 20, 5), rule(4, [10, 11, 195])).
proof_step(1, 215, in_range(4, 20, 6), rule(4, [13, 14, 196])).
proof_step(1, 216, in_range(5, 20, 7), rule(4, [16, 17, 197])).
proof_step(1, 217, in_range(6, 20, 8), rule(4, [19, 20, 198])).
proof_step(1, 218, in_range(7, 20, 9), rule(4, [22, 23, 199])).
proof_step(1, 219, in_range(8, 20, 10), rule(4, [25, 26, 200])).
proof_step(1, 220, in_range(9, 20, 11), rule(4, [28, 29, 201])).
proof_step(1, 221, in_range(10, 20, 12), rule(4, [31, 32, 202])).
proof_step(1, 222, in_range(11, 20, 13), rule(4, [34, 35, 203])).
proof_step(1, 223, in_range(12, 20, 14), rule(4, [37, 38, 204])).
proof_step(1, 224, in_range(13, 20, 15), rule(4, [40, 41, 205])).
proof_step(1, 225, in_range(14, 20, 16), rule(4, [43, 44, 206])).
proof_step(1, 226, in_range(15, 20, 17), rule(4, [46, 47, 207])).
proof_step(1, 227, in_range(16, 20, 18), rule(4, [49, 50, 208])).
proof_step(1, 228, in_range(17, 20, 19), rule(4, [52, 53, 209])).
proof_step(1, 229, in_range(18, 20, 20), rule(4, [55, 56, 210])).
proof_step(1, 230, trajectory(8, [8, 4, 2, 1]), rule(1, [66, 67, 68, 211])).
proof_step(1, 231, in_range(1, 20, 4), rule(4, [4, 5, 213])).
proof_step(1, 232, in_range(2, 20, 5), rule(4, [7, 8, 214])).
proof_step(1, 233, in_range(3, 20, 6), rule(4, [10, 11, 215])).
proof_step(1, 234, in_range(4, 20, 7), rule(4, [13, 14, 216])).
proof_step(1, 235, in_range(5, 20, 8), rule(4, [16, 17, 217])).
proof_step(1, 236, in_range(6, 20, 9), rule(4, [19, 20, 218])).
proof_step(1, 237, in_range(7, 20, 10), rule(4, [22, 23, 219])).
proof_step(1, 238, in_range(8, 20, 11), rule(4, [25, 26, 220])).
proof_step(1, 239, in_range(9, 20, 12), rule(4, [28, 29, 221])).
proof_step(1, 240, in_range(10, 20, 13), rule(4, [31, 32, 222])).
proof_step(1, 241, in_range(11, 20, 14), rule(4, [34, 35, 223])).
proof_step(1, 242, in_range(12, 20, 15), rule(4, [37, 38, 224])).
proof_step(1, 243, in_range(13, 20, 16), rule(4, [40, 41, 225])).
proof_step(1, 244, in_range(14, 20, 17), rule(4, [43, 44, 226])).
proof_step(1, 245, in_range(15, 20, 18), rule(4, [46, 47, 227])).
proof_step(1, 246, in_range(16, 20, 19), rule(4, [49, 50, 228])).
proof_step(1, 247, in_range(17, 20, 20), rule(4, [52, 53, 229])).
proof_step(1, 248, trajectory(16, [16, 8, 4, 2, 1]), rule(1, [69, 70, 71, 230])).
proof_step(1, 249, in_range(1, 20, 5), rule(4, [4, 5, 232])).
proof_step(1, 250, in_range(2, 20, 6), rule(4, [7, 8, 233])).
proof_step(1, 251, in_range(3, 20, 7), rule(4, [10, 11, 234])).
proof_step(1, 252, in_range(4, 20, 8), rule(4, [13, 14, 235])).
proof_step(1, 253, in_range(5, 20, 9), rule(4, [16, 17, 236])).
proof_step(1, 254, in_range(6, 20, 10), rule(4, [19, 20, 237])).
proof_step(1, 255, in_range(7, 20, 11), rule(4, [22, 23, 238])).
proof_step(1, 256, in_range(8, 20, 12), rule(4, [25, 26, 239])).
proof_step(1, 257, in_range(9, 20, 13), rule(4, [28, 29, 240])).
proof_step(1, 258, in_range(10, 20, 14), rule(4, [31, 32, 241])).
proof_step(1, 259, in_range(11, 20, 15), rule(4, [34, 35, 242])).
proof_step(1, 260, in_range(12, 20, 16), rule(4, [37, 38, 243])).
proof_step(1, 261, in_range(13, 20, 17), rule(4, [40, 41, 244])).
proof_step(1, 262, in_range(14, 20, 18), rule(4, [43, 44, 245])).
proof_step(1, 263, in_range(15, 20, 19), rule(4, [46, 47, 246])).
proof_step(1, 264, in_range(16, 20, 20), rule(4, [49, 50, 247])).
proof_step(1, 265, trajectory(5, [5, 16, 8, 4, 2, 1]), rule(2, [72, 73, 74, 248])).
proof_step(1, 266, in_range(1, 20, 6), rule(4, [4, 5, 250])).
proof_step(1, 267, in_range(2, 20, 7), rule(4, [7, 8, 251])).
proof_step(1, 268, in_range(3, 20, 8), rule(4, [10, 11, 252])).
proof_step(1, 269, in_range(4, 20, 9), rule(4, [13, 14, 253])).
proof_step(1, 270, in_range(5, 20, 10), rule(4, [16, 17, 254])).
proof_step(1, 271, in_range(6, 20, 11), rule(4, [19, 20, 255])).
proof_step(1, 272, in_range(7, 20, 12), rule(4, [22, 23, 256])).
proof_step(1, 273, in_range(8, 20, 13), rule(4, [25, 26, 257])).
proof_step(1, 274, in_range(9, 20, 14), rule(4, [28, 29, 258])).
proof_step(1, 275, in_range(10, 20, 15), rule(4, [31, 32, 259])).
proof_step(1, 276, in_range(11, 20, 16), rule(4, [34, 35, 260])).
proof_step(1, 277, in_range(12, 20, 17), rule(4, [37, 38, 261])).
proof_step(1, 278, in_range(13, 20, 18), rule(4, [40, 41, 262])).
proof_step(1, 279, in_range(14, 20, 19), rule(4, [43, 44, 263])).
proof_step(1, 280, in_range(15, 20, 20), rule(4, [46, 47, 264])).
proof_step(1, 281, trajectory(10, [10, 5, 16, 8, 4, 2, 1]), rule(1, [75, 76, 77, 265])).
proof_step(1, 282, in_range(1, 20, 7), rule(4, [4, 5, 267])).
proof_step(1, 283, in_range(2, 20, 8), rule(4, [7, 8, 268])).
proof_step(1, 284, in_range(3, 20, 9), rule(4, [10, 11, 269])).
proof_step(1, 285, in_range(4, 20, 10), rule(4, [13, 14, 270])).
proof_step(1, 286, in_range(5, 20, 11), rule(4, [16, 17, 271])).
proof_step(1, 287, in_range(6, 20, 12), rule(4, [19, 20, 272])).
proof_step(1, 288, in_range(7, 20, 13), rule(4, [22, 23, 273])).
proof_step(1, 289, in_range(8, 20, 14), rule(4, [25, 26, 274])).
proof_step(1, 290, in_range(9, 20, 15), rule(4, [28, 29, 275])).
proof_step(1, 291, in_range(10, 20, 16), rule(4, [31, 32, 276])).
proof_step(1, 292, in_range(11, 20, 17), rule(4, [34, 35, 277])).
proof_step(1, 293, in_range(12, 20, 18), rule(4, [37, 38, 278])).
proof_step(1, 294, in_range(13, 20, 19), rule(4, [40, 41, 279])).
proof_step(1, 295, in_range(14, 20, 20), rule(4, [43, 44, 280])).
proof_step(
    1,
    296,
    trajectory(3, [3, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [78, 79, 80, 281])
).
proof_step(
    1,
    297,
    trajectory(20, [20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [84, 85, 86, 281])
).
proof_step(1, 298, in_range(1, 20, 8), rule(4, [4, 5, 283])).
proof_step(1, 299, in_range(2, 20, 9), rule(4, [7, 8, 284])).
proof_step(1, 300, in_range(3, 20, 10), rule(4, [10, 11, 285])).
proof_step(1, 301, in_range(4, 20, 11), rule(4, [13, 14, 286])).
proof_step(1, 302, in_range(5, 20, 12), rule(4, [16, 17, 287])).
proof_step(1, 303, in_range(6, 20, 13), rule(4, [19, 20, 288])).
proof_step(1, 304, in_range(7, 20, 14), rule(4, [22, 23, 289])).
proof_step(1, 305, in_range(8, 20, 15), rule(4, [25, 26, 290])).
proof_step(1, 306, in_range(9, 20, 16), rule(4, [28, 29, 291])).
proof_step(1, 307, in_range(10, 20, 17), rule(4, [31, 32, 292])).
proof_step(1, 308, in_range(11, 20, 18), rule(4, [34, 35, 293])).
proof_step(1, 309, in_range(12, 20, 19), rule(4, [37, 38, 294])).
proof_step(1, 310, in_range(13, 20, 20), rule(4, [40, 41, 295])).
proof_step(
    1,
    311,
    trajectory(6, [6, 3, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [81, 82, 83, 296])
).
proof_step(
    1,
    312,
    trajectory(40, [40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [87, 88, 89, 297])
).
proof_step(1, 313, in_range(1, 20, 9), rule(4, [4, 5, 299])).
proof_step(1, 314, in_range(2, 20, 10), rule(4, [7, 8, 300])).
proof_step(1, 315, in_range(3, 20, 11), rule(4, [10, 11, 301])).
proof_step(1, 316, in_range(4, 20, 12), rule(4, [13, 14, 302])).
proof_step(1, 317, in_range(5, 20, 13), rule(4, [16, 17, 303])).
proof_step(1, 318, in_range(6, 20, 14), rule(4, [19, 20, 304])).
proof_step(1, 319, in_range(7, 20, 15), rule(4, [22, 23, 305])).
proof_step(1, 320, in_range(8, 20, 16), rule(4, [25, 26, 306])).
proof_step(1, 321, in_range(9, 20, 17), rule(4, [28, 29, 307])).
proof_step(1, 322, in_range(10, 20, 18), rule(4, [31, 32, 308])).
proof_step(1, 323, in_range(11, 20, 19), rule(4, [34, 35, 309])).
proof_step(1, 324, in_range(12, 20, 20), rule(4, [37, 38, 310])).
proof_step(
    1,
    325,
    trajectory(12, [12, 6, 3, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [123, 124, 125, 311])
).
proof_step(
    1,
    326,
    trajectory(13, [13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [90, 91, 92, 312])
).
proof_step(
    1,
    327,
    trajectory(80, [80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [126, 127, 128, 312])
).
proof_step(1, 328, in_range(1, 20, 10), rule(4, [4, 5, 314])).
proof_step(1, 329, in_range(2, 20, 11), rule(4, [7, 8, 315])).
proof_step(1, 330, in_range(3, 20, 12), rule(4, [10, 11, 316])).
proof_step(1, 331, in_range(4, 20, 13), rule(4, [13, 14, 317])).
proof_step(1, 332, in_range(5, 20, 14), rule(4, [16, 17, 318])).
proof_step(1, 333, in_range(6, 20, 15), rule(4, [19, 20, 319])).
proof_step(1, 334, in_range(7, 20, 16), rule(4, [22, 23, 320])).
proof_step(1, 335, in_range(8, 20, 17), rule(4, [25, 26, 321])).
proof_step(1, 336, in_range(9, 20, 18), rule(4, [28, 29, 322])).
proof_step(1, 337, in_range(10, 20, 19), rule(4, [31, 32, 323])).
proof_step(1, 338, in_range(11, 20, 20), rule(4, [34, 35, 324])).
proof_step(
    1,
    339,
    trajectory(26, [26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [93, 94, 95, 326])
).
proof_step(
    1,
    340,
    trajectory(160, [160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [129, 130, 131, 327])
).
proof_step(1, 341, in_range(1, 20, 11), rule(4, [4, 5, 329])).
proof_step(1, 342, in_range(2, 20, 12), rule(4, [7, 8, 330])).
proof_step(1, 343, in_range(3, 20, 13), rule(4, [10, 11, 331])).
proof_step(1, 344, in_range(4, 20, 14), rule(4, [13, 14, 332])).
proof_step(1, 345, in_range(5, 20, 15), rule(4, [16, 17, 333])).
proof_step(1, 346, in_range(6, 20, 16), rule(4, [19, 20, 334])).
proof_step(1, 347, in_range(7, 20, 17), rule(4, [22, 23, 335])).
proof_step(1, 348, in_range(8, 20, 18), rule(4, [25, 26, 336])).
proof_step(1, 349, in_range(9, 20, 19), rule(4, [28, 29, 337])).
proof_step(1, 350, in_range(10, 20, 20), rule(4, [31, 32, 338])).
proof_step(
    1,
    351,
    trajectory(52, [52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [96, 97, 98, 339])
).
proof_step(
    1,
    352,
    trajectory(53, [53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [132, 133, 134, 340])
).
proof_step(1, 353, in_range(1, 20, 12), rule(4, [4, 5, 342])).
proof_step(1, 354, in_range(2, 20, 13), rule(4, [7, 8, 343])).
proof_step(1, 355, in_range(3, 20, 14), rule(4, [10, 11, 344])).
proof_step(1, 356, in_range(4, 20, 15), rule(4, [13, 14, 345])).
proof_step(1, 357, in_range(5, 20, 16), rule(4, [16, 17, 346])).
proof_step(1, 358, in_range(6, 20, 17), rule(4, [19, 20, 347])).
proof_step(1, 359, in_range(7, 20, 18), rule(4, [22, 23, 348])).
proof_step(1, 360, in_range(8, 20, 19), rule(4, [25, 26, 349])).
proof_step(1, 361, in_range(9, 20, 20), rule(4, [28, 29, 350])).
proof_step(
    1,
    362,
    trajectory(17, [17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [99, 100, 101, 351])
).
proof_step(
    1,
    363,
    trajectory(106, [106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [135, 136, 137, 352])
).
proof_step(1, 364, in_range(1, 20, 13), rule(4, [4, 5, 354])).
proof_step(1, 365, in_range(2, 20, 14), rule(4, [7, 8, 355])).
proof_step(1, 366, in_range(3, 20, 15), rule(4, [10, 11, 356])).
proof_step(1, 367, in_range(4, 20, 16), rule(4, [13, 14, 357])).
proof_step(1, 368, in_range(5, 20, 17), rule(4, [16, 17, 358])).
proof_step(1, 369, in_range(6, 20, 18), rule(4, [19, 20, 359])).
proof_step(1, 370, in_range(7, 20, 19), rule(4, [22, 23, 360])).
proof_step(1, 371, in_range(8, 20, 20), rule(4, [25, 26, 361])).
proof_step(
    1,
    372,
    trajectory(34, [34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [102, 103, 104, 362])
).
proof_step(
    1,
    373,
    trajectory(35, [35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [138, 139, 140, 363])
).
proof_step(1, 374, in_range(1, 20, 14), rule(4, [4, 5, 365])).
proof_step(1, 375, in_range(2, 20, 15), rule(4, [7, 8, 366])).
proof_step(1, 376, in_range(3, 20, 16), rule(4, [10, 11, 367])).
proof_step(1, 377, in_range(4, 20, 17), rule(4, [13, 14, 368])).
proof_step(1, 378, in_range(5, 20, 18), rule(4, [16, 17, 369])).
proof_step(1, 379, in_range(6, 20, 19), rule(4, [19, 20, 370])).
proof_step(1, 380, in_range(7, 20, 20), rule(4, [22, 23, 371])).
proof_step(
    1,
    381,
    trajectory(11, [11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [105, 106, 107, 372])
).
proof_step(
    1,
    382,
    trajectory(70, [70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [141, 142, 143, 373])
).
proof_step(1, 383, in_range(1, 20, 15), rule(4, [4, 5, 375])).
proof_step(1, 384, in_range(2, 20, 16), rule(4, [7, 8, 376])).
proof_step(1, 385, in_range(3, 20, 17), rule(4, [10, 11, 377])).
proof_step(1, 386, in_range(4, 20, 18), rule(4, [13, 14, 378])).
proof_step(1, 387, in_range(5, 20, 19), rule(4, [16, 17, 379])).
proof_step(1, 388, in_range(6, 20, 20), rule(4, [19, 20, 380])).
proof_step(
    1,
    389,
    trajectory(22, [22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [108, 109, 110, 381])
).
proof_step(
    1,
    390,
    trajectory(23, [23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [144, 145, 146, 382])
).
proof_step(1, 391, in_range(1, 20, 16), rule(4, [4, 5, 384])).
proof_step(1, 392, in_range(2, 20, 17), rule(4, [7, 8, 385])).
proof_step(1, 393, in_range(3, 20, 18), rule(4, [10, 11, 386])).
proof_step(1, 394, in_range(4, 20, 19), rule(4, [13, 14, 387])).
proof_step(1, 395, in_range(5, 20, 20), rule(4, [16, 17, 388])).
proof_step(
    1,
    396,
    trajectory(7, [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(2, [111, 112, 113, 389])
).
proof_step(
    1,
    397,
    trajectory(44, [44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [156, 157, 158, 389])
).
proof_step(
    1,
    398,
    trajectory(46, [46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [147, 148, 149, 390])
).
proof_step(1, 399, in_range(1, 20, 17), rule(4, [4, 5, 392])).
proof_step(1, 400, in_range(2, 20, 18), rule(4, [7, 8, 393])).
proof_step(1, 401, in_range(3, 20, 19), rule(4, [10, 11, 394])).
proof_step(1, 402, in_range(4, 20, 20), rule(4, [13, 14, 395])).
proof_step(
    1,
    403,
    trajectory(14, [14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [114, 115, 116, 396])
).
proof_step(
    1,
    404,
    trajectory(88, [88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]),
    rule(1, [159, 160, 161, 397])
).
proof_step(
    1,
    405,
    trajectory(
        15,
        [15, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(2, [150, 151, 152, 398])
).
proof_step(1, 406, in_range(1, 20, 18), rule(4, [4, 5, 400])).
proof_step(1, 407, in_range(2, 20, 19), rule(4, [7, 8, 401])).
proof_step(1, 408, in_range(3, 20, 20), rule(4, [10, 11, 402])).
proof_step(
    1,
    409,
    trajectory(
        28,
        [28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(1, [117, 118, 119, 403])
).
proof_step(
    1,
    410,
    trajectory(
        29,
        [29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(2, [162, 163, 164, 404])
).
proof_step(1, 411, in_range(1, 20, 19), rule(4, [4, 5, 407])).
proof_step(1, 412, in_range(2, 20, 20), rule(4, [7, 8, 408])).
proof_step(
    1,
    413,
    trajectory(
        9,
        [9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(2, [120, 121, 122, 409])
).
proof_step(
    1,
    414,
    trajectory(
        58,
        [58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(1, [165, 166, 167, 410])
).
proof_step(1, 415, in_range(1, 20, 20), rule(4, [4, 5, 412])).
proof_step(
    1,
    416,
    trajectory(
        18,
        [18, 9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(1, [153, 154, 155, 413])
).
proof_step(
    1,
    417,
    trajectory(
        19,
        [19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
    ),
    rule(2, [168, 169, 170, 414])
).
proof_claim(1, answer(1, [171, 1])).
proof_claim(1, answer(1, [192, 191])).
proof_claim(1, answer(1, [212, 296])).
proof_claim(1, answer(1, [231, 211])).
proof_claim(1, answer(1, [249, 265])).
proof_claim(1, answer(1, [266, 311])).
proof_claim(1, answer(1, [282, 396])).
proof_claim(1, answer(1, [298, 230])).
proof_claim(1, answer(1, [313, 413])).
proof_claim(1, answer(1, [328, 281])).
proof_claim(1, answer(1, [341, 381])).
proof_claim(1, answer(1, [353, 325])).
proof_claim(1, answer(1, [364, 326])).
proof_claim(1, answer(1, [374, 403])).
proof_claim(1, answer(1, [383, 405])).
proof_claim(1, answer(1, [391, 248])).
proof_claim(1, answer(1, [399, 362])).
proof_claim(1, answer(1, [406, 416])).
proof_claim(1, answer(1, [411, 417])).
proof_claim(1, answer(1, [415, 297])).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
