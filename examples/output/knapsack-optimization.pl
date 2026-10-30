% Answer 1
knapsack_answer(feasible_pack_count, 113).
knapsack_answer(best_pack, [atlas, battery, camera, medkit, sensor]).
knapsack_answer(total_weight, 15).
knapsack_answer(total_value, 40).

% Answer 2
best_pack([atlas, battery, camera, medkit, sensor], 15, 40).

% Reason 2
proof_step(2, 1, capacity(15), source(1)).
proof_step(
    2,
    2,
    items([atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor]),
    source(2)
).
proof_step(2, 3, item(atlas, 2, 6), source(3)).
proof_step(2, 4, item(battery, 4, 10), source(4)).
proof_step(2, 5, item(camera, 3, 8), source(5)).
proof_step(2, 6, item(drone, 6, 13), source(6)).
proof_step(2, 7, item(emergency_radio, 5, 11), source(7)).
proof_step(2, 8, item(field_laptop, 7, 16), source(8)).
proof_step(2, 9, item(medkit, 4, 9), source(9)).
proof_step(2, 10, item(sensor, 2, 7), source(10)).
proof_step(2, 11, subset([], []), source(11)).
proof_step(2, 12, total_weight([], 0), source(12)).
proof_step(2, 13, total_value([], 0), source(13)).
proof_step(2, 14, is(2, '+'(2, 0)), builtin).
proof_step(2, 15, is(4, '+'(4, 0)), builtin).
proof_step(2, 16, is(7, '+'(7, 0)), builtin).
proof_step(2, 17, is(5, '+'(5, 0)), builtin).
proof_step(2, 18, is(6, '+'(6, 0)), builtin).
proof_step(2, 19, is(3, '+'(3, 0)), builtin).
proof_step(2, 20, '=<'(0, 15), builtin).
proof_step(2, 21, is(6, '+'(4, 2)), builtin).
proof_step(2, 22, is(9, '+'(7, 2)), builtin).
proof_step(2, 23, is(7, '+'(5, 2)), builtin).
proof_step(2, 24, is(8, '+'(6, 2)), builtin).
proof_step(2, 25, is(5, '+'(3, 2)), builtin).
proof_step(2, 26, is(4, '+'(2, 2)), builtin).
proof_step(2, 27, is(11, '+'(7, 4)), builtin).
proof_step(2, 28, is(9, '+'(5, 4)), builtin).
proof_step(2, 29, is(10, '+'(6, 4)), builtin).
proof_step(2, 30, is(7, '+'(3, 4)), builtin).
proof_step(2, 31, is(8, '+'(4, 4)), builtin).
proof_step(2, 32, is(6, '+'(2, 4)), builtin).
proof_step(2, 33, is(12, '+'(5, 7)), builtin).
proof_step(2, 34, is(13, '+'(6, 7)), builtin).
proof_step(2, 35, is(10, '+'(3, 7)), builtin).
proof_step(2, 36, is(11, '+'(4, 7)), builtin).
proof_step(2, 37, is(9, '+'(2, 7)), builtin).
proof_step(2, 38, is(11, '+'(6, 5)), builtin).
proof_step(2, 39, is(8, '+'(3, 5)), builtin).
proof_step(2, 40, is(9, '+'(4, 5)), builtin).
proof_step(2, 41, is(7, '+'(2, 5)), builtin).
proof_step(2, 42, is(9, '+'(3, 6)), builtin).
proof_step(2, 43, is(10, '+'(4, 6)), builtin).
proof_step(2, 44, is(8, '+'(2, 6)), builtin).
proof_step(2, 45, is(7, '+'(4, 3)), builtin).
proof_step(2, 46, is(5, '+'(2, 3)), builtin).
proof_step(2, 47, is(13, '+'(7, 6)), builtin).
proof_step(2, 48, is(11, '+'(5, 6)), builtin).
proof_step(2, 49, is(12, '+'(6, 6)), builtin).
proof_step(2, 50, is(14, '+'(5, 9)), builtin).
proof_step(2, 51, is(15, '+'(6, 9)), builtin).
proof_step(2, 52, is(12, '+'(3, 9)), builtin).
proof_step(2, 53, is(13, '+'(4, 9)), builtin).
proof_step(2, 54, is(11, '+'(2, 9)), builtin).
proof_step(2, 55, is(11, '+'(3, 8)), builtin).
proof_step(2, 56, is(12, '+'(4, 8)), builtin).
proof_step(2, 57, is(10, '+'(2, 8)), builtin).
proof_step(2, 58, is(16, '+'(5, 11)), builtin).
proof_step(2, 59, is(17, '+'(6, 11)), builtin).
proof_step(2, 60, is(14, '+'(3, 11)), builtin).
proof_step(2, 61, is(15, '+'(4, 11)), builtin).
proof_step(2, 62, is(13, '+'(2, 11)), builtin).
proof_step(2, 63, is(13, '+'(3, 10)), builtin).
proof_step(2, 64, is(14, '+'(4, 10)), builtin).
proof_step(2, 65, is(12, '+'(2, 10)), builtin).
proof_step(2, 66, is(18, '+'(6, 12)), builtin).
proof_step(2, 67, is(15, '+'(3, 12)), builtin).
proof_step(2, 68, is(16, '+'(4, 12)), builtin).
proof_step(2, 69, is(14, '+'(2, 12)), builtin).
proof_step(2, 70, is(16, '+'(3, 13)), builtin).
proof_step(2, 71, is(17, '+'(4, 13)), builtin).
proof_step(2, 72, is(15, '+'(2, 13)), builtin).
proof_step(2, 73, is(9, '+'(9, 0)), builtin).
proof_step(2, 74, is(16, '+'(16, 0)), builtin).
proof_step(2, 75, is(11, '+'(11, 0)), builtin).
proof_step(2, 76, is(13, '+'(13, 0)), builtin).
proof_step(2, 77, is(8, '+'(8, 0)), builtin).
proof_step(2, 78, is(10, '+'(10, 0)), builtin).
proof_step(2, 79, is(18, '+'(5, 13)), builtin).
proof_step(2, 80, is(19, '+'(6, 13)), builtin).
proof_step(2, 81, is(20, '+'(6, 14)), builtin).
proof_step(2, 82, is(17, '+'(3, 14)), builtin).
proof_step(2, 83, is(18, '+'(4, 14)), builtin).
proof_step(2, 84, is(16, '+'(2, 14)), builtin).
proof_step(2, 85, is(18, '+'(3, 15)), builtin).
proof_step(2, 86, is(19, '+'(4, 15)), builtin).
proof_step(2, 87, is(17, '+'(2, 15)), builtin).
proof_step(2, 88, is(22, '+'(6, 16)), builtin).
proof_step(2, 89, is(19, '+'(3, 16)), builtin).
proof_step(2, 90, is(20, '+'(4, 16)), builtin).
proof_step(2, 91, is(18, '+'(2, 16)), builtin).
proof_step(2, 92, is(20, '+'(3, 17)), builtin).
proof_step(2, 93, is(21, '+'(4, 17)), builtin).
proof_step(2, 94, is(19, '+'(2, 17)), builtin).
proof_step(2, 95, is(21, '+'(3, 18)), builtin).
proof_step(2, 96, is(22, '+'(4, 18)), builtin).
proof_step(2, 97, is(20, '+'(2, 18)), builtin).
proof_step(2, 98, '=<'(2, 15), builtin).
proof_step(2, 99, '=<'(4, 15), builtin).
proof_step(2, 100, '=<'(7, 15), builtin).
proof_step(2, 101, '=<'(5, 15), builtin).
proof_step(2, 102, '=<'(6, 15), builtin).
proof_step(2, 103, '=<'(3, 15), builtin).
proof_step(2, 104, is(16, '+'(9, 7)), builtin).
proof_step(2, 105, is(23, '+'(16, 7)), builtin).
proof_step(2, 106, is(18, '+'(11, 7)), builtin).
proof_step(2, 107, is(20, '+'(13, 7)), builtin).
proof_step(2, 108, is(15, '+'(8, 7)), builtin).
proof_step(2, 109, is(17, '+'(10, 7)), builtin).
proof_step(2, 110, is(25, '+'(16, 9)), builtin).
proof_step(2, 111, is(20, '+'(11, 9)), builtin).
proof_step(2, 112, is(22, '+'(13, 9)), builtin).
proof_step(2, 113, is(17, '+'(8, 9)), builtin).
proof_step(2, 114, is(19, '+'(10, 9)), builtin).
proof_step(2, 115, is(27, '+'(11, 16)), builtin).
proof_step(2, 116, is(29, '+'(13, 16)), builtin).
proof_step(2, 117, is(24, '+'(8, 16)), builtin).
proof_step(2, 118, is(26, '+'(10, 16)), builtin).
proof_step(2, 119, is(24, '+'(13, 11)), builtin).
proof_step(2, 120, is(19, '+'(8, 11)), builtin).
proof_step(2, 121, is(21, '+'(10, 11)), builtin).
proof_step(2, 122, is(21, '+'(8, 13)), builtin).
proof_step(2, 123, is(23, '+'(10, 13)), builtin).
proof_step(2, 124, is(18, '+'(10, 8)), builtin).
proof_step(2, 125, is(14, '+'(6, 8)), builtin).
proof_step(2, 126, is(16, '+'(6, 10)), builtin).
proof_step(2, 127, is(24, '+'(6, 18)), builtin).
proof_step(2, 128, is(22, '+'(3, 19)), builtin).
proof_step(2, 129, is(23, '+'(4, 19)), builtin).
proof_step(2, 130, is(21, '+'(2, 19)), builtin).
proof_step(2, 131, is(23, '+'(3, 20)), builtin).
proof_step(2, 132, is(24, '+'(4, 20)), builtin).
proof_step(2, 133, is(22, '+'(2, 20)), builtin).
proof_step(2, 134, is(25, '+'(3, 22)), builtin).
proof_step(2, 135, is(26, '+'(4, 22)), builtin).
proof_step(2, 136, is(24, '+'(2, 22)), builtin).
proof_step(2, 137, is(23, '+'(2, 21)), builtin).
proof_step(2, 138, is(25, '+'(4, 21)), builtin).
proof_step(2, 139, '=<'(9, 15), builtin).
proof_step(2, 140, '=<'(8, 15), builtin).
proof_step(2, 141, '=<'(11, 15), builtin).
proof_step(2, 142, '=<'(10, 15), builtin).
proof_step(2, 143, '=<'(12, 15), builtin).
proof_step(2, 144, '=<'(13, 15), builtin).
proof_step(2, 145, is(32, '+'(16, 16)), builtin).
proof_step(2, 146, is(34, '+'(11, 23)), builtin).
proof_step(2, 147, is(36, '+'(13, 23)), builtin).
proof_step(2, 148, is(31, '+'(8, 23)), builtin).
proof_step(2, 149, is(33, '+'(10, 23)), builtin).
proof_step(2, 150, is(29, '+'(6, 23)), builtin).
proof_step(2, 151, is(31, '+'(13, 18)), builtin).
proof_step(2, 152, is(26, '+'(8, 18)), builtin).
proof_step(2, 153, is(28, '+'(10, 18)), builtin).
proof_step(2, 154, is(28, '+'(8, 20)), builtin).
proof_step(2, 155, is(30, '+'(10, 20)), builtin).
proof_step(2, 156, is(26, '+'(6, 20)), builtin).
proof_step(2, 157, is(25, '+'(10, 15)), builtin).
proof_step(2, 158, is(21, '+'(6, 15)), builtin).
proof_step(2, 159, is(23, '+'(6, 17)), builtin).
proof_step(2, 160, is(33, '+'(8, 25)), builtin).
proof_step(2, 161, is(35, '+'(10, 25)), builtin).
proof_step(2, 162, is(31, '+'(6, 25)), builtin).
proof_step(2, 163, is(33, '+'(13, 20)), builtin).
proof_step(2, 164, is(30, '+'(8, 22)), builtin).
proof_step(2, 165, is(32, '+'(10, 22)), builtin).
proof_step(2, 166, is(28, '+'(6, 22)), builtin).
proof_step(2, 167, is(27, '+'(10, 17)), builtin).
proof_step(2, 168, is(25, '+'(6, 19)), builtin).
proof_step(2, 169, is(35, '+'(8, 27)), builtin).
proof_step(2, 170, is(33, '+'(6, 27)), builtin).
proof_step(2, 171, is(35, '+'(6, 29)), builtin).
proof_step(2, 172, is(34, '+'(10, 24)), builtin).
proof_step(2, 173, is(30, '+'(6, 24)), builtin).
proof_step(2, 174, is(32, '+'(6, 26)), builtin).
proof_step(2, 175, is(32, '+'(8, 24)), builtin).
proof_step(2, 176, is(29, '+'(10, 19)), builtin).
proof_step(2, 177, is(27, '+'(6, 21)), builtin).
proof_step(2, 178, is(31, '+'(10, 21)), builtin).
proof_step(2, 179, is(27, '+'(3, 24)), builtin).
proof_step(2, 180, is(28, '+'(4, 24)), builtin).
proof_step(2, 181, is(26, '+'(2, 24)), builtin).
proof_step(2, 182, is(25, '+'(2, 23)), builtin).
proof_step(2, 183, is(27, '+'(4, 23)), builtin).
proof_step(2, 184, is(29, '+'(4, 25)), builtin).
proof_step(2, 185, is(27, '+'(2, 25)), builtin).
proof_step(2, 186, is(28, '+'(2, 26)), builtin).
proof_step(2, 187, '=<'(14, 15), builtin).
proof_step(2, 188, '=<'(15, 15), builtin).
proof_step(2, 189, is(38, '+'(6, 32)), builtin).
proof_step(2, 190, is(37, '+'(10, 27)), builtin).
proof_step(2, 191, is(37, '+'(8, 29)), builtin).
proof_step(2, 192, is(37, '+'(6, 31)), builtin).
proof_step(2, 193, is(39, '+'(6, 33)), builtin).
proof_step(2, 194, is(36, '+'(10, 26)), builtin).
proof_step(2, 195, is(34, '+'(6, 28)), builtin).
proof_step(2, 196, is(38, '+'(10, 28)), builtin).
proof_step(2, 197, is(36, '+'(6, 30)), builtin).
proof_step(2, 198, is(31, '+'(4, 27)), builtin).
proof_step(2, 199, is(29, '+'(2, 27)), builtin).
proof_step(2, 200, is(30, '+'(2, 28)), builtin).
proof_step(2, 201, is(31, '+'(2, 29)), builtin).
proof_step(2, 202, is(40, '+'(6, 34)), builtin).
proof_step(2, 203, is(33, '+'(2, 31)), builtin).
proof_step(2, 204, is(9, '+'(6, 3)), builtin).
proof_step(2, 205, is(16, '+'(7, 9)), builtin).
proof_step(2, 206, item_weight(atlas, 2), rule(3, [3])).
proof_step(2, 207, item_value(atlas, 6), rule(4, [3])).
proof_step(2, 208, item_weight(battery, 4), rule(3, [4])).
proof_step(2, 209, item_value(battery, 10), rule(4, [4])).
proof_step(2, 210, item_weight(camera, 3), rule(3, [5])).
proof_step(2, 211, item_value(camera, 8), rule(4, [5])).
proof_step(2, 212, item_weight(drone, 6), rule(3, [6])).
proof_step(2, 213, item_value(drone, 13), rule(4, [6])).
proof_step(2, 214, item_weight(emergency_radio, 5), rule(3, [7])).
proof_step(2, 215, item_value(emergency_radio, 11), rule(4, [7])).
proof_step(2, 216, item_weight(field_laptop, 7), rule(3, [8])).
proof_step(2, 217, item_value(field_laptop, 16), rule(4, [8])).
proof_step(2, 218, item_weight(medkit, 4), rule(3, [9])).
proof_step(2, 219, item_value(medkit, 9), rule(4, [9])).
proof_step(2, 220, item_weight(sensor, 2), rule(3, [10])).
proof_step(2, 221, item_value(sensor, 7), rule(4, [10])).
proof_step(2, 222, subset([sensor], [sensor]), rule(1, [11])).
proof_step(2, 223, subset([sensor], []), rule(2, [11])).
proof_step(2, 224, total_weight([atlas], 2), rule(5, [206, 12, 14])).
proof_step(2, 225, total_value([atlas], 6), rule(6, [207, 13, 18])).
proof_step(2, 226, total_weight([battery], 4), rule(5, [208, 12, 15])).
proof_step(2, 227, total_value([battery], 10), rule(6, [209, 13, 78])).
proof_step(2, 228, total_weight([camera], 3), rule(5, [210, 12, 19])).
proof_step(2, 229, total_value([camera], 8), rule(6, [211, 13, 77])).
proof_step(2, 230, total_weight([drone], 6), rule(5, [212, 12, 18])).
proof_step(2, 231, total_value([drone], 13), rule(6, [213, 13, 76])).
proof_step(2, 232, total_weight([emergency_radio], 5), rule(5, [214, 12, 17])).
proof_step(2, 233, total_value([emergency_radio], 11), rule(6, [215, 13, 75])).
proof_step(2, 234, total_weight([field_laptop], 7), rule(5, [216, 12, 16])).
proof_step(2, 235, total_value([field_laptop], 16), rule(6, [217, 13, 74])).
proof_step(2, 236, total_weight([medkit], 4), rule(5, [218, 12, 15])).
proof_step(2, 237, total_value([medkit], 9), rule(6, [219, 13, 73])).
proof_step(2, 238, total_weight([sensor], 2), rule(5, [220, 12, 14])).
proof_step(2, 239, total_value([sensor], 7), rule(6, [221, 13, 16])).
proof_step(2, 240, subset([medkit, sensor], [medkit, sensor]), rule(1, [222])).
proof_step(2, 241, subset([medkit, sensor], [sensor]), rule(2, [222])).
proof_step(2, 242, subset([medkit, sensor], [medkit]), rule(1, [223])).
proof_step(2, 243, subset([medkit, sensor], []), rule(2, [223])).
proof_step(2, 244, total_weight([atlas, battery], 6), rule(5, [206, 226, 32])).
proof_step(2, 245, total_value([atlas, battery], 16), rule(6, [207, 227, 126])).
proof_step(2, 246, total_weight([battery, camera], 7), rule(5, [208, 228, 45])).
proof_step(2, 247, total_weight([atlas, camera], 5), rule(5, [206, 228, 46])).
proof_step(2, 248, total_weight([drone, camera], 9), rule(5, [212, 228, 204])).
proof_step(2, 249, total_value([battery, camera], 18), rule(6, [209, 229, 124])).
proof_step(2, 250, total_value([atlas, camera], 14), rule(6, [207, 229, 125])).
proof_step(2, 251, total_weight([camera, drone], 9), rule(5, [210, 230, 42])).
proof_step(2, 252, total_weight([battery, drone], 10), rule(5, [208, 230, 43])).
proof_step(2, 253, total_weight([atlas, drone], 8), rule(5, [206, 230, 44])).
proof_step(2, 254, total_value([camera, drone], 21), rule(6, [211, 231, 122])).
proof_step(2, 255, total_value([battery, drone], 23), rule(6, [209, 231, 123])).
proof_step(2, 256, total_value([atlas, drone], 19), rule(6, [207, 231, 80])).
proof_step(2, 257, total_weight([drone, emergency_radio], 11), rule(5, [212, 232, 38])).
proof_step(2, 258, total_weight([camera, emergency_radio], 8), rule(5, [210, 232, 39])).
proof_step(2, 259, total_weight([battery, emergency_radio], 9), rule(5, [208, 232, 40])).
proof_step(2, 260, total_weight([atlas, emergency_radio], 7), rule(5, [206, 232, 41])).
proof_step(2, 261, total_value([drone, emergency_radio], 24), rule(6, [213, 233, 119])).
proof_step(2, 262, total_value([camera, emergency_radio], 19), rule(6, [211, 233, 120])).
proof_step(
    2,
    263,
    total_value([battery, emergency_radio], 21),
    rule(6, [209, 233, 121])
).
proof_step(2, 264, total_value([atlas, emergency_radio], 17), rule(6, [207, 233, 59])).
proof_step(
    2,
    265,
    total_weight([emergency_radio, field_laptop], 12),
    rule(5, [214, 234, 33])
).
proof_step(2, 266, total_weight([drone, field_laptop], 13), rule(5, [212, 234, 34])).
proof_step(2, 267, total_weight([camera, field_laptop], 10), rule(5, [210, 234, 35])).
proof_step(2, 268, total_weight([battery, field_laptop], 11), rule(5, [208, 234, 36])).
proof_step(2, 269, total_weight([atlas, field_laptop], 9), rule(5, [206, 234, 37])).
proof_step(
    2,
    270,
    total_value([emergency_radio, field_laptop], 27),
    rule(6, [215, 235, 115])
).
proof_step(2, 271, total_value([drone, field_laptop], 29), rule(6, [213, 235, 116])).
proof_step(2, 272, total_value([camera, field_laptop], 24), rule(6, [211, 235, 117])).
proof_step(2, 273, total_value([battery, field_laptop], 26), rule(6, [209, 235, 118])).
proof_step(2, 274, total_value([atlas, field_laptop], 22), rule(6, [207, 235, 88])).
proof_step(2, 275, total_weight([field_laptop, medkit], 11), rule(5, [216, 236, 27])).
proof_step(2, 276, total_weight([emergency_radio, medkit], 9), rule(5, [214, 236, 28])).
proof_step(2, 277, total_weight([drone, medkit], 10), rule(5, [212, 236, 29])).
proof_step(2, 278, total_weight([camera, medkit], 7), rule(5, [210, 236, 30])).
proof_step(2, 279, total_weight([battery, medkit], 8), rule(5, [208, 236, 31])).
proof_step(2, 280, total_weight([atlas, medkit], 6), rule(5, [206, 236, 32])).
proof_step(2, 281, total_value([field_laptop, medkit], 25), rule(6, [217, 237, 110])).
proof_step(2, 282, total_value([emergency_radio, medkit], 20), rule(6, [215, 237, 111])).
proof_step(2, 283, total_value([drone, medkit], 22), rule(6, [213, 237, 112])).
proof_step(2, 284, total_value([camera, medkit], 17), rule(6, [211, 237, 113])).
proof_step(2, 285, total_value([battery, medkit], 19), rule(6, [209, 237, 114])).
proof_step(2, 286, total_value([atlas, medkit], 15), rule(6, [207, 237, 51])).
proof_step(2, 287, total_weight([medkit, sensor], 6), rule(5, [218, 238, 21])).
proof_step(2, 288, total_weight([field_laptop, sensor], 9), rule(5, [216, 238, 22])).
proof_step(2, 289, total_weight([emergency_radio, sensor], 7), rule(5, [214, 238, 23])).
proof_step(2, 290, total_weight([drone, sensor], 8), rule(5, [212, 238, 24])).
proof_step(2, 291, total_weight([camera, sensor], 5), rule(5, [210, 238, 25])).
proof_step(2, 292, total_weight([battery, sensor], 6), rule(5, [208, 238, 21])).
proof_step(2, 293, total_weight([atlas, sensor], 4), rule(5, [206, 238, 26])).
proof_step(2, 294, total_value([medkit, sensor], 16), rule(6, [219, 239, 104])).
proof_step(2, 295, total_value([field_laptop, sensor], 23), rule(6, [217, 239, 105])).
proof_step(2, 296, total_value([emergency_radio, sensor], 18), rule(6, [215, 239, 106])).
proof_step(2, 297, total_value([drone, sensor], 20), rule(6, [213, 239, 107])).
proof_step(2, 298, total_value([camera, sensor], 15), rule(6, [211, 239, 108])).
proof_step(2, 299, total_value([battery, sensor], 17), rule(6, [209, 239, 109])).
proof_step(2, 300, total_value([atlas, sensor], 13), rule(6, [207, 239, 34])).
proof_step(
    2,
    301,
    subset([field_laptop, medkit, sensor], [field_laptop, medkit, sensor]),
    rule(1, [240])
).
proof_step(
    2,
    302,
    subset([field_laptop, medkit, sensor], [medkit, sensor]),
    rule(2, [240])
).
proof_step(
    2,
    303,
    subset([field_laptop, medkit, sensor], [field_laptop, sensor]),
    rule(1, [241])
).
proof_step(2, 304, subset([field_laptop, medkit, sensor], [sensor]), rule(2, [241])).
proof_step(
    2,
    305,
    subset([field_laptop, medkit, sensor], [field_laptop, medkit]),
    rule(1, [242])
).
proof_step(2, 306, subset([field_laptop, medkit, sensor], [medkit]), rule(2, [242])).
proof_step(
    2,
    307,
    subset([field_laptop, medkit, sensor], [field_laptop]),
    rule(1, [243])
).
proof_step(2, 308, subset([field_laptop, medkit, sensor], []), rule(2, [243])).
proof_step(2, 309, total_weight([atlas, battery, camera], 9), rule(5, [206, 246, 37])).
proof_step(
    2,
    310,
    total_weight([field_laptop, drone, camera], 16),
    rule(5, [216, 248, 205])
).
proof_step(2, 311, total_value([atlas, battery, camera], 24), rule(6, [207, 249, 127])).
proof_step(2, 312, total_weight([battery, camera, drone], 13), rule(5, [208, 251, 53])).
proof_step(2, 313, total_weight([atlas, camera, drone], 11), rule(5, [206, 251, 54])).
proof_step(2, 314, total_weight([atlas, battery, drone], 12), rule(5, [206, 252, 65])).
proof_step(2, 315, total_value([battery, camera, drone], 31), rule(6, [209, 254, 178])).
proof_step(2, 316, total_value([atlas, camera, drone], 27), rule(6, [207, 254, 177])).
proof_step(2, 317, total_value([atlas, battery, drone], 29), rule(6, [207, 255, 150])).
proof_step(
    2,
    318,
    total_weight([camera, drone, emergency_radio], 14),
    rule(5, [210, 257, 60])
).
proof_step(
    2,
    319,
    total_weight([battery, drone, emergency_radio], 15),
    rule(5, [208, 257, 61])
).
proof_step(
    2,
    320,
    total_weight([atlas, drone, emergency_radio], 13),
    rule(5, [206, 257, 62])
).
proof_step(
    2,
    321,
    total_weight([battery, camera, emergency_radio], 12),
    rule(5, [208, 258, 56])
).
proof_step(
    2,
    322,
    total_weight([atlas, camera, emergency_radio], 10),
    rule(5, [206, 258, 57])
).
proof_step(
    2,
    323,
    total_weight([atlas, battery, emergency_radio], 11),
    rule(5, [206, 259, 54])
).
proof_step(
    2,
    324,
    total_value([camera, drone, emergency_radio], 32),
    rule(6, [211, 261, 175])
).
proof_step(
    2,
    325,
    total_value([battery, drone, emergency_radio], 34),
    rule(6, [209, 261, 172])
).
proof_step(
    2,
    326,
    total_value([atlas, drone, emergency_radio], 30),
    rule(6, [207, 261, 173])
).
proof_step(
    2,
    327,
    total_value([battery, camera, emergency_radio], 29),
    rule(6, [209, 262, 176])
).
proof_step(
    2,
    328,
    total_value([atlas, camera, emergency_radio], 25),
    rule(6, [207, 262, 168])
).
proof_step(
    2,
    329,
    total_value([atlas, battery, emergency_radio], 27),
    rule(6, [207, 263, 177])
).
proof_step(
    2,
    330,
    total_weight([drone, emergency_radio, field_laptop], 18),
    rule(5, [212, 265, 66])
).
proof_step(
    2,
    331,
    total_weight([camera, emergency_radio, field_laptop], 15),
    rule(5, [210, 265, 67])
).
proof_step(
    2,
    332,
    total_weight([battery, emergency_radio, field_laptop], 16),
    rule(5, [208, 265, 68])
).
proof_step(
    2,
    333,
    total_weight([atlas, emergency_radio, field_laptop], 14),
    rule(5, [206, 265, 69])
).
proof_step(
    2,
    334,
    total_weight([camera, drone, field_laptop], 16),
    rule(5, [210, 266, 70])
).
proof_step(
    2,
    335,
    total_weight([battery, drone, field_laptop], 17),
    rule(5, [208, 266, 71])
).
proof_step(
    2,
    336,
    total_weight([atlas, drone, field_laptop], 15),
    rule(5, [206, 266, 72])
).
proof_step(
    2,
    337,
    total_weight([battery, camera, field_laptop], 14),
    rule(5, [208, 267, 64])
).
proof_step(
    2,
    338,
    total_weight([atlas, camera, field_laptop], 12),
    rule(5, [206, 267, 65])
).
proof_step(
    2,
    339,
    total_weight([atlas, battery, field_laptop], 13),
    rule(5, [206, 268, 62])
).
proof_step(
    2,
    340,
    total_value([camera, emergency_radio, field_laptop], 35),
    rule(6, [211, 270, 169])
).
proof_step(
    2,
    341,
    total_value([atlas, emergency_radio, field_laptop], 33),
    rule(6, [207, 270, 170])
).
proof_step(
    2,
    342,
    total_value([atlas, drone, field_laptop], 35),
    rule(6, [207, 271, 171])
).
proof_step(
    2,
    343,
    total_value([battery, camera, field_laptop], 34),
    rule(6, [209, 272, 172])
).
proof_step(
    2,
    344,
    total_value([atlas, camera, field_laptop], 30),
    rule(6, [207, 272, 173])
).
proof_step(
    2,
    345,
    total_value([atlas, battery, field_laptop], 32),
    rule(6, [207, 273, 174])
).
proof_step(
    2,
    346,
    total_weight([emergency_radio, field_laptop, medkit], 16),
    rule(5, [214, 275, 58])
).
proof_step(
    2,
    347,
    total_weight([drone, field_laptop, medkit], 17),
    rule(5, [212, 275, 59])
).
proof_step(
    2,
    348,
    total_weight([camera, field_laptop, medkit], 14),
    rule(5, [210, 275, 60])
).
proof_step(
    2,
    349,
    total_weight([battery, field_laptop, medkit], 15),
    rule(5, [208, 275, 61])
).
proof_step(
    2,
    350,
    total_weight([atlas, field_laptop, medkit], 13),
    rule(5, [206, 275, 62])
).
proof_step(
    2,
    351,
    total_weight([drone, emergency_radio, medkit], 15),
    rule(5, [212, 276, 51])
).
proof_step(
    2,
    352,
    total_weight([camera, emergency_radio, medkit], 12),
    rule(5, [210, 276, 52])
).
proof_step(
    2,
    353,
    total_weight([battery, emergency_radio, medkit], 13),
    rule(5, [208, 276, 53])
).
proof_step(
    2,
    354,
    total_weight([atlas, emergency_radio, medkit], 11),
    rule(5, [206, 276, 54])
).
proof_step(2, 355, total_weight([camera, drone, medkit], 13), rule(5, [210, 277, 63])).
proof_step(2, 356, total_weight([battery, drone, medkit], 14), rule(5, [208, 277, 64])).
proof_step(2, 357, total_weight([atlas, drone, medkit], 12), rule(5, [206, 277, 65])).
proof_step(2, 358, total_weight([battery, camera, medkit], 11), rule(5, [208, 278, 36])).
proof_step(2, 359, total_weight([atlas, camera, medkit], 9), rule(5, [206, 278, 37])).
proof_step(2, 360, total_weight([atlas, battery, medkit], 10), rule(5, [206, 279, 57])).
proof_step(
    2,
    361,
    total_value([camera, field_laptop, medkit], 33),
    rule(6, [211, 281, 160])
).
proof_step(
    2,
    362,
    total_value([battery, field_laptop, medkit], 35),
    rule(6, [209, 281, 161])
).
proof_step(
    2,
    363,
    total_value([atlas, field_laptop, medkit], 31),
    rule(6, [207, 281, 162])
).
proof_step(
    2,
    364,
    total_value([drone, emergency_radio, medkit], 33),
    rule(6, [213, 282, 163])
).
proof_step(
    2,
    365,
    total_value([camera, emergency_radio, medkit], 28),
    rule(6, [211, 282, 154])
).
proof_step(
    2,
    366,
    total_value([battery, emergency_radio, medkit], 30),
    rule(6, [209, 282, 155])
).
proof_step(
    2,
    367,
    total_value([atlas, emergency_radio, medkit], 26),
    rule(6, [207, 282, 156])
).
proof_step(2, 368, total_value([camera, drone, medkit], 30), rule(6, [211, 283, 164])).
proof_step(2, 369, total_value([battery, drone, medkit], 32), rule(6, [209, 283, 165])).
proof_step(2, 370, total_value([atlas, drone, medkit], 28), rule(6, [207, 283, 166])).
proof_step(2, 371, total_value([battery, camera, medkit], 27), rule(6, [209, 284, 167])).
proof_step(2, 372, total_value([atlas, camera, medkit], 23), rule(6, [207, 284, 159])).
proof_step(2, 373, total_value([atlas, battery, medkit], 25), rule(6, [207, 285, 168])).
proof_step(
    2,
    374,
    total_weight([field_laptop, medkit, sensor], 13),
    rule(5, [216, 287, 47])
).
proof_step(
    2,
    375,
    total_weight([emergency_radio, medkit, sensor], 11),
    rule(5, [214, 287, 48])
).
proof_step(2, 376, total_weight([drone, medkit, sensor], 12), rule(5, [212, 287, 49])).
proof_step(2, 377, total_weight([camera, medkit, sensor], 9), rule(5, [210, 287, 42])).
proof_step(2, 378, total_weight([battery, medkit, sensor], 10), rule(5, [208, 287, 43])).
proof_step(2, 379, total_weight([atlas, medkit, sensor], 8), rule(5, [206, 287, 44])).
proof_step(
    2,
    380,
    total_weight([emergency_radio, field_laptop, sensor], 14),
    rule(5, [214, 288, 50])
).
proof_step(
    2,
    381,
    total_weight([drone, field_laptop, sensor], 15),
    rule(5, [212, 288, 51])
).
proof_step(
    2,
    382,
    total_weight([camera, field_laptop, sensor], 12),
    rule(5, [210, 288, 52])
).
proof_step(
    2,
    383,
    total_weight([battery, field_laptop, sensor], 13),
    rule(5, [208, 288, 53])
).
proof_step(
    2,
    384,
    total_weight([atlas, field_laptop, sensor], 11),
    rule(5, [206, 288, 54])
).
proof_step(
    2,
    385,
    total_weight([drone, emergency_radio, sensor], 13),
    rule(5, [212, 289, 34])
).
proof_step(
    2,
    386,
    total_weight([camera, emergency_radio, sensor], 10),
    rule(5, [210, 289, 35])
).
proof_step(
    2,
    387,
    total_weight([battery, emergency_radio, sensor], 11),
    rule(5, [208, 289, 36])
).
proof_step(
    2,
    388,
    total_weight([atlas, emergency_radio, sensor], 9),
    rule(5, [206, 289, 37])
).
proof_step(2, 389, total_weight([camera, drone, sensor], 11), rule(5, [210, 290, 55])).
proof_step(2, 390, total_weight([battery, drone, sensor], 12), rule(5, [208, 290, 56])).
proof_step(2, 391, total_weight([atlas, drone, sensor], 10), rule(5, [206, 290, 57])).
proof_step(2, 392, total_weight([battery, camera, sensor], 9), rule(5, [208, 291, 40])).
proof_step(2, 393, total_weight([atlas, camera, sensor], 7), rule(5, [206, 291, 41])).
proof_step(2, 394, total_weight([atlas, battery, sensor], 8), rule(5, [206, 292, 44])).
proof_step(
    2,
    395,
    total_value([field_laptop, medkit, sensor], 32),
    rule(6, [217, 294, 145])
).
proof_step(
    2,
    396,
    total_value([emergency_radio, medkit, sensor], 27),
    rule(6, [215, 294, 115])
).
proof_step(2, 397, total_value([drone, medkit, sensor], 29), rule(6, [213, 294, 116])).
proof_step(2, 398, total_value([camera, medkit, sensor], 24), rule(6, [211, 294, 117])).
proof_step(2, 399, total_value([battery, medkit, sensor], 26), rule(6, [209, 294, 118])).
proof_step(2, 400, total_value([atlas, medkit, sensor], 22), rule(6, [207, 294, 88])).
proof_step(
    2,
    401,
    total_value([emergency_radio, field_laptop, sensor], 34),
    rule(6, [215, 295, 146])
).
proof_step(
    2,
    402,
    total_value([drone, field_laptop, sensor], 36),
    rule(6, [213, 295, 147])
).
proof_step(
    2,
    403,
    total_value([camera, field_laptop, sensor], 31),
    rule(6, [211, 295, 148])
).
proof_step(
    2,
    404,
    total_value([battery, field_laptop, sensor], 33),
    rule(6, [209, 295, 149])
).
proof_step(
    2,
    405,
    total_value([atlas, field_laptop, sensor], 29),
    rule(6, [207, 295, 150])
).
proof_step(
    2,
    406,
    total_value([drone, emergency_radio, sensor], 31),
    rule(6, [213, 296, 151])
).
proof_step(
    2,
    407,
    total_value([camera, emergency_radio, sensor], 26),
    rule(6, [211, 296, 152])
).
proof_step(
    2,
    408,
    total_value([battery, emergency_radio, sensor], 28),
    rule(6, [209, 296, 153])
).
proof_step(
    2,
    409,
    total_value([atlas, emergency_radio, sensor], 24),
    rule(6, [207, 296, 127])
).
proof_step(2, 410, total_value([camera, drone, sensor], 28), rule(6, [211, 297, 154])).
proof_step(2, 411, total_value([battery, drone, sensor], 30), rule(6, [209, 297, 155])).
proof_step(2, 412, total_value([atlas, drone, sensor], 26), rule(6, [207, 297, 156])).
proof_step(2, 413, total_value([battery, camera, sensor], 25), rule(6, [209, 298, 157])).
proof_step(2, 414, total_value([atlas, camera, sensor], 21), rule(6, [207, 298, 158])).
proof_step(2, 415, total_value([atlas, battery, sensor], 23), rule(6, [207, 299, 159])).
proof_step(
    2,
    416,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [301])
).
proof_step(
    2,
    417,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit, sensor]
    ),
    rule(2, [301])
).
proof_step(
    2,
    418,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit, sensor]
    ),
    rule(1, [302])
).
proof_step(
    2,
    419,
    subset([emergency_radio, field_laptop, medkit, sensor], [medkit, sensor]),
    rule(2, [302])
).
proof_step(
    2,
    420,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, sensor]
    ),
    rule(1, [303])
).
proof_step(
    2,
    421,
    subset([emergency_radio, field_laptop, medkit, sensor], [field_laptop, sensor]),
    rule(2, [303])
).
proof_step(
    2,
    422,
    subset([emergency_radio, field_laptop, medkit, sensor], [emergency_radio, sensor]),
    rule(1, [304])
).
proof_step(
    2,
    423,
    subset([emergency_radio, field_laptop, medkit, sensor], [sensor]),
    rule(2, [304])
).
proof_step(
    2,
    424,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit]
    ),
    rule(1, [305])
).
proof_step(
    2,
    425,
    subset([emergency_radio, field_laptop, medkit, sensor], [field_laptop, medkit]),
    rule(2, [305])
).
proof_step(
    2,
    426,
    subset([emergency_radio, field_laptop, medkit, sensor], [emergency_radio, medkit]),
    rule(1, [306])
).
proof_step(
    2,
    427,
    subset([emergency_radio, field_laptop, medkit, sensor], [medkit]),
    rule(2, [306])
).
proof_step(
    2,
    428,
    subset(
        [emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop]
    ),
    rule(1, [307])
).
proof_step(
    2,
    429,
    subset([emergency_radio, field_laptop, medkit, sensor], [field_laptop]),
    rule(2, [307])
).
proof_step(
    2,
    430,
    subset([emergency_radio, field_laptop, medkit, sensor], [emergency_radio]),
    rule(1, [308])
).
proof_step(
    2,
    431,
    subset([emergency_radio, field_laptop, medkit, sensor], []),
    rule(2, [308])
).
proof_step(
    2,
    432,
    total_weight([atlas, battery, camera, drone], 15),
    rule(5, [206, 312, 72])
).
proof_step(
    2,
    433,
    total_value([atlas, battery, camera, drone], 37),
    rule(6, [207, 315, 192])
).
proof_step(
    2,
    434,
    total_weight([battery, camera, drone, emergency_radio], 18),
    rule(5, [208, 318, 83])
).
proof_step(
    2,
    435,
    total_weight([atlas, camera, drone, emergency_radio], 16),
    rule(5, [206, 318, 84])
).
proof_step(
    2,
    436,
    total_weight([atlas, battery, drone, emergency_radio], 17),
    rule(5, [206, 319, 87])
).
proof_step(
    2,
    437,
    total_weight([atlas, battery, camera, emergency_radio], 14),
    rule(5, [206, 321, 69])
).
proof_step(
    2,
    438,
    total_value([atlas, battery, camera, emergency_radio], 35),
    rule(6, [207, 327, 171])
).
proof_step(
    2,
    439,
    total_weight([camera, drone, emergency_radio, field_laptop], 21),
    rule(5, [210, 330, 95])
).
proof_step(
    2,
    440,
    total_weight([battery, drone, emergency_radio, field_laptop], 22),
    rule(5, [208, 330, 96])
).
proof_step(
    2,
    441,
    total_weight([atlas, drone, emergency_radio, field_laptop], 20),
    rule(5, [206, 330, 97])
).
proof_step(
    2,
    442,
    total_weight([battery, camera, emergency_radio, field_laptop], 19),
    rule(5, [208, 331, 86])
).
proof_step(
    2,
    443,
    total_weight([atlas, camera, emergency_radio, field_laptop], 17),
    rule(5, [206, 331, 87])
).
proof_step(
    2,
    444,
    total_weight([atlas, battery, emergency_radio, field_laptop], 18),
    rule(5, [206, 332, 91])
).
proof_step(
    2,
    445,
    total_weight([battery, camera, drone, field_laptop], 20),
    rule(5, [208, 334, 90])
).
proof_step(
    2,
    446,
    total_weight([atlas, camera, drone, field_laptop], 18),
    rule(5, [206, 334, 91])
).
proof_step(
    2,
    447,
    total_weight([atlas, battery, drone, field_laptop], 19),
    rule(5, [206, 335, 94])
).
proof_step(
    2,
    448,
    total_weight([atlas, battery, camera, field_laptop], 16),
    rule(5, [206, 337, 84])
).
proof_step(
    2,
    449,
    total_weight([drone, emergency_radio, field_laptop, medkit], 22),
    rule(5, [212, 346, 88])
).
proof_step(
    2,
    450,
    total_weight([camera, emergency_radio, field_laptop, medkit], 19),
    rule(5, [210, 346, 89])
).
proof_step(
    2,
    451,
    total_weight([battery, emergency_radio, field_laptop, medkit], 20),
    rule(5, [208, 346, 90])
).
proof_step(
    2,
    452,
    total_weight([atlas, emergency_radio, field_laptop, medkit], 18),
    rule(5, [206, 346, 91])
).
proof_step(
    2,
    453,
    total_weight([camera, drone, field_laptop, medkit], 20),
    rule(5, [210, 347, 92])
).
proof_step(
    2,
    454,
    total_weight([battery, drone, field_laptop, medkit], 21),
    rule(5, [208, 347, 93])
).
proof_step(
    2,
    455,
    total_weight([atlas, drone, field_laptop, medkit], 19),
    rule(5, [206, 347, 94])
).
proof_step(
    2,
    456,
    total_weight([battery, camera, field_laptop, medkit], 18),
    rule(5, [208, 348, 83])
).
proof_step(
    2,
    457,
    total_weight([atlas, camera, field_laptop, medkit], 16),
    rule(5, [206, 348, 84])
).
proof_step(
    2,
    458,
    total_weight([atlas, battery, field_laptop, medkit], 17),
    rule(5, [206, 349, 87])
).
proof_step(
    2,
    459,
    total_weight([camera, drone, emergency_radio, medkit], 18),
    rule(5, [210, 351, 85])
).
proof_step(
    2,
    460,
    total_weight([battery, drone, emergency_radio, medkit], 19),
    rule(5, [208, 351, 86])
).
proof_step(
    2,
    461,
    total_weight([atlas, drone, emergency_radio, medkit], 17),
    rule(5, [206, 351, 87])
).
proof_step(
    2,
    462,
    total_weight([battery, camera, emergency_radio, medkit], 16),
    rule(5, [208, 352, 68])
).
proof_step(
    2,
    463,
    total_weight([atlas, camera, emergency_radio, medkit], 14),
    rule(5, [206, 352, 69])
).
proof_step(
    2,
    464,
    total_weight([atlas, battery, emergency_radio, medkit], 15),
    rule(5, [206, 353, 72])
).
proof_step(
    2,
    465,
    total_weight([battery, camera, drone, medkit], 17),
    rule(5, [208, 355, 71])
).
proof_step(
    2,
    466,
    total_weight([atlas, camera, drone, medkit], 15),
    rule(5, [206, 355, 72])
).
proof_step(
    2,
    467,
    total_weight([atlas, battery, drone, medkit], 16),
    rule(5, [206, 356, 84])
).
proof_step(
    2,
    468,
    total_weight([atlas, battery, camera, medkit], 13),
    rule(5, [206, 358, 62])
).
proof_step(
    2,
    469,
    total_value([atlas, camera, emergency_radio, medkit], 34),
    rule(6, [207, 365, 195])
).
proof_step(
    2,
    470,
    total_value([atlas, battery, emergency_radio, medkit], 36),
    rule(6, [207, 366, 197])
).
proof_step(
    2,
    471,
    total_value([atlas, camera, drone, medkit], 36),
    rule(6, [207, 368, 197])
).
proof_step(
    2,
    472,
    total_value([atlas, battery, camera, medkit], 33),
    rule(6, [207, 371, 170])
).
proof_step(
    2,
    473,
    total_weight([emergency_radio, field_laptop, medkit, sensor], 18),
    rule(5, [214, 374, 79])
).
proof_step(
    2,
    474,
    total_weight([drone, field_laptop, medkit, sensor], 19),
    rule(5, [212, 374, 80])
).
proof_step(
    2,
    475,
    total_weight([camera, field_laptop, medkit, sensor], 16),
    rule(5, [210, 374, 70])
).
proof_step(
    2,
    476,
    total_weight([battery, field_laptop, medkit, sensor], 17),
    rule(5, [208, 374, 71])
).
proof_step(
    2,
    477,
    total_weight([atlas, field_laptop, medkit, sensor], 15),
    rule(5, [206, 374, 72])
).
proof_step(
    2,
    478,
    total_weight([drone, emergency_radio, medkit, sensor], 17),
    rule(5, [212, 375, 59])
).
proof_step(
    2,
    479,
    total_weight([camera, emergency_radio, medkit, sensor], 14),
    rule(5, [210, 375, 60])
).
proof_step(
    2,
    480,
    total_weight([battery, emergency_radio, medkit, sensor], 15),
    rule(5, [208, 375, 61])
).
proof_step(
    2,
    481,
    total_weight([atlas, emergency_radio, medkit, sensor], 13),
    rule(5, [206, 375, 62])
).
proof_step(
    2,
    482,
    total_weight([camera, drone, medkit, sensor], 15),
    rule(5, [210, 376, 67])
).
proof_step(
    2,
    483,
    total_weight([battery, drone, medkit, sensor], 16),
    rule(5, [208, 376, 68])
).
proof_step(
    2,
    484,
    total_weight([atlas, drone, medkit, sensor], 14),
    rule(5, [206, 376, 69])
).
proof_step(
    2,
    485,
    total_weight([battery, camera, medkit, sensor], 13),
    rule(5, [208, 377, 53])
).
proof_step(
    2,
    486,
    total_weight([atlas, camera, medkit, sensor], 11),
    rule(5, [206, 377, 54])
).
proof_step(
    2,
    487,
    total_weight([atlas, battery, medkit, sensor], 12),
    rule(5, [206, 378, 65])
).
proof_step(
    2,
    488,
    total_weight([drone, emergency_radio, field_laptop, sensor], 20),
    rule(5, [212, 380, 81])
).
proof_step(
    2,
    489,
    total_weight([camera, emergency_radio, field_laptop, sensor], 17),
    rule(5, [210, 380, 82])
).
proof_step(
    2,
    490,
    total_weight([battery, emergency_radio, field_laptop, sensor], 18),
    rule(5, [208, 380, 83])
).
proof_step(
    2,
    491,
    total_weight([atlas, emergency_radio, field_laptop, sensor], 16),
    rule(5, [206, 380, 84])
).
proof_step(
    2,
    492,
    total_weight([camera, drone, field_laptop, sensor], 18),
    rule(5, [210, 381, 85])
).
proof_step(
    2,
    493,
    total_weight([battery, drone, field_laptop, sensor], 19),
    rule(5, [208, 381, 86])
).
proof_step(
    2,
    494,
    total_weight([atlas, drone, field_laptop, sensor], 17),
    rule(5, [206, 381, 87])
).
proof_step(
    2,
    495,
    total_weight([battery, camera, field_laptop, sensor], 16),
    rule(5, [208, 382, 68])
).
proof_step(
    2,
    496,
    total_weight([atlas, camera, field_laptop, sensor], 14),
    rule(5, [206, 382, 69])
).
proof_step(
    2,
    497,
    total_weight([atlas, battery, field_laptop, sensor], 15),
    rule(5, [206, 383, 72])
).
proof_step(
    2,
    498,
    total_weight([camera, drone, emergency_radio, sensor], 16),
    rule(5, [210, 385, 70])
).
proof_step(
    2,
    499,
    total_weight([battery, drone, emergency_radio, sensor], 17),
    rule(5, [208, 385, 71])
).
proof_step(
    2,
    500,
    total_weight([atlas, drone, emergency_radio, sensor], 15),
    rule(5, [206, 385, 72])
).
proof_step(
    2,
    501,
    total_weight([battery, camera, emergency_radio, sensor], 14),
    rule(5, [208, 386, 64])
).
proof_step(
    2,
    502,
    total_weight([atlas, camera, emergency_radio, sensor], 12),
    rule(5, [206, 386, 65])
).
proof_step(
    2,
    503,
    total_weight([atlas, battery, emergency_radio, sensor], 13),
    rule(5, [206, 387, 62])
).
proof_step(
    2,
    504,
    total_weight([battery, camera, drone, sensor], 15),
    rule(5, [208, 389, 61])
).
proof_step(
    2,
    505,
    total_weight([atlas, camera, drone, sensor], 13),
    rule(5, [206, 389, 62])
).
proof_step(
    2,
    506,
    total_weight([atlas, battery, drone, sensor], 14),
    rule(5, [206, 390, 69])
).
proof_step(
    2,
    507,
    total_weight([atlas, battery, camera, sensor], 11),
    rule(5, [206, 392, 54])
).
proof_step(
    2,
    508,
    total_value([atlas, field_laptop, medkit, sensor], 38),
    rule(6, [207, 395, 189])
).
proof_step(
    2,
    509,
    total_value([camera, emergency_radio, medkit, sensor], 35),
    rule(6, [211, 396, 169])
).
proof_step(
    2,
    510,
    total_value([battery, emergency_radio, medkit, sensor], 37),
    rule(6, [209, 396, 190])
).
proof_step(
    2,
    511,
    total_value([atlas, emergency_radio, medkit, sensor], 33),
    rule(6, [207, 396, 170])
).
proof_step(
    2,
    512,
    total_value([camera, drone, medkit, sensor], 37),
    rule(6, [211, 397, 191])
).
proof_step(
    2,
    513,
    total_value([atlas, drone, medkit, sensor], 35),
    rule(6, [207, 397, 171])
).
proof_step(
    2,
    514,
    total_value([battery, camera, medkit, sensor], 34),
    rule(6, [209, 398, 172])
).
proof_step(
    2,
    515,
    total_value([atlas, camera, medkit, sensor], 30),
    rule(6, [207, 398, 173])
).
proof_step(
    2,
    516,
    total_value([atlas, battery, medkit, sensor], 32),
    rule(6, [207, 399, 174])
).
proof_step(
    2,
    517,
    total_value([atlas, camera, field_laptop, sensor], 37),
    rule(6, [207, 403, 192])
).
proof_step(
    2,
    518,
    total_value([atlas, battery, field_laptop, sensor], 39),
    rule(6, [207, 404, 193])
).
proof_step(
    2,
    519,
    total_value([atlas, drone, emergency_radio, sensor], 37),
    rule(6, [207, 406, 192])
).
proof_step(
    2,
    520,
    total_value([battery, camera, emergency_radio, sensor], 36),
    rule(6, [209, 407, 194])
).
proof_step(
    2,
    521,
    total_value([atlas, camera, emergency_radio, sensor], 32),
    rule(6, [207, 407, 174])
).
proof_step(
    2,
    522,
    total_value([atlas, battery, emergency_radio, sensor], 34),
    rule(6, [207, 408, 195])
).
proof_step(
    2,
    523,
    total_value([battery, camera, drone, sensor], 38),
    rule(6, [209, 410, 196])
).
proof_step(
    2,
    524,
    total_value([atlas, camera, drone, sensor], 34),
    rule(6, [207, 410, 195])
).
proof_step(
    2,
    525,
    total_value([atlas, battery, drone, sensor], 36),
    rule(6, [207, 411, 197])
).
proof_step(
    2,
    526,
    total_value([atlas, battery, camera, sensor], 31),
    rule(6, [207, 413, 162])
).
proof_step(
    2,
    527,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [416])
).
proof_step(
    2,
    528,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [416])
).
proof_step(
    2,
    529,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit, sensor]
    ),
    rule(1, [417])
).
proof_step(
    2,
    530,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit, sensor]
    ),
    rule(2, [417])
).
proof_step(
    2,
    531,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [418])
).
proof_step(
    2,
    532,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit, sensor]
    ),
    rule(2, [418])
).
proof_step(
    2,
    533,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit, sensor]
    ),
    rule(1, [419])
).
proof_step(
    2,
    534,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [medkit, sensor]),
    rule(2, [419])
).
proof_step(
    2,
    535,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [420])
).
proof_step(
    2,
    536,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, sensor]
    ),
    rule(2, [420])
).
proof_step(
    2,
    537,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, sensor]
    ),
    rule(1, [421])
).
proof_step(
    2,
    538,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, sensor]
    ),
    rule(2, [421])
).
proof_step(
    2,
    539,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, sensor]
    ),
    rule(1, [422])
).
proof_step(
    2,
    540,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, sensor]
    ),
    rule(2, [422])
).
proof_step(
    2,
    541,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [drone, sensor]),
    rule(1, [423])
).
proof_step(
    2,
    542,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [sensor]),
    rule(2, [423])
).
proof_step(
    2,
    543,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [424])
).
proof_step(
    2,
    544,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit]
    ),
    rule(2, [424])
).
proof_step(
    2,
    545,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit]
    ),
    rule(1, [425])
).
proof_step(
    2,
    546,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit]
    ),
    rule(2, [425])
).
proof_step(
    2,
    547,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit]
    ),
    rule(1, [426])
).
proof_step(
    2,
    548,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit]
    ),
    rule(2, [426])
).
proof_step(
    2,
    549,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [drone, medkit]),
    rule(1, [427])
).
proof_step(
    2,
    550,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [medkit]),
    rule(2, [427])
).
proof_step(
    2,
    551,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop]
    ),
    rule(1, [428])
).
proof_step(
    2,
    552,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop]
    ),
    rule(2, [428])
).
proof_step(
    2,
    553,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop]
    ),
    rule(1, [429])
).
proof_step(
    2,
    554,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [field_laptop]),
    rule(2, [429])
).
proof_step(
    2,
    555,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio]
    ),
    rule(1, [430])
).
proof_step(
    2,
    556,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [emergency_radio]),
    rule(2, [430])
).
proof_step(
    2,
    557,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], [drone]),
    rule(1, [431])
).
proof_step(
    2,
    558,
    subset([drone, emergency_radio, field_laptop, medkit, sensor], []),
    rule(2, [431])
).
proof_step(
    2,
    559,
    total_weight([atlas, battery, camera, drone, emergency_radio], 20),
    rule(5, [206, 434, 97])
).
proof_step(
    2,
    560,
    total_weight([battery, camera, drone, emergency_radio, field_laptop], 25),
    rule(5, [208, 439, 138])
).
proof_step(
    2,
    561,
    total_weight([atlas, camera, drone, emergency_radio, field_laptop], 23),
    rule(5, [206, 439, 137])
).
proof_step(
    2,
    562,
    total_weight([atlas, battery, drone, emergency_radio, field_laptop], 24),
    rule(5, [206, 440, 136])
).
proof_step(
    2,
    563,
    total_weight([atlas, battery, camera, emergency_radio, field_laptop], 21),
    rule(5, [206, 442, 130])
).
proof_step(
    2,
    564,
    total_weight([atlas, battery, camera, drone, field_laptop], 22),
    rule(5, [206, 445, 133])
).
proof_step(
    2,
    565,
    total_weight([camera, drone, emergency_radio, field_laptop, medkit], 25),
    rule(5, [210, 449, 134])
).
proof_step(
    2,
    566,
    total_weight([battery, drone, emergency_radio, field_laptop, medkit], 26),
    rule(5, [208, 449, 135])
).
proof_step(
    2,
    567,
    total_weight([atlas, drone, emergency_radio, field_laptop, medkit], 24),
    rule(5, [206, 449, 136])
).
proof_step(
    2,
    568,
    total_weight([battery, camera, emergency_radio, field_laptop, medkit], 23),
    rule(5, [208, 450, 129])
).
proof_step(
    2,
    569,
    total_weight([atlas, camera, emergency_radio, field_laptop, medkit], 21),
    rule(5, [206, 450, 130])
).
proof_step(
    2,
    570,
    total_weight([atlas, battery, emergency_radio, field_laptop, medkit], 22),
    rule(5, [206, 451, 133])
).
proof_step(
    2,
    571,
    total_weight([battery, camera, drone, field_laptop, medkit], 24),
    rule(5, [208, 453, 132])
).
proof_step(
    2,
    572,
    total_weight([atlas, camera, drone, field_laptop, medkit], 22),
    rule(5, [206, 453, 133])
).
proof_step(
    2,
    573,
    total_weight([atlas, battery, drone, field_laptop, medkit], 23),
    rule(5, [206, 454, 137])
).
proof_step(
    2,
    574,
    total_weight([atlas, battery, camera, field_laptop, medkit], 20),
    rule(5, [206, 456, 97])
).
proof_step(
    2,
    575,
    total_weight([battery, camera, drone, emergency_radio, medkit], 22),
    rule(5, [208, 459, 96])
).
proof_step(
    2,
    576,
    total_weight([atlas, camera, drone, emergency_radio, medkit], 20),
    rule(5, [206, 459, 97])
).
proof_step(
    2,
    577,
    total_weight([atlas, battery, drone, emergency_radio, medkit], 21),
    rule(5, [206, 460, 130])
).
proof_step(
    2,
    578,
    total_weight([atlas, battery, camera, emergency_radio, medkit], 18),
    rule(5, [206, 462, 91])
).
proof_step(
    2,
    579,
    total_weight([atlas, battery, camera, drone, medkit], 19),
    rule(5, [206, 465, 94])
).
proof_step(
    2,
    580,
    total_weight([drone, emergency_radio, field_laptop, medkit, sensor], 24),
    rule(5, [212, 473, 127])
).
proof_step(
    2,
    581,
    total_weight([camera, emergency_radio, field_laptop, medkit, sensor], 21),
    rule(5, [210, 473, 95])
).
proof_step(
    2,
    582,
    total_weight([battery, emergency_radio, field_laptop, medkit, sensor], 22),
    rule(5, [208, 473, 96])
).
proof_step(
    2,
    583,
    total_weight([atlas, emergency_radio, field_laptop, medkit, sensor], 20),
    rule(5, [206, 473, 97])
).
proof_step(
    2,
    584,
    total_weight([camera, drone, field_laptop, medkit, sensor], 22),
    rule(5, [210, 474, 128])
).
proof_step(
    2,
    585,
    total_weight([battery, drone, field_laptop, medkit, sensor], 23),
    rule(5, [208, 474, 129])
).
proof_step(
    2,
    586,
    total_weight([atlas, drone, field_laptop, medkit, sensor], 21),
    rule(5, [206, 474, 130])
).
proof_step(
    2,
    587,
    total_weight([battery, camera, field_laptop, medkit, sensor], 20),
    rule(5, [208, 475, 90])
).
proof_step(
    2,
    588,
    total_weight([atlas, camera, field_laptop, medkit, sensor], 18),
    rule(5, [206, 475, 91])
).
proof_step(
    2,
    589,
    total_weight([atlas, battery, field_laptop, medkit, sensor], 19),
    rule(5, [206, 476, 94])
).
proof_step(
    2,
    590,
    total_weight([camera, drone, emergency_radio, medkit, sensor], 20),
    rule(5, [210, 478, 92])
).
proof_step(
    2,
    591,
    total_weight([battery, drone, emergency_radio, medkit, sensor], 21),
    rule(5, [208, 478, 93])
).
proof_step(
    2,
    592,
    total_weight([atlas, drone, emergency_radio, medkit, sensor], 19),
    rule(5, [206, 478, 94])
).
proof_step(
    2,
    593,
    total_weight([battery, camera, emergency_radio, medkit, sensor], 18),
    rule(5, [208, 479, 83])
).
proof_step(
    2,
    594,
    total_weight([atlas, camera, emergency_radio, medkit, sensor], 16),
    rule(5, [206, 479, 84])
).
proof_step(
    2,
    595,
    total_weight([atlas, battery, emergency_radio, medkit, sensor], 17),
    rule(5, [206, 480, 87])
).
proof_step(
    2,
    596,
    total_weight([battery, camera, drone, medkit, sensor], 19),
    rule(5, [208, 482, 86])
).
proof_step(
    2,
    597,
    total_weight([atlas, camera, drone, medkit, sensor], 17),
    rule(5, [206, 482, 87])
).
proof_step(
    2,
    598,
    total_weight([atlas, battery, drone, medkit, sensor], 18),
    rule(5, [206, 483, 91])
).
proof_step(
    2,
    599,
    total_weight([atlas, battery, camera, medkit, sensor], 15),
    rule(5, [206, 485, 72])
).
proof_step(
    2,
    600,
    total_weight([camera, drone, emergency_radio, field_laptop, sensor], 23),
    rule(5, [210, 488, 131])
).
proof_step(
    2,
    601,
    total_weight([battery, drone, emergency_radio, field_laptop, sensor], 24),
    rule(5, [208, 488, 132])
).
proof_step(
    2,
    602,
    total_weight([atlas, drone, emergency_radio, field_laptop, sensor], 22),
    rule(5, [206, 488, 133])
).
proof_step(
    2,
    603,
    total_weight([battery, camera, emergency_radio, field_laptop, sensor], 21),
    rule(5, [208, 489, 93])
).
proof_step(
    2,
    604,
    total_weight([atlas, camera, emergency_radio, field_laptop, sensor], 19),
    rule(5, [206, 489, 94])
).
proof_step(
    2,
    605,
    total_weight([atlas, battery, emergency_radio, field_laptop, sensor], 20),
    rule(5, [206, 490, 97])
).
proof_step(
    2,
    606,
    total_weight([battery, camera, drone, field_laptop, sensor], 22),
    rule(5, [208, 492, 96])
).
proof_step(
    2,
    607,
    total_weight([atlas, camera, drone, field_laptop, sensor], 20),
    rule(5, [206, 492, 97])
).
proof_step(
    2,
    608,
    total_weight([atlas, battery, drone, field_laptop, sensor], 21),
    rule(5, [206, 493, 130])
).
proof_step(
    2,
    609,
    total_weight([atlas, battery, camera, field_laptop, sensor], 18),
    rule(5, [206, 495, 91])
).
proof_step(
    2,
    610,
    total_weight([battery, camera, drone, emergency_radio, sensor], 20),
    rule(5, [208, 498, 90])
).
proof_step(
    2,
    611,
    total_weight([atlas, camera, drone, emergency_radio, sensor], 18),
    rule(5, [206, 498, 91])
).
proof_step(
    2,
    612,
    total_weight([atlas, battery, drone, emergency_radio, sensor], 19),
    rule(5, [206, 499, 94])
).
proof_step(
    2,
    613,
    total_weight([atlas, battery, camera, emergency_radio, sensor], 16),
    rule(5, [206, 501, 84])
).
proof_step(
    2,
    614,
    total_weight([atlas, battery, camera, drone, sensor], 17),
    rule(5, [206, 504, 87])
).
proof_step(
    2,
    615,
    total_value([atlas, battery, camera, medkit, sensor], 40),
    rule(6, [207, 514, 202])
).
proof_step(
    2,
    616,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [527])
).
proof_step(
    2,
    617,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [527])
).
proof_step(
    2,
    618,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [528])
).
proof_step(
    2,
    619,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [528])
).
proof_step(
    2,
    620,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [529])
).
proof_step(
    2,
    621,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit, sensor]
    ),
    rule(2, [529])
).
proof_step(
    2,
    622,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit, sensor]
    ),
    rule(1, [530])
).
proof_step(
    2,
    623,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit, sensor]
    ),
    rule(2, [530])
).
proof_step(
    2,
    624,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [531])
).
proof_step(
    2,
    625,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [531])
).
proof_step(
    2,
    626,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit, sensor]
    ),
    rule(1, [532])
).
proof_step(
    2,
    627,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit, sensor]
    ),
    rule(2, [532])
).
proof_step(
    2,
    628,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit, sensor]
    ),
    rule(1, [533])
).
proof_step(
    2,
    629,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit, sensor]
    ),
    rule(2, [533])
).
proof_step(
    2,
    630,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit, sensor]
    ),
    rule(1, [534])
).
proof_step(
    2,
    631,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [medkit, sensor]
    ),
    rule(2, [534])
).
proof_step(
    2,
    632,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [535])
).
proof_step(
    2,
    633,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [535])
).
proof_step(
    2,
    634,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [536])
).
proof_step(
    2,
    635,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, sensor]
    ),
    rule(2, [536])
).
proof_step(
    2,
    636,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, sensor]
    ),
    rule(1, [537])
).
proof_step(
    2,
    637,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, sensor]
    ),
    rule(2, [537])
).
proof_step(
    2,
    638,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, sensor]
    ),
    rule(1, [538])
).
proof_step(
    2,
    639,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, sensor]
    ),
    rule(2, [538])
).
proof_step(
    2,
    640,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, sensor]
    ),
    rule(1, [539])
).
proof_step(
    2,
    641,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, sensor]
    ),
    rule(2, [539])
).
proof_step(
    2,
    642,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, sensor]
    ),
    rule(1, [540])
).
proof_step(
    2,
    643,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, sensor]
    ),
    rule(2, [540])
).
proof_step(
    2,
    644,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, sensor]
    ),
    rule(1, [541])
).
proof_step(
    2,
    645,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, sensor]
    ),
    rule(2, [541])
).
proof_step(
    2,
    646,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, sensor]
    ),
    rule(1, [542])
).
proof_step(
    2,
    647,
    subset([camera, drone, emergency_radio, field_laptop, medkit, sensor], [sensor]),
    rule(2, [542])
).
proof_step(
    2,
    648,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [543])
).
proof_step(
    2,
    649,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [543])
).
proof_step(
    2,
    650,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [544])
).
proof_step(
    2,
    651,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit]
    ),
    rule(2, [544])
).
proof_step(
    2,
    652,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit]
    ),
    rule(1, [545])
).
proof_step(
    2,
    653,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit]
    ),
    rule(2, [545])
).
proof_step(
    2,
    654,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit]
    ),
    rule(1, [546])
).
proof_step(
    2,
    655,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit]
    ),
    rule(2, [546])
).
proof_step(
    2,
    656,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit]
    ),
    rule(1, [547])
).
proof_step(
    2,
    657,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit]
    ),
    rule(2, [547])
).
proof_step(
    2,
    658,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit]
    ),
    rule(1, [548])
).
proof_step(
    2,
    659,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit]
    ),
    rule(2, [548])
).
proof_step(
    2,
    660,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit]
    ),
    rule(1, [549])
).
proof_step(
    2,
    661,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit]
    ),
    rule(2, [549])
).
proof_step(
    2,
    662,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit]
    ),
    rule(1, [550])
).
proof_step(
    2,
    663,
    subset([camera, drone, emergency_radio, field_laptop, medkit, sensor], [medkit]),
    rule(2, [550])
).
proof_step(
    2,
    664,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop]
    ),
    rule(1, [551])
).
proof_step(
    2,
    665,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop]
    ),
    rule(2, [551])
).
proof_step(
    2,
    666,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop]
    ),
    rule(1, [552])
).
proof_step(
    2,
    667,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop]
    ),
    rule(2, [552])
).
proof_step(
    2,
    668,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop]
    ),
    rule(1, [553])
).
proof_step(
    2,
    669,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop]
    ),
    rule(2, [553])
).
proof_step(
    2,
    670,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop]
    ),
    rule(1, [554])
).
proof_step(
    2,
    671,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop]
    ),
    rule(2, [554])
).
proof_step(
    2,
    672,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio]
    ),
    rule(1, [555])
).
proof_step(
    2,
    673,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio]
    ),
    rule(2, [555])
).
proof_step(
    2,
    674,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio]
    ),
    rule(1, [556])
).
proof_step(
    2,
    675,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio]
    ),
    rule(2, [556])
).
proof_step(
    2,
    676,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone]
    ),
    rule(1, [557])
).
proof_step(
    2,
    677,
    subset([camera, drone, emergency_radio, field_laptop, medkit, sensor], [drone]),
    rule(2, [557])
).
proof_step(
    2,
    678,
    subset([camera, drone, emergency_radio, field_laptop, medkit, sensor], [camera]),
    rule(1, [558])
).
proof_step(
    2,
    679,
    subset([camera, drone, emergency_radio, field_laptop, medkit, sensor], []),
    rule(2, [558])
).
proof_step(
    2,
    680,
    total_weight([atlas, battery, camera, drone, emergency_radio, field_laptop], 27),
    rule(5, [206, 560, 185])
).
proof_step(
    2,
    681,
    total_weight([battery, camera, drone, emergency_radio, field_laptop, medkit], 29),
    rule(5, [208, 565, 184])
).
proof_step(
    2,
    682,
    total_weight([atlas, camera, drone, emergency_radio, field_laptop, medkit], 27),
    rule(5, [206, 565, 185])
).
proof_step(
    2,
    683,
    total_weight([atlas, battery, drone, emergency_radio, field_laptop, medkit], 28),
    rule(5, [206, 566, 186])
).
proof_step(
    2,
    684,
    total_weight([atlas, battery, camera, emergency_radio, field_laptop, medkit], 25),
    rule(5, [206, 568, 182])
).
proof_step(
    2,
    685,
    total_weight([atlas, battery, camera, drone, field_laptop, medkit], 26),
    rule(5, [206, 571, 181])
).
proof_step(
    2,
    686,
    total_weight([atlas, battery, camera, drone, emergency_radio, medkit], 24),
    rule(5, [206, 575, 136])
).
proof_step(
    2,
    687,
    total_weight([camera, drone, emergency_radio, field_laptop, medkit, sensor], 27),
    rule(5, [210, 580, 179])
).
proof_step(
    2,
    688,
    total_weight([battery, drone, emergency_radio, field_laptop, medkit, sensor], 28),
    rule(5, [208, 580, 180])
).
proof_step(
    2,
    689,
    total_weight([atlas, drone, emergency_radio, field_laptop, medkit, sensor], 26),
    rule(5, [206, 580, 181])
).
proof_step(
    2,
    690,
    total_weight([battery, camera, emergency_radio, field_laptop, medkit, sensor], 25),
    rule(5, [208, 581, 138])
).
proof_step(
    2,
    691,
    total_weight([atlas, camera, emergency_radio, field_laptop, medkit, sensor], 23),
    rule(5, [206, 581, 137])
).
proof_step(
    2,
    692,
    total_weight([atlas, battery, emergency_radio, field_laptop, medkit, sensor], 24),
    rule(5, [206, 582, 136])
).
proof_step(
    2,
    693,
    total_weight([battery, camera, drone, field_laptop, medkit, sensor], 26),
    rule(5, [208, 584, 135])
).
proof_step(
    2,
    694,
    total_weight([atlas, camera, drone, field_laptop, medkit, sensor], 24),
    rule(5, [206, 584, 136])
).
proof_step(
    2,
    695,
    total_weight([atlas, battery, drone, field_laptop, medkit, sensor], 25),
    rule(5, [206, 585, 182])
).
proof_step(
    2,
    696,
    total_weight([atlas, battery, camera, field_laptop, medkit, sensor], 22),
    rule(5, [206, 587, 133])
).
proof_step(
    2,
    697,
    total_weight([battery, camera, drone, emergency_radio, medkit, sensor], 24),
    rule(5, [208, 590, 132])
).
proof_step(
    2,
    698,
    total_weight([atlas, camera, drone, emergency_radio, medkit, sensor], 22),
    rule(5, [206, 590, 133])
).
proof_step(
    2,
    699,
    total_weight([atlas, battery, drone, emergency_radio, medkit, sensor], 23),
    rule(5, [206, 591, 137])
).
proof_step(
    2,
    700,
    total_weight([atlas, battery, camera, emergency_radio, medkit, sensor], 20),
    rule(5, [206, 593, 97])
).
proof_step(
    2,
    701,
    total_weight([atlas, battery, camera, drone, medkit, sensor], 21),
    rule(5, [206, 596, 130])
).
proof_step(
    2,
    702,
    total_weight([battery, camera, drone, emergency_radio, field_laptop, sensor], 27),
    rule(5, [208, 600, 183])
).
proof_step(
    2,
    703,
    total_weight([atlas, camera, drone, emergency_radio, field_laptop, sensor], 25),
    rule(5, [206, 600, 182])
).
proof_step(
    2,
    704,
    total_weight([atlas, battery, drone, emergency_radio, field_laptop, sensor], 26),
    rule(5, [206, 601, 181])
).
proof_step(
    2,
    705,
    total_weight([atlas, battery, camera, emergency_radio, field_laptop, sensor], 23),
    rule(5, [206, 603, 137])
).
proof_step(
    2,
    706,
    total_weight([atlas, battery, camera, drone, field_laptop, sensor], 24),
    rule(5, [206, 606, 136])
).
proof_step(
    2,
    707,
    total_weight([atlas, battery, camera, drone, emergency_radio, sensor], 22),
    rule(5, [206, 610, 133])
).
proof_step(
    2,
    708,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [616])
).
proof_step(
    2,
    709,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [616])
).
proof_step(
    2,
    710,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [617])
).
proof_step(
    2,
    711,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [617])
).
proof_step(
    2,
    712,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [618])
).
proof_step(
    2,
    713,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [618])
).
proof_step(
    2,
    714,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [619])
).
proof_step(
    2,
    715,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [619])
).
proof_step(
    2,
    716,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [620])
).
proof_step(
    2,
    717,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit, sensor]
    ),
    rule(2, [620])
).
proof_step(
    2,
    718,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [621])
).
proof_step(
    2,
    719,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit, sensor]
    ),
    rule(2, [621])
).
proof_step(
    2,
    720,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, medkit, sensor]
    ),
    rule(1, [622])
).
proof_step(
    2,
    721,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit, sensor]
    ),
    rule(2, [622])
).
proof_step(
    2,
    722,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, medkit, sensor]
    ),
    rule(1, [623])
).
proof_step(
    2,
    723,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit, sensor]
    ),
    rule(2, [623])
).
proof_step(
    2,
    724,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [624])
).
proof_step(
    2,
    725,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [624])
).
proof_step(
    2,
    726,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [625])
).
proof_step(
    2,
    727,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [625])
).
proof_step(
    2,
    728,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, medkit, sensor]
    ),
    rule(1, [626])
).
proof_step(
    2,
    729,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit, sensor]
    ),
    rule(2, [626])
).
proof_step(
    2,
    730,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, medkit, sensor]
    ),
    rule(1, [627])
).
proof_step(
    2,
    731,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit, sensor]
    ),
    rule(2, [627])
).
proof_step(
    2,
    732,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, medkit, sensor]
    ),
    rule(1, [628])
).
proof_step(
    2,
    733,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit, sensor]
    ),
    rule(2, [628])
).
proof_step(
    2,
    734,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, medkit, sensor]
    ),
    rule(1, [629])
).
proof_step(
    2,
    735,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit, sensor]
    ),
    rule(2, [629])
).
proof_step(
    2,
    736,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, medkit, sensor]
    ),
    rule(1, [630])
).
proof_step(
    2,
    737,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit, sensor]
    ),
    rule(2, [630])
).
proof_step(
    2,
    738,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, medkit, sensor]
    ),
    rule(1, [631])
).
proof_step(
    2,
    739,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [medkit, sensor]
    ),
    rule(2, [631])
).
proof_step(
    2,
    740,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [632])
).
proof_step(
    2,
    741,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [632])
).
proof_step(
    2,
    742,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [633])
).
proof_step(
    2,
    743,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [633])
).
proof_step(
    2,
    744,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [634])
).
proof_step(
    2,
    745,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [634])
).
proof_step(
    2,
    746,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [635])
).
proof_step(
    2,
    747,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, sensor]
    ),
    rule(2, [635])
).
proof_step(
    2,
    748,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, sensor]
    ),
    rule(1, [636])
).
proof_step(
    2,
    749,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, sensor]
    ),
    rule(2, [636])
).
proof_step(
    2,
    750,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, sensor]
    ),
    rule(1, [637])
).
proof_step(
    2,
    751,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, sensor]
    ),
    rule(2, [637])
).
proof_step(
    2,
    752,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, sensor]
    ),
    rule(1, [638])
).
proof_step(
    2,
    753,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, sensor]
    ),
    rule(2, [638])
).
proof_step(
    2,
    754,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, sensor]
    ),
    rule(1, [639])
).
proof_step(
    2,
    755,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, sensor]
    ),
    rule(2, [639])
).
proof_step(
    2,
    756,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, sensor]
    ),
    rule(1, [640])
).
proof_step(
    2,
    757,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, sensor]
    ),
    rule(2, [640])
).
proof_step(
    2,
    758,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, sensor]
    ),
    rule(1, [641])
).
proof_step(
    2,
    759,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, sensor]
    ),
    rule(2, [641])
).
proof_step(
    2,
    760,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, sensor]
    ),
    rule(1, [642])
).
proof_step(
    2,
    761,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, sensor]
    ),
    rule(2, [642])
).
proof_step(
    2,
    762,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, sensor]
    ),
    rule(1, [643])
).
proof_step(
    2,
    763,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, sensor]
    ),
    rule(2, [643])
).
proof_step(
    2,
    764,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, sensor]
    ),
    rule(1, [644])
).
proof_step(
    2,
    765,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, sensor]
    ),
    rule(2, [644])
).
proof_step(
    2,
    766,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, sensor]
    ),
    rule(1, [645])
).
proof_step(
    2,
    767,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, sensor]
    ),
    rule(2, [645])
).
proof_step(
    2,
    768,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, sensor]
    ),
    rule(1, [646])
).
proof_step(
    2,
    769,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, sensor]
    ),
    rule(2, [646])
).
proof_step(
    2,
    770,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, sensor]
    ),
    rule(1, [647])
).
proof_step(
    2,
    771,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [sensor]
    ),
    rule(2, [647])
).
proof_step(
    2,
    772,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [648])
).
proof_step(
    2,
    773,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [648])
).
proof_step(
    2,
    774,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [649])
).
proof_step(
    2,
    775,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [649])
).
proof_step(
    2,
    776,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [650])
).
proof_step(
    2,
    777,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [650])
).
proof_step(
    2,
    778,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [651])
).
proof_step(
    2,
    779,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit]
    ),
    rule(2, [651])
).
proof_step(
    2,
    780,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, medkit]
    ),
    rule(1, [652])
).
proof_step(
    2,
    781,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit]
    ),
    rule(2, [652])
).
proof_step(
    2,
    782,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, medkit]
    ),
    rule(1, [653])
).
proof_step(
    2,
    783,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit]
    ),
    rule(2, [653])
).
proof_step(
    2,
    784,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, medkit]
    ),
    rule(1, [654])
).
proof_step(
    2,
    785,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit]
    ),
    rule(2, [654])
).
proof_step(
    2,
    786,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, medkit]
    ),
    rule(1, [655])
).
proof_step(
    2,
    787,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit]
    ),
    rule(2, [655])
).
proof_step(
    2,
    788,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, medkit]
    ),
    rule(1, [656])
).
proof_step(
    2,
    789,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit]
    ),
    rule(2, [656])
).
proof_step(
    2,
    790,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, medkit]
    ),
    rule(1, [657])
).
proof_step(
    2,
    791,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit]
    ),
    rule(2, [657])
).
proof_step(
    2,
    792,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, medkit]
    ),
    rule(1, [658])
).
proof_step(
    2,
    793,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit]
    ),
    rule(2, [658])
).
proof_step(
    2,
    794,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, medkit]
    ),
    rule(1, [659])
).
proof_step(
    2,
    795,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit]
    ),
    rule(2, [659])
).
proof_step(
    2,
    796,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, medkit]
    ),
    rule(1, [660])
).
proof_step(
    2,
    797,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit]
    ),
    rule(2, [660])
).
proof_step(
    2,
    798,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, medkit]
    ),
    rule(1, [661])
).
proof_step(
    2,
    799,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit]
    ),
    rule(2, [661])
).
proof_step(
    2,
    800,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, medkit]
    ),
    rule(1, [662])
).
proof_step(
    2,
    801,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit]
    ),
    rule(2, [662])
).
proof_step(
    2,
    802,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, medkit]
    ),
    rule(1, [663])
).
proof_step(
    2,
    803,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [medkit]
    ),
    rule(2, [663])
).
proof_step(
    2,
    804,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop]
    ),
    rule(1, [664])
).
proof_step(
    2,
    805,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop]
    ),
    rule(2, [664])
).
proof_step(
    2,
    806,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop]
    ),
    rule(1, [665])
).
proof_step(
    2,
    807,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop]
    ),
    rule(2, [665])
).
proof_step(
    2,
    808,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop]
    ),
    rule(1, [666])
).
proof_step(
    2,
    809,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop]
    ),
    rule(2, [666])
).
proof_step(
    2,
    810,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop]
    ),
    rule(1, [667])
).
proof_step(
    2,
    811,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop]
    ),
    rule(2, [667])
).
proof_step(
    2,
    812,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop]
    ),
    rule(1, [668])
).
proof_step(
    2,
    813,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop]
    ),
    rule(2, [668])
).
proof_step(
    2,
    814,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop]
    ),
    rule(1, [669])
).
proof_step(
    2,
    815,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop]
    ),
    rule(2, [669])
).
proof_step(
    2,
    816,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop]
    ),
    rule(1, [670])
).
proof_step(
    2,
    817,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop]
    ),
    rule(2, [670])
).
proof_step(
    2,
    818,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop]
    ),
    rule(1, [671])
).
proof_step(
    2,
    819,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop]
    ),
    rule(2, [671])
).
proof_step(
    2,
    820,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio]
    ),
    rule(1, [672])
).
proof_step(
    2,
    821,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio]
    ),
    rule(2, [672])
).
proof_step(
    2,
    822,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio]
    ),
    rule(1, [673])
).
proof_step(
    2,
    823,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio]
    ),
    rule(2, [673])
).
proof_step(
    2,
    824,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio]
    ),
    rule(1, [674])
).
proof_step(
    2,
    825,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio]
    ),
    rule(2, [674])
).
proof_step(
    2,
    826,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio]
    ),
    rule(1, [675])
).
proof_step(
    2,
    827,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio]
    ),
    rule(2, [675])
).
proof_step(
    2,
    828,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone]
    ),
    rule(1, [676])
).
proof_step(
    2,
    829,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone]
    ),
    rule(2, [676])
).
proof_step(
    2,
    830,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone]
    ),
    rule(1, [677])
).
proof_step(
    2,
    831,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone]
    ),
    rule(2, [677])
).
proof_step(
    2,
    832,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera]
    ),
    rule(1, [678])
).
proof_step(
    2,
    833,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera]
    ),
    rule(2, [678])
).
proof_step(
    2,
    834,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery]
    ),
    rule(1, [679])
).
proof_step(
    2,
    835,
    subset([battery, camera, drone, emergency_radio, field_laptop, medkit, sensor], []),
    rule(2, [679])
).
proof_step(
    2,
    836,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit],
        31
    ),
    rule(5, [206, 681, 201])
).
proof_step(
    2,
    837,
    total_weight(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        31
    ),
    rule(5, [208, 687, 198])
).
proof_step(
    2,
    838,
    total_weight(
        [atlas, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        29
    ),
    rule(5, [206, 687, 199])
).
proof_step(
    2,
    839,
    total_weight(
        [atlas, battery, drone, emergency_radio, field_laptop, medkit, sensor],
        30
    ),
    rule(5, [206, 688, 200])
).
proof_step(
    2,
    840,
    total_weight(
        [atlas, battery, camera, emergency_radio, field_laptop, medkit, sensor],
        27
    ),
    rule(5, [206, 690, 185])
).
proof_step(
    2,
    841,
    total_weight([atlas, battery, camera, drone, field_laptop, medkit, sensor], 28),
    rule(5, [206, 693, 186])
).
proof_step(
    2,
    842,
    total_weight([atlas, battery, camera, drone, emergency_radio, medkit, sensor], 26),
    rule(5, [206, 697, 181])
).
proof_step(
    2,
    843,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, sensor],
        29
    ),
    rule(5, [206, 702, 199])
).
proof_step(
    2,
    844,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [708])
).
proof_step(
    2,
    845,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [708])
).
proof_step(
    2,
    846,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [709])
).
proof_step(
    2,
    847,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [709])
).
proof_step(
    2,
    848,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [710])
).
proof_step(
    2,
    849,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [710])
).
proof_step(
    2,
    850,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [711])
).
proof_step(
    2,
    851,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [711])
).
proof_step(
    2,
    852,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [712])
).
proof_step(
    2,
    853,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [712])
).
proof_step(
    2,
    854,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [713])
).
proof_step(
    2,
    855,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [713])
).
proof_step(
    2,
    856,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [714])
).
proof_step(
    2,
    857,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [714])
).
proof_step(
    2,
    858,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(1, [715])
).
proof_step(
    2,
    859,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit, sensor]
    ),
    rule(2, [715])
).
proof_step(
    2,
    860,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [716])
).
proof_step(
    2,
    861,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, medkit, sensor]
    ),
    rule(2, [716])
).
proof_step(
    2,
    862,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [717])
).
proof_step(
    2,
    863,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit, sensor]
    ),
    rule(2, [717])
).
proof_step(
    2,
    864,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [718])
).
proof_step(
    2,
    865,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, medkit, sensor]
    ),
    rule(2, [718])
).
proof_step(
    2,
    866,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, field_laptop, medkit, sensor]
    ),
    rule(1, [719])
).
proof_step(
    2,
    867,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit, sensor]
    ),
    rule(2, [719])
).
proof_step(
    2,
    868,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, field_laptop, medkit, sensor]
    ),
    rule(1, [720])
).
proof_step(
    2,
    869,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, medkit, sensor]
    ),
    rule(2, [720])
).
proof_step(
    2,
    870,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, field_laptop, medkit, sensor]
    ),
    rule(1, [721])
).
proof_step(
    2,
    871,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit, sensor]
    ),
    rule(2, [721])
).
proof_step(
    2,
    872,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, field_laptop, medkit, sensor]
    ),
    rule(1, [722])
).
proof_step(
    2,
    873,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, medkit, sensor]
    ),
    rule(2, [722])
).
proof_step(
    2,
    874,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, field_laptop, medkit, sensor]
    ),
    rule(1, [723])
).
proof_step(
    2,
    875,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit, sensor]
    ),
    rule(2, [723])
).
proof_step(
    2,
    876,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [724])
).
proof_step(
    2,
    877,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [724])
).
proof_step(
    2,
    878,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [725])
).
proof_step(
    2,
    879,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [725])
).
proof_step(
    2,
    880,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [726])
).
proof_step(
    2,
    881,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [726])
).
proof_step(
    2,
    882,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, medkit, sensor]
    ),
    rule(1, [727])
).
proof_step(
    2,
    883,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit, sensor]
    ),
    rule(2, [727])
).
proof_step(
    2,
    884,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, medkit, sensor]
    ),
    rule(1, [728])
).
proof_step(
    2,
    885,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, medkit, sensor]
    ),
    rule(2, [728])
).
proof_step(
    2,
    886,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, medkit, sensor]
    ),
    rule(1, [729])
).
proof_step(
    2,
    887,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit, sensor]
    ),
    rule(2, [729])
).
proof_step(
    2,
    888,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, medkit, sensor]
    ),
    rule(1, [730])
).
proof_step(
    2,
    889,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, medkit, sensor]
    ),
    rule(2, [730])
).
proof_step(
    2,
    890,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, medkit, sensor]
    ),
    rule(1, [731])
).
proof_step(
    2,
    891,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit, sensor]
    ),
    rule(2, [731])
).
proof_step(
    2,
    892,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, medkit, sensor]
    ),
    rule(1, [732])
).
proof_step(
    2,
    893,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, medkit, sensor]
    ),
    rule(2, [732])
).
proof_step(
    2,
    894,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, medkit, sensor]
    ),
    rule(1, [733])
).
proof_step(
    2,
    895,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit, sensor]
    ),
    rule(2, [733])
).
proof_step(
    2,
    896,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, medkit, sensor]
    ),
    rule(1, [734])
).
proof_step(
    2,
    897,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, medkit, sensor]
    ),
    rule(2, [734])
).
proof_step(
    2,
    898,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, medkit, sensor]
    ),
    rule(1, [735])
).
proof_step(
    2,
    899,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit, sensor]
    ),
    rule(2, [735])
).
proof_step(
    2,
    900,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, medkit, sensor]
    ),
    rule(1, [736])
).
proof_step(
    2,
    901,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, medkit, sensor]
    ),
    rule(2, [736])
).
proof_step(
    2,
    902,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, medkit, sensor]
    ),
    rule(1, [737])
).
proof_step(
    2,
    903,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit, sensor]
    ),
    rule(2, [737])
).
proof_step(
    2,
    904,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, medkit, sensor]
    ),
    rule(1, [738])
).
proof_step(
    2,
    905,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, medkit, sensor]
    ),
    rule(2, [738])
).
proof_step(
    2,
    906,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, medkit, sensor]
    ),
    rule(1, [739])
).
proof_step(
    2,
    907,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [medkit, sensor]
    ),
    rule(2, [739])
).
proof_step(
    2,
    908,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [740])
).
proof_step(
    2,
    909,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [740])
).
proof_step(
    2,
    910,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [741])
).
proof_step(
    2,
    911,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [741])
).
proof_step(
    2,
    912,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [742])
).
proof_step(
    2,
    913,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [742])
).
proof_step(
    2,
    914,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [743])
).
proof_step(
    2,
    915,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [743])
).
proof_step(
    2,
    916,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [744])
).
proof_step(
    2,
    917,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [744])
).
proof_step(
    2,
    918,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [745])
).
proof_step(
    2,
    919,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [745])
).
proof_step(
    2,
    920,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [746])
).
proof_step(
    2,
    921,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, sensor]
    ),
    rule(2, [746])
).
proof_step(
    2,
    922,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, field_laptop, sensor]
    ),
    rule(1, [747])
).
proof_step(
    2,
    923,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, sensor]
    ),
    rule(2, [747])
).
proof_step(
    2,
    924,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, field_laptop, sensor]
    ),
    rule(1, [748])
).
proof_step(
    2,
    925,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, sensor]
    ),
    rule(2, [748])
).
proof_step(
    2,
    926,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, field_laptop, sensor]
    ),
    rule(1, [749])
).
proof_step(
    2,
    927,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, sensor]
    ),
    rule(2, [749])
).
proof_step(
    2,
    928,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, field_laptop, sensor]
    ),
    rule(1, [750])
).
proof_step(
    2,
    929,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, sensor]
    ),
    rule(2, [750])
).
proof_step(
    2,
    930,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, field_laptop, sensor]
    ),
    rule(1, [751])
).
proof_step(
    2,
    931,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, sensor]
    ),
    rule(2, [751])
).
proof_step(
    2,
    932,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, field_laptop, sensor]
    ),
    rule(1, [752])
).
proof_step(
    2,
    933,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, sensor]
    ),
    rule(2, [752])
).
proof_step(
    2,
    934,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, field_laptop, sensor]
    ),
    rule(1, [753])
).
proof_step(
    2,
    935,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, sensor]
    ),
    rule(2, [753])
).
proof_step(
    2,
    936,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, field_laptop, sensor]
    ),
    rule(1, [754])
).
proof_step(
    2,
    937,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, sensor]
    ),
    rule(2, [754])
).
proof_step(
    2,
    938,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, field_laptop, sensor]
    ),
    rule(1, [755])
).
proof_step(
    2,
    939,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, sensor]
    ),
    rule(2, [755])
).
proof_step(
    2,
    940,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, sensor]
    ),
    rule(1, [756])
).
proof_step(
    2,
    941,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, sensor]
    ),
    rule(2, [756])
).
proof_step(
    2,
    942,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, sensor]
    ),
    rule(1, [757])
).
proof_step(
    2,
    943,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, sensor]
    ),
    rule(2, [757])
).
proof_step(
    2,
    944,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, sensor]
    ),
    rule(1, [758])
).
proof_step(
    2,
    945,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, sensor]
    ),
    rule(2, [758])
).
proof_step(
    2,
    946,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, sensor]
    ),
    rule(1, [759])
).
proof_step(
    2,
    947,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, sensor]
    ),
    rule(2, [759])
).
proof_step(
    2,
    948,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, sensor]
    ),
    rule(1, [760])
).
proof_step(
    2,
    949,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, sensor]
    ),
    rule(2, [760])
).
proof_step(
    2,
    950,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, sensor]
    ),
    rule(1, [761])
).
proof_step(
    2,
    951,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, sensor]
    ),
    rule(2, [761])
).
proof_step(
    2,
    952,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, sensor]
    ),
    rule(1, [762])
).
proof_step(
    2,
    953,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, sensor]
    ),
    rule(2, [762])
).
proof_step(
    2,
    954,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, sensor]
    ),
    rule(1, [763])
).
proof_step(
    2,
    955,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, sensor]
    ),
    rule(2, [763])
).
proof_step(
    2,
    956,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, sensor]
    ),
    rule(1, [764])
).
proof_step(
    2,
    957,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, sensor]
    ),
    rule(2, [764])
).
proof_step(
    2,
    958,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, sensor]
    ),
    rule(1, [765])
).
proof_step(
    2,
    959,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, sensor]
    ),
    rule(2, [765])
).
proof_step(
    2,
    960,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, sensor]
    ),
    rule(1, [766])
).
proof_step(
    2,
    961,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, sensor]
    ),
    rule(2, [766])
).
proof_step(
    2,
    962,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, sensor]
    ),
    rule(1, [767])
).
proof_step(
    2,
    963,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, sensor]
    ),
    rule(2, [767])
).
proof_step(
    2,
    964,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, sensor]
    ),
    rule(1, [768])
).
proof_step(
    2,
    965,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, sensor]
    ),
    rule(2, [768])
).
proof_step(
    2,
    966,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, sensor]
    ),
    rule(1, [769])
).
proof_step(
    2,
    967,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, sensor]
    ),
    rule(2, [769])
).
proof_step(
    2,
    968,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, sensor]
    ),
    rule(1, [770])
).
proof_step(
    2,
    969,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, sensor]
    ),
    rule(2, [770])
).
proof_step(
    2,
    970,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, sensor]
    ),
    rule(1, [771])
).
proof_step(
    2,
    971,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [sensor]
    ),
    rule(2, [771])
).
proof_step(
    2,
    972,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [772])
).
proof_step(
    2,
    973,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [772])
).
proof_step(
    2,
    974,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [773])
).
proof_step(
    2,
    975,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [773])
).
proof_step(
    2,
    976,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [774])
).
proof_step(
    2,
    977,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [774])
).
proof_step(
    2,
    978,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [775])
).
proof_step(
    2,
    979,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [775])
).
proof_step(
    2,
    980,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [776])
).
proof_step(
    2,
    981,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [776])
).
proof_step(
    2,
    982,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [777])
).
proof_step(
    2,
    983,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [777])
).
proof_step(
    2,
    984,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [778])
).
proof_step(
    2,
    985,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop, medkit]
    ),
    rule(2, [778])
).
proof_step(
    2,
    986,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, field_laptop, medkit]
    ),
    rule(1, [779])
).
proof_step(
    2,
    987,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop, medkit]
    ),
    rule(2, [779])
).
proof_step(
    2,
    988,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, field_laptop, medkit]
    ),
    rule(1, [780])
).
proof_step(
    2,
    989,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop, medkit]
    ),
    rule(2, [780])
).
proof_step(
    2,
    990,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, field_laptop, medkit]
    ),
    rule(1, [781])
).
proof_step(
    2,
    991,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop, medkit]
    ),
    rule(2, [781])
).
proof_step(
    2,
    992,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, field_laptop, medkit]
    ),
    rule(1, [782])
).
proof_step(
    2,
    993,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop, medkit]
    ),
    rule(2, [782])
).
proof_step(
    2,
    994,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, field_laptop, medkit]
    ),
    rule(1, [783])
).
proof_step(
    2,
    995,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop, medkit]
    ),
    rule(2, [783])
).
proof_step(
    2,
    996,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, field_laptop, medkit]
    ),
    rule(1, [784])
).
proof_step(
    2,
    997,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop, medkit]
    ),
    rule(2, [784])
).
proof_step(
    2,
    998,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, field_laptop, medkit]
    ),
    rule(1, [785])
).
proof_step(
    2,
    999,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop, medkit]
    ),
    rule(2, [785])
).
proof_step(
    2,
    1000,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, field_laptop, medkit]
    ),
    rule(1, [786])
).
proof_step(
    2,
    1001,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop, medkit]
    ),
    rule(2, [786])
).
proof_step(
    2,
    1002,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, field_laptop, medkit]
    ),
    rule(1, [787])
).
proof_step(
    2,
    1003,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop, medkit]
    ),
    rule(2, [787])
).
proof_step(
    2,
    1004,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, medkit]
    ),
    rule(1, [788])
).
proof_step(
    2,
    1005,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, medkit]
    ),
    rule(2, [788])
).
proof_step(
    2,
    1006,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, medkit]
    ),
    rule(1, [789])
).
proof_step(
    2,
    1007,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, medkit]
    ),
    rule(2, [789])
).
proof_step(
    2,
    1008,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, medkit]
    ),
    rule(1, [790])
).
proof_step(
    2,
    1009,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, medkit]
    ),
    rule(2, [790])
).
proof_step(
    2,
    1010,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, medkit]
    ),
    rule(1, [791])
).
proof_step(
    2,
    1011,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, medkit]
    ),
    rule(2, [791])
).
proof_step(
    2,
    1012,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, medkit]
    ),
    rule(1, [792])
).
proof_step(
    2,
    1013,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, medkit]
    ),
    rule(2, [792])
).
proof_step(
    2,
    1014,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, medkit]
    ),
    rule(1, [793])
).
proof_step(
    2,
    1015,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, medkit]
    ),
    rule(2, [793])
).
proof_step(
    2,
    1016,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, medkit]
    ),
    rule(1, [794])
).
proof_step(
    2,
    1017,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, medkit]
    ),
    rule(2, [794])
).
proof_step(
    2,
    1018,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, medkit]
    ),
    rule(1, [795])
).
proof_step(
    2,
    1019,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, medkit]
    ),
    rule(2, [795])
).
proof_step(
    2,
    1020,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, medkit]
    ),
    rule(1, [796])
).
proof_step(
    2,
    1021,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, medkit]
    ),
    rule(2, [796])
).
proof_step(
    2,
    1022,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, medkit]
    ),
    rule(1, [797])
).
proof_step(
    2,
    1023,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, medkit]
    ),
    rule(2, [797])
).
proof_step(
    2,
    1024,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, medkit]
    ),
    rule(1, [798])
).
proof_step(
    2,
    1025,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, medkit]
    ),
    rule(2, [798])
).
proof_step(
    2,
    1026,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, medkit]
    ),
    rule(1, [799])
).
proof_step(
    2,
    1027,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, medkit]
    ),
    rule(2, [799])
).
proof_step(
    2,
    1028,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, medkit]
    ),
    rule(1, [800])
).
proof_step(
    2,
    1029,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, medkit]
    ),
    rule(2, [800])
).
proof_step(
    2,
    1030,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, medkit]
    ),
    rule(1, [801])
).
proof_step(
    2,
    1031,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, medkit]
    ),
    rule(2, [801])
).
proof_step(
    2,
    1032,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, medkit]
    ),
    rule(1, [802])
).
proof_step(
    2,
    1033,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, medkit]
    ),
    rule(2, [802])
).
proof_step(
    2,
    1034,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, medkit]
    ),
    rule(1, [803])
).
proof_step(
    2,
    1035,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [medkit]
    ),
    rule(2, [803])
).
proof_step(
    2,
    1036,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio, field_laptop]
    ),
    rule(1, [804])
).
proof_step(
    2,
    1037,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio, field_laptop]
    ),
    rule(2, [804])
).
proof_step(
    2,
    1038,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio, field_laptop]
    ),
    rule(1, [805])
).
proof_step(
    2,
    1039,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio, field_laptop]
    ),
    rule(2, [805])
).
proof_step(
    2,
    1040,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio, field_laptop]
    ),
    rule(1, [806])
).
proof_step(
    2,
    1041,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio, field_laptop]
    ),
    rule(2, [806])
).
proof_step(
    2,
    1042,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio, field_laptop]
    ),
    rule(1, [807])
).
proof_step(
    2,
    1043,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio, field_laptop]
    ),
    rule(2, [807])
).
proof_step(
    2,
    1044,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio, field_laptop]
    ),
    rule(1, [808])
).
proof_step(
    2,
    1045,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio, field_laptop]
    ),
    rule(2, [808])
).
proof_step(
    2,
    1046,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio, field_laptop]
    ),
    rule(1, [809])
).
proof_step(
    2,
    1047,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio, field_laptop]
    ),
    rule(2, [809])
).
proof_step(
    2,
    1048,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio, field_laptop]
    ),
    rule(1, [810])
).
proof_step(
    2,
    1049,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio, field_laptop]
    ),
    rule(2, [810])
).
proof_step(
    2,
    1050,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio, field_laptop]
    ),
    rule(1, [811])
).
proof_step(
    2,
    1051,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio, field_laptop]
    ),
    rule(2, [811])
).
proof_step(
    2,
    1052,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, field_laptop]
    ),
    rule(1, [812])
).
proof_step(
    2,
    1053,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, field_laptop]
    ),
    rule(2, [812])
).
proof_step(
    2,
    1054,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, field_laptop]
    ),
    rule(1, [813])
).
proof_step(
    2,
    1055,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, field_laptop]
    ),
    rule(2, [813])
).
proof_step(
    2,
    1056,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, field_laptop]
    ),
    rule(1, [814])
).
proof_step(
    2,
    1057,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, field_laptop]
    ),
    rule(2, [814])
).
proof_step(
    2,
    1058,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, field_laptop]
    ),
    rule(1, [815])
).
proof_step(
    2,
    1059,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, field_laptop]
    ),
    rule(2, [815])
).
proof_step(
    2,
    1060,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, field_laptop]
    ),
    rule(1, [816])
).
proof_step(
    2,
    1061,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, field_laptop]
    ),
    rule(2, [816])
).
proof_step(
    2,
    1062,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, field_laptop]
    ),
    rule(1, [817])
).
proof_step(
    2,
    1063,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, field_laptop]
    ),
    rule(2, [817])
).
proof_step(
    2,
    1064,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, field_laptop]
    ),
    rule(1, [818])
).
proof_step(
    2,
    1065,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, field_laptop]
    ),
    rule(2, [818])
).
proof_step(
    2,
    1066,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, field_laptop]
    ),
    rule(1, [819])
).
proof_step(
    2,
    1067,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [field_laptop]
    ),
    rule(2, [819])
).
proof_step(
    2,
    1068,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone, emergency_radio]
    ),
    rule(1, [820])
).
proof_step(
    2,
    1069,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone, emergency_radio]
    ),
    rule(2, [820])
).
proof_step(
    2,
    1070,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone, emergency_radio]
    ),
    rule(1, [821])
).
proof_step(
    2,
    1071,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone, emergency_radio]
    ),
    rule(2, [821])
).
proof_step(
    2,
    1072,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone, emergency_radio]
    ),
    rule(1, [822])
).
proof_step(
    2,
    1073,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone, emergency_radio]
    ),
    rule(2, [822])
).
proof_step(
    2,
    1074,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone, emergency_radio]
    ),
    rule(1, [823])
).
proof_step(
    2,
    1075,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone, emergency_radio]
    ),
    rule(2, [823])
).
proof_step(
    2,
    1076,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, emergency_radio]
    ),
    rule(1, [824])
).
proof_step(
    2,
    1077,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, emergency_radio]
    ),
    rule(2, [824])
).
proof_step(
    2,
    1078,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, emergency_radio]
    ),
    rule(1, [825])
).
proof_step(
    2,
    1079,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, emergency_radio]
    ),
    rule(2, [825])
).
proof_step(
    2,
    1080,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, emergency_radio]
    ),
    rule(1, [826])
).
proof_step(
    2,
    1081,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, emergency_radio]
    ),
    rule(2, [826])
).
proof_step(
    2,
    1082,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, emergency_radio]
    ),
    rule(1, [827])
).
proof_step(
    2,
    1083,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [emergency_radio]
    ),
    rule(2, [827])
).
proof_step(
    2,
    1084,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera, drone]
    ),
    rule(1, [828])
).
proof_step(
    2,
    1085,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera, drone]
    ),
    rule(2, [828])
).
proof_step(
    2,
    1086,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera, drone]
    ),
    rule(1, [829])
).
proof_step(
    2,
    1087,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera, drone]
    ),
    rule(2, [829])
).
proof_step(
    2,
    1088,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, drone]
    ),
    rule(1, [830])
).
proof_step(
    2,
    1089,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, drone]
    ),
    rule(2, [830])
).
proof_step(
    2,
    1090,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, drone]
    ),
    rule(1, [831])
).
proof_step(
    2,
    1091,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [drone]
    ),
    rule(2, [831])
).
proof_step(
    2,
    1092,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery, camera]
    ),
    rule(1, [832])
).
proof_step(
    2,
    1093,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery, camera]
    ),
    rule(2, [832])
).
proof_step(
    2,
    1094,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, camera]
    ),
    rule(1, [833])
).
proof_step(
    2,
    1095,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [camera]
    ),
    rule(2, [833])
).
proof_step(
    2,
    1096,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas, battery]
    ),
    rule(1, [834])
).
proof_step(
    2,
    1097,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [battery]
    ),
    rule(2, [834])
).
proof_step(
    2,
    1098,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        [atlas]
    ),
    rule(1, [835])
).
proof_step(
    2,
    1099,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        []
    ),
    rule(2, [835])
).
proof_step(
    2,
    1100,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        33
    ),
    rule(5, [206, 837, 203])
).
proof_step(
    2,
    1101,
    feasible_pack([atlas, field_laptop, medkit, sensor], 15, 38),
    rule(7, [2, 874, 477, 1, 188, 508])
).
proof_step(
    2,
    1102,
    feasible_pack([field_laptop, medkit, sensor], 13, 32),
    rule(7, [2, 875, 374, 1, 144, 395])
).
proof_step(
    2,
    1103,
    feasible_pack([camera, emergency_radio, medkit, sensor], 14, 35),
    rule(7, [2, 887, 479, 1, 187, 509])
).
proof_step(
    2,
    1104,
    feasible_pack([battery, emergency_radio, medkit, sensor], 15, 37),
    rule(7, [2, 889, 480, 1, 188, 510])
).
proof_step(
    2,
    1105,
    feasible_pack([atlas, emergency_radio, medkit, sensor], 13, 33),
    rule(7, [2, 890, 481, 1, 144, 511])
).
proof_step(
    2,
    1106,
    feasible_pack([emergency_radio, medkit, sensor], 11, 27),
    rule(7, [2, 891, 375, 1, 141, 396])
).
proof_step(
    2,
    1107,
    feasible_pack([camera, drone, medkit, sensor], 15, 37),
    rule(7, [2, 895, 482, 1, 188, 512])
).
proof_step(
    2,
    1108,
    feasible_pack([atlas, drone, medkit, sensor], 14, 35),
    rule(7, [2, 898, 484, 1, 187, 513])
).
proof_step(
    2,
    1109,
    feasible_pack([drone, medkit, sensor], 12, 29),
    rule(7, [2, 899, 376, 1, 143, 397])
).
proof_step(
    2,
    1110,
    feasible_pack([atlas, battery, camera, medkit, sensor], 15, 40),
    rule(7, [2, 900, 599, 1, 188, 615])
).
proof_step(
    2,
    1111,
    feasible_pack([battery, camera, medkit, sensor], 13, 34),
    rule(7, [2, 901, 485, 1, 144, 514])
).
proof_step(
    2,
    1112,
    feasible_pack([atlas, camera, medkit, sensor], 11, 30),
    rule(7, [2, 902, 486, 1, 141, 515])
).
proof_step(
    2,
    1113,
    feasible_pack([camera, medkit, sensor], 9, 24),
    rule(7, [2, 903, 377, 1, 139, 398])
).
proof_step(
    2,
    1114,
    feasible_pack([atlas, battery, medkit, sensor], 12, 32),
    rule(7, [2, 904, 487, 1, 143, 516])
).
proof_step(
    2,
    1115,
    feasible_pack([battery, medkit, sensor], 10, 26),
    rule(7, [2, 905, 378, 1, 142, 399])
).
proof_step(
    2,
    1116,
    feasible_pack([atlas, medkit, sensor], 8, 22),
    rule(7, [2, 906, 379, 1, 140, 400])
).
proof_step(
    2,
    1117,
    feasible_pack([medkit, sensor], 6, 16),
    rule(7, [2, 907, 287, 1, 102, 294])
).
proof_step(
    2,
    1118,
    feasible_pack([emergency_radio, field_laptop, sensor], 14, 34),
    rule(7, [2, 923, 380, 1, 187, 401])
).
proof_step(
    2,
    1119,
    feasible_pack([drone, field_laptop, sensor], 15, 36),
    rule(7, [2, 931, 381, 1, 188, 402])
).
proof_step(
    2,
    1120,
    feasible_pack([atlas, camera, field_laptop, sensor], 14, 37),
    rule(7, [2, 934, 496, 1, 187, 517])
).
proof_step(
    2,
    1121,
    feasible_pack([camera, field_laptop, sensor], 12, 31),
    rule(7, [2, 935, 382, 1, 143, 403])
).
proof_step(
    2,
    1122,
    feasible_pack([atlas, battery, field_laptop, sensor], 15, 39),
    rule(7, [2, 936, 497, 1, 188, 518])
).
proof_step(
    2,
    1123,
    feasible_pack([battery, field_laptop, sensor], 13, 33),
    rule(7, [2, 937, 383, 1, 144, 404])
).
proof_step(
    2,
    1124,
    feasible_pack([atlas, field_laptop, sensor], 11, 29),
    rule(7, [2, 938, 384, 1, 141, 405])
).
proof_step(
    2,
    1125,
    feasible_pack([field_laptop, sensor], 9, 23),
    rule(7, [2, 939, 288, 1, 139, 295])
).
proof_step(
    2,
    1126,
    feasible_pack([atlas, drone, emergency_radio, sensor], 15, 37),
    rule(7, [2, 946, 500, 1, 188, 519])
).
proof_step(
    2,
    1127,
    feasible_pack([drone, emergency_radio, sensor], 13, 31),
    rule(7, [2, 947, 385, 1, 144, 406])
).
proof_step(
    2,
    1128,
    feasible_pack([battery, camera, emergency_radio, sensor], 14, 36),
    rule(7, [2, 949, 501, 1, 187, 520])
).
proof_step(
    2,
    1129,
    feasible_pack([atlas, camera, emergency_radio, sensor], 12, 32),
    rule(7, [2, 950, 502, 1, 143, 521])
).
proof_step(
    2,
    1130,
    feasible_pack([camera, emergency_radio, sensor], 10, 26),
    rule(7, [2, 951, 386, 1, 142, 407])
).
proof_step(
    2,
    1131,
    feasible_pack([atlas, battery, emergency_radio, sensor], 13, 34),
    rule(7, [2, 952, 503, 1, 144, 522])
).
proof_step(
    2,
    1132,
    feasible_pack([battery, emergency_radio, sensor], 11, 28),
    rule(7, [2, 953, 387, 1, 141, 408])
).
proof_step(
    2,
    1133,
    feasible_pack([atlas, emergency_radio, sensor], 9, 24),
    rule(7, [2, 954, 388, 1, 139, 409])
).
proof_step(
    2,
    1134,
    feasible_pack([emergency_radio, sensor], 7, 18),
    rule(7, [2, 955, 289, 1, 100, 296])
).
proof_step(
    2,
    1135,
    feasible_pack([battery, camera, drone, sensor], 15, 38),
    rule(7, [2, 957, 504, 1, 188, 523])
).
proof_step(
    2,
    1136,
    feasible_pack([atlas, camera, drone, sensor], 13, 34),
    rule(7, [2, 958, 505, 1, 144, 524])
).
proof_step(
    2,
    1137,
    feasible_pack([camera, drone, sensor], 11, 28),
    rule(7, [2, 959, 389, 1, 141, 410])
).
proof_step(
    2,
    1138,
    feasible_pack([atlas, battery, drone, sensor], 14, 36),
    rule(7, [2, 960, 506, 1, 187, 525])
).
proof_step(
    2,
    1139,
    feasible_pack([battery, drone, sensor], 12, 30),
    rule(7, [2, 961, 390, 1, 143, 411])
).
proof_step(
    2,
    1140,
    feasible_pack([atlas, drone, sensor], 10, 26),
    rule(7, [2, 962, 391, 1, 142, 412])
).
proof_step(
    2,
    1141,
    feasible_pack([drone, sensor], 8, 20),
    rule(7, [2, 963, 290, 1, 140, 297])
).
proof_step(
    2,
    1142,
    feasible_pack([atlas, battery, camera, sensor], 11, 31),
    rule(7, [2, 964, 507, 1, 141, 526])
).
proof_step(
    2,
    1143,
    feasible_pack([battery, camera, sensor], 9, 25),
    rule(7, [2, 965, 392, 1, 139, 413])
).
proof_step(
    2,
    1144,
    feasible_pack([atlas, camera, sensor], 7, 21),
    rule(7, [2, 966, 393, 1, 100, 414])
).
proof_step(
    2,
    1145,
    feasible_pack([camera, sensor], 5, 15),
    rule(7, [2, 967, 291, 1, 101, 298])
).
proof_step(
    2,
    1146,
    feasible_pack([atlas, battery, sensor], 8, 23),
    rule(7, [2, 968, 394, 1, 140, 415])
).
proof_step(
    2,
    1147,
    feasible_pack([battery, sensor], 6, 17),
    rule(7, [2, 969, 292, 1, 102, 299])
).
proof_step(
    2,
    1148,
    feasible_pack([atlas, sensor], 4, 13),
    rule(7, [2, 970, 293, 1, 99, 300])
).
proof_step(2, 1149, feasible_pack([sensor], 2, 7), rule(7, [2, 971, 238, 1, 98, 239])).
proof_step(
    2,
    1150,
    feasible_pack([camera, field_laptop, medkit], 14, 33),
    rule(7, [2, 999, 348, 1, 187, 361])
).
proof_step(
    2,
    1151,
    feasible_pack([battery, field_laptop, medkit], 15, 35),
    rule(7, [2, 1001, 349, 1, 188, 362])
).
proof_step(
    2,
    1152,
    feasible_pack([atlas, field_laptop, medkit], 13, 31),
    rule(7, [2, 1002, 350, 1, 144, 363])
).
proof_step(
    2,
    1153,
    feasible_pack([field_laptop, medkit], 11, 25),
    rule(7, [2, 1003, 275, 1, 141, 281])
).
proof_step(
    2,
    1154,
    feasible_pack([drone, emergency_radio, medkit], 15, 33),
    rule(7, [2, 1011, 351, 1, 188, 364])
).
proof_step(
    2,
    1155,
    feasible_pack([atlas, camera, emergency_radio, medkit], 14, 34),
    rule(7, [2, 1014, 463, 1, 187, 469])
).
proof_step(
    2,
    1156,
    feasible_pack([camera, emergency_radio, medkit], 12, 28),
    rule(7, [2, 1015, 352, 1, 143, 365])
).
proof_step(
    2,
    1157,
    feasible_pack([atlas, battery, emergency_radio, medkit], 15, 36),
    rule(7, [2, 1016, 464, 1, 188, 470])
).
proof_step(
    2,
    1158,
    feasible_pack([battery, emergency_radio, medkit], 13, 30),
    rule(7, [2, 1017, 353, 1, 144, 366])
).
proof_step(
    2,
    1159,
    feasible_pack([atlas, emergency_radio, medkit], 11, 26),
    rule(7, [2, 1018, 354, 1, 141, 367])
).
proof_step(
    2,
    1160,
    feasible_pack([emergency_radio, medkit], 9, 20),
    rule(7, [2, 1019, 276, 1, 139, 282])
).
proof_step(
    2,
    1161,
    feasible_pack([atlas, camera, drone, medkit], 15, 36),
    rule(7, [2, 1022, 466, 1, 188, 471])
).
proof_step(
    2,
    1162,
    feasible_pack([camera, drone, medkit], 13, 30),
    rule(7, [2, 1023, 355, 1, 144, 368])
).
proof_step(
    2,
    1163,
    feasible_pack([battery, drone, medkit], 14, 32),
    rule(7, [2, 1025, 356, 1, 187, 369])
).
proof_step(
    2,
    1164,
    feasible_pack([atlas, drone, medkit], 12, 28),
    rule(7, [2, 1026, 357, 1, 143, 370])
).
proof_step(
    2,
    1165,
    feasible_pack([drone, medkit], 10, 22),
    rule(7, [2, 1027, 277, 1, 142, 283])
).
proof_step(
    2,
    1166,
    feasible_pack([atlas, battery, camera, medkit], 13, 33),
    rule(7, [2, 1028, 468, 1, 144, 472])
).
proof_step(
    2,
    1167,
    feasible_pack([battery, camera, medkit], 11, 27),
    rule(7, [2, 1029, 358, 1, 141, 371])
).
proof_step(
    2,
    1168,
    feasible_pack([atlas, camera, medkit], 9, 23),
    rule(7, [2, 1030, 359, 1, 139, 372])
).
proof_step(
    2,
    1169,
    feasible_pack([camera, medkit], 7, 17),
    rule(7, [2, 1031, 278, 1, 100, 284])
).
proof_step(
    2,
    1170,
    feasible_pack([atlas, battery, medkit], 10, 25),
    rule(7, [2, 1032, 360, 1, 142, 373])
).
proof_step(
    2,
    1171,
    feasible_pack([battery, medkit], 8, 19),
    rule(7, [2, 1033, 279, 1, 140, 285])
).
proof_step(
    2,
    1172,
    feasible_pack([atlas, medkit], 6, 15),
    rule(7, [2, 1034, 280, 1, 102, 286])
).
proof_step(2, 1173, feasible_pack([medkit], 4, 9), rule(7, [2, 1035, 236, 1, 99, 237])).
proof_step(
    2,
    1174,
    feasible_pack([camera, emergency_radio, field_laptop], 15, 35),
    rule(7, [2, 1047, 331, 1, 188, 340])
).
proof_step(
    2,
    1175,
    feasible_pack([atlas, emergency_radio, field_laptop], 14, 33),
    rule(7, [2, 1050, 333, 1, 187, 341])
).
proof_step(
    2,
    1176,
    feasible_pack([emergency_radio, field_laptop], 12, 27),
    rule(7, [2, 1051, 265, 1, 143, 270])
).
proof_step(
    2,
    1177,
    feasible_pack([atlas, drone, field_laptop], 15, 35),
    rule(7, [2, 1058, 336, 1, 188, 342])
).
proof_step(
    2,
    1178,
    feasible_pack([drone, field_laptop], 13, 29),
    rule(7, [2, 1059, 266, 1, 144, 271])
).
proof_step(
    2,
    1179,
    feasible_pack([battery, camera, field_laptop], 14, 34),
    rule(7, [2, 1061, 337, 1, 187, 343])
).
proof_step(
    2,
    1180,
    feasible_pack([atlas, camera, field_laptop], 12, 30),
    rule(7, [2, 1062, 338, 1, 143, 344])
).
proof_step(
    2,
    1181,
    feasible_pack([camera, field_laptop], 10, 24),
    rule(7, [2, 1063, 267, 1, 142, 272])
).
proof_step(
    2,
    1182,
    feasible_pack([atlas, battery, field_laptop], 13, 32),
    rule(7, [2, 1064, 339, 1, 144, 345])
).
proof_step(
    2,
    1183,
    feasible_pack([battery, field_laptop], 11, 26),
    rule(7, [2, 1065, 268, 1, 141, 273])
).
proof_step(
    2,
    1184,
    feasible_pack([atlas, field_laptop], 9, 22),
    rule(7, [2, 1066, 269, 1, 139, 274])
).
proof_step(
    2,
    1185,
    feasible_pack([field_laptop], 7, 16),
    rule(7, [2, 1067, 234, 1, 100, 235])
).
proof_step(
    2,
    1186,
    feasible_pack([camera, drone, emergency_radio], 14, 32),
    rule(7, [2, 1071, 318, 1, 187, 324])
).
proof_step(
    2,
    1187,
    feasible_pack([battery, drone, emergency_radio], 15, 34),
    rule(7, [2, 1073, 319, 1, 188, 325])
).
proof_step(
    2,
    1188,
    feasible_pack([atlas, drone, emergency_radio], 13, 30),
    rule(7, [2, 1074, 320, 1, 144, 326])
).
proof_step(
    2,
    1189,
    feasible_pack([drone, emergency_radio], 11, 24),
    rule(7, [2, 1075, 257, 1, 141, 261])
).
proof_step(
    2,
    1190,
    feasible_pack([atlas, battery, camera, emergency_radio], 14, 35),
    rule(7, [2, 1076, 437, 1, 187, 438])
).
proof_step(
    2,
    1191,
    feasible_pack([battery, camera, emergency_radio], 12, 29),
    rule(7, [2, 1077, 321, 1, 143, 327])
).
proof_step(
    2,
    1192,
    feasible_pack([atlas, camera, emergency_radio], 10, 25),
    rule(7, [2, 1078, 322, 1, 142, 328])
).
proof_step(
    2,
    1193,
    feasible_pack([camera, emergency_radio], 8, 19),
    rule(7, [2, 1079, 258, 1, 140, 262])
).
proof_step(
    2,
    1194,
    feasible_pack([atlas, battery, emergency_radio], 11, 27),
    rule(7, [2, 1080, 323, 1, 141, 329])
).
proof_step(
    2,
    1195,
    feasible_pack([battery, emergency_radio], 9, 21),
    rule(7, [2, 1081, 259, 1, 139, 263])
).
proof_step(
    2,
    1196,
    feasible_pack([atlas, emergency_radio], 7, 17),
    rule(7, [2, 1082, 260, 1, 100, 264])
).
proof_step(
    2,
    1197,
    feasible_pack([emergency_radio], 5, 11),
    rule(7, [2, 1083, 232, 1, 101, 233])
).
proof_step(
    2,
    1198,
    feasible_pack([atlas, battery, camera, drone], 15, 37),
    rule(7, [2, 1084, 432, 1, 188, 433])
).
proof_step(
    2,
    1199,
    feasible_pack([battery, camera, drone], 13, 31),
    rule(7, [2, 1085, 312, 1, 144, 315])
).
proof_step(
    2,
    1200,
    feasible_pack([atlas, camera, drone], 11, 27),
    rule(7, [2, 1086, 313, 1, 141, 316])
).
proof_step(
    2,
    1201,
    feasible_pack([camera, drone], 9, 21),
    rule(7, [2, 1087, 251, 1, 139, 254])
).
proof_step(
    2,
    1202,
    feasible_pack([atlas, battery, drone], 12, 29),
    rule(7, [2, 1088, 314, 1, 143, 317])
).
proof_step(
    2,
    1203,
    feasible_pack([battery, drone], 10, 23),
    rule(7, [2, 1089, 252, 1, 142, 255])
).
proof_step(
    2,
    1204,
    feasible_pack([atlas, drone], 8, 19),
    rule(7, [2, 1090, 253, 1, 140, 256])
).
proof_step(2, 1205, feasible_pack([drone], 6, 13), rule(7, [2, 1091, 230, 1, 102, 231])).
proof_step(
    2,
    1206,
    feasible_pack([atlas, battery, camera], 9, 24),
    rule(7, [2, 1092, 309, 1, 139, 311])
).
proof_step(
    2,
    1207,
    feasible_pack([battery, camera], 7, 18),
    rule(7, [2, 1093, 246, 1, 100, 249])
).
proof_step(
    2,
    1208,
    feasible_pack([atlas, camera], 5, 14),
    rule(7, [2, 1094, 247, 1, 101, 250])
).
proof_step(2, 1209, feasible_pack([camera], 3, 8), rule(7, [2, 1095, 228, 1, 103, 229])).
proof_step(
    2,
    1210,
    feasible_pack([atlas, battery], 6, 16),
    rule(7, [2, 1096, 244, 1, 102, 245])
).
proof_step(
    2,
    1211,
    feasible_pack([battery], 4, 10),
    rule(7, [2, 1097, 226, 1, 99, 227])
).
proof_step(2, 1212, feasible_pack([atlas], 2, 6), rule(7, [2, 1098, 224, 1, 98, 225])).
proof_step(2, 1213, feasible_pack([], 0, 0), rule(7, [2, 1099, 12, 1, 20, 13])).
proof_step(2, 1214, '$aggregate:r8:1'([], 40), aggregate(rule(8), 1, 1)).
proof_step(
    2,
    1215,
    best_pack([atlas, battery, camera, medkit, sensor], 15, 40),
    rule(8, [1214, 1110])
).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 13).
proof_boundary_steps(2, 1, 206, 1213).
proof_boundary_call(2, 1, subset([], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    subset(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    subset(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    subset(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    subset(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    subset([emergency_radio, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    subset([field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, subset([medkit, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, subset([sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera, drone], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, camera], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, battery, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, battery, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, battery], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, camera, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, camera, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, camera, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, drone, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, drone, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([atlas, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([atlas, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([atlas, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, medkit, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([atlas], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, drone], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, camera, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([battery, camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([battery, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([battery, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([battery, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([battery, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([battery, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([battery, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([battery, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([battery, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([battery], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([camera, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([camera, drone, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([camera, drone, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([camera, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([camera, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([camera, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([camera, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([camera, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([camera, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([drone, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([drone, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([drone, medkit, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([drone, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([drone, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([emergency_radio, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_value([emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([emergency_radio], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_value([field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_value([field_laptop, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([field_laptop, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([medkit, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_value([sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, emergency_radio],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, drone, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, drone], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, emergency_radio, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, camera, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, camera], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, emergency_radio, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, drone, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, drone], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, battery, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, battery, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, battery], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, emergency_radio, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, drone, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, camera, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, camera, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, camera, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, drone, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([atlas, drone, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([atlas, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [atlas, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight([atlas, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([atlas, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([atlas, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([atlas], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, emergency_radio, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, drone, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, drone], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, camera, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, camera, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([battery, camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, drone, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([battery, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [battery, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([battery, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([battery, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([battery, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([battery], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, drone, emergency_radio, field_laptop],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, drone, emergency_radio, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, drone, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([camera, drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [camera, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([camera, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([camera, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight([camera, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([camera, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([camera, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([camera], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([drone, camera], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [drone, emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [drone, emergency_radio, field_laptop, medkit],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight(
        [drone, emergency_radio, field_laptop, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, emergency_radio], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([drone, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([drone, field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight([drone, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([drone, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([drone, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([drone], variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    total_weight(
        [emergency_radio, field_laptop, medkit, sensor],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, field_laptop, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, field_laptop, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, field_laptop], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, medkit], variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    total_weight([emergency_radio, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([emergency_radio], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([field_laptop, drone, camera], 16)).
proof_boundary_call(
    2,
    1,
    total_weight([field_laptop, medkit, sensor], variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, total_weight([field_laptop, medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([field_laptop, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([field_laptop], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([medkit, sensor], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([medkit], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, total_weight([sensor], variable("_EyeplCall0"))).
proof_claim(2, answer(2, [1215])).

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
