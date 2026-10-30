% Answer 1
left_coset(e, e).
left_coset(e, t12).
left_coset(c123, c123).
left_coset(c123, t13).
left_coset(c132, c132).
left_coset(c132, t23).

% Answer 2
left_coset(c123, c123).
left_coset(c123, t13).

% Reason 2
proof_step(2, 1, element(e, [1, 2, 3]), source(1)).
proof_step(2, 2, element(t12, [2, 1, 3]), source(2)).
proof_step(2, 3, element(t13, [3, 2, 1]), source(3)).
proof_step(2, 4, element(t23, [1, 3, 2]), source(4)).
proof_step(2, 5, element(c123, [2, 3, 1]), source(5)).
proof_step(2, 6, element(c132, [3, 1, 2]), source(6)).
proof_step(2, 7, subgroup(e), source(7)).
proof_step(2, 8, subgroup(t12), source(8)).
proof_step(2, 9, apply([1, 2, 3], 1, 1), rule(1, [])).
proof_step(2, 10, apply([1, 2, 3], 2, 2), rule(2, [])).
proof_step(2, 11, apply([1, 2, 3], 3, 3), rule(3, [])).
proof_step(2, 12, apply([2, 1, 3], 1, 2), rule(1, [])).
proof_step(2, 13, apply([2, 1, 3], 2, 1), rule(2, [])).
proof_step(2, 14, apply([2, 1, 3], 3, 3), rule(3, [])).
proof_step(2, 15, apply([3, 2, 1], 1, 3), rule(1, [])).
proof_step(2, 16, apply([3, 2, 1], 2, 2), rule(2, [])).
proof_step(2, 17, apply([3, 2, 1], 3, 1), rule(3, [])).
proof_step(2, 18, apply([1, 3, 2], 1, 1), rule(1, [])).
proof_step(2, 19, apply([1, 3, 2], 2, 3), rule(2, [])).
proof_step(2, 20, apply([1, 3, 2], 3, 2), rule(3, [])).
proof_step(2, 21, apply([2, 3, 1], 1, 2), rule(1, [])).
proof_step(2, 22, apply([2, 3, 1], 2, 3), rule(2, [])).
proof_step(2, 23, apply([2, 3, 1], 3, 1), rule(3, [])).
proof_step(2, 24, apply([3, 1, 2], 1, 3), rule(1, [])).
proof_step(2, 25, apply([3, 1, 2], 2, 1), rule(2, [])).
proof_step(2, 26, apply([3, 1, 2], 3, 2), rule(3, [])).
proof_step(2, 27, '@<'(e, t12), builtin).
proof_step(2, 28, '@<'(c123, t13), builtin).
proof_step(2, 29, '@<'(c132, t23), builtin).
proof_step(2, 30, compose([1, 2, 3], [1, 2, 3], [1, 2, 3]), rule(4, [9, 10, 11])).
proof_step(2, 31, compose([1, 2, 3], [1, 3, 2], [1, 3, 2]), rule(4, [9, 11, 10])).
proof_step(2, 32, compose([1, 2, 3], [2, 1, 3], [2, 1, 3]), rule(4, [10, 9, 11])).
proof_step(2, 33, compose([1, 2, 3], [2, 3, 1], [2, 3, 1]), rule(4, [10, 11, 9])).
proof_step(2, 34, compose([1, 2, 3], [3, 2, 1], [3, 2, 1]), rule(4, [11, 10, 9])).
proof_step(2, 35, compose([1, 2, 3], [3, 1, 2], [3, 1, 2]), rule(4, [11, 9, 10])).
proof_step(2, 36, compose([2, 1, 3], [1, 2, 3], [2, 1, 3]), rule(4, [12, 13, 14])).
proof_step(2, 37, compose([2, 1, 3], [1, 3, 2], [2, 3, 1]), rule(4, [12, 14, 13])).
proof_step(2, 38, compose([2, 1, 3], [2, 1, 3], [1, 2, 3]), rule(4, [13, 12, 14])).
proof_step(2, 39, compose([2, 1, 3], [2, 3, 1], [1, 3, 2]), rule(4, [13, 14, 12])).
proof_step(2, 40, compose([2, 1, 3], [3, 2, 1], [3, 1, 2]), rule(4, [14, 13, 12])).
proof_step(2, 41, compose([2, 1, 3], [3, 1, 2], [3, 2, 1]), rule(4, [14, 12, 13])).
proof_step(2, 42, compose([3, 2, 1], [1, 2, 3], [3, 2, 1]), rule(4, [15, 16, 17])).
proof_step(2, 43, compose([3, 2, 1], [1, 3, 2], [3, 1, 2]), rule(4, [15, 17, 16])).
proof_step(2, 44, compose([3, 2, 1], [2, 1, 3], [2, 3, 1]), rule(4, [16, 15, 17])).
proof_step(2, 45, compose([3, 2, 1], [2, 3, 1], [2, 1, 3]), rule(4, [16, 17, 15])).
proof_step(2, 46, compose([3, 2, 1], [3, 2, 1], [1, 2, 3]), rule(4, [17, 16, 15])).
proof_step(2, 47, compose([3, 2, 1], [3, 1, 2], [1, 3, 2]), rule(4, [17, 15, 16])).
proof_step(2, 48, compose([1, 3, 2], [1, 2, 3], [1, 3, 2]), rule(4, [18, 19, 20])).
proof_step(2, 49, compose([1, 3, 2], [1, 3, 2], [1, 2, 3]), rule(4, [18, 20, 19])).
proof_step(2, 50, compose([1, 3, 2], [2, 1, 3], [3, 1, 2]), rule(4, [19, 18, 20])).
proof_step(2, 51, compose([1, 3, 2], [2, 3, 1], [3, 2, 1]), rule(4, [19, 20, 18])).
proof_step(2, 52, compose([1, 3, 2], [3, 2, 1], [2, 3, 1]), rule(4, [20, 19, 18])).
proof_step(2, 53, compose([1, 3, 2], [3, 1, 2], [2, 1, 3]), rule(4, [20, 18, 19])).
proof_step(2, 54, compose([2, 3, 1], [1, 2, 3], [2, 3, 1]), rule(4, [21, 22, 23])).
proof_step(2, 55, compose([2, 3, 1], [1, 3, 2], [2, 1, 3]), rule(4, [21, 23, 22])).
proof_step(2, 56, compose([2, 3, 1], [2, 1, 3], [3, 2, 1]), rule(4, [22, 21, 23])).
proof_step(2, 57, compose([2, 3, 1], [2, 3, 1], [3, 1, 2]), rule(4, [22, 23, 21])).
proof_step(2, 58, compose([2, 3, 1], [3, 2, 1], [1, 3, 2]), rule(4, [23, 22, 21])).
proof_step(2, 59, compose([2, 3, 1], [3, 1, 2], [1, 2, 3]), rule(4, [23, 21, 22])).
proof_step(2, 60, compose([3, 1, 2], [1, 2, 3], [3, 1, 2]), rule(4, [24, 25, 26])).
proof_step(2, 61, compose([3, 1, 2], [1, 3, 2], [3, 2, 1]), rule(4, [24, 26, 25])).
proof_step(2, 62, compose([3, 1, 2], [2, 1, 3], [1, 3, 2]), rule(4, [25, 24, 26])).
proof_step(2, 63, compose([3, 1, 2], [2, 3, 1], [1, 2, 3]), rule(4, [25, 26, 24])).
proof_step(2, 64, compose([3, 1, 2], [3, 2, 1], [2, 1, 3]), rule(4, [26, 25, 24])).
proof_step(2, 65, compose([3, 1, 2], [3, 1, 2], [2, 3, 1]), rule(4, [26, 24, 25])).
proof_step(2, 66, product(e, e, e), rule(5, [1, 1, 30, 1])).
proof_step(2, 67, product(e, t23, t23), rule(5, [1, 4, 31, 4])).
proof_step(2, 68, product(e, t12, t12), rule(5, [1, 2, 32, 2])).
proof_step(2, 69, product(e, c123, c123), rule(5, [1, 5, 33, 5])).
proof_step(2, 70, product(e, t13, t13), rule(5, [1, 3, 34, 3])).
proof_step(2, 71, product(e, c132, c132), rule(5, [1, 6, 35, 6])).
proof_step(2, 72, product(t12, e, t12), rule(5, [2, 1, 36, 2])).
proof_step(2, 73, product(t12, t23, c123), rule(5, [2, 4, 37, 5])).
proof_step(2, 74, product(t12, t12, e), rule(5, [2, 2, 38, 1])).
proof_step(2, 75, product(t12, c123, t23), rule(5, [2, 5, 39, 4])).
proof_step(2, 76, product(t12, t13, c132), rule(5, [2, 3, 40, 6])).
proof_step(2, 77, product(t12, c132, t13), rule(5, [2, 6, 41, 3])).
proof_step(2, 78, product(t13, e, t13), rule(5, [3, 1, 42, 3])).
proof_step(2, 79, product(t13, t23, c132), rule(5, [3, 4, 43, 6])).
proof_step(2, 80, product(t13, t12, c123), rule(5, [3, 2, 44, 5])).
proof_step(2, 81, product(t13, c123, t12), rule(5, [3, 5, 45, 2])).
proof_step(2, 82, product(t13, t13, e), rule(5, [3, 3, 46, 1])).
proof_step(2, 83, product(t13, c132, t23), rule(5, [3, 6, 47, 4])).
proof_step(2, 84, product(t23, e, t23), rule(5, [4, 1, 48, 4])).
proof_step(2, 85, product(t23, t23, e), rule(5, [4, 4, 49, 1])).
proof_step(2, 86, product(t23, t12, c132), rule(5, [4, 2, 50, 6])).
proof_step(2, 87, product(t23, c123, t13), rule(5, [4, 5, 51, 3])).
proof_step(2, 88, product(t23, t13, c123), rule(5, [4, 3, 52, 5])).
proof_step(2, 89, product(t23, c132, t12), rule(5, [4, 6, 53, 2])).
proof_step(2, 90, product(c123, e, c123), rule(5, [5, 1, 54, 5])).
proof_step(2, 91, product(c123, t23, t12), rule(5, [5, 4, 55, 2])).
proof_step(2, 92, product(c123, t12, t13), rule(5, [5, 2, 56, 3])).
proof_step(2, 93, product(c123, c123, c132), rule(5, [5, 5, 57, 6])).
proof_step(2, 94, product(c123, t13, t23), rule(5, [5, 3, 58, 4])).
proof_step(2, 95, product(c123, c132, e), rule(5, [5, 6, 59, 1])).
proof_step(2, 96, product(c132, e, c132), rule(5, [6, 1, 60, 6])).
proof_step(2, 97, product(c132, t23, t13), rule(5, [6, 4, 61, 3])).
proof_step(2, 98, product(c132, t12, t23), rule(5, [6, 2, 62, 4])).
proof_step(2, 99, product(c132, c123, e), rule(5, [6, 5, 63, 1])).
proof_step(2, 100, product(c132, t13, t12), rule(5, [6, 3, 64, 2])).
proof_step(2, 101, product(c132, c132, c123), rule(5, [6, 6, 65, 5])).
proof_step(2, 102, left_member(e, e), rule(7, [1, 7, 66])).
proof_step(2, 103, right_member(e, e), rule(8, [1, 7, 66])).
proof_step(2, 104, inverse(e, e), rule(6, [66, 66])).
proof_step(2, 105, right_member(t23, t23), rule(8, [4, 7, 67])).
proof_step(2, 106, left_member(e, t12), rule(7, [1, 8, 68])).
proof_step(2, 107, right_member(t12, t12), rule(8, [2, 7, 68])).
proof_step(2, 108, right_member(c123, c123), rule(8, [5, 7, 69])).
proof_step(2, 109, right_member(t13, t13), rule(8, [3, 7, 70])).
proof_step(2, 110, right_member(c132, c132), rule(8, [6, 7, 71])).
proof_step(2, 111, left_member(t12, t12), rule(7, [2, 7, 72])).
proof_step(2, 112, right_member(e, t12), rule(8, [1, 8, 72])).
proof_step(2, 113, right_member(t23, c123), rule(8, [4, 8, 73])).
proof_step(2, 114, left_member(t12, e), rule(7, [2, 8, 74])).
proof_step(2, 115, right_member(t12, e), rule(8, [2, 8, 74])).
proof_step(2, 116, inverse(t12, t12), rule(6, [74, 74])).
proof_step(2, 117, right_member(c123, t23), rule(8, [5, 8, 75])).
proof_step(2, 118, right_member(t13, c132), rule(8, [3, 8, 76])).
proof_step(2, 119, right_member(c132, t13), rule(8, [6, 8, 77])).
proof_step(2, 120, left_member(t13, t13), rule(7, [3, 7, 78])).
proof_step(2, 121, left_member(t13, c123), rule(7, [3, 8, 80])).
proof_step(2, 122, inverse(t13, t13), rule(6, [82, 82])).
proof_step(2, 123, left_member(t23, t23), rule(7, [4, 7, 84])).
proof_step(2, 124, inverse(t23, t23), rule(6, [85, 85])).
proof_step(2, 125, left_member(t23, c132), rule(7, [4, 8, 86])).
proof_step(2, 126, left_member(c123, c123), rule(7, [5, 7, 90])).
proof_step(2, 127, left_member(c123, t13), rule(7, [5, 8, 92])).
proof_step(2, 128, left_member(c132, c132), rule(7, [6, 7, 96])).
proof_step(2, 129, left_member(c132, t23), rule(7, [6, 8, 98])).
proof_step(2, 130, inverse(c123, c132), rule(6, [95, 99])).
proof_step(2, 131, inverse(c132, c123), rule(6, [99, 95])).
proof_step(2, 132, smaller_left_member(t12), rule(9, [114, 27])).
proof_step(2, 133, smaller_left_member(t13), rule(9, [121, 28])).
proof_step(2, 134, smaller_left_member(t23), rule(9, [125, 29])).
proof_step(2, 135, smaller_left_member(c123), absent(1)).
proof_step(2, 136, left_coset(c123, c123), rule(10, [126, 135])).
proof_step(2, 137, left_coset(c123, t13), rule(10, [127, 135])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 26).
proof_boundary_steps(2, 1, 30, 134).
proof_boundary_call(2, 1, apply([1, 2, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([1, 2, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([1, 2, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([1, 3, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([1, 3, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([1, 3, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 1, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 1, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 1, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 3, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 3, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([2, 3, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 1, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 1, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 1, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 2, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 2, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, apply([3, 2, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 2, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([1, 3, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 1, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([2, 3, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 1, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(2, 1, compose([3, 2, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_claim(2, answer(2, [136])).
proof_claim(2, answer(2, [137])).

% Answer 3
lagrange(6, 2, 3).

% Reason 3
proof_step(3, 1, element(e, [1, 2, 3]), source(1)).
proof_step(3, 2, element(t12, [2, 1, 3]), source(2)).
proof_step(3, 3, element(t13, [3, 2, 1]), source(3)).
proof_step(3, 4, element(t23, [1, 3, 2]), source(4)).
proof_step(3, 5, element(c123, [2, 3, 1]), source(5)).
proof_step(3, 6, element(c132, [3, 1, 2]), source(6)).
proof_step(3, 7, subgroup(e), source(7)).
proof_step(3, 8, subgroup(t12), source(8)).
proof_step(3, 9, apply([1, 2, 3], 1, 1), rule(1, [])).
proof_step(3, 10, apply([1, 2, 3], 2, 2), rule(2, [])).
proof_step(3, 11, apply([1, 2, 3], 3, 3), rule(3, [])).
proof_step(3, 12, apply([2, 1, 3], 1, 2), rule(1, [])).
proof_step(3, 13, apply([2, 1, 3], 2, 1), rule(2, [])).
proof_step(3, 14, apply([2, 1, 3], 3, 3), rule(3, [])).
proof_step(3, 15, apply([3, 2, 1], 1, 3), rule(1, [])).
proof_step(3, 16, apply([3, 2, 1], 2, 2), rule(2, [])).
proof_step(3, 17, apply([3, 2, 1], 3, 1), rule(3, [])).
proof_step(3, 18, apply([1, 3, 2], 1, 1), rule(1, [])).
proof_step(3, 19, apply([1, 3, 2], 2, 3), rule(2, [])).
proof_step(3, 20, apply([1, 3, 2], 3, 2), rule(3, [])).
proof_step(3, 21, apply([2, 3, 1], 1, 2), rule(1, [])).
proof_step(3, 22, apply([2, 3, 1], 2, 3), rule(2, [])).
proof_step(3, 23, apply([2, 3, 1], 3, 1), rule(3, [])).
proof_step(3, 24, apply([3, 1, 2], 1, 3), rule(1, [])).
proof_step(3, 25, apply([3, 1, 2], 2, 1), rule(2, [])).
proof_step(3, 26, apply([3, 1, 2], 3, 2), rule(3, [])).
proof_step(3, 27, '@<'(e, t12), builtin).
proof_step(3, 28, '@<'(c123, t13), builtin).
proof_step(3, 29, '@<'(c132, t23), builtin).
proof_step(3, 30, '=:='(6, '*'(2, 3)), builtin).
proof_step(3, 31, compose([1, 2, 3], [1, 2, 3], [1, 2, 3]), rule(4, [9, 10, 11])).
proof_step(3, 32, compose([1, 2, 3], [1, 3, 2], [1, 3, 2]), rule(4, [9, 11, 10])).
proof_step(3, 33, compose([1, 2, 3], [2, 1, 3], [2, 1, 3]), rule(4, [10, 9, 11])).
proof_step(3, 34, compose([1, 2, 3], [2, 3, 1], [2, 3, 1]), rule(4, [10, 11, 9])).
proof_step(3, 35, compose([1, 2, 3], [3, 2, 1], [3, 2, 1]), rule(4, [11, 10, 9])).
proof_step(3, 36, compose([1, 2, 3], [3, 1, 2], [3, 1, 2]), rule(4, [11, 9, 10])).
proof_step(3, 37, compose([2, 1, 3], [1, 2, 3], [2, 1, 3]), rule(4, [12, 13, 14])).
proof_step(3, 38, compose([2, 1, 3], [1, 3, 2], [2, 3, 1]), rule(4, [12, 14, 13])).
proof_step(3, 39, compose([2, 1, 3], [2, 1, 3], [1, 2, 3]), rule(4, [13, 12, 14])).
proof_step(3, 40, compose([2, 1, 3], [2, 3, 1], [1, 3, 2]), rule(4, [13, 14, 12])).
proof_step(3, 41, compose([2, 1, 3], [3, 2, 1], [3, 1, 2]), rule(4, [14, 13, 12])).
proof_step(3, 42, compose([2, 1, 3], [3, 1, 2], [3, 2, 1]), rule(4, [14, 12, 13])).
proof_step(3, 43, compose([3, 2, 1], [1, 2, 3], [3, 2, 1]), rule(4, [15, 16, 17])).
proof_step(3, 44, compose([3, 2, 1], [1, 3, 2], [3, 1, 2]), rule(4, [15, 17, 16])).
proof_step(3, 45, compose([3, 2, 1], [2, 1, 3], [2, 3, 1]), rule(4, [16, 15, 17])).
proof_step(3, 46, compose([3, 2, 1], [2, 3, 1], [2, 1, 3]), rule(4, [16, 17, 15])).
proof_step(3, 47, compose([3, 2, 1], [3, 2, 1], [1, 2, 3]), rule(4, [17, 16, 15])).
proof_step(3, 48, compose([3, 2, 1], [3, 1, 2], [1, 3, 2]), rule(4, [17, 15, 16])).
proof_step(3, 49, compose([1, 3, 2], [1, 2, 3], [1, 3, 2]), rule(4, [18, 19, 20])).
proof_step(3, 50, compose([1, 3, 2], [1, 3, 2], [1, 2, 3]), rule(4, [18, 20, 19])).
proof_step(3, 51, compose([1, 3, 2], [2, 1, 3], [3, 1, 2]), rule(4, [19, 18, 20])).
proof_step(3, 52, compose([1, 3, 2], [2, 3, 1], [3, 2, 1]), rule(4, [19, 20, 18])).
proof_step(3, 53, compose([1, 3, 2], [3, 2, 1], [2, 3, 1]), rule(4, [20, 19, 18])).
proof_step(3, 54, compose([1, 3, 2], [3, 1, 2], [2, 1, 3]), rule(4, [20, 18, 19])).
proof_step(3, 55, compose([2, 3, 1], [1, 2, 3], [2, 3, 1]), rule(4, [21, 22, 23])).
proof_step(3, 56, compose([2, 3, 1], [1, 3, 2], [2, 1, 3]), rule(4, [21, 23, 22])).
proof_step(3, 57, compose([2, 3, 1], [2, 1, 3], [3, 2, 1]), rule(4, [22, 21, 23])).
proof_step(3, 58, compose([2, 3, 1], [2, 3, 1], [3, 1, 2]), rule(4, [22, 23, 21])).
proof_step(3, 59, compose([2, 3, 1], [3, 2, 1], [1, 3, 2]), rule(4, [23, 22, 21])).
proof_step(3, 60, compose([2, 3, 1], [3, 1, 2], [1, 2, 3]), rule(4, [23, 21, 22])).
proof_step(3, 61, compose([3, 1, 2], [1, 2, 3], [3, 1, 2]), rule(4, [24, 25, 26])).
proof_step(3, 62, compose([3, 1, 2], [1, 3, 2], [3, 2, 1]), rule(4, [24, 26, 25])).
proof_step(3, 63, compose([3, 1, 2], [2, 1, 3], [1, 3, 2]), rule(4, [25, 24, 26])).
proof_step(3, 64, compose([3, 1, 2], [2, 3, 1], [1, 2, 3]), rule(4, [25, 26, 24])).
proof_step(3, 65, compose([3, 1, 2], [3, 2, 1], [2, 1, 3]), rule(4, [26, 25, 24])).
proof_step(3, 66, compose([3, 1, 2], [3, 1, 2], [2, 3, 1]), rule(4, [26, 24, 25])).
proof_step(3, 67, product(e, e, e), rule(5, [1, 1, 31, 1])).
proof_step(3, 68, product(e, t23, t23), rule(5, [1, 4, 32, 4])).
proof_step(3, 69, product(e, t12, t12), rule(5, [1, 2, 33, 2])).
proof_step(3, 70, product(e, c123, c123), rule(5, [1, 5, 34, 5])).
proof_step(3, 71, product(e, t13, t13), rule(5, [1, 3, 35, 3])).
proof_step(3, 72, product(e, c132, c132), rule(5, [1, 6, 36, 6])).
proof_step(3, 73, product(t12, e, t12), rule(5, [2, 1, 37, 2])).
proof_step(3, 74, product(t12, t23, c123), rule(5, [2, 4, 38, 5])).
proof_step(3, 75, product(t12, t12, e), rule(5, [2, 2, 39, 1])).
proof_step(3, 76, product(t12, c123, t23), rule(5, [2, 5, 40, 4])).
proof_step(3, 77, product(t12, t13, c132), rule(5, [2, 3, 41, 6])).
proof_step(3, 78, product(t12, c132, t13), rule(5, [2, 6, 42, 3])).
proof_step(3, 79, product(t13, e, t13), rule(5, [3, 1, 43, 3])).
proof_step(3, 80, product(t13, t23, c132), rule(5, [3, 4, 44, 6])).
proof_step(3, 81, product(t13, t12, c123), rule(5, [3, 2, 45, 5])).
proof_step(3, 82, product(t13, c123, t12), rule(5, [3, 5, 46, 2])).
proof_step(3, 83, product(t13, t13, e), rule(5, [3, 3, 47, 1])).
proof_step(3, 84, product(t13, c132, t23), rule(5, [3, 6, 48, 4])).
proof_step(3, 85, product(t23, e, t23), rule(5, [4, 1, 49, 4])).
proof_step(3, 86, product(t23, t23, e), rule(5, [4, 4, 50, 1])).
proof_step(3, 87, product(t23, t12, c132), rule(5, [4, 2, 51, 6])).
proof_step(3, 88, product(t23, c123, t13), rule(5, [4, 5, 52, 3])).
proof_step(3, 89, product(t23, t13, c123), rule(5, [4, 3, 53, 5])).
proof_step(3, 90, product(t23, c132, t12), rule(5, [4, 6, 54, 2])).
proof_step(3, 91, product(c123, e, c123), rule(5, [5, 1, 55, 5])).
proof_step(3, 92, product(c123, t23, t12), rule(5, [5, 4, 56, 2])).
proof_step(3, 93, product(c123, t12, t13), rule(5, [5, 2, 57, 3])).
proof_step(3, 94, product(c123, c123, c132), rule(5, [5, 5, 58, 6])).
proof_step(3, 95, product(c123, t13, t23), rule(5, [5, 3, 59, 4])).
proof_step(3, 96, product(c123, c132, e), rule(5, [5, 6, 60, 1])).
proof_step(3, 97, product(c132, e, c132), rule(5, [6, 1, 61, 6])).
proof_step(3, 98, product(c132, t23, t13), rule(5, [6, 4, 62, 3])).
proof_step(3, 99, product(c132, t12, t23), rule(5, [6, 2, 63, 4])).
proof_step(3, 100, product(c132, c123, e), rule(5, [6, 5, 64, 1])).
proof_step(3, 101, product(c132, t13, t12), rule(5, [6, 3, 65, 2])).
proof_step(3, 102, product(c132, c132, c123), rule(5, [6, 6, 66, 5])).
proof_step(3, 103, left_member(e, e), rule(7, [1, 7, 67])).
proof_step(3, 104, right_member(e, e), rule(8, [1, 7, 67])).
proof_step(3, 105, inverse(e, e), rule(6, [67, 67])).
proof_step(3, 106, right_member(t23, t23), rule(8, [4, 7, 68])).
proof_step(3, 107, left_member(e, t12), rule(7, [1, 8, 69])).
proof_step(3, 108, right_member(t12, t12), rule(8, [2, 7, 69])).
proof_step(3, 109, right_member(c123, c123), rule(8, [5, 7, 70])).
proof_step(3, 110, right_member(t13, t13), rule(8, [3, 7, 71])).
proof_step(3, 111, right_member(c132, c132), rule(8, [6, 7, 72])).
proof_step(3, 112, left_member(t12, t12), rule(7, [2, 7, 73])).
proof_step(3, 113, right_member(e, t12), rule(8, [1, 8, 73])).
proof_step(3, 114, right_member(t23, c123), rule(8, [4, 8, 74])).
proof_step(3, 115, left_member(t12, e), rule(7, [2, 8, 75])).
proof_step(3, 116, right_member(t12, e), rule(8, [2, 8, 75])).
proof_step(3, 117, inverse(t12, t12), rule(6, [75, 75])).
proof_step(3, 118, right_member(c123, t23), rule(8, [5, 8, 76])).
proof_step(3, 119, right_member(t13, c132), rule(8, [3, 8, 77])).
proof_step(3, 120, right_member(c132, t13), rule(8, [6, 8, 78])).
proof_step(3, 121, left_member(t13, t13), rule(7, [3, 7, 79])).
proof_step(3, 122, left_member(t13, c123), rule(7, [3, 8, 81])).
proof_step(3, 123, inverse(t13, t13), rule(6, [83, 83])).
proof_step(3, 124, left_member(t23, t23), rule(7, [4, 7, 85])).
proof_step(3, 125, inverse(t23, t23), rule(6, [86, 86])).
proof_step(3, 126, left_member(t23, c132), rule(7, [4, 8, 87])).
proof_step(3, 127, left_member(c123, c123), rule(7, [5, 7, 91])).
proof_step(3, 128, left_member(c123, t13), rule(7, [5, 8, 93])).
proof_step(3, 129, left_member(c132, c132), rule(7, [6, 7, 97])).
proof_step(3, 130, left_member(c132, t23), rule(7, [6, 8, 99])).
proof_step(3, 131, inverse(c123, c132), rule(6, [96, 100])).
proof_step(3, 132, inverse(c132, c123), rule(6, [100, 96])).
proof_step(3, 133, smaller_left_member(t12), rule(9, [115, 27])).
proof_step(3, 134, smaller_left_member(t13), rule(9, [122, 28])).
proof_step(3, 135, smaller_left_member(t23), rule(9, [126, 29])).
proof_step(3, 136, smaller_left_member(e), absent(1)).
proof_step(3, 137, smaller_left_member(c123), absent(1)).
proof_step(3, 138, smaller_left_member(c132), absent(1)).
proof_step(3, 139, right_member(t13, c123), absent(1)).
proof_step(3, 140, right_member(t23, c132), absent(1)).
proof_step(3, 141, right_member(c123, t13), absent(1)).
proof_step(3, 142, right_member(c132, t23), absent(1)).
proof_step(3, 143, '$aggregate:r19:1'([], 6), aggregate(rule(19), 1, 1)).
proof_step(
    3,
    144,
    '$aggregate:r19:2'([binding('Order', 6)], 2),
    aggregate(rule(19), 2, 1)
).
proof_step(3, 145, left_coset(e, e), rule(10, [103, 136])).
proof_step(3, 146, left_coset(e, t12), rule(10, [107, 136])).
proof_step(3, 147, left_coset(c123, c123), rule(10, [127, 137])).
proof_step(3, 148, left_coset(c123, t13), rule(10, [128, 137])).
proof_step(3, 149, left_coset(c132, c132), rule(10, [129, 138])).
proof_step(3, 150, left_coset(c132, t23), rule(10, [130, 138])).
proof_step(3, 151, normality_counterexample(t13, c123), rule(14, [122, 139])).
proof_step(3, 152, normality_counterexample(t23, c132), rule(14, [126, 140])).
proof_step(3, 153, normality_counterexample(c123, t13), rule(14, [128, 141])).
proof_step(3, 154, normality_counterexample(c132, t23), rule(14, [130, 142])).
proof_step(3, 155, representative(e), rule(11, [145])).
proof_step(3, 156, covered(e), rule(12, [145])).
proof_step(3, 157, covered(t12), rule(12, [146])).
proof_step(3, 158, representative(c123), rule(11, [147])).
proof_step(3, 159, covered(c123), rule(12, [147])).
proof_step(3, 160, covered(t13), rule(12, [148])).
proof_step(3, 161, representative(c132), rule(11, [149])).
proof_step(3, 162, covered(c132), rule(12, [149])).
proof_step(3, 163, covered(t23), rule(12, [150])).
proof_step(
    3,
    164,
    '$aggregate:r19:3'([binding('Order', 6), binding('SubgroupOrder', 2)], 3),
    aggregate(rule(19), 3, 2)
).
proof_step(3, 165, lagrange(6, 2, 3), rule(19, [143, 144, 164, 30])).
proof_boundary(3, 1, 0).
proof_boundary_steps(3, 1, 1, 26).
proof_boundary_steps(3, 1, 31, 135).
proof_boundary_call(3, 1, apply([1, 2, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([1, 2, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([1, 2, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([1, 3, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([1, 3, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([1, 3, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 1, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 1, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 1, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 3, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 3, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([2, 3, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 1, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 1, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 1, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 2, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 2, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, apply([3, 2, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 2, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([1, 3, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 1, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([2, 3, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 1, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 1, compose([3, 2, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary(3, 2, 1).
proof_boundary_steps(3, 2, 1, 26).
proof_boundary_steps(3, 2, 31, 135).
proof_boundary_steps(3, 2, 145, 163).
proof_boundary_call(3, 2, apply([1, 2, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([1, 2, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([1, 2, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([1, 3, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([1, 3, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([1, 3, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 1, 3], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 1, 3], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 1, 3], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 3, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 3, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([2, 3, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 1, 2], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 1, 2], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 1, 2], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 2, 1], 1, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 2, 1], 2, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, apply([3, 2, 1], 3, variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 2, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([1, 3, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 1, 3], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([2, 3, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 1, 2], [3, 2, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [1, 2, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [1, 3, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [2, 1, 3], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [2, 3, 1], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [3, 1, 2], variable("_EyeplCall0"))).
proof_boundary_call(3, 2, compose([3, 2, 1], [3, 2, 1], variable("_EyeplCall0"))).
proof_claim(3, answer(3, [165])).

% Answer 4
normality_counterexample(t13, c123).
normality_counterexample(t23, c132).
normality_counterexample(c123, t13).
normality_counterexample(c132, t23).

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
