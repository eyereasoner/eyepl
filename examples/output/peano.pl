% Answer 1
add(s(s(s(zero))), zero, s(s(s(zero)))).
add(s(s(zero)), s(zero), s(s(s(zero)))).
add(s(zero), s(s(zero)), s(s(s(zero)))).
add(zero, s(s(s(zero))), s(s(s(zero)))).

% Reason 1
proof_step(1, 1, add(s(s(s(zero))), zero, s(s(s(zero)))), rule(1, [])).
proof_step(1, 2, add(s(s(zero)), zero, s(s(zero))), rule(1, [])).
proof_step(1, 3, add(s(zero), zero, s(zero)), rule(1, [])).
proof_step(1, 4, add(zero, zero, zero), rule(1, [])).
proof_step(1, 5, add(s(s(zero)), s(zero), s(s(s(zero)))), rule(2, [2])).
proof_step(1, 6, add(s(zero), s(zero), s(s(zero))), rule(2, [3])).
proof_step(1, 7, add(zero, s(zero), s(zero)), rule(2, [4])).
proof_step(1, 8, add(s(zero), s(s(zero)), s(s(s(zero)))), rule(2, [6])).
proof_step(1, 9, add(zero, s(s(zero)), s(s(zero))), rule(2, [7])).
proof_step(1, 10, add(zero, s(s(s(zero))), s(s(s(zero)))), rule(2, [9])).
proof_claim(1, answer(1, [1])).
proof_claim(1, answer(1, [5])).
proof_claim(1, answer(1, [8])).
proof_claim(1, answer(1, [10])).

% Answer 2
multiply(s(zero), s(s(zero)), s(s(zero))).
add(s(s(zero)), s(s(s(zero))), s(s(s(s(s(zero)))))).
factorial(
    s(s(s(s(s(zero))))),
    s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
).

