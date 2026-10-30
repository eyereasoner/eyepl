% Answer 1
assessment(
    [baseline, r3],
    [['deny-policy', ['prohibited-by', 'no-marketing']], [policy]]
).
assessment(
    [baseline, r6],
    [['deny-policy', ['prohibited-by', 'no-transfer-us']], [policy]]
).
assessment(
    ['omnibus-proposal', r3],
    [['deny-policy', ['prohibited-by', 'no-marketing']], [policy]]
).
assessment(
    ['omnibus-proposal', r6],
    [['deny-policy', ['prohibited-by', 'no-transfer-us']], [policy]]
).
assessment(
    ['omnibus-proposal', r1],
    [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]]
).
assessment([baseline, r10], [[permit, research], [policy, "ePrivacy Art. 5(3)"]]).
assessment(
    ['omnibus-proposal', r10],
    [[permit, research], [policy, "GDPR Art. 88a(3)(b)"]]
).
assessment([baseline, r11], [['deny-policy', 'no-matching-permission'], [policy]]).
assessment(
    ['omnibus-proposal', r11],
    [['deny-policy', 'no-matching-permission'], [policy]]
).
assessment(
    [baseline, r1],
    [['await-device-consent', research], [policy, "ePrivacy Art. 5(3)"]]
).
assessment(
    [baseline, r7],
    [['await-device-consent', research], [policy, "ePrivacy Art. 5(3)"]]
).
assessment(
    [baseline, r8],
    [['await-device-consent', research], [policy, "ePrivacy Art. 5(3)"]]
).
assessment(
    [baseline, r9],
    [['await-device-consent', research], [policy, "ePrivacy Art. 5(3)"]]
).
assessment(
    ['omnibus-proposal', r9],
    [
        ['await-device-consent', research],
        [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]
    ]
).
assessment(
    ['omnibus-proposal', r7],
    [
        ['deny-device', 'refused-by-signal'],
        [policy, "GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"]
    ]
).
assessment(
    ['omnibus-proposal', r8],
    [
        ['deny-device', 'do-not-ask-again'],
        [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]
    ]
).
assessment(
    [baseline, r2],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, 'for-research', purpose, 'personalised-advertising',
                        within, 'research-and-development'
                    ],
                    [
                        unmet, 'under-consent', 'legal-basis', 'legitimate-interest',
                        equal, consent
                    ],
                    [
                        unmet, 'consent-given', 'consent-status', 'consent-unknown',
                        equal, 'consent-given'
                    ]
                ]
            ]
        ],
        [policy]
    ]
).
assessment(
    ['omnibus-proposal', r2],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, 'for-research', purpose, 'personalised-advertising',
                        within, 'research-and-development'
                    ],
                    [
                        unmet, 'under-consent', 'legal-basis', 'legitimate-interest',
                        equal, consent
                    ],
                    [
                        unmet, 'consent-given', 'consent-status', 'consent-unknown',
                        equal, 'consent-given'
                    ]
                ]
            ]
        ],
        [policy]
    ]
).
assessment(
    [baseline, r4],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                        equal, 'consent-given'
                    ]
                ]
            ]
        ],
        [policy]
    ]
).
assessment(
    ['omnibus-proposal', r4],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                        equal, 'consent-given'
                    ]
                ]
            ]
        ],
        [policy]
    ]
).
assessment(
    [baseline, r5],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, pseudonymised, 'technical-measure', encryption, equal,
                        pseudonymisation
                    ],
                    [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
                ]
            ]
        ],
        [policy]
    ]
).
assessment(
    ['omnibus-proposal', r5],
    [
        [
            'deny-policy',
            [
                'not-permitted',
                [
                    [
                        unmet, pseudonymised, 'technical-measure', encryption, equal,
                        pseudonymisation
                    ],
                    [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
                ]
            ]
        ],
        [policy]
    ]
).

% Answer 2
'breach-plan'(
    [baseline, b1],
    [
        [notify, [authority, none], [people, none]],
        'document-breach',
        ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).
'breach-plan'(
    [baseline, b2],
    [
        [notify, [authority, ['within-hours', 72]], [people, none]],
        'document-breach',
        ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).
'breach-plan'(
    [baseline, b3],
    [
        [notify, [authority, ['within-hours', 72]], [people, 'without-undue-delay']],
        'document-breach',
        ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).
'breach-plan'(
    ['omnibus-proposal', b1],
    [
        [notify, [authority, none], [people, none]],
        'document-breach',
        ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).
'breach-plan'(
    ['omnibus-proposal', b2],
    [
        [notify, [authority, none], [people, none]],
        'document-breach',
        ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).
'breach-plan'(
    ['omnibus-proposal', b3],
    [
        [
            notify,
            [authority, ['within-hours-via-single-entry-point', 96]],
            [people, 'without-undue-delay']
        ],
        'document-breach',
        ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
    ]
).

% Answer 3
'planned-duty'(['omnibus-proposal', r1], [delete, ['within-days', 90]]).
'planned-duty'([baseline, r10], [delete, ['within-days', 90]]).
'planned-duty'(['omnibus-proposal', r10], [delete, ['within-days', 90]]).

% Answer 4
'policy-conflict'(
    r6,
    ['resolved-by', prohibit, 'no-transfer-us', [overrides, research]]
).

% Answer 5
change(
    [breach, b2],
    [
        from,
        [notify, [authority, ['within-hours', 72]], [people, none]],
        to,
        [notify, [authority, none], [people, none]]
    ]
).
change(
    [breach, b3],
    [
        from,
        [notify, [authority, ['within-hours', 72]], [people, 'without-undue-delay']],
        to,
        [
            notify,
            [authority, ['within-hours-via-single-entry-point', 96]],
            [people, 'without-undue-delay']
        ]
    ]
).
change(
    [session, r1],
    [from, ['await-device-consent', research], to, [permit, research]]
).
change(
    [session, r7],
    [from, ['await-device-consent', research], to, ['deny-device', 'refused-by-signal']]
).
change(
    [session, r8],
    [from, ['await-device-consent', research], to, ['deny-device', 'do-not-ask-again']]
).

% Answer 6
assessment(
    ['omnibus-proposal', r1],
    [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]]
).

% Reason 6
proof_step(
    6,
    1,
    'has-broader-purpose'('academic-research', 'research-and-development'),
    source(1)
).
proof_step(
    6,
    2,
    'has-broader-purpose'('commercial-research', 'research-and-development'),
    source(2)
).
proof_step(6, 3, 'has-broader-purpose'(advertising, marketing), source(3)).
proof_step(6, 4, 'belongs-to'('partner-be', consortium), source(4)).
proof_step(6, 5, 'belongs-to'('partner-us', consortium), source(5)).
proof_step(6, 6, is_a(policy, agreement), source(6)).
proof_step(6, 7, assigner(policy, hospital), source(7)).
proof_step(6, 8, 'conflict-strategies'(policy, [prohibit]), source(8)).
proof_step(6, 9, permissions(policy, [research]), source(9)).
proof_step(6, 10, prohibitions(policy, ['no-marketing', 'no-transfer-us']), source(10)).
proof_step(6, 11, assignee(research, consortium), source(11)).
proof_step(6, 12, action(research, use), source(12)).
proof_step(6, 13, target(research, 'lab-results'), source(13)).
proof_step(
    6,
    14,
    constraints(
        research,
        ['for-research', 'under-consent', 'consent-given', pseudonymised, 'before-2027']
    ),
    source(14)
).
proof_step(6, 15, duty(research, deletion), source(15)).
proof_step(6, 16, 'duty-action'(deletion, delete), source(16)).
proof_step(6, 17, 'duty-days'(deletion, 90), source(17)).
proof_step(6, 18, assignee('no-marketing', consortium), source(18)).
proof_step(6, 19, action('no-marketing', distribute), source(19)).
proof_step(6, 20, target('no-marketing', 'lab-results'), source(20)).
proof_step(6, 21, constraints('no-marketing', ['for-marketing']), source(21)).
proof_step(6, 22, assignee('no-transfer-us', 'partner-us'), source(22)).
proof_step(6, 23, action('no-transfer-us', use), source(23)).
proof_step(6, 24, target('no-transfer-us', 'lab-results'), source(24)).
proof_step(6, 25, constraints('no-transfer-us', []), source(25)).
proof_step(
    6,
    26,
    constraint('for-research', [purpose, within, 'research-and-development']),
    source(26)
).
proof_step(
    6,
    27,
    constraint('under-consent', ['legal-basis', equal, consent]),
    source(27)
).
proof_step(
    6,
    28,
    constraint('consent-given', ['consent-status', equal, 'consent-given']),
    source(28)
).
proof_step(
    6,
    29,
    constraint(pseudonymised, ['technical-measure', equal, pseudonymisation]),
    source(29)
).
proof_step(6, 30, constraint('before-2027', [date, 'less-than', 20270101]), source(30)).
proof_step(6, 31, constraint('for-marketing', [purpose, within, marketing]), source(31)).
proof_step(
    6,
    32,
    process(
        r1,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(32)
).
proof_step(
    6,
    33,
    process(
        r2,
        [
            hospital, 'partner-be', use, 'lab-results', 'personalised-advertising',
            'legitimate-interest', 'consent-unknown', pseudonymisation, 20261115
        ]
    ),
    source(33)
).
proof_step(
    6,
    34,
    process(
        r3,
        [
            hospital, 'partner-be', share, 'lab-results', advertising, consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(34)
).
proof_step(
    6,
    35,
    process(
        r4,
        [
            hospital, 'partner-be', use, 'lab-results', 'commercial-research', consent,
            'consent-withdrawn', pseudonymisation, 20261115
        ]
    ),
    source(35)
).
proof_step(
    6,
    36,
    process(
        r5,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', encryption, 20270301
        ]
    ),
    source(36)
).
proof_step(
    6,
    37,
    process(
        r6,
        [
            hospital, 'partner-us', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(37)
).
proof_step(
    6,
    38,
    process(
        r7,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(38)
).
proof_step(
    6,
    39,
    process(
        r8,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(39)
).
proof_step(
    6,
    40,
    process(
        r9,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(40)
).
proof_step(
    6,
    41,
    process(
        r10,
        [
            hospital, 'partner-be', use, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(41)
).
proof_step(
    6,
    42,
    process(
        r11,
        [
            hospital, 'partner-be', share, 'lab-results', 'academic-research', consent,
            'consent-given', pseudonymisation, 20261115
        ]
    ),
    source(42)
).
proof_step(6, 43, 'mapped-action'(use, use), source(43)).
proof_step(6, 44, 'mapped-action'(share, distribute), source(44)).
proof_step(6, 45, session(r1, ['own-audience-measurement', 'first-visit']), source(45)).
proof_step(6, 46, session(r2, ['own-audience-measurement', 'first-visit']), source(46)).
proof_step(6, 47, session(r3, [advertising, ['browser-signal', refuse]]), source(47)).
proof_step(6, 48, session(r4, ['own-audience-measurement', 'first-visit']), source(48)).
proof_step(6, 49, session(r5, ['requested-service', 'first-visit']), source(49)).
proof_step(6, 50, session(r6, ['own-audience-measurement', 'first-visit']), source(50)).
proof_step(6, 51, session(r7, [advertising, ['browser-signal', refuse]]), source(51)).
proof_step(
    6,
    52,
    session(r8, [advertising, [refused, ['completed-months', 5]]]),
    source(52)
).
proof_step(
    6,
    53,
    session(r9, [advertising, [refused, ['completed-months', 6]]]),
    source(53)
).
proof_step(6, 54, session(r10, ['requested-service', 'first-visit']), source(54)).
proof_step(6, 55, session(r11, ['requested-service', 'first-visit']), source(55)).
proof_step(6, 56, is_a(baseline, rulebook), source(56)).
proof_step(6, 57, is_a('omnibus-proposal', rulebook), source(57)).
proof_step(6, 58, 'media-service'(portal, no), source(58)).
proof_step(6, 59, 'refusal-pause'(portal, 6), source(59)).
proof_step(
    6,
    60,
    consent([baseline, 'requested-service'], ['not-needed', "ePrivacy Art. 5(3)"]),
    source(60)
).
proof_step(
    6,
    61,
    consent([baseline, 'own-audience-measurement'], [needed, "ePrivacy Art. 5(3)"]),
    source(61)
).
proof_step(
    6,
    62,
    consent([baseline, advertising], [needed, "ePrivacy Art. 5(3)"]),
    source(62)
).
proof_step(
    6,
    63,
    consent(
        ['omnibus-proposal', 'requested-service'],
        ['not-needed', "GDPR Art. 88a(3)(b)"]
    ),
    source(63)
).
proof_step(
    6,
    64,
    consent(
        ['omnibus-proposal', 'own-audience-measurement'],
        ['not-needed', "GDPR Art. 88a(3)(c)"]
    ),
    source(64)
).
proof_step(
    6,
    65,
    consent(['omnibus-proposal', advertising], [needed, "GDPR Art. 88a(1)"]),
    source(65)
).
proof_step(6, 66, breach(b1, ["encrypted laptop lost, key safe", unlikely]), source(66)).
proof_step(
    6,
    67,
    breach(b2, ["researcher contact addresses exposed", some]),
    source(67)
).
proof_step(6, 68, breach(b3, ["patient lab records exposed", high]), source(68)).
proof_step(
    6,
    69,
    authority([baseline, unlikely], [none, "GDPR Art. 33(1)"]),
    source(69)
).
proof_step(
    6,
    70,
    authority([baseline, some], [['within-hours', 72], "GDPR Art. 33(1)"]),
    source(70)
).
proof_step(
    6,
    71,
    authority([baseline, high], [['within-hours', 72], "GDPR Art. 33(1)"]),
    source(71)
).
proof_step(
    6,
    72,
    authority(['omnibus-proposal', unlikely], [none, "GDPR Art. 33(1) as amended"]),
    source(72)
).
proof_step(
    6,
    73,
    authority(['omnibus-proposal', some], [none, "GDPR Art. 33(1) as amended"]),
    source(73)
).
proof_step(
    6,
    74,
    authority(
        ['omnibus-proposal', high],
        [['within-hours-via-single-entry-point', 96], "GDPR Art. 33(1) as amended"]
    ),
    source(74)
).
proof_step(6, 75, people(unlikely, [none, "GDPR Art. 34(1)"]), source(75)).
proof_step(6, 76, people(some, [none, "GDPR Art. 34(1)"]), source(76)).
proof_step(6, 77, people(high, ['without-undue-delay', "GDPR Art. 34(1)"]), source(77)).
proof_step(
    6,
    78,
    '='(
        [notify, [authority, ['within-hours', 72]], [people, none]],
        [notify, [authority, none], [people, none]]
    ),
    not_builtin
).
proof_step(
    6,
    79,
    '='(
        [notify, [authority, ['within-hours', 72]], [people, 'without-undue-delay']],
        [
            notify,
            [authority, ['within-hours-via-single-entry-point', 96]],
            [people, 'without-undue-delay']
        ]
    ),
    not_builtin
).
proof_step(6, 80, '='(research, research), builtin).
proof_step(6, 81, '='('no-marketing', 'no-marketing'), builtin).
proof_step(6, 82, '='('no-transfer-us', 'no-transfer-us'), builtin).
proof_step(6, 83, '<'(20261115, 20270101), builtin).
proof_step(6, 84, '>='(5, 0), builtin).
proof_step(6, 85, '<'(5, 6), builtin).
proof_step(6, 86, '>='(6, 0), builtin).
proof_step(6, 87, '>='(6, 6), builtin).
proof_step(6, 88, '='([], []), builtin).
proof_step(6, 89, '='("ePrivacy Art. 5(3)", "ePrivacy Art. 5(3)"), builtin).
proof_step(6, 90, '='("GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"), not_builtin).
proof_step(6, 91, '='("GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"), not_builtin).
proof_step(6, 92, is_a('research-and-development', purpose), rule(17, [1])).
proof_step(6, 93, is_a(marketing, purpose), rule(17, [3])).
proof_step(6, 94, 'is-member-of'('partner-be', consortium), rule(14, [4])).
proof_step(6, 95, 'is-member-of'('partner-us', consortium), rule(14, [5])).
proof_step(6, 96, controller(r1, hospital), rule(2, [32])).
proof_step(6, 97, requester(r1, 'partner-be'), rule(3, [32])).
proof_step(6, 98, processing(r1, use), rule(4, [32])).
proof_step(6, 99, data(r1, 'lab-results'), rule(5, [32])).
proof_step(6, 100, operand([r1, purpose], 'academic-research'), rule(6, [32])).
proof_step(6, 101, operand([r1, 'legal-basis'], consent), rule(7, [32])).
proof_step(6, 102, operand([r1, 'consent-status'], 'consent-given'), rule(8, [32])).
proof_step(6, 103, operand([r1, 'technical-measure'], pseudonymisation), rule(9, [32])).
proof_step(6, 104, operand([r1, date], 20261115), rule(10, [32])).
proof_step(6, 105, is_a(r1, 'research-process'), rule(1, [32])).
proof_step(6, 106, controller(r2, hospital), rule(2, [33])).
proof_step(6, 107, requester(r2, 'partner-be'), rule(3, [33])).
proof_step(6, 108, processing(r2, use), rule(4, [33])).
proof_step(6, 109, data(r2, 'lab-results'), rule(5, [33])).
proof_step(6, 110, operand([r2, purpose], 'personalised-advertising'), rule(6, [33])).
proof_step(6, 111, is_a(r2, 'research-process'), rule(1, [33])).
proof_step(6, 112, operand([r2, 'legal-basis'], 'legitimate-interest'), rule(7, [33])).
proof_step(6, 113, operand([r2, 'consent-status'], 'consent-unknown'), rule(8, [33])).
proof_step(6, 114, operand([r2, 'technical-measure'], pseudonymisation), rule(9, [33])).
proof_step(6, 115, operand([r2, date], 20261115), rule(10, [33])).
proof_step(6, 116, controller(r3, hospital), rule(2, [34])).
proof_step(6, 117, requester(r3, 'partner-be'), rule(3, [34])).
proof_step(6, 118, processing(r3, share), rule(4, [34])).
proof_step(6, 119, data(r3, 'lab-results'), rule(5, [34])).
proof_step(6, 120, operand([r3, purpose], advertising), rule(6, [34])).
proof_step(6, 121, is_a(r3, 'research-process'), rule(1, [34])).
proof_step(6, 122, controller(r4, hospital), rule(2, [35])).
proof_step(6, 123, requester(r4, 'partner-be'), rule(3, [35])).
proof_step(6, 124, processing(r4, use), rule(4, [35])).
proof_step(6, 125, data(r4, 'lab-results'), rule(5, [35])).
proof_step(6, 126, operand([r4, purpose], 'commercial-research'), rule(6, [35])).
proof_step(6, 127, operand([r4, 'legal-basis'], consent), rule(7, [35])).
proof_step(6, 128, is_a(r4, 'research-process'), rule(1, [35])).
proof_step(6, 129, operand([r4, 'consent-status'], 'consent-withdrawn'), rule(8, [35])).
proof_step(6, 130, operand([r4, 'technical-measure'], pseudonymisation), rule(9, [35])).
proof_step(6, 131, operand([r4, date], 20261115), rule(10, [35])).
proof_step(6, 132, controller(r5, hospital), rule(2, [36])).
proof_step(6, 133, requester(r5, 'partner-be'), rule(3, [36])).
proof_step(6, 134, processing(r5, use), rule(4, [36])).
proof_step(6, 135, data(r5, 'lab-results'), rule(5, [36])).
proof_step(6, 136, operand([r5, purpose], 'academic-research'), rule(6, [36])).
proof_step(6, 137, operand([r5, 'legal-basis'], consent), rule(7, [36])).
proof_step(6, 138, operand([r5, 'consent-status'], 'consent-given'), rule(8, [36])).
proof_step(6, 139, is_a(r5, 'research-process'), rule(1, [36])).
proof_step(6, 140, operand([r5, 'technical-measure'], encryption), rule(9, [36])).
proof_step(6, 141, operand([r5, date], 20270301), rule(10, [36])).
proof_step(6, 142, controller(r6, hospital), rule(2, [37])).
proof_step(6, 143, requester(r6, 'partner-us'), rule(3, [37])).
proof_step(6, 144, processing(r6, use), rule(4, [37])).
proof_step(6, 145, data(r6, 'lab-results'), rule(5, [37])).
proof_step(6, 146, is_a(r6, 'research-process'), rule(1, [37])).
proof_step(6, 147, operand([r6, purpose], 'academic-research'), rule(6, [37])).
proof_step(6, 148, operand([r6, 'legal-basis'], consent), rule(7, [37])).
proof_step(6, 149, operand([r6, 'consent-status'], 'consent-given'), rule(8, [37])).
proof_step(6, 150, operand([r6, 'technical-measure'], pseudonymisation), rule(9, [37])).
proof_step(6, 151, operand([r6, date], 20261115), rule(10, [37])).
proof_step(6, 152, controller(r7, hospital), rule(2, [38])).
proof_step(6, 153, requester(r7, 'partner-be'), rule(3, [38])).
proof_step(6, 154, processing(r7, use), rule(4, [38])).
proof_step(6, 155, data(r7, 'lab-results'), rule(5, [38])).
proof_step(6, 156, operand([r7, purpose], 'academic-research'), rule(6, [38])).
proof_step(6, 157, operand([r7, 'legal-basis'], consent), rule(7, [38])).
proof_step(6, 158, operand([r7, 'consent-status'], 'consent-given'), rule(8, [38])).
proof_step(6, 159, operand([r7, 'technical-measure'], pseudonymisation), rule(9, [38])).
proof_step(6, 160, operand([r7, date], 20261115), rule(10, [38])).
proof_step(6, 161, is_a(r7, 'research-process'), rule(1, [38])).
proof_step(6, 162, controller(r8, hospital), rule(2, [39])).
proof_step(6, 163, requester(r8, 'partner-be'), rule(3, [39])).
proof_step(6, 164, processing(r8, use), rule(4, [39])).
proof_step(6, 165, data(r8, 'lab-results'), rule(5, [39])).
proof_step(6, 166, operand([r8, purpose], 'academic-research'), rule(6, [39])).
proof_step(6, 167, operand([r8, 'legal-basis'], consent), rule(7, [39])).
proof_step(6, 168, operand([r8, 'consent-status'], 'consent-given'), rule(8, [39])).
proof_step(6, 169, operand([r8, 'technical-measure'], pseudonymisation), rule(9, [39])).
proof_step(6, 170, operand([r8, date], 20261115), rule(10, [39])).
proof_step(6, 171, is_a(r8, 'research-process'), rule(1, [39])).
proof_step(6, 172, controller(r9, hospital), rule(2, [40])).
proof_step(6, 173, requester(r9, 'partner-be'), rule(3, [40])).
proof_step(6, 174, processing(r9, use), rule(4, [40])).
proof_step(6, 175, data(r9, 'lab-results'), rule(5, [40])).
proof_step(6, 176, operand([r9, purpose], 'academic-research'), rule(6, [40])).
proof_step(6, 177, operand([r9, 'legal-basis'], consent), rule(7, [40])).
proof_step(6, 178, operand([r9, 'consent-status'], 'consent-given'), rule(8, [40])).
proof_step(6, 179, operand([r9, 'technical-measure'], pseudonymisation), rule(9, [40])).
proof_step(6, 180, operand([r9, date], 20261115), rule(10, [40])).
proof_step(6, 181, is_a(r9, 'research-process'), rule(1, [40])).
proof_step(6, 182, controller(r10, hospital), rule(2, [41])).
proof_step(6, 183, requester(r10, 'partner-be'), rule(3, [41])).
proof_step(6, 184, processing(r10, use), rule(4, [41])).
proof_step(6, 185, data(r10, 'lab-results'), rule(5, [41])).
proof_step(6, 186, operand([r10, purpose], 'academic-research'), rule(6, [41])).
proof_step(6, 187, operand([r10, 'legal-basis'], consent), rule(7, [41])).
proof_step(6, 188, operand([r10, 'consent-status'], 'consent-given'), rule(8, [41])).
proof_step(6, 189, operand([r10, 'technical-measure'], pseudonymisation), rule(9, [41])).
proof_step(6, 190, operand([r10, date], 20261115), rule(10, [41])).
proof_step(6, 191, is_a(r10, 'research-process'), rule(1, [41])).
proof_step(6, 192, controller(r11, hospital), rule(2, [42])).
proof_step(6, 193, requester(r11, 'partner-be'), rule(3, [42])).
proof_step(6, 194, processing(r11, share), rule(4, [42])).
proof_step(6, 195, data(r11, 'lab-results'), rule(5, [42])).
proof_step(6, 196, operand([r11, purpose], 'academic-research'), rule(6, [42])).
proof_step(6, 197, is_a(r11, 'research-process'), rule(1, [42])).
proof_step(
    6,
    198,
    ask([baseline, 'first-visit'], ['ask-for-consent', "ePrivacy Art. 5(3)"]),
    rule(49, [45])
).
proof_step(
    6,
    199,
    ask(
        [baseline, ['browser-signal', refuse]],
        ['ask-for-consent', "ePrivacy Art. 5(3)"]
    ),
    rule(49, [47])
).
proof_step(
    6,
    200,
    ask(
        [baseline, [refused, ['completed-months', 5]]],
        ['ask-for-consent', "ePrivacy Art. 5(3)"]
    ),
    rule(49, [52])
).
proof_step(
    6,
    201,
    ask(
        [baseline, [refused, ['completed-months', 6]]],
        ['ask-for-consent', "ePrivacy Art. 5(3)"]
    ),
    rule(49, [53])
).
proof_step(
    6,
    202,
    ask(
        ['omnibus-proposal', ['browser-signal', refuse]],
        ['refused-by-signal', "GDPR Art. 88b(1)-(2)"]
    ),
    rule(50, [58])
).
proof_step(
    6,
    203,
    'breach-plan'(
        [baseline, b1],
        [
            [notify, [authority, none], [people, none]],
            'document-breach',
            ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [56, 66, 69, 75])
).
proof_step(
    6,
    204,
    'breach-plan'(
        ['omnibus-proposal', b1],
        [
            [notify, [authority, none], [people, none]],
            'document-breach',
            ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [57, 66, 72, 75])
).
proof_step(
    6,
    205,
    'breach-plan'(
        [baseline, b2],
        [
            [notify, [authority, ['within-hours', 72]], [people, none]],
            'document-breach',
            ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [56, 67, 70, 76])
).
proof_step(
    6,
    206,
    'breach-plan'(
        ['omnibus-proposal', b2],
        [
            [notify, [authority, none], [people, none]],
            'document-breach',
            ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [57, 67, 73, 76])
).
proof_step(
    6,
    207,
    'breach-plan'(
        [baseline, b3],
        [
            [notify, [authority, ['within-hours', 72]], [people, 'without-undue-delay']],
            'document-breach',
            ["GDPR Art. 33(1)", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [56, 68, 71, 77])
).
proof_step(
    6,
    208,
    'breach-plan'(
        ['omnibus-proposal', b3],
        [
            [
                notify,
                [authority, ['within-hours-via-single-entry-point', 96]],
                [people, 'without-undue-delay']
            ],
            'document-breach',
            ["GDPR Art. 33(1) as amended", "GDPR Art. 34(1)", "GDPR Art. 33(5)"]
        ]
    ),
    rule(60, [57, 68, 74, 77])
).
proof_step(6, 209, member([research], research), rule(28, [80])).
proof_step(
    6,
    210,
    member(['no-marketing', 'no-transfer-us'], 'no-marketing'),
    rule(28, [81])
).
proof_step(6, 211, member(['no-transfer-us'], 'no-transfer-us'), rule(28, [82])).
proof_step(
    6,
    212,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 5]]],
        ['do-not-ask-again', "GDPR Art. 88a(4)(c)"]
    ),
    rule(51, [52, 84, 59, 85])
).
proof_step(
    6,
    213,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 6]]],
        ['ask-for-consent', "GDPR Art. 88a(4)(c)"]
    ),
    rule(52, [53, 86, 59, 87])
).
proof_step(6, 214, joined([[], []], []), rule(30, [88])).
proof_step(
    6,
    215,
    'device-basis'(
        ["ePrivacy Art. 5(3)", "ePrivacy Art. 5(3)"],
        [policy, "ePrivacy Art. 5(3)"]
    ),
    rule(53, [89])
).
proof_step(
    6,
    216,
    'device-basis'(
        ["GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"],
        [policy, "GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"]
    ),
    rule(54, [90])
).
proof_step(
    6,
    217,
    'device-basis'(
        ["GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"],
        [policy, "GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"]
    ),
    rule(54, [91])
).
proof_step(
    6,
    218,
    'falls-within'('research-and-development', 'research-and-development'),
    rule(19, [92])
).
proof_step(6, 219, 'falls-within'(marketing, marketing), rule(19, [93])).
proof_step(6, 220, governs(policy, r1), rule(32, [6, 7, 96])).
proof_step(6, 221, addresses(r1, research), rule(21, [97, 11, 94, 98, 43, 12, 99, 13])).
proof_step(6, 222, is_a([r1, 'under-consent'], 'met-constraint'), rule(22, [27, 101])).
proof_step(6, 223, is_a([r1, 'consent-given'], 'met-constraint'), rule(22, [28, 102])).
proof_step(6, 224, is_a([r1, pseudonymised], 'met-constraint'), rule(22, [29, 103])).
proof_step(6, 225, is_a([r1, 'before-2027'], 'met-constraint'), rule(23, [30, 104, 83])).
proof_step(6, 226, failures([r1, []], []), rule(25, [105])).
proof_step(6, 227, governs(policy, r2), rule(32, [6, 7, 106])).
proof_step(
    6,
    228,
    addresses(r2, research),
    rule(21, [107, 11, 94, 108, 43, 12, 109, 13])
).
proof_step(6, 229, failures([r2, []], []), rule(25, [111])).
proof_step(6, 230, 'permission-failures'([r2, []], []), rule(41, [111])).
proof_step(6, 231, is_a([r2, pseudonymised], 'met-constraint'), rule(22, [29, 114])).
proof_step(6, 232, is_a([r2, 'before-2027'], 'met-constraint'), rule(23, [30, 115, 83])).
proof_step(6, 233, governs(policy, r3), rule(32, [6, 7, 116])).
proof_step(
    6,
    234,
    addresses(r3, 'no-marketing'),
    rule(21, [117, 18, 94, 118, 44, 19, 119, 20])
).
proof_step(6, 235, failures([r3, []], []), rule(25, [121])).
proof_step(6, 236, governs(policy, r4), rule(32, [6, 7, 122])).
proof_step(
    6,
    237,
    addresses(r4, research),
    rule(21, [123, 11, 94, 124, 43, 12, 125, 13])
).
proof_step(6, 238, is_a([r4, 'under-consent'], 'met-constraint'), rule(22, [27, 127])).
proof_step(6, 239, failures([r4, []], []), rule(25, [128])).
proof_step(6, 240, 'permission-failures'([r4, []], []), rule(41, [128])).
proof_step(6, 241, is_a([r4, pseudonymised], 'met-constraint'), rule(22, [29, 130])).
proof_step(6, 242, is_a([r4, 'before-2027'], 'met-constraint'), rule(23, [30, 131, 83])).
proof_step(6, 243, governs(policy, r5), rule(32, [6, 7, 132])).
proof_step(
    6,
    244,
    addresses(r5, research),
    rule(21, [133, 11, 94, 134, 43, 12, 135, 13])
).
proof_step(6, 245, is_a([r5, 'under-consent'], 'met-constraint'), rule(22, [27, 137])).
proof_step(6, 246, is_a([r5, 'consent-given'], 'met-constraint'), rule(22, [28, 138])).
proof_step(6, 247, failures([r5, []], []), rule(25, [139])).
proof_step(6, 248, 'permission-failures'([r5, []], []), rule(41, [139])).
proof_step(6, 249, governs(policy, r6), rule(32, [6, 7, 142])).
proof_step(6, 250, is_a('partner-us', party), rule(11, [143])).
proof_step(
    6,
    251,
    addresses(r6, research),
    rule(21, [143, 11, 95, 144, 43, 12, 145, 13])
).
proof_step(6, 252, failures([r6, []], []), rule(25, [146])).
proof_step(6, 253, is_a([r6, 'under-consent'], 'met-constraint'), rule(22, [27, 148])).
proof_step(6, 254, is_a([r6, 'consent-given'], 'met-constraint'), rule(22, [28, 149])).
proof_step(6, 255, is_a([r6, pseudonymised], 'met-constraint'), rule(22, [29, 150])).
proof_step(6, 256, is_a([r6, 'before-2027'], 'met-constraint'), rule(23, [30, 151, 83])).
proof_step(6, 257, governs(policy, r7), rule(32, [6, 7, 152])).
proof_step(
    6,
    258,
    addresses(r7, research),
    rule(21, [153, 11, 94, 154, 43, 12, 155, 13])
).
proof_step(6, 259, is_a([r7, 'under-consent'], 'met-constraint'), rule(22, [27, 157])).
proof_step(6, 260, is_a([r7, 'consent-given'], 'met-constraint'), rule(22, [28, 158])).
proof_step(6, 261, is_a([r7, pseudonymised], 'met-constraint'), rule(22, [29, 159])).
proof_step(6, 262, is_a([r7, 'before-2027'], 'met-constraint'), rule(23, [30, 160, 83])).
proof_step(6, 263, failures([r7, []], []), rule(25, [161])).
proof_step(6, 264, governs(policy, r8), rule(32, [6, 7, 162])).
proof_step(
    6,
    265,
    addresses(r8, research),
    rule(21, [163, 11, 94, 164, 43, 12, 165, 13])
).
proof_step(6, 266, is_a([r8, 'under-consent'], 'met-constraint'), rule(22, [27, 167])).
proof_step(6, 267, is_a([r8, 'consent-given'], 'met-constraint'), rule(22, [28, 168])).
proof_step(6, 268, is_a([r8, pseudonymised], 'met-constraint'), rule(22, [29, 169])).
proof_step(6, 269, is_a([r8, 'before-2027'], 'met-constraint'), rule(23, [30, 170, 83])).
proof_step(6, 270, failures([r8, []], []), rule(25, [171])).
proof_step(6, 271, governs(policy, r9), rule(32, [6, 7, 172])).
proof_step(
    6,
    272,
    addresses(r9, research),
    rule(21, [173, 11, 94, 174, 43, 12, 175, 13])
).
proof_step(6, 273, is_a([r9, 'under-consent'], 'met-constraint'), rule(22, [27, 177])).
proof_step(6, 274, is_a([r9, 'consent-given'], 'met-constraint'), rule(22, [28, 178])).
proof_step(6, 275, is_a([r9, pseudonymised], 'met-constraint'), rule(22, [29, 179])).
proof_step(6, 276, is_a([r9, 'before-2027'], 'met-constraint'), rule(23, [30, 180, 83])).
proof_step(6, 277, failures([r9, []], []), rule(25, [181])).
proof_step(6, 278, governs(policy, r10), rule(32, [6, 7, 182])).
proof_step(
    6,
    279,
    addresses(r10, research),
    rule(21, [183, 11, 94, 184, 43, 12, 185, 13])
).
proof_step(6, 280, is_a([r10, 'under-consent'], 'met-constraint'), rule(22, [27, 187])).
proof_step(6, 281, is_a([r10, 'consent-given'], 'met-constraint'), rule(22, [28, 188])).
proof_step(6, 282, is_a([r10, pseudonymised], 'met-constraint'), rule(22, [29, 189])).
proof_step(
    6,
    283,
    is_a([r10, 'before-2027'], 'met-constraint'),
    rule(23, [30, 190, 83])
).
proof_step(6, 284, failures([r10, []], []), rule(25, [191])).
proof_step(6, 285, governs(policy, r11), rule(32, [6, 7, 192])).
proof_step(
    6,
    286,
    addresses(r11, 'no-marketing'),
    rule(21, [193, 18, 94, 194, 44, 19, 195, 20])
).
proof_step(6, 287, is_a([baseline, b1], 'planned-breach'), rule(65, [203])).
proof_step(6, 288, is_a(['omnibus-proposal', b1], 'planned-breach'), rule(65, [204])).
proof_step(6, 289, is_a([baseline, b2], 'planned-breach'), rule(65, [205])).
proof_step(
    6,
    290,
    change(
        [breach, b2],
        [
            from,
            [notify, [authority, ['within-hours', 72]], [people, none]],
            to,
            [notify, [authority, none], [people, none]]
        ]
    ),
    rule(62, [205, 206, 78])
).
proof_step(6, 291, is_a(['omnibus-proposal', b2], 'planned-breach'), rule(65, [206])).
proof_step(6, 292, is_a([baseline, b3], 'planned-breach'), rule(65, [207])).
proof_step(
    6,
    293,
    change(
        [breach, b3],
        [
            from,
            [notify, [authority, ['within-hours', 72]], [people, 'without-undue-delay']],
            to,
            [
                notify,
                [authority, ['within-hours-via-single-entry-point', 96]],
                [people, 'without-undue-delay']
            ]
        ]
    ),
    rule(62, [207, 208, 79])
).
proof_step(6, 294, is_a(['omnibus-proposal', b3], 'planned-breach'), rule(65, [208])).
proof_step(
    6,
    295,
    member(['no-marketing', 'no-transfer-us'], 'no-transfer-us'),
    rule(29, [211])
).
proof_step(
    6,
    296,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(31, [214])
).
proof_step(
    6,
    297,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                    equal, 'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    ),
    rule(31, [214])
).
proof_step(
    6,
    298,
    joined(
        [[[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]], []],
        [[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]]
    ),
    rule(31, [214])
).
proof_step(
    6,
    299,
    'falls-within'('academic-research', 'research-and-development'),
    rule(20, [1, 218])
).
proof_step(
    6,
    300,
    'falls-within'('commercial-research', 'research-and-development'),
    rule(20, [2, 218])
).
proof_step(6, 301, 'falls-within'(advertising, marketing), rule(20, [3, 219])).
proof_step(6, 302, is_a(r1, 'policy-ready-process'), rule(40, [220, 8])).
proof_step(6, 303, 'is-candidate-for'(r1, research), rule(36, [220, 9, 209, 221])).
proof_step(6, 304, failures([r1, ['before-2027']], []), rule(26, [225, 226])).
proof_step(6, 305, is_a(r2, 'policy-ready-process'), rule(40, [227, 8])).
proof_step(6, 306, 'is-candidate-for'(r2, research), rule(36, [227, 9, 209, 228])).
proof_step(6, 307, failures([r2, ['before-2027']], []), rule(26, [232, 229])).
proof_step(6, 308, is_a(r3, 'policy-ready-process'), rule(40, [233, 8])).
proof_step(6, 309, is_a(r4, 'policy-ready-process'), rule(40, [236, 8])).
proof_step(6, 310, 'is-candidate-for'(r4, research), rule(36, [236, 9, 209, 237])).
proof_step(6, 311, failures([r4, ['before-2027']], []), rule(26, [242, 239])).
proof_step(6, 312, is_a(r5, 'policy-ready-process'), rule(40, [243, 8])).
proof_step(6, 313, 'is-candidate-for'(r5, research), rule(36, [243, 9, 209, 244])).
proof_step(6, 314, is_a(r6, 'policy-ready-process'), rule(40, [249, 8])).
proof_step(6, 315, 'is-member-of'('partner-us', 'partner-us'), rule(13, [250])).
proof_step(6, 316, 'is-candidate-for'(r6, research), rule(36, [249, 9, 209, 251])).
proof_step(6, 317, failures([r6, ['before-2027']], []), rule(26, [256, 252])).
proof_step(6, 318, is_a(r7, 'policy-ready-process'), rule(40, [257, 8])).
proof_step(6, 319, 'is-candidate-for'(r7, research), rule(36, [257, 9, 209, 258])).
proof_step(6, 320, failures([r7, ['before-2027']], []), rule(26, [262, 263])).
proof_step(6, 321, is_a(r8, 'policy-ready-process'), rule(40, [264, 8])).
proof_step(6, 322, 'is-candidate-for'(r8, research), rule(36, [264, 9, 209, 265])).
proof_step(6, 323, failures([r8, ['before-2027']], []), rule(26, [269, 270])).
proof_step(6, 324, is_a(r9, 'policy-ready-process'), rule(40, [271, 8])).
proof_step(6, 325, 'is-candidate-for'(r9, research), rule(36, [271, 9, 209, 272])).
proof_step(6, 326, failures([r9, ['before-2027']], []), rule(26, [276, 277])).
proof_step(6, 327, is_a(r10, 'policy-ready-process'), rule(40, [278, 8])).
proof_step(6, 328, 'is-candidate-for'(r10, research), rule(36, [278, 9, 209, 279])).
proof_step(6, 329, failures([r10, ['before-2027']], []), rule(26, [283, 284])).
proof_step(6, 330, is_a(r11, 'policy-ready-process'), rule(40, [285, 8])).
proof_step(
    6,
    331,
    joined(
        [
            [
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                consent
            ],
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(31, [296])
).
proof_step(
    6,
    332,
    joined(
        [
            [
                [
                    unmet, pseudonymised, 'technical-measure', encryption, equal,
                    pseudonymisation
                ],
                [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
            ],
            []
        ],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(31, [298])
).
proof_step(
    6,
    333,
    is_a([r1, 'for-research'], 'met-constraint'),
    rule(24, [26, 100, 299])
).
proof_step(
    6,
    334,
    is_a([r5, 'for-research'], 'met-constraint'),
    rule(24, [26, 136, 299])
).
proof_step(
    6,
    335,
    is_a([r6, 'for-research'], 'met-constraint'),
    rule(24, [26, 147, 299])
).
proof_step(
    6,
    336,
    is_a([r7, 'for-research'], 'met-constraint'),
    rule(24, [26, 156, 299])
).
proof_step(
    6,
    337,
    is_a([r8, 'for-research'], 'met-constraint'),
    rule(24, [26, 166, 299])
).
proof_step(
    6,
    338,
    is_a([r9, 'for-research'], 'met-constraint'),
    rule(24, [26, 176, 299])
).
proof_step(
    6,
    339,
    is_a([r10, 'for-research'], 'met-constraint'),
    rule(24, [26, 186, 299])
).
proof_step(
    6,
    340,
    is_a([r4, 'for-research'], 'met-constraint'),
    rule(24, [26, 126, 300])
).
proof_step(
    6,
    341,
    is_a([r3, 'for-marketing'], 'met-constraint'),
    rule(24, [31, 120, 301])
).
proof_step(6, 342, is_a(r1, 'candidate-process'), rule(39, [303])).
proof_step(
    6,
    343,
    failures([r1, [pseudonymised, 'before-2027']], []),
    rule(26, [224, 304])
).
proof_step(6, 344, is_a(r2, 'candidate-process'), rule(39, [306])).
proof_step(
    6,
    345,
    failures([r2, [pseudonymised, 'before-2027']], []),
    rule(26, [231, 307])
).
proof_step(6, 346, is_a(r4, 'candidate-process'), rule(39, [310])).
proof_step(
    6,
    347,
    failures([r4, [pseudonymised, 'before-2027']], []),
    rule(26, [241, 311])
).
proof_step(6, 348, is_a(r5, 'candidate-process'), rule(39, [313])).
proof_step(
    6,
    349,
    addresses(r6, 'no-transfer-us'),
    rule(21, [143, 22, 315, 144, 43, 23, 145, 24])
).
proof_step(6, 350, is_a(r6, 'candidate-process'), rule(39, [316])).
proof_step(
    6,
    351,
    failures([r6, [pseudonymised, 'before-2027']], []),
    rule(26, [255, 317])
).
proof_step(6, 352, is_a(r7, 'candidate-process'), rule(39, [319])).
proof_step(
    6,
    353,
    failures([r7, [pseudonymised, 'before-2027']], []),
    rule(26, [261, 320])
).
proof_step(6, 354, is_a(r8, 'candidate-process'), rule(39, [322])).
proof_step(
    6,
    355,
    failures([r8, [pseudonymised, 'before-2027']], []),
    rule(26, [268, 323])
).
proof_step(6, 356, is_a(r9, 'candidate-process'), rule(39, [325])).
proof_step(
    6,
    357,
    failures([r9, [pseudonymised, 'before-2027']], []),
    rule(26, [275, 326])
).
proof_step(6, 358, is_a(r10, 'candidate-process'), rule(39, [328])).
proof_step(
    6,
    359,
    failures([r10, [pseudonymised, 'before-2027']], []),
    rule(26, [282, 329])
).
proof_step(
    6,
    360,
    joined(
        [
            [
                [
                    unmet, 'for-research', purpose, 'personalised-advertising', within,
                    'research-and-development'
                ],
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'for-research', purpose, 'personalised-advertising', within,
                'research-and-development'
            ],
            [
                unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                consent
            ],
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(31, [331])
).
proof_step(6, 361, failures([r3, ['for-marketing']], []), rule(26, [341, 235])).
proof_step(
    6,
    362,
    failures([r1, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [223, 343])
).
proof_step(
    6,
    363,
    is_a([r6, 'no-transfer-us'], 'applied-rule'),
    rule(33, [349, 25, 252])
).
proof_step(
    6,
    364,
    failures([r6, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [254, 351])
).
proof_step(
    6,
    365,
    failures([r7, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [260, 353])
).
proof_step(
    6,
    366,
    failures([r8, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [267, 355])
).
proof_step(
    6,
    367,
    failures([r9, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [274, 357])
).
proof_step(
    6,
    368,
    failures([r10, ['consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [281, 359])
).
proof_step(6, 369, is_a([r2, 'consent-given'], 'met-constraint'), absent(1)).
proof_step(6, 370, is_a([r2, 'under-consent'], 'met-constraint'), absent(1)).
proof_step(6, 371, is_a([r2, 'for-research'], 'met-constraint'), absent(1)).
proof_step(6, 372, is_a([r4, 'consent-given'], 'met-constraint'), absent(1)).
proof_step(6, 373, is_a([r5, 'before-2027'], 'met-constraint'), absent(1)).
proof_step(6, 374, is_a([r5, pseudonymised], 'met-constraint'), absent(1)).
proof_step(6, 375, is_a([r3, 'no-marketing'], 'applied-rule'), rule(33, [234, 21, 361])).
proof_step(
    6,
    376,
    failures([r1, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [222, 362])
).
proof_step(
    6,
    377,
    'is-prohibited-by'(r6, 'no-transfer-us'),
    rule(35, [249, 10, 295, 363])
).
proof_step(
    6,
    378,
    failures([r6, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [253, 364])
).
proof_step(
    6,
    379,
    failures([r7, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [259, 365])
).
proof_step(
    6,
    380,
    failures([r8, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [266, 366])
).
proof_step(
    6,
    381,
    failures([r9, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], []),
    rule(26, [273, 367])
).
proof_step(
    6,
    382,
    failures(
        [r10, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        []
    ),
    rule(26, [280, 368])
).
proof_step(
    6,
    383,
    failures(
        [r2, ['consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(27, [111, 28, 113, 369, 345])
).
proof_step(
    6,
    384,
    failures(
        [r4, ['consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    ),
    rule(27, [128, 28, 129, 372, 347])
).
proof_step(
    6,
    385,
    failures(
        [r5, ['before-2027']],
        [[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]]
    ),
    rule(27, [139, 30, 141, 373, 247])
).
proof_step(
    6,
    386,
    'is-prohibited-by'(r3, 'no-marketing'),
    rule(35, [233, 10, 210, 375])
).
proof_step(
    6,
    387,
    failures(
        [
            r1,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [333, 376])
).
proof_step(
    6,
    388,
    'policy-result'(r6, [deny, ['prohibited-by', 'no-transfer-us']]),
    rule(45, [314, 377])
).
proof_step(6, 389, is_a(r6, 'prohibited-process'), rule(38, [377])).
proof_step(
    6,
    390,
    failures(
        [
            r6,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [335, 378])
).
proof_step(
    6,
    391,
    failures(
        [
            r7,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [336, 379])
).
proof_step(
    6,
    392,
    failures(
        [
            r8,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [337, 380])
).
proof_step(
    6,
    393,
    failures(
        [
            r9,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [338, 381])
).
proof_step(
    6,
    394,
    failures(
        [
            r10,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    ),
    rule(26, [339, 382])
).
proof_step(
    6,
    395,
    failures(
        [r2, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                consent
            ],
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(27, [111, 27, 112, 370, 383])
).
proof_step(
    6,
    396,
    failures(
        [r4, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    ),
    rule(26, [238, 384])
).
proof_step(
    6,
    397,
    failures(
        [r5, [pseudonymised, 'before-2027']],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(27, [139, 29, 140, 374, 385])
).
proof_step(
    6,
    398,
    'policy-result'(r3, [deny, ['prohibited-by', 'no-marketing']]),
    rule(45, [308, 386])
).
proof_step(6, 399, is_a(r3, 'prohibited-process'), rule(38, [386])).
proof_step(6, 400, is_a([r1, research], 'applied-rule'), rule(33, [221, 14, 387])).
proof_step(6, 401, is_a([r6, research], 'applied-rule'), rule(33, [251, 14, 390])).
proof_step(6, 402, is_a([r7, research], 'applied-rule'), rule(33, [258, 14, 391])).
proof_step(6, 403, is_a([r8, research], 'applied-rule'), rule(33, [265, 14, 392])).
proof_step(6, 404, is_a([r9, research], 'applied-rule'), rule(33, [272, 14, 393])).
proof_step(6, 405, is_a([r10, research], 'applied-rule'), rule(33, [279, 14, 394])).
proof_step(
    6,
    406,
    failures(
        [
            r2,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        [
            [
                unmet, 'for-research', purpose, 'personalised-advertising', within,
                'research-and-development'
            ],
            [
                unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                consent
            ],
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(27, [111, 26, 110, 371, 395])
).
proof_step(
    6,
    407,
    failures(
        [
            r4,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    ),
    rule(26, [340, 396])
).
proof_step(
    6,
    408,
    failures(
        [r5, ['consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(26, [246, 397])
).
proof_step(6, 409, 'is-permitted-by'(r1, research), rule(34, [220, 9, 209, 400])).
proof_step(6, 410, 'is-permitted-by'(r6, research), rule(34, [249, 9, 209, 401])).
proof_step(6, 411, 'is-permitted-by'(r7, research), rule(34, [257, 9, 209, 402])).
proof_step(6, 412, 'is-permitted-by'(r8, research), rule(34, [264, 9, 209, 403])).
proof_step(6, 413, 'is-permitted-by'(r9, research), rule(34, [271, 9, 209, 404])).
proof_step(6, 414, 'is-permitted-by'(r10, research), rule(34, [278, 9, 209, 405])).
proof_step(
    6,
    415,
    'permission-failures'(
        [r2, [research]],
        [
            [
                unmet, 'for-research', purpose, 'personalised-advertising', within,
                'research-and-development'
            ],
            [
                unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                consent
            ],
            [
                unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                'consent-given'
            ]
        ]
    ),
    rule(42, [228, 14, 406, 230, 360])
).
proof_step(
    6,
    416,
    'permission-failures'(
        [r4, [research]],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    ),
    rule(42, [237, 14, 407, 240, 297])
).
proof_step(
    6,
    417,
    failures(
        [r5, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(26, [245, 408])
).
proof_step(6, 418, is_a(r1, 'permitted-process'), rule(37, [409])).
proof_step(
    6,
    419,
    'policy-conflict'(
        r6,
        ['resolved-by', prohibit, 'no-transfer-us', [overrides, research]]
    ),
    rule(48, [314, 410, 377])
).
proof_step(6, 420, is_a(r6, 'permitted-process'), rule(37, [410])).
proof_step(6, 421, is_a(r7, 'permitted-process'), rule(37, [411])).
proof_step(6, 422, is_a(r8, 'permitted-process'), rule(37, [412])).
proof_step(6, 423, is_a(r9, 'permitted-process'), rule(37, [413])).
proof_step(6, 424, is_a(r10, 'permitted-process'), rule(37, [414])).
proof_step(
    6,
    425,
    failures(
        [
            r5,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(26, [334, 417])
).
proof_step(6, 426, is_a(r6, 'conflicting-process'), rule(67, [419])).
proof_step(
    6,
    427,
    'permission-failures'(
        [r5, [research]],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    ),
    rule(42, [244, 14, 425, 248, 332])
).
proof_step(6, 428, is_a(r1, 'prohibited-process'), absent(2)).
proof_step(6, 429, 'policy-result'(r1, [permit, research]), rule(44, [302, 409, 428])).
proof_step(
    6,
    430,
    assessment(
        ['omnibus-proposal', r1],
        [[permit, research], [policy, "GDPR Art. 88a(3)(c)"]]
    ),
    rule(56, [57, 429, 45, 64])
).
proof_boundary(6, 1, 0).
proof_boundary_steps(6, 1, 1, 77).
proof_boundary_steps(6, 1, 92, 303).
proof_boundary_steps(6, 1, 305, 306).
proof_boundary_steps(6, 1, 308, 310).
proof_boundary_steps(6, 1, 312, 316).
proof_boundary_steps(6, 1, 318, 319).
proof_boundary_steps(6, 1, 321, 322).
proof_boundary_steps(6, 1, 324, 325).
proof_boundary_steps(6, 1, 327, 328).
proof_boundary_steps(6, 1, 330, 342).
proof_boundary_steps(6, 1, 344, 344).
proof_boundary_steps(6, 1, 346, 346).
proof_boundary_steps(6, 1, 348, 350).
proof_boundary_steps(6, 1, 352, 352).
proof_boundary_steps(6, 1, 354, 354).
proof_boundary_steps(6, 1, 356, 356).
proof_boundary_steps(6, 1, 358, 358).
proof_boundary_steps(6, 1, 360, 360).
proof_boundary_call(
    6,
    1,
    'device-basis'(["GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"], variable("_EyeplCall0"))
).
proof_boundary_call(
    6,
    1,
    'device-basis'(
        ["GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    'device-basis'(
        ["ePrivacy Art. 5(3)", "ePrivacy Art. 5(3)"],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    'falls-within'('academic-research', 'research-and-development')
).
proof_boundary_call(6, 1, 'falls-within'('academic-research', marketing)).
proof_boundary_call(
    6,
    1,
    'falls-within'('commercial-research', 'research-and-development')
).
proof_boundary_call(
    6,
    1,
    'falls-within'('personalised-advertising', 'research-and-development')
).
proof_boundary_call(
    6,
    1,
    'falls-within'('research-and-development', 'research-and-development')
).
proof_boundary_call(6, 1, 'falls-within'('research-and-development', marketing)).
proof_boundary_call(6, 1, 'falls-within'(advertising, marketing)).
proof_boundary_call(6, 1, 'falls-within'(marketing, marketing)).
proof_boundary_call(6, 1, 'is-member-of'('partner-be', 'partner-us')).
proof_boundary_call(6, 1, 'is-member-of'('partner-be', consortium)).
proof_boundary_call(6, 1, 'is-member-of'('partner-us', 'partner-us')).
proof_boundary_call(6, 1, 'is-member-of'('partner-us', consortium)).
proof_boundary_call(6, 1, addresses(r1, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r1, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r1, research)).
proof_boundary_call(6, 1, addresses(r10, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r10, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r10, research)).
proof_boundary_call(6, 1, addresses(r11, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r11, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r11, research)).
proof_boundary_call(6, 1, addresses(r2, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r2, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r2, research)).
proof_boundary_call(6, 1, addresses(r3, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r3, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r3, research)).
proof_boundary_call(6, 1, addresses(r4, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r4, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r4, research)).
proof_boundary_call(6, 1, addresses(r5, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r5, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r5, research)).
proof_boundary_call(6, 1, addresses(r6, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r6, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r6, research)).
proof_boundary_call(6, 1, addresses(r7, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r7, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r7, research)).
proof_boundary_call(6, 1, addresses(r8, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r8, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r8, research)).
proof_boundary_call(6, 1, addresses(r9, 'no-marketing')).
proof_boundary_call(6, 1, addresses(r9, 'no-transfer-us')).
proof_boundary_call(6, 1, addresses(r9, research)).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', ['browser-signal', refuse]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', ['browser-signal', refuse]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 5]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 5]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 6]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 6]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    1,
    ask([baseline, 'first-visit'], ['ask-for-consent', variable("_EyeplCall0")])
).
proof_boundary_call(
    6,
    1,
    ask([baseline, 'first-visit'], [variable("_EyeplCall0"), variable("_EyeplCall1")])
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, ['browser-signal', refuse]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, ['browser-signal', refuse]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, [refused, ['completed-months', 5]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, [refused, ['completed-months', 5]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, [refused, ['completed-months', 6]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    1,
    ask(
        [baseline, [refused, ['completed-months', 6]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(6, 1, controller(variable("_EyeplCall0"), hospital)).
proof_boundary_call(6, 1, controller(r1, hospital)).
proof_boundary_call(6, 1, controller(r10, hospital)).
proof_boundary_call(6, 1, controller(r11, hospital)).
proof_boundary_call(6, 1, controller(r2, hospital)).
proof_boundary_call(6, 1, controller(r3, hospital)).
proof_boundary_call(6, 1, controller(r4, hospital)).
proof_boundary_call(6, 1, controller(r5, hospital)).
proof_boundary_call(6, 1, controller(r6, hospital)).
proof_boundary_call(6, 1, controller(r7, hospital)).
proof_boundary_call(6, 1, controller(r8, hospital)).
proof_boundary_call(6, 1, controller(r9, hospital)).
proof_boundary_call(6, 1, data(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, data(r9, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), variable("_EyeplCall1"))).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r1)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r10)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r11)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r2)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r3)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r4)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r5)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r6)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r7)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r8)).
proof_boundary_call(6, 1, governs(variable("_EyeplCall0"), r9)).
proof_boundary_call(6, 1, is_a('partner-us', party)).
proof_boundary_call(6, 1, is_a('research-and-development', purpose)).
proof_boundary_call(6, 1, is_a([r1, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r1, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r1, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r1, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r1, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r10, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r10, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r10, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r10, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r10, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r11, 'for-marketing'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r2, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r2, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r2, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r2, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r2, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r3, 'for-marketing'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r4, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r4, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r4, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r4, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r4, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r5, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r5, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r5, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r5, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r5, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r6, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r6, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r6, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r6, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r6, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r7, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r7, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r7, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r7, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r7, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r8, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r8, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r8, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r8, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r8, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r9, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r9, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r9, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r9, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 1, is_a([r9, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 1, is_a(variable("_EyeplCall0"), 'planned-breach')).
proof_boundary_call(6, 1, is_a(variable("_EyeplCall0"), 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(variable("_EyeplCall0"), agreement)).
proof_boundary_call(6, 1, is_a(variable("_EyeplCall0"), rulebook)).
proof_boundary_call(6, 1, is_a(marketing, purpose)).
proof_boundary_call(6, 1, is_a(r1, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r1, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r1, 'research-process')).
proof_boundary_call(6, 1, is_a(r10, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r10, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r10, 'research-process')).
proof_boundary_call(6, 1, is_a(r11, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r11, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r11, 'research-process')).
proof_boundary_call(6, 1, is_a(r2, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r2, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r2, 'research-process')).
proof_boundary_call(6, 1, is_a(r3, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r3, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r3, 'research-process')).
proof_boundary_call(6, 1, is_a(r4, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r4, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r4, 'research-process')).
proof_boundary_call(6, 1, is_a(r5, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r5, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r5, 'research-process')).
proof_boundary_call(6, 1, is_a(r6, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r6, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r6, 'research-process')).
proof_boundary_call(6, 1, is_a(r7, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r7, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r7, 'research-process')).
proof_boundary_call(6, 1, is_a(r8, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r8, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r8, 'research-process')).
proof_boundary_call(6, 1, is_a(r9, 'candidate-process')).
proof_boundary_call(6, 1, is_a(r9, 'policy-ready-process')).
proof_boundary_call(6, 1, is_a(r9, 'research-process')).
proof_boundary_call(
    6,
    1,
    joined(
        [[[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]], []],
        [[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]]
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [[[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]], []],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                    equal, 'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                    equal, 'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, 'for-research', purpose, 'personalised-advertising', within,
                    'research-and-development'
                ],
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, pseudonymised, 'technical-measure', encryption, equal,
                    pseudonymisation
                ],
                [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
            ],
            []
        ],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    )
).
proof_boundary_call(
    6,
    1,
    joined(
        [
            [
                [
                    unmet, pseudonymised, 'technical-measure', encryption, equal,
                    pseudonymisation
                ],
                [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(6, 1, joined([[], []], [])).
proof_boundary_call(6, 1, joined([[], []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    1,
    member(['no-marketing', 'no-transfer-us'], variable("_EyeplCall0"))
).
proof_boundary_call(6, 1, member(['no-transfer-us'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, member([], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, member([research], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    1,
    operand([variable("_EyeplCall0"), purpose], 'research-and-development')
).
proof_boundary_call(6, 1, operand([variable("_EyeplCall0"), purpose], marketing)).
proof_boundary_call(6, 1, operand([r1, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r1, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r1, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r1, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r1, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r10, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r10, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r10, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r10, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r10, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r11, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r2, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r2, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r2, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r2, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r2, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r2, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r2, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r2, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r3, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r4, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r4, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r4, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r4, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r4, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r4, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r4, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r4, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r5, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r5, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r5, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r5, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r5, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r5, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r5, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r5, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r6, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r6, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r6, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r6, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r6, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r7, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r7, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r7, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r7, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r7, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r8, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r8, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r8, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r8, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r8, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r9, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 1, operand([r9, 'legal-basis'], consent)).
proof_boundary_call(6, 1, operand([r9, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 1, operand([r9, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, operand([r9, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, processing(r9, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(variable("_EyeplCall0"), 'partner-us')).
proof_boundary_call(6, 1, requester(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 1, requester(r9, variable("_EyeplCall0"))).
proof_boundary(6, 2, 1).
proof_boundary_steps(6, 2, 1, 77).
proof_boundary_steps(6, 2, 92, 368).
proof_boundary_steps(6, 2, 375, 427).
proof_boundary_call(
    6,
    2,
    'device-basis'(["GDPR Art. 88a(1)", "GDPR Art. 88a(4)(c)"], variable("_EyeplCall0"))
).
proof_boundary_call(
    6,
    2,
    'device-basis'(
        ["GDPR Art. 88a(1)", "GDPR Art. 88b(1)-(2)"],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    'device-basis'(
        ["ePrivacy Art. 5(3)", "ePrivacy Art. 5(3)"],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    'falls-within'('academic-research', 'research-and-development')
).
proof_boundary_call(6, 2, 'falls-within'('academic-research', marketing)).
proof_boundary_call(
    6,
    2,
    'falls-within'('commercial-research', 'research-and-development')
).
proof_boundary_call(
    6,
    2,
    'falls-within'('personalised-advertising', 'research-and-development')
).
proof_boundary_call(
    6,
    2,
    'falls-within'('research-and-development', 'research-and-development')
).
proof_boundary_call(6, 2, 'falls-within'('research-and-development', marketing)).
proof_boundary_call(6, 2, 'falls-within'(advertising, marketing)).
proof_boundary_call(6, 2, 'falls-within'(marketing, marketing)).
proof_boundary_call(6, 2, 'is-member-of'('partner-be', 'partner-us')).
proof_boundary_call(6, 2, 'is-member-of'('partner-be', consortium)).
proof_boundary_call(6, 2, 'is-member-of'('partner-us', 'partner-us')).
proof_boundary_call(6, 2, 'is-member-of'('partner-us', consortium)).
proof_boundary_call(6, 2, 'permission-failures'([r2, []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    'permission-failures'([r2, [research]], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, 'permission-failures'([r4, []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    'permission-failures'(
        [r4, [research]],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    )
).
proof_boundary_call(
    6,
    2,
    'permission-failures'([r4, [research]], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, 'permission-failures'([r5, []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    'permission-failures'(
        [r5, [research]],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    )
).
proof_boundary_call(
    6,
    2,
    'permission-failures'([r5, [research]], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, addresses(r1, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r1, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r1, research)).
proof_boundary_call(6, 2, addresses(r10, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r10, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r10, research)).
proof_boundary_call(6, 2, addresses(r11, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r11, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r11, research)).
proof_boundary_call(6, 2, addresses(r2, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r2, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r2, research)).
proof_boundary_call(6, 2, addresses(r3, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r3, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r3, research)).
proof_boundary_call(6, 2, addresses(r4, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r4, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r4, research)).
proof_boundary_call(6, 2, addresses(r5, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r5, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r5, research)).
proof_boundary_call(6, 2, addresses(r6, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r6, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r6, research)).
proof_boundary_call(6, 2, addresses(r7, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r7, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r7, research)).
proof_boundary_call(6, 2, addresses(r8, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r8, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r8, research)).
proof_boundary_call(6, 2, addresses(r9, 'no-marketing')).
proof_boundary_call(6, 2, addresses(r9, 'no-transfer-us')).
proof_boundary_call(6, 2, addresses(r9, research)).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', ['browser-signal', refuse]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', ['browser-signal', refuse]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 5]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 5]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 6]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        ['omnibus-proposal', [refused, ['completed-months', 6]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    2,
    ask([baseline, 'first-visit'], ['ask-for-consent', variable("_EyeplCall0")])
).
proof_boundary_call(
    6,
    2,
    ask([baseline, 'first-visit'], [variable("_EyeplCall0"), variable("_EyeplCall1")])
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, ['browser-signal', refuse]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, ['browser-signal', refuse]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, [refused, ['completed-months', 5]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, [refused, ['completed-months', 5]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, [refused, ['completed-months', 6]]],
        ['ask-for-consent', variable("_EyeplCall0")]
    )
).
proof_boundary_call(
    6,
    2,
    ask(
        [baseline, [refused, ['completed-months', 6]]],
        [variable("_EyeplCall0"), variable("_EyeplCall1")]
    )
).
proof_boundary_call(6, 2, controller(variable("_EyeplCall0"), hospital)).
proof_boundary_call(6, 2, controller(r1, hospital)).
proof_boundary_call(6, 2, controller(r10, hospital)).
proof_boundary_call(6, 2, controller(r11, hospital)).
proof_boundary_call(6, 2, controller(r2, hospital)).
proof_boundary_call(6, 2, controller(r3, hospital)).
proof_boundary_call(6, 2, controller(r4, hospital)).
proof_boundary_call(6, 2, controller(r5, hospital)).
proof_boundary_call(6, 2, controller(r6, hospital)).
proof_boundary_call(6, 2, controller(r7, hospital)).
proof_boundary_call(6, 2, controller(r8, hospital)).
proof_boundary_call(6, 2, controller(r9, hospital)).
proof_boundary_call(6, 2, data(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, data(r9, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, failures([r1, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r1, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r1,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures([r1, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(6, 2, failures([r1, []], [])).
proof_boundary_call(6, 2, failures([r1, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, failures([r10, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r10, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r10,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [r10, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        []
    )
).
proof_boundary_call(6, 2, failures([r10, []], [])).
proof_boundary_call(6, 2, failures([r10, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, failures([r11, ['for-marketing']], [])).
proof_boundary_call(6, 2, failures([r2, ['before-2027']], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    failures(
        [r2, ['consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r2,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r2,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [r2, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(6, 2, failures([r2, []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    failures([r2, [pseudonymised, 'before-2027']], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, failures([r3, ['for-marketing']], [])).
proof_boundary_call(6, 2, failures([r3, []], [])).
proof_boundary_call(6, 2, failures([r4, ['before-2027']], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    failures([r4, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [r4, ['consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r4,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r4,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures([r4, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [r4, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(6, 2, failures([r4, []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    failures([r4, [pseudonymised, 'before-2027']], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, failures([r5, ['before-2027']], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    failures([r5, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [r5, ['consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r5,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r5,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    failures([r5, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [r5, ['under-consent', 'consent-given', pseudonymised, 'before-2027']],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(6, 2, failures([r5, []], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, failures([r5, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r5, [pseudonymised, 'before-2027']], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, failures([r6, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r6, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r6,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures([r6, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(6, 2, failures([r6, []], [])).
proof_boundary_call(6, 2, failures([r6, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, failures([r7, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r7, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r7,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures([r7, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(6, 2, failures([r7, []], [])).
proof_boundary_call(6, 2, failures([r7, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, failures([r8, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r8, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r8,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures([r8, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(6, 2, failures([r8, []], [])).
proof_boundary_call(6, 2, failures([r8, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, failures([r9, ['before-2027']], [])).
proof_boundary_call(
    6,
    2,
    failures([r9, ['consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(
    6,
    2,
    failures(
        [
            r9,
            [
                'for-research', 'under-consent', 'consent-given', pseudonymised,
                'before-2027'
            ]
        ],
        []
    )
).
proof_boundary_call(
    6,
    2,
    failures([r9, ['under-consent', 'consent-given', pseudonymised, 'before-2027']], [])
).
proof_boundary_call(6, 2, failures([r9, []], [])).
proof_boundary_call(6, 2, failures([r9, [pseudonymised, 'before-2027']], [])).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), variable("_EyeplCall1"))).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r1)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r10)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r11)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r2)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r3)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r4)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r5)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r6)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r7)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r8)).
proof_boundary_call(6, 2, governs(variable("_EyeplCall0"), r9)).
proof_boundary_call(6, 2, is_a('partner-us', party)).
proof_boundary_call(6, 2, is_a('research-and-development', purpose)).
proof_boundary_call(6, 2, is_a([r1, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r1, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r1, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r1, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r1, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r1, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r1, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r1, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r10, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r10, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r10, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r10, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r10, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r10, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r10, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r10, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r11, 'for-marketing'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r11, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r11, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r11, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r2, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r2, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r2, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r2, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r2, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r2, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r2, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r2, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r3, 'for-marketing'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r3, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r3, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r3, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r4, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r4, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r4, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r4, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r4, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r4, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r4, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r4, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r5, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r5, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r5, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r5, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r5, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r5, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r5, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r5, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r6, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r6, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r6, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r6, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r6, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r6, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r6, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r6, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r7, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r7, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r7, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r7, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r7, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r7, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r7, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r7, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r8, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r8, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r8, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r8, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r8, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r8, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r8, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r8, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r9, 'before-2027'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r9, 'consent-given'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r9, 'for-research'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r9, 'no-marketing'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r9, 'no-transfer-us'], 'applied-rule')).
proof_boundary_call(6, 2, is_a([r9, 'under-consent'], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r9, pseudonymised], 'met-constraint')).
proof_boundary_call(6, 2, is_a([r9, research], 'applied-rule')).
proof_boundary_call(6, 2, is_a(variable("_EyeplCall0"), 'conflicting-process')).
proof_boundary_call(6, 2, is_a(variable("_EyeplCall0"), 'planned-breach')).
proof_boundary_call(6, 2, is_a(variable("_EyeplCall0"), 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(variable("_EyeplCall0"), agreement)).
proof_boundary_call(6, 2, is_a(variable("_EyeplCall0"), rulebook)).
proof_boundary_call(6, 2, is_a(marketing, purpose)).
proof_boundary_call(6, 2, is_a(r1, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r1, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r1, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r1, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r1, 'research-process')).
proof_boundary_call(6, 2, is_a(r10, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r10, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r10, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r10, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r10, 'research-process')).
proof_boundary_call(6, 2, is_a(r11, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r11, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r11, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r11, 'research-process')).
proof_boundary_call(6, 2, is_a(r2, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r2, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r2, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r2, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r2, 'research-process')).
proof_boundary_call(6, 2, is_a(r3, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r3, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r3, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r3, 'research-process')).
proof_boundary_call(6, 2, is_a(r4, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r4, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r4, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r4, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r4, 'research-process')).
proof_boundary_call(6, 2, is_a(r5, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r5, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r5, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r5, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r5, 'research-process')).
proof_boundary_call(6, 2, is_a(r6, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r6, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r6, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r6, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r6, 'research-process')).
proof_boundary_call(6, 2, is_a(r7, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r7, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r7, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r7, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r7, 'research-process')).
proof_boundary_call(6, 2, is_a(r8, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r8, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r8, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r8, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r8, 'research-process')).
proof_boundary_call(6, 2, is_a(r9, 'candidate-process')).
proof_boundary_call(6, 2, is_a(r9, 'permitted-process')).
proof_boundary_call(6, 2, is_a(r9, 'policy-ready-process')).
proof_boundary_call(6, 2, is_a(r9, 'prohibited-process')).
proof_boundary_call(6, 2, is_a(r9, 'research-process')).
proof_boundary_call(
    6,
    2,
    joined(
        [[[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]], []],
        [[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]]
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [[[unmet, 'before-2027', date, 20270301, 'less-than', 20270101]], []],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                    equal, 'consent-given'
                ]
            ],
            []
        ],
        [
            [
                unmet, 'consent-given', 'consent-status', 'consent-withdrawn', equal,
                'consent-given'
            ]
        ]
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, 'consent-given', 'consent-status', 'consent-withdrawn',
                    equal, 'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, 'for-research', purpose, 'personalised-advertising', within,
                    'research-and-development'
                ],
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, 'under-consent', 'legal-basis', 'legitimate-interest', equal,
                    consent
                ],
                [
                    unmet, 'consent-given', 'consent-status', 'consent-unknown', equal,
                    'consent-given'
                ]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, pseudonymised, 'technical-measure', encryption, equal,
                    pseudonymisation
                ],
                [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
            ],
            []
        ],
        [
            [
                unmet, pseudonymised, 'technical-measure', encryption, equal,
                pseudonymisation
            ],
            [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
        ]
    )
).
proof_boundary_call(
    6,
    2,
    joined(
        [
            [
                [
                    unmet, pseudonymised, 'technical-measure', encryption, equal,
                    pseudonymisation
                ],
                [unmet, 'before-2027', date, 20270301, 'less-than', 20270101]
            ],
            []
        ],
        variable("_EyeplCall0")
    )
).
proof_boundary_call(6, 2, joined([[], []], [])).
proof_boundary_call(6, 2, joined([[], []], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    member(['no-marketing', 'no-transfer-us'], variable("_EyeplCall0"))
).
proof_boundary_call(6, 2, member(['no-transfer-us'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, member([], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, member([research], variable("_EyeplCall0"))).
proof_boundary_call(
    6,
    2,
    operand([variable("_EyeplCall0"), purpose], 'research-and-development')
).
proof_boundary_call(6, 2, operand([variable("_EyeplCall0"), purpose], marketing)).
proof_boundary_call(6, 2, operand([r1, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r1, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r1, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r1, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r1, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r10, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r10, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r10, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r10, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r10, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r11, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r2, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r2, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r2, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r2, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r2, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r2, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r2, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r2, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r3, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r4, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r4, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r4, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r4, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r4, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r4, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r4, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r4, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r5, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r5, 'consent-status'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r5, 'legal-basis'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r5, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r5, 'technical-measure'], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r5, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r5, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r5, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r6, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r6, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r6, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r6, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r6, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r7, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r7, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r7, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r7, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r7, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r8, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r8, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r8, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r8, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r8, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r9, 'consent-status'], 'consent-given')).
proof_boundary_call(6, 2, operand([r9, 'legal-basis'], consent)).
proof_boundary_call(6, 2, operand([r9, 'technical-measure'], pseudonymisation)).
proof_boundary_call(6, 2, operand([r9, date], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, operand([r9, purpose], variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, processing(r9, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(variable("_EyeplCall0"), 'partner-us')).
proof_boundary_call(6, 2, requester(r1, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r10, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r11, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r2, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r3, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r4, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r5, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r6, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r7, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r8, variable("_EyeplCall0"))).
proof_boundary_call(6, 2, requester(r9, variable("_EyeplCall0"))).
proof_claim(6, answer(6, [430])).

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

% Goal check 20
check_result(20, true).

% Goal check 21
check_result(21, true).

% Goal check 22
check_result(22, true).

% Goal check 23
check_result(23, true).

% Goal check 24
check_result(24, true).
