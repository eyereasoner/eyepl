% Answer 1
scores(
    case,
    [0.001547, 4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5]
).

% Answer 2
'evidence-total'(case, 0.00164363).

% Answer 3
posterior([covid19, case], 0.9412093962753174).

% Answer 4
posterior([influenza, case], 0.02920365289024903).

% Answer 5
posterior(['allergic-rhinitis', case], 0.0004563070764101409).

% Answer 6
posterior(['bacterial-pneumonia', case], 0.029130643758023392).

% Reason 6
proof_step(6, 1, is_a(covid19, disease), source(1)).
proof_step(6, 2, is_a(influenza, disease), source(2)).
proof_step(6, 3, is_a('allergic-rhinitis', disease), source(3)).
proof_step(6, 4, is_a('bacterial-pneumonia', disease), source(4)).
proof_step(6, 5, prior(covid19, 0.05), source(5)).
proof_step(6, 6, prior(influenza, 0.03), source(6)).
proof_step(6, 7, prior('allergic-rhinitis', 0.1), source(7)).
proof_step(6, 8, prior('bacterial-pneumonia', 0.01), source(8)).
proof_step(6, 9, probability([covid19, fever], 0.7), source(9)).
proof_step(6, 10, probability([covid19, 'dry-cough'], 0.65), source(10)).
proof_step(6, 11, probability([covid19, 'loss-of-smell'], 0.4), source(11)).
proof_step(6, 12, probability([covid19, sneezing], 0.15), source(12)).
proof_step(6, 13, probability([covid19, 'short-breath'], 0.2), source(13)).
proof_step(6, 14, probability([influenza, fever], 0.8), source(14)).
proof_step(6, 15, probability([influenza, 'dry-cough'], 0.5), source(15)).
proof_step(6, 16, probability([influenza, 'loss-of-smell'], 0.05), source(16)).
proof_step(6, 17, probability([influenza, sneezing], 0.2), source(17)).
proof_step(6, 18, probability([influenza, 'short-breath'], 0.1), source(18)).
proof_step(6, 19, probability(['allergic-rhinitis', fever], 0.05), source(19)).
proof_step(6, 20, probability(['allergic-rhinitis', 'dry-cough'], 0.15), source(20)).
proof_step(6, 21, probability(['allergic-rhinitis', 'loss-of-smell'], 0.1), source(21)).
proof_step(6, 22, probability(['allergic-rhinitis', sneezing], 0.8), source(22)).
proof_step(6, 23, probability(['allergic-rhinitis', 'short-breath'], 0.05), source(23)).
proof_step(6, 24, probability(['bacterial-pneumonia', fever], 0.7), source(24)).
proof_step(6, 25, probability(['bacterial-pneumonia', 'dry-cough'], 0.6), source(25)).
proof_step(
    6,
    26,
    probability(['bacterial-pneumonia', 'loss-of-smell'], 0.02),
    source(26)
).
proof_step(6, 27, probability(['bacterial-pneumonia', sneezing], 0.05), source(27)).
proof_step(6, 28, probability(['bacterial-pneumonia', 'short-breath'], 0.6), source(28)).
proof_step(6, 29, is_a(case, 'patient-case'), source(29)).
proof_step(
    6,
    30,
    diseases(case, [covid19, influenza, 'allergic-rhinitis', 'bacterial-pneumonia']),
    source(30)
).
proof_step(
    6,
    31,
    evidence(
        case,
        [
            [fever, present],
            ['dry-cough', present],
            ['loss-of-smell', present],
            [sneezing, absent],
            ['short-breath', present]
        ]
    ),
    source(31)
).
proof_step(6, 32, sum([], 0), source(32)).
proof_step(6, 33, is(0.85, '-'(1, 0.15)), builtin).
proof_step(6, 34, is(0.8, '-'(1, 0.2)), builtin).
proof_step(6, 35, is(0.19999999999999996, '-'(1, 0.8)), builtin).
proof_step(6, 36, is(0.95, '-'(1, 0.05)), builtin).
proof_step(6, 37, is(0.2, '*'(0.2, 1)), builtin).
proof_step(6, 38, is(0.1, '*'(0.1, 1)), builtin).
proof_step(6, 39, is(0.17, '*'(0.85, 0.2)), builtin).
proof_step(6, 40, is(0.05, '*'(0.05, 1)), builtin).
proof_step(6, 41, is(0.08000000000000002, '*'(0.8, 0.1)), builtin).
proof_step(6, 42, is(0.6, '*'(0.6, 1)), builtin).
proof_step(6, 43, is(0.068, '*'(0.4, 0.17)), builtin).
proof_step(6, 44, is(0.009999999999999998, '*'(0.19999999999999996, 0.05)), builtin).
proof_step(6, 45, is(0.004000000000000001, '*'(0.05, 0.08000000000000002)), builtin).
proof_step(6, 46, is(0.57, '*'(0.95, 0.6)), builtin).
proof_step(6, 47, is(0.0442, '*'(0.65, 0.068)), builtin).
proof_step(6, 48, is(0.0009999999999999998, '*'(0.1, 0.009999999999999998)), builtin).
proof_step(6, 49, is(0.0020000000000000005, '*'(0.5, 0.004000000000000001)), builtin).
proof_step(6, 50, is(0.011399999999999999, '*'(0.02, 0.57)), builtin).
proof_step(6, 51, is(0.03094, '*'(0.7, 0.0442)), builtin).
proof_step(6, 52, is(0.00014999999999999996, '*'(0.15, 0.0009999999999999998)), builtin).
proof_step(6, 53, is(0.0016000000000000005, '*'(0.8, 0.0020000000000000005)), builtin).
proof_step(6, 54, is(0.006839999999999999, '*'(0.6, 0.011399999999999999)), builtin).
proof_step(6, 55, is(0.001547, '*'(0.05, 0.03094)), builtin).
proof_step(6, 56, is(7.4999999999999985e-6, '*'(0.05, 0.00014999999999999996)), builtin).
proof_step(6, 57, is(4.8000000000000015e-5, '*'(0.03, 0.0016000000000000005)), builtin).
proof_step(6, 58, is(0.004787999999999999, '*'(0.7, 0.006839999999999999)), builtin).
proof_step(6, 59, is(7.499999999999999e-7, '*'(0.1, 7.4999999999999985e-6)), builtin).
proof_step(6, 60, is(4.787999999999999e-5, '*'(0.01, 0.004787999999999999)), builtin).
proof_step(6, 61, is(4.787999999999999e-5, '+'(4.787999999999999e-5, 0)), builtin).
proof_step(
    6,
    62,
    is(4.862999999999999e-5, '+'(7.499999999999999e-7, 4.787999999999999e-5)),
    builtin
).
proof_step(
    6,
    63,
    is(9.663e-5, '+'(4.8000000000000015e-5, 4.862999999999999e-5)),
    builtin
).
proof_step(6, 64, is(0.00164363, '+'(0.001547, 9.663e-5)), builtin).
proof_step(6, 65, '>'(0.00164363, 0), builtin).
proof_step(
    6,
    66,
    is(0.029130643758023392, '/'(4.787999999999999e-5, 0.00164363)),
    builtin
).
proof_step(6, 67, likelihood([covid19, []], 1), rule(3, [1])).
proof_step(6, 68, likelihood([influenza, []], 1), rule(3, [2])).
proof_step(6, 69, likelihood(['allergic-rhinitis', []], 1), rule(3, [3])).
proof_step(6, 70, likelihood(['bacterial-pneumonia', []], 1), rule(3, [4])).
proof_step(6, 71, factor([covid19, [fever, present]], 0.7), rule(1, [9])).
proof_step(6, 72, factor([covid19, ['dry-cough', present]], 0.65), rule(1, [10])).
proof_step(6, 73, factor([covid19, ['loss-of-smell', present]], 0.4), rule(1, [11])).
proof_step(6, 74, factor([covid19, ['short-breath', present]], 0.2), rule(1, [13])).
proof_step(6, 75, factor([influenza, [fever, present]], 0.8), rule(1, [14])).
proof_step(6, 76, factor([influenza, ['dry-cough', present]], 0.5), rule(1, [15])).
proof_step(6, 77, factor([influenza, ['loss-of-smell', present]], 0.05), rule(1, [16])).
proof_step(6, 78, factor([influenza, ['short-breath', present]], 0.1), rule(1, [18])).
proof_step(6, 79, factor(['allergic-rhinitis', [fever, present]], 0.05), rule(1, [19])).
proof_step(
    6,
    80,
    factor(['allergic-rhinitis', ['dry-cough', present]], 0.15),
    rule(1, [20])
).
proof_step(
    6,
    81,
    factor(['allergic-rhinitis', ['loss-of-smell', present]], 0.1),
    rule(1, [21])
).
proof_step(
    6,
    82,
    factor(['allergic-rhinitis', ['short-breath', present]], 0.05),
    rule(1, [23])
).
proof_step(6, 83, factor(['bacterial-pneumonia', [fever, present]], 0.7), rule(1, [24])).
proof_step(
    6,
    84,
    factor(['bacterial-pneumonia', ['dry-cough', present]], 0.6),
    rule(1, [25])
).
proof_step(
    6,
    85,
    factor(['bacterial-pneumonia', ['loss-of-smell', present]], 0.02),
    rule(1, [26])
).
proof_step(
    6,
    86,
    factor(['bacterial-pneumonia', ['short-breath', present]], 0.6),
    rule(1, [28])
).
proof_step(6, 87, scores([[], case], []), rule(6, [29])).
proof_step(
    6,
    88,
    candidates(case, [covid19, influenza, 'allergic-rhinitis', 'bacterial-pneumonia']),
    rule(11, [29, 30])
).
proof_step(6, 89, factor([covid19, [sneezing, absent]], 0.85), rule(2, [12, 33])).
proof_step(6, 90, factor([influenza, [sneezing, absent]], 0.8), rule(2, [17, 34])).
proof_step(
    6,
    91,
    factor(['allergic-rhinitis', [sneezing, absent]], 0.19999999999999996),
    rule(2, [22, 35])
).
proof_step(
    6,
    92,
    factor(['bacterial-pneumonia', [sneezing, absent]], 0.95),
    rule(2, [27, 36])
).
proof_step(6, 93, sum([4.787999999999999e-5], 4.787999999999999e-5), rule(8, [32, 61])).
proof_step(
    6,
    94,
    likelihood([covid19, [['short-breath', present]]], 0.2),
    rule(4, [74, 67, 37])
).
proof_step(
    6,
    95,
    likelihood([influenza, [['short-breath', present]]], 0.1),
    rule(4, [78, 68, 38])
).
proof_step(
    6,
    96,
    likelihood(['allergic-rhinitis', [['short-breath', present]]], 0.05),
    rule(4, [82, 69, 40])
).
proof_step(
    6,
    97,
    likelihood(['bacterial-pneumonia', [['short-breath', present]]], 0.6),
    rule(4, [86, 70, 42])
).
proof_step(
    6,
    98,
    candidates(case, [influenza, 'allergic-rhinitis', 'bacterial-pneumonia']),
    rule(12, [88])
).
proof_step(
    6,
    99,
    sum([7.499999999999999e-7, 4.787999999999999e-5], 4.862999999999999e-5),
    rule(8, [93, 62])
).
proof_step(
    6,
    100,
    likelihood([covid19, [[sneezing, absent], ['short-breath', present]]], 0.17),
    rule(4, [89, 94, 39])
).
proof_step(
    6,
    101,
    likelihood(
        [influenza, [[sneezing, absent], ['short-breath', present]]],
        0.08000000000000002
    ),
    rule(4, [90, 95, 41])
).
proof_step(
    6,
    102,
    likelihood(
        ['allergic-rhinitis', [[sneezing, absent], ['short-breath', present]]],
        0.009999999999999998
    ),
    rule(4, [91, 96, 44])
).
proof_step(
    6,
    103,
    likelihood(
        ['bacterial-pneumonia', [[sneezing, absent], ['short-breath', present]]],
        0.57
    ),
    rule(4, [92, 97, 46])
).
proof_step(
    6,
    104,
    candidates(case, ['allergic-rhinitis', 'bacterial-pneumonia']),
    rule(12, [98])
).
proof_step(
    6,
    105,
    sum([4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5], 9.663e-5),
    rule(8, [99, 63])
).
proof_step(
    6,
    106,
    likelihood(
        [
            covid19,
            [['loss-of-smell', present], [sneezing, absent], ['short-breath', present]]
        ],
        0.068
    ),
    rule(4, [73, 100, 43])
).
proof_step(
    6,
    107,
    likelihood(
        [
            influenza,
            [['loss-of-smell', present], [sneezing, absent], ['short-breath', present]]
        ],
        0.004000000000000001
    ),
    rule(4, [77, 101, 45])
).
proof_step(
    6,
    108,
    likelihood(
        [
            'allergic-rhinitis',
            [['loss-of-smell', present], [sneezing, absent], ['short-breath', present]]
        ],
        0.0009999999999999998
    ),
    rule(4, [81, 102, 48])
).
proof_step(
    6,
    109,
    likelihood(
        [
            'bacterial-pneumonia',
            [['loss-of-smell', present], [sneezing, absent], ['short-breath', present]]
        ],
        0.011399999999999999
    ),
    rule(4, [85, 103, 50])
).
proof_step(6, 110, candidates(case, ['bacterial-pneumonia']), rule(12, [104])).
proof_step(
    6,
    111,
    sum(
        [0.001547, 4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5],
        0.00164363
    ),
    rule(8, [105, 64])
).
proof_step(
    6,
    112,
    likelihood(
        [
            covid19,
            [
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.0442
    ),
    rule(4, [72, 106, 47])
).
proof_step(
    6,
    113,
    likelihood(
        [
            influenza,
            [
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.0020000000000000005
    ),
    rule(4, [76, 107, 49])
).
proof_step(
    6,
    114,
    likelihood(
        [
            'allergic-rhinitis',
            [
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.00014999999999999996
    ),
    rule(4, [80, 108, 52])
).
proof_step(
    6,
    115,
    likelihood(
        [
            'bacterial-pneumonia',
            [
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.006839999999999999
    ),
    rule(4, [84, 109, 54])
).
proof_step(
    6,
    116,
    likelihood(
        [
            covid19,
            [
                [fever, present],
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.03094
    ),
    rule(4, [71, 112, 51])
).
proof_step(
    6,
    117,
    likelihood(
        [
            influenza,
            [
                [fever, present],
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.0016000000000000005
    ),
    rule(4, [75, 113, 53])
).
proof_step(
    6,
    118,
    likelihood(
        [
            'allergic-rhinitis',
            [
                [fever, present],
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        7.4999999999999985e-6
    ),
    rule(4, [79, 114, 56])
).
proof_step(
    6,
    119,
    likelihood(
        [
            'bacterial-pneumonia',
            [
                [fever, present],
                ['dry-cough', present],
                ['loss-of-smell', present],
                [sneezing, absent],
                ['short-breath', present]
            ]
        ],
        0.004787999999999999
    ),
    rule(4, [83, 115, 58])
).
proof_step(6, 120, score([covid19, case], 0.001547), rule(5, [5, 31, 116, 55])).
proof_step(
    6,
    121,
    score([influenza, case], 4.8000000000000015e-5),
    rule(5, [6, 31, 117, 57])
).
proof_step(
    6,
    122,
    score(['allergic-rhinitis', case], 7.499999999999999e-7),
    rule(5, [7, 31, 118, 59])
).
proof_step(
    6,
    123,
    score(['bacterial-pneumonia', case], 4.787999999999999e-5),
    rule(5, [8, 31, 119, 60])
).
proof_step(
    6,
    124,
    scores([['bacterial-pneumonia'], case], [4.787999999999999e-5]),
    rule(7, [123, 87])
).
proof_step(
    6,
    125,
    scores(
        [['allergic-rhinitis', 'bacterial-pneumonia'], case],
        [7.499999999999999e-7, 4.787999999999999e-5]
    ),
    rule(7, [122, 124])
).
proof_step(
    6,
    126,
    scores(
        [[influenza, 'allergic-rhinitis', 'bacterial-pneumonia'], case],
        [4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5]
    ),
    rule(7, [121, 125])
).
proof_step(
    6,
    127,
    scores(
        [[covid19, influenza, 'allergic-rhinitis', 'bacterial-pneumonia'], case],
        [0.001547, 4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5]
    ),
    rule(7, [120, 126])
).
proof_step(
    6,
    128,
    scores(
        case,
        [0.001547, 4.8000000000000015e-5, 7.499999999999999e-7, 4.787999999999999e-5]
    ),
    rule(9, [29, 30, 127])
).
proof_step(6, 129, 'evidence-total'(case, 0.00164363), rule(10, [29, 128, 111])).
proof_step(
    6,
    130,
    posterior(['bacterial-pneumonia', case], 0.029130643758023392),
    rule(13, [110, 123, 129, 65, 66])
).
proof_claim(6, answer(6, [130])).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).

% Goal check 9
check_result(9, true).