% Reason 2
proof_step(2, 1, factorial(zero, s(zero)), source(1)).
proof_step(2, 2, add(s(s(s(zero))), zero, s(s(s(zero)))), rule(1, [])).
proof_step(2, 3, add(s(s(zero)), zero, s(s(zero))), rule(1, [])).
proof_step(2, 4, add(s(zero), zero, s(zero)), rule(1, [])).
proof_step(2, 5, multiply(s(zero), zero, zero), rule(3, [])).
proof_step(2, 6, multiply(s(s(zero)), zero, zero), rule(3, [])).
proof_step(2, 7, multiply(s(s(s(zero))), zero, zero), rule(3, [])).
proof_step(2, 8, multiply(s(s(s(s(zero)))), zero, zero), rule(3, [])).
proof_step(2, 9, add(s(s(s(s(zero)))), zero, s(s(s(s(zero))))), rule(1, [])).
proof_step(2, 10, multiply(s(s(s(s(s(zero))))), zero, zero), rule(3, [])).
proof_step(2, 11, add(s(s(s(s(s(zero))))), zero, s(s(s(s(s(zero)))))), rule(1, [])).
proof_step(2, 12, add(s(s(s(zero))), s(zero), s(s(s(s(zero))))), rule(2, [2])).
proof_step(2, 13, add(s(s(zero)), s(zero), s(s(s(zero)))), rule(2, [3])).
proof_step(2, 14, add(s(zero), s(zero), s(s(zero))), rule(2, [4])).
proof_step(2, 15, multiply(s(zero), s(zero), s(zero)), rule(4, [5, 4])).
proof_step(2, 16, multiply(s(s(zero)), s(zero), s(s(zero))), rule(4, [6, 3])).
proof_step(2, 17, multiply(s(s(s(zero))), s(zero), s(s(s(zero)))), rule(4, [7, 2])).
proof_step(
    2,
    18,
    multiply(s(s(s(s(zero)))), s(zero), s(s(s(s(zero))))),
    rule(4, [8, 9])
).
proof_step(2, 19, add(s(s(s(s(zero)))), s(zero), s(s(s(s(s(zero)))))), rule(2, [9])).
proof_step(
    2,
    20,
    multiply(s(s(s(s(s(zero))))), s(zero), s(s(s(s(s(zero)))))),
    rule(4, [10, 11])
).
proof_step(
    2,
    21,
    add(s(s(s(s(s(zero))))), s(zero), s(s(s(s(s(s(zero))))))),
    rule(2, [11])
).
proof_step(2, 22, add(s(s(s(zero))), s(s(zero)), s(s(s(s(s(zero)))))), rule(2, [12])).
proof_step(2, 23, add(s(s(zero)), s(s(zero)), s(s(s(s(zero))))), rule(2, [13])).
proof_step(2, 24, multiply(s(zero), s(s(zero)), s(s(zero))), rule(4, [15, 14])).
proof_step(2, 25, factorial(s(zero), s(zero)), rule(5, [1, 15])).
proof_step(
    2,
    26,
    add(s(s(s(s(zero)))), s(s(zero)), s(s(s(s(s(s(zero))))))),
    rule(2, [19])
).
proof_step(
    2,
    27,
    add(s(s(s(s(s(zero))))), s(s(zero)), s(s(s(s(s(s(s(zero)))))))),
    rule(2, [21])
).
proof_step(
    2,
    28,
    add(s(s(s(zero))), s(s(s(zero))), s(s(s(s(s(s(zero))))))),
    rule(2, [22])
).
proof_step(2, 29, add(s(s(zero)), s(s(s(zero))), s(s(s(s(s(zero)))))), rule(2, [23])).
proof_step(2, 30, factorial(s(s(zero)), s(s(zero))), rule(5, [25, 16])).
proof_step(
    2,
    31,
    add(s(s(s(s(zero)))), s(s(s(zero))), s(s(s(s(s(s(s(zero)))))))),
    rule(2, [26])
).
proof_step(
    2,
    32,
    add(s(s(s(s(s(zero))))), s(s(s(zero))), s(s(s(s(s(s(s(s(zero))))))))),
    rule(2, [27])
).
proof_step(
    2,
    33,
    multiply(s(s(s(zero))), s(s(zero)), s(s(s(s(s(s(zero))))))),
    rule(4, [17, 28])
).
proof_step(
    2,
    34,
    add(s(s(s(s(zero)))), s(s(s(s(zero)))), s(s(s(s(s(s(s(s(zero))))))))),
    rule(2, [31])
).
proof_step(
    2,
    35,
    add(s(s(s(s(s(zero))))), s(s(s(s(zero)))), s(s(s(s(s(s(s(s(s(zero)))))))))),
    rule(2, [32])
).
proof_step(2, 36, factorial(s(s(s(zero))), s(s(s(s(s(s(zero))))))), rule(5, [30, 33])).
proof_step(
    2,
    37,
    multiply(s(s(s(s(zero)))), s(s(zero)), s(s(s(s(s(s(s(s(zero))))))))),
    rule(4, [18, 34])
).
proof_step(
    2,
    38,
    add(s(s(s(s(zero)))), s(s(s(s(s(zero))))), s(s(s(s(s(s(s(s(s(zero)))))))))),
    rule(2, [34])
).
proof_step(
    2,
    39,
    add(s(s(s(s(s(zero))))), s(s(s(s(s(zero))))), s(s(s(s(s(s(s(s(s(s(zero))))))))))),
    rule(2, [35])
).
proof_step(
    2,
    40,
    add(s(s(s(s(zero)))), s(s(s(s(s(s(zero)))))), s(s(s(s(s(s(s(s(s(s(zero))))))))))),
    rule(2, [38])
).
proof_step(
    2,
    41,
    multiply(s(s(s(s(s(zero))))), s(s(zero)), s(s(s(s(s(s(s(s(s(s(zero))))))))))),
    rule(4, [20, 39])
).
proof_step(
    2,
    42,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(zero)))))),
        s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))
    ),
    rule(2, [39])
).
proof_step(
    2,
    43,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(zero))))))),
        s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))
    ),
    rule(2, [40])
).
proof_step(
    2,
    44,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(zero))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))
    ),
    rule(2, [42])
).
proof_step(
    2,
    45,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(zero)))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))
    ),
    rule(2, [43])
).
proof_step(
    2,
    46,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(zero)))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))
    ),
    rule(2, [44])
).
proof_step(
    2,
    47,
    multiply(s(s(s(s(zero)))), s(s(s(zero))), s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))),
    rule(4, [37, 45])
).
proof_step(
    2,
    48,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(zero))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))
    ),
    rule(2, [45])
).
proof_step(
    2,
    49,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(zero))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))
    ),
    rule(2, [46])
).
proof_step(
    2,
    50,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(zero)))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))
    ),
    rule(2, [48])
).
proof_step(
    2,
    51,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(zero)))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))
    ),
    rule(2, [49])
).
proof_step(
    2,
    52,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(zero))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))
    ),
    rule(2, [50])
).
proof_step(
    2,
    53,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(zero))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))
    ),
    rule(4, [41, 51])
).
proof_step(
    2,
    54,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(zero))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))
    ),
    rule(2, [51])
).
proof_step(
    2,
    55,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))
    ),
    rule(2, [52])
).
proof_step(
    2,
    56,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))
    ),
    rule(2, [54])
).
proof_step(
    2,
    57,
    multiply(
        s(s(s(s(zero)))),
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))
    ),
    rule(4, [47, 55])
).
proof_step(
    2,
    58,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))
    ),
    rule(2, [55])
).
proof_step(
    2,
    59,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))
    ),
    rule(2, [56])
).
proof_step(
    2,
    60,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))
    ),
    rule(2, [58])
).
proof_step(
    2,
    61,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))
    ),
    rule(2, [59])
).
proof_step(
    2,
    62,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))
    ),
    rule(2, [60])
).
proof_step(
    2,
    63,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))
    ),
    rule(2, [61])
).
proof_step(
    2,
    64,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))
    ),
    rule(2, [62])
).
proof_step(
    2,
    65,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))
    ),
    rule(4, [53, 63])
).
proof_step(
    2,
    66,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))
    ),
    rule(2, [63])
).
proof_step(
    2,
    67,
    multiply(
        s(s(s(s(zero)))),
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))
    ),
    rule(4, [57, 64])
).
proof_step(
    2,
    68,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))
    ),
    rule(2, [64])
).
proof_step(
    2,
    69,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))
    ),
    rule(2, [66])
).
proof_step(
    2,
    70,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))
    ),
    rule(2, [68])
).
proof_step(
    2,
    71,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))
    ),
    rule(2, [69])
).
proof_step(
    2,
    72,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))
    ),
    rule(2, [70])
).
proof_step(
    2,
    73,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))
    ),
    rule(2, [71])
).
proof_step(
    2,
    74,
    add(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))
    ),
    rule(2, [72])
).
proof_step(
    2,
    75,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))
    ),
    rule(2, [73])
).
proof_step(
    2,
    76,
    multiply(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(zero)))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))
    ),
    rule(4, [67, 74])
).
proof_step(
    2,
    77,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))
    ),
    rule(4, [65, 75])
).
proof_step(
    2,
    78,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))
    ),
    rule(2, [75])
).
proof_step(
    2,
    79,
    factorial(
        s(s(s(s(zero)))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))
    ),
    rule(5, [36, 76])
).
proof_step(
    2,
    80,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))
    ),
    rule(2, [78])
).
proof_step(
    2,
    81,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))
    ),
    rule(2, [80])
).
proof_step(
    2,
    82,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))
    ),
    rule(2, [81])
).
proof_step(
    2,
    83,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))
    ),
    rule(2, [82])
).
proof_step(
    2,
    84,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(zero)))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))
    ),
    rule(4, [77, 83])
).
proof_step(
    2,
    85,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))
    ),
    rule(2, [83])
).
proof_step(
    2,
    86,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))
    ),
    rule(2, [85])
).
proof_step(
    2,
    87,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))
    ),
    rule(2, [86])
).
proof_step(
    2,
    88,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))
    ),
    rule(2, [87])
).
proof_step(
    2,
    89,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))
    ),
    rule(2, [88])
).
proof_step(
    2,
    90,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(zero))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))
    ),
    rule(4, [84, 89])
).
proof_step(
    2,
    91,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [89])
).
proof_step(
    2,
    92,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [91])
).
proof_step(
    2,
    93,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [92])
).
proof_step(
    2,
    94,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [93])
).
proof_step(
    2,
    95,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [94])
).
proof_step(
    2,
    96,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(zero)))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [90, 95])
).
proof_step(
    2,
    97,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [95])
).
proof_step(
    2,
    98,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [97])
).
proof_step(
    2,
    99,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [98])
).
proof_step(
    2,
    100,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [99])
).
proof_step(
    2,
    101,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [100])
).
proof_step(
    2,
    102,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(zero))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [96, 101])
).
proof_step(
    2,
    103,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [101])
).
proof_step(
    2,
    104,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [103])
).
proof_step(
    2,
    105,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [104])
).
proof_step(
    2,
    106,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [105])
).
proof_step(
    2,
    107,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [106])
).
proof_step(
    2,
    108,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(zero)))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [102, 107])
).
proof_step(
    2,
    109,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [107])
).
proof_step(
    2,
    110,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [109])
).
proof_step(
    2,
    111,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [110])
).
proof_step(
    2,
    112,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [111])
).
proof_step(
    2,
    113,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [112])
).
proof_step(
    2,
    114,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(zero))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [108, 113])
).
proof_step(
    2,
    115,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [113])
).
proof_step(
    2,
    116,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [115])
).
proof_step(
    2,
    117,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [116])
).
proof_step(
    2,
    118,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [117])
).
proof_step(
    2,
    119,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [118])
).
proof_step(
    2,
    120,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [114, 119])
).
proof_step(
    2,
    121,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [119])
).
proof_step(
    2,
    122,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [121])
).
proof_step(
    2,
    123,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [122])
).
proof_step(
    2,
    124,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [123])
).
proof_step(
    2,
    125,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [124])
).
proof_step(
    2,
    126,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [120, 125])
).
proof_step(
    2,
    127,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [125])
).
proof_step(
    2,
    128,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [127])
).
proof_step(
    2,
    129,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [128])
).
proof_step(
    2,
    130,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [129])
).
proof_step(
    2,
    131,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [130])
).
proof_step(
    2,
    132,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [126, 131])
).
proof_step(
    2,
    133,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [131])
).
proof_step(
    2,
    134,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [133])
).
proof_step(
    2,
    135,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [134])
).
proof_step(
    2,
    136,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [135])
).
proof_step(
    2,
    137,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [136])
).
proof_step(
    2,
    138,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [132, 137])
).
proof_step(
    2,
    139,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [137])
).
proof_step(
    2,
    140,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [139])
).
proof_step(
    2,
    141,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [140])
).
proof_step(
    2,
    142,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [141])
).
proof_step(
    2,
    143,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [142])
).
proof_step(
    2,
    144,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [138, 143])
).
proof_step(
    2,
    145,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [143])
).
proof_step(
    2,
    146,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [145])
).
proof_step(
    2,
    147,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [146])
).
proof_step(
    2,
    148,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [147])
).
proof_step(
    2,
    149,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [148])
).
proof_step(
    2,
    150,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [144, 149])
).
proof_step(
    2,
    151,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [149])
).
proof_step(
    2,
    152,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [151])
).
proof_step(
    2,
    153,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [152])
).
proof_step(
    2,
    154,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [153])
).
proof_step(
    2,
    155,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [154])
).
proof_step(
    2,
    156,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [150, 155])
).
proof_step(
    2,
    157,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [155])
).
proof_step(
    2,
    158,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [157])
).
proof_step(
    2,
    159,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [158])
).
proof_step(
    2,
    160,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [159])
).
proof_step(
    2,
    161,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [160])
).
proof_step(
    2,
    162,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [156, 161])
).
proof_step(
    2,
    163,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [161])
).
proof_step(
    2,
    164,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [163])
).
proof_step(
    2,
    165,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [164])
).
proof_step(
    2,
    166,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [165])
).
proof_step(
    2,
    167,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [166])
).
proof_step(
    2,
    168,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [162, 167])
).
proof_step(
    2,
    169,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [167])
).
proof_step(
    2,
    170,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [169])
).
proof_step(
    2,
    171,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [170])
).
proof_step(
    2,
    172,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [171])
).
proof_step(
    2,
    173,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [172])
).
proof_step(
    2,
    174,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [168, 173])
).
proof_step(
    2,
    175,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [173])
).
proof_step(
    2,
    176,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [175])
).
proof_step(
    2,
    177,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [176])
).
proof_step(
    2,
    178,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [177])
).
proof_step(
    2,
    179,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [178])
).
proof_step(
    2,
    180,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [174, 179])
).
proof_step(
    2,
    181,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [179])
).
proof_step(
    2,
    182,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [181])
).
proof_step(
    2,
    183,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [182])
).
proof_step(
    2,
    184,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [183])
).
proof_step(
    2,
    185,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [184])
).
proof_step(
    2,
    186,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [180, 185])
).
proof_step(
    2,
    187,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [185])
).
proof_step(
    2,
    188,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [187])
).
proof_step(
    2,
    189,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [188])
).
proof_step(
    2,
    190,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [189])
).
proof_step(
    2,
    191,
    add(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(2, [190])
).
proof_step(
    2,
    192,
    multiply(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero)))))))))))))))))))))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(4, [186, 191])
).
proof_step(
    2,
    193,
    factorial(
        s(s(s(s(s(zero))))),
        s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(zero))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    ),
    rule(5, [79, 192])
).
proof_claim(2, answer(2, [24, 29, 193])).

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
