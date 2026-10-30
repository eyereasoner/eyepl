% Answer 1
binomial_answer(symmetry_24_7, true).
binomial_answer(choose_24_12, 2704156).
binomial_answer(choose_100_50, 100891344545564193334812497256).
binomial_answer(row_12_sum, 4096).
binomial_answer(vandermonde_12_10_8, 319770).

% Answer 2
vandermonde(12, 10, 8, 319770).

% Reason 2
proof_step(2, 1, choose_step(24, 7, 7, 346104, 346104), rule(4, [])).
proof_step(2, 2, '<'(6, 7), builtin).
proof_step(2, 3, is(7, '+'(6, 1)), builtin).
proof_step(2, 4, is(2422728, '*'(134596, '-'(24, 6))), builtin).
proof_step(2, 5, is(346104, '//'(2422728, 7)), builtin).
proof_step(2, 6, '<'(5, 7), builtin).
proof_step(2, 7, is(6, '+'(5, 1)), builtin).
proof_step(2, 8, is(807576, '*'(42504, '-'(24, 5))), builtin).
proof_step(2, 9, is(134596, '//'(807576, 6)), builtin).
proof_step(2, 10, '<'(4, 7), builtin).
proof_step(2, 11, is(5, '+'(4, 1)), builtin).
proof_step(2, 12, is(212520, '*'(10626, '-'(24, 4))), builtin).
proof_step(2, 13, is(42504, '//'(212520, 5)), builtin).
proof_step(2, 14, '<'(3, 7), builtin).
proof_step(2, 15, is(4, '+'(3, 1)), builtin).
proof_step(2, 16, is(42504, '*'(2024, '-'(24, 3))), builtin).
proof_step(2, 17, is(10626, '//'(42504, 4)), builtin).
proof_step(2, 18, '<'(2, 7), builtin).
proof_step(2, 19, is(3, '+'(2, 1)), builtin).
proof_step(2, 20, is(6072, '*'(276, '-'(24, 2))), builtin).
proof_step(2, 21, is(2024, '//'(6072, 3)), builtin).
proof_step(2, 22, '<'(1, 7), builtin).
proof_step(2, 23, is(2, '+'(1, 1)), builtin).
proof_step(2, 24, is(552, '*'(24, '-'(24, 1))), builtin).
proof_step(2, 25, is(276, '//'(552, 2)), builtin).
proof_step(2, 26, '<'(0, 7), builtin).
proof_step(2, 27, is(1, '+'(0, 1)), builtin).
proof_step(2, 28, is(24, '*'(1, '-'(24, 0))), builtin).
proof_step(2, 29, is(24, '//'(24, 1)), builtin).
proof_step(2, 30, '>='(7, 0), builtin).
proof_step(2, 31, '=<'(7, 24), builtin).
proof_step(2, 32, is(7, min(7, '-'(24, 7))), builtin).
proof_step(2, 33, choose_step(24, 12, 12, 2704156, 2704156), rule(4, [])).
proof_step(2, 34, '>='(17, 0), builtin).
proof_step(2, 35, '=<'(17, 24), builtin).
proof_step(2, 36, is(7, min(17, '-'(24, 17))), builtin).
proof_step(2, 37, '<'(11, 12), builtin).
proof_step(2, 38, is(12, '+'(11, 1)), builtin).
proof_step(2, 39, is(32449872, '*'(2496144, '-'(24, 11))), builtin).
proof_step(2, 40, is(2704156, '//'(32449872, 12)), builtin).
proof_step(2, 41, is(17, '-'(24, 7)), builtin).
proof_step(2, 42, '<'(10, 12), builtin).
proof_step(2, 43, is(11, '+'(10, 1)), builtin).
proof_step(2, 44, is(27457584, '*'(1961256, '-'(24, 10))), builtin).
proof_step(2, 45, is(2496144, '//'(27457584, 11)), builtin).
proof_step(2, 46, '<'(9, 12), builtin).
proof_step(2, 47, is(10, '+'(9, 1)), builtin).
proof_step(2, 48, is(19612560, '*'(1307504, '-'(24, 9))), builtin).
proof_step(2, 49, is(1961256, '//'(19612560, 10)), builtin).
proof_step(2, 50, '<'(8, 12), builtin).
proof_step(2, 51, is(9, '+'(8, 1)), builtin).
proof_step(2, 52, is(11767536, '*'(735471, '-'(24, 8))), builtin).
proof_step(2, 53, is(1307504, '//'(11767536, 9)), builtin).
proof_step(2, 54, '<'(7, 12), builtin).
proof_step(2, 55, is(8, '+'(7, 1)), builtin).
proof_step(2, 56, is(5883768, '*'(346104, '-'(24, 7))), builtin).
proof_step(2, 57, is(735471, '//'(5883768, 8)), builtin).
proof_step(2, 58, '<'(6, 12), builtin).
proof_step(2, 59, '<'(5, 12), builtin).
proof_step(2, 60, '<'(4, 12), builtin).
proof_step(2, 61, '<'(3, 12), builtin).
proof_step(2, 62, '<'(2, 12), builtin).
proof_step(2, 63, '<'(1, 12), builtin).
proof_step(2, 64, '<'(0, 12), builtin).
proof_step(2, 65, '>='(12, 0), builtin).
proof_step(2, 66, '=<'(12, 24), builtin).
proof_step(2, 67, is(12, min(12, '-'(24, 12))), builtin).
proof_step(
    2,
    68,
    choose_step(
        100,
        50,
        50,
        100891344545564193334812497256,
        100891344545564193334812497256
    ),
    rule(4, [])
).
proof_step(2, 69, '<'(49, 50), builtin).
proof_step(2, 70, is(50, '+'(49, 1)), builtin).
proof_step(
    2,
    71,
    is(
        5044567227278209666740624862800,
        '*'(98913082887808032681188722800, '-'(100, 49))
    ),
    builtin
).
proof_step(
    2,
    72,
    is(100891344545564193334812497256, '//'(5044567227278209666740624862800, 50)),
    builtin
).
proof_step(2, 73, '<'(48, 50), builtin).
proof_step(2, 74, is(49, '+'(48, 1)), builtin).
proof_step(
    2,
    75,
    is(
        4846741061502593601378247417200,
        '*'(93206558875049876949581681100, '-'(100, 48))
    ),
    builtin
).
proof_step(
    2,
    76,
    is(98913082887808032681188722800, '//'(4846741061502593601378247417200, 49)),
    builtin
).
proof_step(2, 77, '<'(47, 50), builtin).
proof_step(2, 78, is(48, '+'(47, 1)), builtin).
proof_step(
    2,
    79,
    is(
        4473914826002394093579920692800,
        '*'(84413487283064039501507937600, '-'(100, 47))
    ),
    builtin
).
proof_step(
    2,
    80,
    is(93206558875049876949581681100, '//'(4473914826002394093579920692800, 48)),
    builtin
).
proof_step(2, 81, '<'(46, 50), builtin).
proof_step(2, 82, is(47, '+'(46, 1)), builtin).
proof_step(
    2,
    83,
    is(
        3967433902304009856570873067200,
        '*'(73470998190814997343905056800, '-'(100, 46))
    ),
    builtin
).
proof_step(
    2,
    84,
    is(84413487283064039501507937600, '//'(3967433902304009856570873067200, 47)),
    builtin
).
proof_step(2, 85, '<'(45, 50), builtin).
proof_step(2, 86, is(46, '+'(45, 1)), builtin).
proof_step(
    2,
    87,
    is(
        3379665916777489877819632612800,
        '*'(61448471214136179596720592960, '-'(100, 45))
    ),
    builtin
).
proof_step(
    2,
    88,
    is(73470998190814997343905056800, '//'(3379665916777489877819632612800, 46)),
    builtin
).
proof_step(2, 89, '<'(44, 50), builtin).
proof_step(2, 90, is(45, '+'(44, 1)), builtin).
proof_step(
    2,
    91,
    is(
        2765181204636128081852426683200,
        '*'(49378235797073715747364762200, '-'(100, 44))
    ),
    builtin
).
proof_step(
    2,
    92,
    is(61448471214136179596720592960, '//'(2765181204636128081852426683200, 45)),
    builtin
).
proof_step(2, 93, '<'(43, 50), builtin).
proof_step(2, 94, is(44, '+'(43, 1)), builtin).
proof_step(
    2,
    95,
    is(
        2172642375071243492884049536800,
        '*'(38116532895986727945334202400, '-'(100, 43))
    ),
    builtin
).
proof_step(
    2,
    96,
    is(49378235797073715747364762200, '//'(2172642375071243492884049536800, 44)),
    builtin
).
proof_step(2, 97, '<'(42, 50), builtin).
proof_step(2, 98, is(43, '+'(42, 1)), builtin).
proof_step(
    2,
    99,
    is(
        1639010914527429301649370703200,
        '*'(28258808871162574166368460400, '-'(100, 42))
    ),
    builtin
).
proof_step(
    2,
    100,
    is(38116532895986727945334202400, '//'(1639010914527429301649370703200, 43)),
    builtin
).
proof_step(2, 101, '<'(41, 50), builtin).
proof_step(2, 102, is(42, '+'(41, 1)), builtin).
proof_step(
    2,
    103,
    is(
        1186869972588828114987475336800,
        '*'(20116440213369968050635175200, '-'(100, 41))
    ),
    builtin
).
proof_step(
    2,
    104,
    is(28258808871162574166368460400, '//'(1186869972588828114987475336800, 42)),
    builtin
).
proof_step(2, 105, '<'(40, 50), builtin).
proof_step(2, 106, is(41, '+'(40, 1)), builtin).
proof_step(
    2,
    107,
    is(824774048748168690076042183200, '*'(13746234145802811501267369720, '-'(100, 40))),
    builtin
).
proof_step(
    2,
    108,
    is(20116440213369968050635175200, '//'(824774048748168690076042183200, 41)),
    builtin
).
proof_step(2, 109, '<'(39, 50), builtin).
proof_step(2, 110, is(40, '+'(39, 1)), builtin).
proof_step(
    2,
    111,
    is(549849365832112460050694788800, '*'(9013924030034630492634340800, '-'(100, 39))),
    builtin
).
proof_step(
    2,
    112,
    is(13746234145802811501267369720, '//'(549849365832112460050694788800, 40)),
    builtin
).
proof_step(2, 113, '<'(38, 50), builtin).
proof_step(2, 114, is(39, '+'(38, 1)), builtin).
proof_step(
    2,
    115,
    is(351543037171350589212739291200, '*'(5670048986634686922786117600, '-'(100, 38))),
    builtin
).
proof_step(
    2,
    116,
    is(9013924030034630492634340800, '//'(351543037171350589212739291200, 39)),
    builtin
).
proof_step(2, 117, '<'(37, 50), builtin).
proof_step(2, 118, is(38, '+'(37, 1)), builtin).
proof_step(
    2,
    119,
    is(215461861492118103065872468800, '*'(3420029547493938143902737600, '-'(100, 37))),
    builtin
).
proof_step(
    2,
    120,
    is(5670048986634686922786117600, '//'(215461861492118103065872468800, 38)),
    builtin
).
proof_step(2, 121, '<'(36, 50), builtin).
proof_step(2, 122, is(37, '+'(36, 1)), builtin).
proof_step(
    2,
    123,
    is(126541093257275711324401291200, '*'(1977204582144932989443770175, '-'(100, 36))),
    builtin
).
proof_step(
    2,
    124,
    is(3420029547493938143902737600, '//'(126541093257275711324401291200, 37)),
    builtin
).
proof_step(2, 125, '<'(35, 50), builtin).
proof_step(2, 126, is(36, '+'(35, 1)), builtin).
proof_step(
    2,
    127,
    is(71179364957217587619975726300, '*'(1095067153187962886461165020, '-'(100, 35))),
    builtin
).
proof_step(
    2,
    128,
    is(1977204582144932989443770175, '//'(71179364957217587619975726300, 36)),
    builtin
).
proof_step(2, 129, '<'(34, 50), builtin).
proof_step(2, 130, is(35, '+'(34, 1)), builtin).
proof_step(
    2,
    131,
    is(38327350361578701026140775700, '*'(580717429720889409486981450, '-'(100, 34))),
    builtin
).
proof_step(
    2,
    132,
    is(1095067153187962886461165020, '//'(38327350361578701026140775700, 35)),
    builtin
).
proof_step(2, 133, '<'(33, 50), builtin).
proof_step(2, 134, is(34, '+'(33, 1)), builtin).
proof_step(
    2,
    135,
    is(19744392610510239922557369300, '*'(294692427022540894366527900, '-'(100, 33))),
    builtin
).
proof_step(
    2,
    136,
    is(580717429720889409486981450, '//'(19744392610510239922557369300, 34)),
    builtin
).
proof_step(2, 137, '<'(32, 50), builtin).
proof_step(2, 138, is(33, '+'(32, 1)), builtin).
proof_step(
    2,
    139,
    is(9724850091743849514095420700, '*'(143012501349174257560226775, '-'(100, 32))),
    builtin
).
proof_step(
    2,
    140,
    is(294692427022540894366527900, '//'(9724850091743849514095420700, 33)),
    builtin
).
proof_step(2, 141, '<'(31, 50), builtin).
proof_step(2, 142, is(32, '+'(31, 1)), builtin).
proof_step(
    2,
    143,
    is(4576400043173576241927256800, '*'(66324638306863423796047200, '-'(100, 31))),
    builtin
).
proof_step(
    2,
    144,
    is(143012501349174257560226775, '//'(4576400043173576241927256800, 32)),
    builtin
).
proof_step(2, 145, '<'(30, 50), builtin).
proof_step(2, 146, is(31, '+'(30, 1)), builtin).
proof_step(
    2,
    147,
    is(2056063787512766137677463200, '*'(29372339821610944823963760, '-'(100, 30))),
    builtin
).
proof_step(
    2,
    148,
    is(66324638306863423796047200, '//'(2056063787512766137677463200, 31)),
    builtin
).
proof_step(2, 149, '<'(29, 50), builtin).
proof_step(2, 150, is(30, '+'(29, 1)), builtin).
proof_step(
    2,
    151,
    is(881170194648328344718912800, '*'(12410847811948286545336800, '-'(100, 29))),
    builtin
).
proof_step(
    2,
    152,
    is(29372339821610944823963760, '//'(881170194648328344718912800, 30)),
    builtin
).
proof_step(2, 153, '<'(28, 50), builtin).
proof_step(2, 154, is(29, '+'(28, 1)), builtin).
proof_step(
    2,
    155,
    is(359914586546500309814767200, '*'(4998813702034726525205100, '-'(100, 28))),
    builtin
).
proof_step(
    2,
    156,
    is(12410847811948286545336800, '//'(359914586546500309814767200, 29)),
    builtin
).
proof_step(2, 157, '<'(27, 50), builtin).
proof_step(2, 158, is(28, '+'(27, 1)), builtin).
proof_step(
    2,
    159,
    is(139966783656972342705742800, '*'(1917353200780443050763600, '-'(100, 27))),
    builtin
).
proof_step(
    2,
    160,
    is(4998813702034726525205100, '//'(139966783656972342705742800, 28)),
    builtin
).
proof_step(2, 161, '<'(26, 50), builtin).
proof_step(2, 162, is(27, '+'(26, 1)), builtin).
proof_step(
    2,
    163,
    is(51768536421071962370617200, '*'(699574816500972464467800, '-'(100, 26))),
    builtin
).
proof_step(
    2,
    164,
    is(1917353200780443050763600, '//'(51768536421071962370617200, 27)),
    builtin
).
proof_step(2, 165, '<'(25, 50), builtin).
proof_step(2, 166, is(26, '+'(25, 1)), builtin).
proof_step(
    2,
    167,
    is(18188945229025284076162800, '*'(242519269720337121015504, '-'(100, 25))),
    builtin
).
proof_step(
    2,
    168,
    is(699574816500972464467800, '//'(18188945229025284076162800, 26)),
    builtin
).
proof_step(2, 169, '<'(24, 50), builtin).
proof_step(2, 170, is(25, '+'(24, 1)), builtin).
proof_step(
    2,
    171,
    is(6062981743008428025387600, '*'(79776075565900368755100, '-'(100, 24))),
    builtin
).
proof_step(
    2,
    172,
    is(242519269720337121015504, '//'(6062981743008428025387600, 25)),
    builtin
).
proof_step(2, 173, '<'(23, 50), builtin).
proof_step(2, 174, is(24, '+'(23, 1)), builtin).
proof_step(
    2,
    175,
    is(1914625813581608850122400, '*'(24865270306254660391200, '-'(100, 23))),
    builtin
).
proof_step(
    2,
    176,
    is(79776075565900368755100, '//'(1914625813581608850122400, 24)),
    builtin
).
proof_step(2, 177, '<'(22, 50), builtin).
proof_step(2, 178, is(23, '+'(22, 1)), builtin).
proof_step(
    2,
    179,
    is(571901217043857188997600, '*'(7332066885177656269200, '-'(100, 22))),
    builtin
).
proof_step(
    2,
    180,
    is(24865270306254660391200, '//'(571901217043857188997600, 23)),
    builtin
).
proof_step(2, 181, '<'(21, 50), builtin).
proof_step(2, 182, is(22, '+'(21, 1)), builtin).
proof_step(
    2,
    183,
    is(161305471473908437922400, '*'(2041841411062132125600, '-'(100, 21))),
    builtin
).
proof_step(
    2,
    184,
    is(7332066885177656269200, '//'(161305471473908437922400, 22)),
    builtin
).
proof_step(2, 185, '<'(20, 50), builtin).
proof_step(2, 186, is(21, '+'(20, 1)), builtin).
proof_step(
    2,
    187,
    is(42878669632304774637600, '*'(535983370403809682970, '-'(100, 20))),
    builtin
).
proof_step(
    2,
    188,
    is(2041841411062132125600, '//'(42878669632304774637600, 21)),
    builtin
).
proof_step(2, 189, '<'(19, 50), builtin).
proof_step(2, 190, is(20, '+'(19, 1)), builtin).
proof_step(
    2,
    191,
    is(10719667408076193659400, '*'(132341572939212267400, '-'(100, 19))),
    builtin
).
proof_step(
    2,
    192,
    is(535983370403809682970, '//'(10719667408076193659400, 20)),
    builtin
).
proof_step(2, 193, '<'(18, 50), builtin).
proof_step(2, 194, is(19, '+'(18, 1)), builtin).
proof_step(
    2,
    195,
    is(2514489885845033080600, '*'(30664510802988208300, '-'(100, 18))),
    builtin
).
proof_step(2, 196, is(132341572939212267400, '//'(2514489885845033080600, 19)), builtin).
proof_step(2, 197, '<'(17, 50), builtin).
proof_step(2, 198, is(18, '+'(17, 1)), builtin).
proof_step(
    2,
    199,
    is(551961194453787749400, '*'(6650134872937201800, '-'(100, 17))),
    builtin
).
proof_step(2, 200, is(30664510802988208300, '//'(551961194453787749400, 18)), builtin).
proof_step(2, 201, '<'(16, 50), builtin).
proof_step(2, 202, is(17, '+'(16, 1)), builtin).
proof_step(
    2,
    203,
    is(113052292839932430600, '*'(1345860629046814650, '-'(100, 16))),
    builtin
).
proof_step(2, 204, is(6650134872937201800, '//'(113052292839932430600, 17)), builtin).
proof_step(2, 205, '<'(15, 50), builtin).
proof_step(2, 206, is(16, '+'(15, 1)), builtin).
proof_step(
    2,
    207,
    is(21533770064749034400, '*'(253338471349988640, '-'(100, 15))),
    builtin
).
proof_step(2, 208, is(1345860629046814650, '//'(21533770064749034400, 16)), builtin).
proof_step(2, 209, '<'(14, 50), builtin).
proof_step(2, 210, is(15, '+'(14, 1)), builtin).
proof_step(
    2,
    211,
    is(3800077070249829600, '*'(44186942677323600, '-'(100, 14))),
    builtin
).
proof_step(2, 212, is(253338471349988640, '//'(3800077070249829600, 15)), builtin).
proof_step(2, 213, '<'(13, 50), builtin).
proof_step(2, 214, is(14, '+'(13, 1)), builtin).
proof_step(2, 215, is(618617197482530400, '*'(7110542499799200, '-'(100, 13))), builtin).
proof_step(2, 216, is(44186942677323600, '//'(618617197482530400, 14)), builtin).
proof_step(2, 217, '<'(12, 50), builtin).
proof_step(2, 218, is(13, '+'(12, 1)), builtin).
proof_step(2, 219, is(92437052497389600, '*'(1050421051106700, '-'(100, 12))), builtin).
proof_step(2, 220, is(7110542499799200, '//'(92437052497389600, 13)), builtin).
proof_step(2, 221, '<'(11, 50), builtin).
proof_step(2, 222, is(12605052613280400, '*'(141629804643600, '-'(100, 11))), builtin).
proof_step(2, 223, is(1050421051106700, '//'(12605052613280400, 12)), builtin).
proof_step(2, 224, '<'(10, 50), builtin).
proof_step(2, 225, is(1557927851079600, '*'(17310309456440, '-'(100, 10))), builtin).
proof_step(2, 226, is(141629804643600, '//'(1557927851079600, 11)), builtin).
proof_step(2, 227, '<'(9, 50), builtin).
proof_step(2, 228, is(173103094564400, '*'(1902231808400, '-'(100, 9))), builtin).
proof_step(2, 229, is(17310309456440, '//'(173103094564400, 10)), builtin).
proof_step(2, 230, '<'(8, 50), builtin).
proof_step(2, 231, is(17120086275600, '*'(186087894300, '-'(100, 8))), builtin).
proof_step(2, 232, is(1902231808400, '//'(17120086275600, 9)), builtin).
proof_step(2, 233, '<'(7, 50), builtin).
proof_step(2, 234, is(1488703154400, '*'(16007560800, '-'(100, 7))), builtin).
proof_step(2, 235, is(186087894300, '//'(1488703154400, 8)), builtin).
proof_step(2, 236, '<'(6, 50), builtin).
proof_step(2, 237, is(112052925600, '*'(1192052400, '-'(100, 6))), builtin).
proof_step(2, 238, is(16007560800, '//'(112052925600, 7)), builtin).
proof_step(2, 239, '<'(5, 50), builtin).
proof_step(2, 240, is(7152314400, '*'(75287520, '-'(100, 5))), builtin).
proof_step(2, 241, is(1192052400, '//'(7152314400, 6)), builtin).
proof_step(2, 242, '<'(4, 50), builtin).
proof_step(2, 243, is(376437600, '*'(3921225, '-'(100, 4))), builtin).
proof_step(2, 244, is(75287520, '//'(376437600, 5)), builtin).
proof_step(2, 245, '<'(3, 50), builtin).
proof_step(2, 246, is(15684900, '*'(161700, '-'(100, 3))), builtin).
proof_step(2, 247, is(3921225, '//'(15684900, 4)), builtin).
proof_step(2, 248, '<'(2, 50), builtin).
proof_step(2, 249, is(485100, '*'(4950, '-'(100, 2))), builtin).
proof_step(2, 250, is(161700, '//'(485100, 3)), builtin).
proof_step(2, 251, '<'(1, 50), builtin).
proof_step(2, 252, is(9900, '*'(100, '-'(100, 1))), builtin).
proof_step(2, 253, is(4950, '//'(9900, 2)), builtin).
proof_step(2, 254, '<'(0, 50), builtin).
proof_step(2, 255, is(100, '*'(1, '-'(100, 0))), builtin).
proof_step(2, 256, is(100, '//'(100, 1)), builtin).
proof_step(2, 257, '>='(50, 0), builtin).
proof_step(2, 258, '=<'(50, 100), builtin).
proof_step(2, 259, is(50, min(50, '-'(100, 50))), builtin).
proof_step(2, 260, '=<'(0, 12), builtin).
proof_step(2, 261, '=<'(1, 12), builtin).
proof_step(2, 262, '=<'(2, 12), builtin).
proof_step(2, 263, '=<'(3, 12), builtin).
proof_step(2, 264, '=<'(4, 12), builtin).
proof_step(2, 265, '=<'(5, 12), builtin).
proof_step(2, 266, '=<'(6, 12), builtin).
proof_step(2, 267, '=<'(7, 12), builtin).
proof_step(2, 268, '=<'(8, 12), builtin).
proof_step(2, 269, '=<'(9, 12), builtin).
proof_step(2, 270, '=<'(10, 12), builtin).
proof_step(2, 271, '=<'(11, 12), builtin).
proof_step(2, 272, '=<'(12, 12), builtin).
proof_step(2, 273, choose_step(22, 8, 8, 319770, 319770), rule(4, [])).
proof_step(2, 274, '<'(7, 8), builtin).
proof_step(2, 275, is(2558160, '*'(170544, '-'(22, 7))), builtin).
proof_step(2, 276, is(319770, '//'(2558160, 8)), builtin).
proof_step(2, 277, '<'(6, 8), builtin).
proof_step(2, 278, is(1193808, '*'(74613, '-'(22, 6))), builtin).
proof_step(2, 279, is(170544, '//'(1193808, 7)), builtin).
proof_step(2, 280, '<'(5, 8), builtin).
proof_step(2, 281, is(447678, '*'(26334, '-'(22, 5))), builtin).
proof_step(2, 282, is(74613, '//'(447678, 6)), builtin).
proof_step(2, 283, '<'(4, 8), builtin).
proof_step(2, 284, is(131670, '*'(7315, '-'(22, 4))), builtin).
proof_step(2, 285, is(26334, '//'(131670, 5)), builtin).
proof_step(2, 286, '<'(3, 8), builtin).
proof_step(2, 287, is(29260, '*'(1540, '-'(22, 3))), builtin).
proof_step(2, 288, is(7315, '//'(29260, 4)), builtin).
proof_step(2, 289, '<'(2, 8), builtin).
proof_step(2, 290, is(4620, '*'(231, '-'(22, 2))), builtin).
proof_step(2, 291, is(1540, '//'(4620, 3)), builtin).
proof_step(2, 292, '<'(1, 8), builtin).
proof_step(2, 293, is(462, '*'(22, '-'(22, 1))), builtin).
proof_step(2, 294, is(231, '//'(462, 2)), builtin).
proof_step(2, 295, '<'(0, 8), builtin).
proof_step(2, 296, is(22, '*'(1, '-'(22, 0))), builtin).
proof_step(2, 297, is(22, '//'(22, 1)), builtin).
proof_step(2, 298, '>='(8, 0), builtin).
proof_step(2, 299, '=<'(8, 22), builtin).
proof_step(2, 300, is(8, min(8, '-'(22, 8))), builtin).
proof_step(2, 301, choose_step(12, 0, 0, 1, 1), rule(4, [])).
proof_step(2, 302, '>='(0, 0), builtin).
proof_step(2, 303, is(0, min(0, '-'(12, 0))), builtin).
proof_step(2, 304, is(0, min(12, '-'(12, 12))), builtin).
proof_step(2, 305, choose_step(12, 1, 1, 12, 12), rule(4, [])).
proof_step(2, 306, '<'(0, 1), builtin).
proof_step(2, 307, is(12, '*'(1, '-'(12, 0))), builtin).
proof_step(2, 308, is(12, '//'(12, 1)), builtin).
proof_step(2, 309, '>='(1, 0), builtin).
proof_step(2, 310, is(1, min(1, '-'(12, 1))), builtin).
proof_step(2, 311, '>='(11, 0), builtin).
proof_step(2, 312, is(1, min(11, '-'(12, 11))), builtin).
proof_step(2, 313, choose_step(12, 2, 2, 66, 66), rule(4, [])).
proof_step(2, 314, '<'(1, 2), builtin).
proof_step(2, 315, is(132, '*'(12, '-'(12, 1))), builtin).
proof_step(2, 316, is(66, '//'(132, 2)), builtin).
proof_step(2, 317, '<'(0, 2), builtin).
proof_step(2, 318, choose_step(12, 3, 3, 220, 220), rule(4, [])).
proof_step(2, 319, '>='(2, 0), builtin).
proof_step(2, 320, is(2, min(2, '-'(12, 2))), builtin).
proof_step(2, 321, '>='(10, 0), builtin).
proof_step(2, 322, is(2, min(10, '-'(12, 10))), builtin).
proof_step(2, 323, '<'(2, 3), builtin).
proof_step(2, 324, is(660, '*'(66, '-'(12, 2))), builtin).
proof_step(2, 325, is(220, '//'(660, 3)), builtin).
proof_step(2, 326, '<'(1, 3), builtin).
proof_step(2, 327, choose_step(12, 4, 4, 495, 495), rule(4, [])).
proof_step(2, 328, '<'(0, 3), builtin).
proof_step(2, 329, '<'(3, 4), builtin).
proof_step(2, 330, is(1980, '*'(220, '-'(12, 3))), builtin).
proof_step(2, 331, is(495, '//'(1980, 4)), builtin).
proof_step(2, 332, '>='(3, 0), builtin).
proof_step(2, 333, is(3, min(3, '-'(12, 3))), builtin).
proof_step(2, 334, '>='(9, 0), builtin).
proof_step(2, 335, is(3, min(9, '-'(12, 9))), builtin).
proof_step(2, 336, '<'(2, 4), builtin).
proof_step(2, 337, choose_step(12, 5, 5, 792, 792), rule(4, [])).
proof_step(2, 338, '<'(1, 4), builtin).
proof_step(2, 339, '<'(4, 5), builtin).
proof_step(2, 340, is(3960, '*'(495, '-'(12, 4))), builtin).
proof_step(2, 341, is(792, '//'(3960, 5)), builtin).
proof_step(2, 342, '<'(0, 4), builtin).
proof_step(2, 343, '<'(3, 5), builtin).
proof_step(2, 344, '>='(4, 0), builtin).
proof_step(2, 345, is(4, min(4, '-'(12, 4))), builtin).
proof_step(2, 346, is(4, min(8, '-'(12, 8))), builtin).
proof_step(2, 347, choose_step(12, 6, 6, 924, 924), rule(4, [])).
proof_step(2, 348, '<'(2, 5), builtin).
proof_step(2, 349, '<'(5, 6), builtin).
proof_step(2, 350, is(5544, '*'(792, '-'(12, 5))), builtin).
proof_step(2, 351, is(924, '//'(5544, 6)), builtin).
proof_step(2, 352, '<'(1, 5), builtin).
proof_step(2, 353, '<'(4, 6), builtin).
proof_step(2, 354, '<'(0, 5), builtin).
proof_step(2, 355, '<'(3, 6), builtin).
proof_step(2, 356, '>='(5, 0), builtin).
proof_step(2, 357, is(5, min(5, '-'(12, 5))), builtin).
proof_step(2, 358, is(5, min(7, '-'(12, 7))), builtin).
proof_step(2, 359, '<'(2, 6), builtin).
proof_step(2, 360, '<'(1, 6), builtin).
proof_step(2, 361, '<'(0, 6), builtin).
proof_step(2, 362, '>='(6, 0), builtin).
proof_step(2, 363, is(6, min(6, '-'(12, 6))), builtin).
proof_step(2, 364, '=<'(0, 8), builtin).
proof_step(2, 365, '=<'(1, 8), builtin).
proof_step(2, 366, '=<'(2, 8), builtin).
proof_step(2, 367, '=<'(3, 8), builtin).
proof_step(2, 368, '=<'(4, 8), builtin).
proof_step(2, 369, '=<'(5, 8), builtin).
proof_step(2, 370, '=<'(6, 8), builtin).
proof_step(2, 371, '=<'(7, 8), builtin).
proof_step(2, 372, '=<'(8, 8), builtin).
proof_step(2, 373, choose_step(10, 0, 0, 1, 1), rule(4, [])).
proof_step(2, 374, '=<'(0, 10), builtin).
proof_step(2, 375, is(0, min(0, '-'(10, 0))), builtin).
proof_step(2, 376, choose_step(10, 1, 1, 10, 10), rule(4, [])).
proof_step(2, 377, is(10, '*'(1, '-'(10, 0))), builtin).
proof_step(2, 378, is(10, '//'(10, 1)), builtin).
proof_step(2, 379, '=<'(1, 10), builtin).
proof_step(2, 380, is(1, min(1, '-'(10, 1))), builtin).
proof_step(2, 381, choose_step(10, 2, 2, 45, 45), rule(4, [])).
proof_step(2, 382, is(90, '*'(10, '-'(10, 1))), builtin).
proof_step(2, 383, is(45, '//'(90, 2)), builtin).
proof_step(2, 384, choose_step(10, 3, 3, 120, 120), rule(4, [])).
proof_step(2, 385, '=<'(8, 10), builtin).
proof_step(2, 386, is(2, min(8, '-'(10, 8))), builtin).
proof_step(2, 387, '=<'(2, 10), builtin).
proof_step(2, 388, is(2, min(2, '-'(10, 2))), builtin).
proof_step(2, 389, is(360, '*'(45, '-'(10, 2))), builtin).
proof_step(2, 390, is(120, '//'(360, 3)), builtin).
proof_step(2, 391, choose_step(10, 4, 4, 210, 210), rule(4, [])).
proof_step(2, 392, is(840, '*'(120, '-'(10, 3))), builtin).
proof_step(2, 393, is(210, '//'(840, 4)), builtin).
proof_step(2, 394, '=<'(7, 10), builtin).
proof_step(2, 395, is(3, min(7, '-'(10, 7))), builtin).
proof_step(2, 396, '=<'(3, 10), builtin).
proof_step(2, 397, is(3, min(3, '-'(10, 3))), builtin).
proof_step(2, 398, choose_step(10, 5, 5, 252, 252), rule(4, [])).
proof_step(2, 399, is(1260, '*'(210, '-'(10, 4))), builtin).
proof_step(2, 400, is(252, '//'(1260, 5)), builtin).
proof_step(2, 401, '=<'(6, 10), builtin).
proof_step(2, 402, is(4, min(6, '-'(10, 6))), builtin).
proof_step(2, 403, '=<'(4, 10), builtin).
proof_step(2, 404, is(4, min(4, '-'(10, 4))), builtin).
proof_step(2, 405, '=<'(5, 10), builtin).
proof_step(2, 406, is(5, min(5, '-'(10, 5))), builtin).
proof_step(2, 407, is(22, '+'(12, 10)), builtin).
proof_step(2, 408, choose_step(0, 0, 0, 1, 1), rule(4, [])).
proof_step(2, 409, '=<'(0, 0), builtin).
proof_step(2, 410, is(0, min(0, '-'(0, 0))), builtin).
proof_step(
    2,
    411,
    choose_step(100, 37, 37, 3420029547493938143902737600, 3420029547493938143902737600),
    rule(4, [])
).
proof_step(2, 412, '<'(36, 37), builtin).
proof_step(2, 413, '<'(35, 37), builtin).
proof_step(2, 414, '<'(34, 37), builtin).
proof_step(2, 415, '<'(33, 37), builtin).
proof_step(2, 416, '<'(32, 37), builtin).
proof_step(2, 417, '<'(31, 37), builtin).
proof_step(2, 418, '<'(30, 37), builtin).
proof_step(2, 419, '<'(29, 37), builtin).
proof_step(2, 420, '<'(28, 37), builtin).
proof_step(2, 421, '<'(27, 37), builtin).
proof_step(2, 422, '<'(26, 37), builtin).
proof_step(2, 423, '<'(25, 37), builtin).
proof_step(2, 424, '<'(24, 37), builtin).
proof_step(2, 425, '<'(23, 37), builtin).
proof_step(2, 426, '<'(22, 37), builtin).
proof_step(2, 427, '<'(21, 37), builtin).
proof_step(2, 428, '<'(20, 37), builtin).
proof_step(2, 429, '<'(19, 37), builtin).
proof_step(2, 430, '<'(18, 37), builtin).
proof_step(2, 431, '<'(17, 37), builtin).
proof_step(2, 432, '<'(16, 37), builtin).
proof_step(2, 433, '<'(15, 37), builtin).
proof_step(2, 434, '<'(14, 37), builtin).
proof_step(2, 435, '<'(13, 37), builtin).
proof_step(2, 436, '<'(12, 37), builtin).
proof_step(2, 437, '<'(11, 37), builtin).
proof_step(2, 438, '<'(10, 37), builtin).
proof_step(2, 439, '<'(9, 37), builtin).
proof_step(2, 440, '<'(8, 37), builtin).
proof_step(2, 441, '<'(7, 37), builtin).
proof_step(2, 442, '<'(6, 37), builtin).
proof_step(2, 443, '<'(5, 37), builtin).
proof_step(2, 444, '<'(4, 37), builtin).
proof_step(2, 445, '<'(3, 37), builtin).
proof_step(2, 446, '<'(2, 37), builtin).
proof_step(2, 447, '<'(1, 37), builtin).
proof_step(2, 448, '<'(0, 37), builtin).
proof_step(2, 449, '>='(37, 0), builtin).
proof_step(2, 450, '=<'(37, 100), builtin).
proof_step(2, 451, is(37, min(37, '-'(100, 37))), builtin).
proof_step(2, 452, '>='(63, 0), builtin).
proof_step(2, 453, '=<'(63, 100), builtin).
proof_step(2, 454, is(37, min(63, '-'(100, 63))), builtin).
proof_step(2, 455, is(63, '-'(100, 37)), builtin).
proof_step(2, 456, choose_step(24, 7, 6, 134596, 346104), rule(5, [2, 3, 4, 5, 1])).
proof_step(
    2,
    457,
    choose_step(24, 12, 11, 2496144, 2704156),
    rule(5, [37, 38, 39, 40, 33])
).
proof_step(
    2,
    458,
    choose_step(
        100,
        50,
        49,
        98913082887808032681188722800,
        100891344545564193334812497256
    ),
    rule(5, [69, 70, 71, 72, 68])
).
proof_step(2, 459, between(0, 12, 0), rule(1, [260])).
proof_step(2, 460, between(1, 12, 1), rule(1, [261])).
proof_step(2, 461, between(2, 12, 2), rule(1, [262])).
proof_step(2, 462, between(3, 12, 3), rule(1, [263])).
proof_step(2, 463, between(4, 12, 4), rule(1, [264])).
proof_step(2, 464, between(5, 12, 5), rule(1, [265])).
proof_step(2, 465, between(6, 12, 6), rule(1, [266])).
proof_step(2, 466, between(7, 12, 7), rule(1, [267])).
proof_step(2, 467, between(8, 12, 8), rule(1, [268])).
proof_step(2, 468, between(9, 12, 9), rule(1, [269])).
proof_step(2, 469, between(10, 12, 10), rule(1, [270])).
proof_step(2, 470, between(11, 12, 11), rule(1, [271])).
proof_step(2, 471, between(12, 12, 12), rule(1, [272])).
proof_step(
    2,
    472,
    choose_step(22, 8, 7, 170544, 319770),
    rule(5, [274, 55, 275, 276, 273])
).
proof_step(2, 473, choose(12, 0, 1), rule(3, [302, 260, 303, 301])).
proof_step(2, 474, choose(12, 12, 1), rule(3, [65, 272, 304, 301])).
proof_step(2, 475, choose_step(12, 1, 0, 1, 12), rule(5, [306, 27, 307, 308, 305])).
proof_step(2, 476, choose_step(12, 2, 1, 12, 66), rule(5, [314, 23, 315, 316, 313])).
proof_step(2, 477, choose_step(12, 3, 2, 66, 220), rule(5, [323, 19, 324, 325, 318])).
proof_step(2, 478, choose_step(12, 4, 3, 220, 495), rule(5, [329, 15, 330, 331, 327])).
proof_step(2, 479, choose_step(12, 5, 4, 495, 792), rule(5, [339, 11, 340, 341, 337])).
proof_step(2, 480, choose_step(12, 6, 5, 792, 924), rule(5, [349, 7, 350, 351, 347])).
proof_step(2, 481, between(0, 8, 0), rule(1, [364])).
proof_step(2, 482, between(1, 8, 1), rule(1, [365])).
proof_step(2, 483, between(2, 8, 2), rule(1, [366])).
proof_step(2, 484, between(3, 8, 3), rule(1, [367])).
proof_step(2, 485, between(4, 8, 4), rule(1, [368])).
proof_step(2, 486, between(5, 8, 5), rule(1, [369])).
proof_step(2, 487, between(6, 8, 6), rule(1, [370])).
proof_step(2, 488, between(7, 8, 7), rule(1, [371])).
proof_step(2, 489, between(8, 8, 8), rule(1, [372])).
proof_step(2, 490, choose(10, 0, 1), rule(3, [302, 374, 375, 373])).
proof_step(2, 491, choose_step(10, 1, 0, 1, 10), rule(5, [306, 27, 377, 378, 376])).
proof_step(2, 492, choose_step(10, 2, 1, 10, 45), rule(5, [314, 23, 382, 383, 381])).
proof_step(2, 493, choose_step(10, 3, 2, 45, 120), rule(5, [323, 19, 389, 390, 384])).
proof_step(2, 494, choose_step(10, 4, 3, 120, 210), rule(5, [329, 15, 392, 393, 391])).
proof_step(2, 495, choose_step(10, 5, 4, 210, 252), rule(5, [339, 11, 399, 400, 398])).
proof_step(2, 496, choose(0, 0, 1), rule(3, [302, 409, 410, 408])).
proof_step(
    2,
    497,
    choose_step(100, 37, 36, 1977204582144932989443770175, 3420029547493938143902737600),
    rule(5, [412, 122, 123, 124, 411])
).
proof_step(2, 498, choose_step(24, 7, 5, 42504, 346104), rule(5, [6, 7, 8, 9, 456])).
proof_step(
    2,
    499,
    choose_step(24, 12, 10, 1961256, 2704156),
    rule(5, [42, 43, 44, 45, 457])
).
proof_step(
    2,
    500,
    choose_step(
        100,
        50,
        48,
        93206558875049876949581681100,
        100891344545564193334812497256
    ),
    rule(5, [73, 74, 75, 76, 458])
).
proof_step(2, 501, between(0, 12, 1), rule(2, [64, 27, 460])).
proof_step(2, 502, between(1, 12, 2), rule(2, [63, 23, 461])).
proof_step(2, 503, between(2, 12, 3), rule(2, [62, 19, 462])).
proof_step(2, 504, between(3, 12, 4), rule(2, [61, 15, 463])).
proof_step(2, 505, between(4, 12, 5), rule(2, [60, 11, 464])).
proof_step(2, 506, between(5, 12, 6), rule(2, [59, 7, 465])).
proof_step(2, 507, between(6, 12, 7), rule(2, [58, 3, 466])).
proof_step(2, 508, between(7, 12, 8), rule(2, [54, 55, 467])).
proof_step(2, 509, between(8, 12, 9), rule(2, [50, 51, 468])).
proof_step(2, 510, between(9, 12, 10), rule(2, [46, 47, 469])).
proof_step(2, 511, between(10, 12, 11), rule(2, [42, 43, 470])).
proof_step(2, 512, between(11, 12, 12), rule(2, [37, 38, 471])).
proof_step(
    2,
    513,
    choose_step(22, 8, 6, 74613, 319770),
    rule(5, [277, 3, 278, 279, 472])
).
proof_step(2, 514, choose(12, 1, 12), rule(3, [309, 261, 310, 475])).
proof_step(2, 515, choose(12, 11, 12), rule(3, [311, 271, 312, 475])).
proof_step(2, 516, choose_step(12, 2, 0, 1, 66), rule(5, [317, 27, 307, 308, 476])).
proof_step(2, 517, choose_step(12, 3, 1, 12, 220), rule(5, [326, 23, 315, 316, 477])).
proof_step(2, 518, choose_step(12, 4, 2, 66, 495), rule(5, [336, 19, 324, 325, 478])).
proof_step(2, 519, choose_step(12, 5, 3, 220, 792), rule(5, [343, 15, 330, 331, 479])).
proof_step(2, 520, choose_step(12, 6, 4, 495, 924), rule(5, [353, 11, 340, 341, 480])).
proof_step(2, 521, between(0, 8, 1), rule(2, [295, 27, 482])).
proof_step(2, 522, between(1, 8, 2), rule(2, [292, 23, 483])).
proof_step(2, 523, between(2, 8, 3), rule(2, [289, 19, 484])).
proof_step(2, 524, between(3, 8, 4), rule(2, [286, 15, 485])).
proof_step(2, 525, between(4, 8, 5), rule(2, [283, 11, 486])).
proof_step(2, 526, between(5, 8, 6), rule(2, [280, 7, 487])).
proof_step(2, 527, between(6, 8, 7), rule(2, [277, 3, 488])).
proof_step(2, 528, between(7, 8, 8), rule(2, [274, 55, 489])).
proof_step(2, 529, choose(10, 1, 10), rule(3, [309, 379, 380, 491])).
proof_step(2, 530, choose_step(10, 2, 0, 1, 45), rule(5, [317, 27, 377, 378, 492])).
proof_step(2, 531, choose_step(10, 3, 1, 10, 120), rule(5, [326, 23, 382, 383, 493])).
proof_step(2, 532, choose_step(10, 4, 2, 45, 210), rule(5, [336, 19, 389, 390, 494])).
proof_step(2, 533, choose_step(10, 5, 3, 120, 252), rule(5, [343, 15, 392, 393, 495])).
proof_step(
    2,
    534,
    choose_step(100, 37, 35, 1095067153187962886461165020, 3420029547493938143902737600),
    rule(5, [413, 126, 127, 128, 497])
).
proof_step(2, 535, choose_step(24, 7, 4, 10626, 346104), rule(5, [10, 11, 12, 13, 498])).
proof_step(
    2,
    536,
    choose_step(24, 12, 9, 1307504, 2704156),
    rule(5, [46, 47, 48, 49, 499])
).
proof_step(
    2,
    537,
    choose_step(
        100,
        50,
        47,
        84413487283064039501507937600,
        100891344545564193334812497256
    ),
    rule(5, [77, 78, 79, 80, 500])
).
proof_step(2, 538, between(0, 12, 2), rule(2, [64, 27, 502])).
proof_step(2, 539, between(1, 12, 3), rule(2, [63, 23, 503])).
proof_step(2, 540, between(2, 12, 4), rule(2, [62, 19, 504])).
proof_step(2, 541, between(3, 12, 5), rule(2, [61, 15, 505])).
proof_step(2, 542, between(4, 12, 6), rule(2, [60, 11, 506])).
proof_step(2, 543, between(5, 12, 7), rule(2, [59, 7, 507])).
proof_step(2, 544, between(6, 12, 8), rule(2, [58, 3, 508])).
proof_step(2, 545, between(7, 12, 9), rule(2, [54, 55, 509])).
proof_step(2, 546, between(8, 12, 10), rule(2, [50, 51, 510])).
proof_step(2, 547, between(9, 12, 11), rule(2, [46, 47, 511])).
proof_step(2, 548, between(10, 12, 12), rule(2, [42, 43, 512])).
proof_step(
    2,
    549,
    choose_step(22, 8, 5, 26334, 319770),
    rule(5, [280, 7, 281, 282, 513])
).
proof_step(2, 550, choose(12, 2, 66), rule(3, [319, 262, 320, 516])).
proof_step(2, 551, choose(12, 10, 66), rule(3, [321, 270, 322, 516])).
proof_step(2, 552, choose_step(12, 3, 0, 1, 220), rule(5, [328, 27, 307, 308, 517])).
proof_step(2, 553, choose_step(12, 4, 1, 12, 495), rule(5, [338, 23, 315, 316, 518])).
proof_step(2, 554, choose_step(12, 5, 2, 66, 792), rule(5, [348, 19, 324, 325, 519])).
proof_step(2, 555, choose_step(12, 6, 3, 220, 924), rule(5, [355, 15, 330, 331, 520])).
proof_step(2, 556, between(0, 8, 2), rule(2, [295, 27, 522])).
proof_step(2, 557, between(1, 8, 3), rule(2, [292, 23, 523])).
proof_step(2, 558, between(2, 8, 4), rule(2, [289, 19, 524])).
proof_step(2, 559, between(3, 8, 5), rule(2, [286, 15, 525])).
proof_step(2, 560, between(4, 8, 6), rule(2, [283, 11, 526])).
proof_step(2, 561, between(5, 8, 7), rule(2, [280, 7, 527])).
proof_step(2, 562, between(6, 8, 8), rule(2, [277, 3, 528])).
proof_step(2, 563, choose(10, 8, 45), rule(3, [298, 385, 386, 530])).
proof_step(2, 564, choose(10, 2, 45), rule(3, [319, 387, 388, 530])).
proof_step(2, 565, choose_step(10, 3, 0, 1, 120), rule(5, [328, 27, 377, 378, 531])).
proof_step(2, 566, choose_step(10, 4, 1, 10, 210), rule(5, [338, 23, 382, 383, 532])).
proof_step(2, 567, choose_step(10, 5, 2, 45, 252), rule(5, [348, 19, 389, 390, 533])).
proof_step(
    2,
    568,
    choose_step(100, 37, 34, 580717429720889409486981450, 3420029547493938143902737600),
    rule(5, [414, 130, 131, 132, 534])
).
proof_step(2, 569, choose_step(24, 7, 3, 2024, 346104), rule(5, [14, 15, 16, 17, 535])).
proof_step(
    2,
    570,
    choose_step(24, 12, 8, 735471, 2704156),
    rule(5, [50, 51, 52, 53, 536])
).
proof_step(
    2,
    571,
    choose_step(
        100,
        50,
        46,
        73470998190814997343905056800,
        100891344545564193334812497256
    ),
    rule(5, [81, 82, 83, 84, 537])
).
proof_step(2, 572, between(0, 12, 3), rule(2, [64, 27, 539])).
proof_step(2, 573, between(1, 12, 4), rule(2, [63, 23, 540])).
proof_step(2, 574, between(2, 12, 5), rule(2, [62, 19, 541])).
proof_step(2, 575, between(3, 12, 6), rule(2, [61, 15, 542])).
proof_step(2, 576, between(4, 12, 7), rule(2, [60, 11, 543])).
proof_step(2, 577, between(5, 12, 8), rule(2, [59, 7, 544])).
proof_step(2, 578, between(6, 12, 9), rule(2, [58, 3, 545])).
proof_step(2, 579, between(7, 12, 10), rule(2, [54, 55, 546])).
proof_step(2, 580, between(8, 12, 11), rule(2, [50, 51, 547])).
proof_step(2, 581, between(9, 12, 12), rule(2, [46, 47, 548])).
proof_step(
    2,
    582,
    choose_step(22, 8, 4, 7315, 319770),
    rule(5, [283, 11, 284, 285, 549])
).
proof_step(2, 583, choose(12, 3, 220), rule(3, [332, 263, 333, 552])).
proof_step(2, 584, choose(12, 9, 220), rule(3, [334, 269, 335, 552])).
proof_step(2, 585, choose_step(12, 4, 0, 1, 495), rule(5, [342, 27, 307, 308, 553])).
proof_step(2, 586, choose_step(12, 5, 1, 12, 792), rule(5, [352, 23, 315, 316, 554])).
proof_step(2, 587, choose_step(12, 6, 2, 66, 924), rule(5, [359, 19, 324, 325, 555])).
proof_step(2, 588, between(0, 8, 3), rule(2, [295, 27, 557])).
proof_step(2, 589, between(1, 8, 4), rule(2, [292, 23, 558])).
proof_step(2, 590, between(2, 8, 5), rule(2, [289, 19, 559])).
proof_step(2, 591, between(3, 8, 6), rule(2, [286, 15, 560])).
proof_step(2, 592, between(4, 8, 7), rule(2, [283, 11, 561])).
proof_step(2, 593, between(5, 8, 8), rule(2, [280, 7, 562])).
proof_step(2, 594, choose(10, 7, 120), rule(3, [30, 394, 395, 565])).
proof_step(2, 595, choose(10, 3, 120), rule(3, [332, 396, 397, 565])).
proof_step(2, 596, choose_step(10, 4, 0, 1, 210), rule(5, [342, 27, 377, 378, 566])).
proof_step(2, 597, choose_step(10, 5, 1, 10, 252), rule(5, [352, 23, 382, 383, 567])).
proof_step(
    2,
    598,
    choose_step(100, 37, 33, 294692427022540894366527900, 3420029547493938143902737600),
    rule(5, [415, 134, 135, 136, 568])
).
proof_step(2, 599, choose_step(24, 7, 2, 276, 346104), rule(5, [18, 19, 20, 21, 569])).
proof_step(
    2,
    600,
    choose_step(24, 12, 7, 346104, 2704156),
    rule(5, [54, 55, 56, 57, 570])
).
proof_step(
    2,
    601,
    choose_step(
        100,
        50,
        45,
        61448471214136179596720592960,
        100891344545564193334812497256
    ),
    rule(5, [85, 86, 87, 88, 571])
).
proof_step(2, 602, between(0, 12, 4), rule(2, [64, 27, 573])).
proof_step(2, 603, between(1, 12, 5), rule(2, [63, 23, 574])).
proof_step(2, 604, between(2, 12, 6), rule(2, [62, 19, 575])).
proof_step(2, 605, between(3, 12, 7), rule(2, [61, 15, 576])).
proof_step(2, 606, between(4, 12, 8), rule(2, [60, 11, 577])).
proof_step(2, 607, between(5, 12, 9), rule(2, [59, 7, 578])).
proof_step(2, 608, between(6, 12, 10), rule(2, [58, 3, 579])).
proof_step(2, 609, between(7, 12, 11), rule(2, [54, 55, 580])).
proof_step(2, 610, between(8, 12, 12), rule(2, [50, 51, 581])).
proof_step(
    2,
    611,
    choose_step(22, 8, 3, 1540, 319770),
    rule(5, [286, 15, 287, 288, 582])
).
proof_step(2, 612, choose(12, 4, 495), rule(3, [344, 264, 345, 585])).
proof_step(2, 613, choose(12, 8, 495), rule(3, [298, 268, 346, 585])).
proof_step(2, 614, choose_step(12, 5, 0, 1, 792), rule(5, [354, 27, 307, 308, 586])).
proof_step(2, 615, choose_step(12, 6, 1, 12, 924), rule(5, [360, 23, 315, 316, 587])).
proof_step(2, 616, between(0, 8, 4), rule(2, [295, 27, 589])).
proof_step(2, 617, between(1, 8, 5), rule(2, [292, 23, 590])).
proof_step(2, 618, between(2, 8, 6), rule(2, [289, 19, 591])).
proof_step(2, 619, between(3, 8, 7), rule(2, [286, 15, 592])).
proof_step(2, 620, between(4, 8, 8), rule(2, [283, 11, 593])).
proof_step(2, 621, choose(10, 6, 210), rule(3, [362, 401, 402, 596])).
proof_step(2, 622, choose(10, 4, 210), rule(3, [344, 403, 404, 596])).
proof_step(2, 623, choose_step(10, 5, 0, 1, 252), rule(5, [354, 27, 377, 378, 597])).
proof_step(
    2,
    624,
    choose_step(100, 37, 32, 143012501349174257560226775, 3420029547493938143902737600),
    rule(5, [416, 138, 139, 140, 598])
).
proof_step(2, 625, choose_step(24, 7, 1, 24, 346104), rule(5, [22, 23, 24, 25, 599])).
proof_step(2, 626, choose_step(24, 12, 6, 134596, 2704156), rule(5, [58, 3, 4, 5, 600])).
proof_step(
    2,
    627,
    choose_step(
        100,
        50,
        44,
        49378235797073715747364762200,
        100891344545564193334812497256
    ),
    rule(5, [89, 90, 91, 92, 601])
).
proof_step(2, 628, between(0, 12, 5), rule(2, [64, 27, 603])).
proof_step(2, 629, between(1, 12, 6), rule(2, [63, 23, 604])).
proof_step(2, 630, between(2, 12, 7), rule(2, [62, 19, 605])).
proof_step(2, 631, between(3, 12, 8), rule(2, [61, 15, 606])).
proof_step(2, 632, between(4, 12, 9), rule(2, [60, 11, 607])).
proof_step(2, 633, between(5, 12, 10), rule(2, [59, 7, 608])).
proof_step(2, 634, between(6, 12, 11), rule(2, [58, 3, 609])).
proof_step(2, 635, between(7, 12, 12), rule(2, [54, 55, 610])).
proof_step(
    2,
    636,
    choose_step(22, 8, 2, 231, 319770),
    rule(5, [289, 19, 290, 291, 611])
).
proof_step(2, 637, choose(12, 5, 792), rule(3, [356, 265, 357, 614])).
proof_step(2, 638, choose(12, 7, 792), rule(3, [30, 267, 358, 614])).
proof_step(2, 639, choose_step(12, 6, 0, 1, 924), rule(5, [361, 27, 307, 308, 615])).
proof_step(2, 640, between(0, 8, 5), rule(2, [295, 27, 617])).
proof_step(2, 641, between(1, 8, 6), rule(2, [292, 23, 618])).
proof_step(2, 642, between(2, 8, 7), rule(2, [289, 19, 619])).
proof_step(2, 643, between(3, 8, 8), rule(2, [286, 15, 620])).
proof_step(2, 644, choose(10, 5, 252), rule(3, [356, 405, 406, 623])).
proof_step(
    2,
    645,
    choose_step(100, 37, 31, 66324638306863423796047200, 3420029547493938143902737600),
    rule(5, [417, 142, 143, 144, 624])
).
proof_step(2, 646, choose_step(24, 7, 0, 1, 346104), rule(5, [26, 27, 28, 29, 625])).
proof_step(2, 647, choose_step(24, 12, 5, 42504, 2704156), rule(5, [59, 7, 8, 9, 626])).
proof_step(
    2,
    648,
    choose_step(
        100,
        50,
        43,
        38116532895986727945334202400,
        100891344545564193334812497256
    ),
    rule(5, [93, 94, 95, 96, 627])
).
proof_step(2, 649, between(0, 12, 6), rule(2, [64, 27, 629])).
proof_step(2, 650, between(1, 12, 7), rule(2, [63, 23, 630])).
proof_step(2, 651, between(2, 12, 8), rule(2, [62, 19, 631])).
proof_step(2, 652, between(3, 12, 9), rule(2, [61, 15, 632])).
proof_step(2, 653, between(4, 12, 10), rule(2, [60, 11, 633])).
proof_step(2, 654, between(5, 12, 11), rule(2, [59, 7, 634])).
proof_step(2, 655, between(6, 12, 12), rule(2, [58, 3, 635])).
proof_step(2, 656, choose_step(22, 8, 1, 22, 319770), rule(5, [292, 23, 293, 294, 636])).
proof_step(2, 657, choose(12, 6, 924), rule(3, [362, 266, 363, 639])).
proof_step(2, 658, between(0, 8, 6), rule(2, [295, 27, 641])).
proof_step(2, 659, between(1, 8, 7), rule(2, [292, 23, 642])).
proof_step(2, 660, between(2, 8, 8), rule(2, [289, 19, 643])).
proof_step(
    2,
    661,
    choose_step(100, 37, 30, 29372339821610944823963760, 3420029547493938143902737600),
    rule(5, [418, 146, 147, 148, 645])
).
proof_step(2, 662, choose(24, 7, 346104), rule(3, [30, 31, 32, 646])).
proof_step(2, 663, choose(24, 17, 346104), rule(3, [34, 35, 36, 646])).
proof_step(
    2,
    664,
    choose_step(24, 12, 4, 10626, 2704156),
    rule(5, [60, 11, 12, 13, 647])
).
proof_step(
    2,
    665,
    choose_step(
        100,
        50,
        42,
        28258808871162574166368460400,
        100891344545564193334812497256
    ),
    rule(5, [97, 98, 99, 100, 648])
).
proof_step(2, 666, between(0, 12, 7), rule(2, [64, 27, 650])).
proof_step(2, 667, between(1, 12, 8), rule(2, [63, 23, 651])).
proof_step(2, 668, between(2, 12, 9), rule(2, [62, 19, 652])).
proof_step(2, 669, between(3, 12, 10), rule(2, [61, 15, 653])).
proof_step(2, 670, between(4, 12, 11), rule(2, [60, 11, 654])).
proof_step(2, 671, between(5, 12, 12), rule(2, [59, 7, 655])).
proof_step(2, 672, choose_step(22, 8, 0, 1, 319770), rule(5, [295, 27, 296, 297, 656])).
proof_step(2, 673, between(0, 8, 7), rule(2, [295, 27, 659])).
proof_step(2, 674, between(1, 8, 8), rule(2, [292, 23, 660])).
proof_step(
    2,
    675,
    choose_step(100, 37, 29, 12410847811948286545336800, 3420029547493938143902737600),
    rule(5, [419, 150, 151, 152, 661])
).
proof_step(2, 676, symmetric(24, 7), rule(6, [662, 41, 663])).
proof_step(
    2,
    677,
    choose_step(24, 12, 3, 2024, 2704156),
    rule(5, [61, 15, 16, 17, 664])
).
proof_step(
    2,
    678,
    choose_step(
        100,
        50,
        41,
        20116440213369968050635175200,
        100891344545564193334812497256
    ),
    rule(5, [101, 102, 103, 104, 665])
).
proof_step(2, 679, between(0, 12, 8), rule(2, [64, 27, 667])).
proof_step(2, 680, between(1, 12, 9), rule(2, [63, 23, 668])).
proof_step(2, 681, between(2, 12, 10), rule(2, [62, 19, 669])).
proof_step(2, 682, between(3, 12, 11), rule(2, [61, 15, 670])).
proof_step(2, 683, between(4, 12, 12), rule(2, [60, 11, 671])).
proof_step(2, 684, choose(22, 8, 319770), rule(3, [298, 299, 300, 672])).
proof_step(2, 685, between(0, 8, 8), rule(2, [295, 27, 674])).
proof_step(
    2,
    686,
    choose_step(100, 37, 28, 4998813702034726525205100, 3420029547493938143902737600),
    rule(5, [420, 154, 155, 156, 675])
).
proof_step(2, 687, binomial_answer(symmetry_24_7, true), rule(11, [676])).
proof_step(2, 688, choose_step(24, 12, 2, 276, 2704156), rule(5, [62, 19, 20, 21, 677])).
proof_step(
    2,
    689,
    choose_step(
        100,
        50,
        40,
        13746234145802811501267369720,
        100891344545564193334812497256
    ),
    rule(5, [105, 106, 107, 108, 678])
).
proof_step(2, 690, between(0, 12, 9), rule(2, [64, 27, 680])).
proof_step(2, 691, between(1, 12, 10), rule(2, [63, 23, 681])).
proof_step(2, 692, between(2, 12, 11), rule(2, [62, 19, 682])).
proof_step(2, 693, between(3, 12, 12), rule(2, [61, 15, 683])).
proof_step(
    2,
    694,
    choose_step(100, 37, 27, 1917353200780443050763600, 3420029547493938143902737600),
    rule(5, [421, 158, 159, 160, 686])
).
proof_step(2, 695, choose_step(24, 12, 1, 24, 2704156), rule(5, [63, 23, 24, 25, 688])).
proof_step(
    2,
    696,
    choose_step(
        100,
        50,
        39,
        9013924030034630492634340800,
        100891344545564193334812497256
    ),
    rule(5, [109, 110, 111, 112, 689])
).
proof_step(2, 697, between(0, 12, 10), rule(2, [64, 27, 691])).
proof_step(2, 698, between(1, 12, 11), rule(2, [63, 23, 692])).
proof_step(2, 699, between(2, 12, 12), rule(2, [62, 19, 693])).
proof_step(
    2,
    700,
    choose_step(100, 37, 26, 699574816500972464467800, 3420029547493938143902737600),
    rule(5, [422, 162, 163, 164, 694])
).
proof_step(2, 701, choose_step(24, 12, 0, 1, 2704156), rule(5, [64, 27, 28, 29, 695])).
proof_step(
    2,
    702,
    choose_step(
        100,
        50,
        38,
        5670048986634686922786117600,
        100891344545564193334812497256
    ),
    rule(5, [113, 114, 115, 116, 696])
).
proof_step(2, 703, between(0, 12, 11), rule(2, [64, 27, 698])).
proof_step(2, 704, between(1, 12, 12), rule(2, [63, 23, 699])).
proof_step(
    2,
    705,
    choose_step(100, 37, 25, 242519269720337121015504, 3420029547493938143902737600),
    rule(5, [423, 166, 167, 168, 700])
).
proof_step(2, 706, choose(24, 12, 2704156), rule(3, [65, 66, 67, 701])).
proof_step(
    2,
    707,
    choose_step(
        100,
        50,
        37,
        3420029547493938143902737600,
        100891344545564193334812497256
    ),
    rule(5, [117, 118, 119, 120, 702])
).
proof_step(2, 708, between(0, 12, 12), rule(2, [64, 27, 704])).
proof_step(
    2,
    709,
    choose_step(100, 37, 24, 79776075565900368755100, 3420029547493938143902737600),
    rule(5, [424, 170, 171, 172, 705])
).
proof_step(2, 710, binomial_answer(choose_24_12, 2704156), rule(9, [706])).
proof_step(
    2,
    711,
    choose_step(
        100,
        50,
        36,
        1977204582144932989443770175,
        100891344545564193334812497256
    ),
    rule(5, [121, 122, 123, 124, 707])
).
proof_step(
    2,
    712,
    choose_step(100, 37, 23, 24865270306254660391200, 3420029547493938143902737600),
    rule(5, [425, 174, 175, 176, 709])
).
proof_step(
    2,
    713,
    choose_step(
        100,
        50,
        35,
        1095067153187962886461165020,
        100891344545564193334812497256
    ),
    rule(5, [125, 126, 127, 128, 711])
).
proof_step(
    2,
    714,
    choose_step(100, 37, 22, 7332066885177656269200, 3420029547493938143902737600),
    rule(5, [426, 178, 179, 180, 712])
).
proof_step(
    2,
    715,
    choose_step(
        100,
        50,
        34,
        580717429720889409486981450,
        100891344545564193334812497256
    ),
    rule(5, [129, 130, 131, 132, 713])
).
proof_step(
    2,
    716,
    choose_step(100, 37, 21, 2041841411062132125600, 3420029547493938143902737600),
    rule(5, [427, 182, 183, 184, 714])
).
proof_step(
    2,
    717,
    choose_step(
        100,
        50,
        33,
        294692427022540894366527900,
        100891344545564193334812497256
    ),
    rule(5, [133, 134, 135, 136, 715])
).
proof_step(
    2,
    718,
    choose_step(100, 37, 20, 535983370403809682970, 3420029547493938143902737600),
    rule(5, [428, 186, 187, 188, 716])
).
proof_step(
    2,
    719,
    choose_step(
        100,
        50,
        32,
        143012501349174257560226775,
        100891344545564193334812497256
    ),
    rule(5, [137, 138, 139, 140, 717])
).
proof_step(
    2,
    720,
    choose_step(100, 37, 19, 132341572939212267400, 3420029547493938143902737600),
    rule(5, [429, 190, 191, 192, 718])
).
proof_step(
    2,
    721,
    choose_step(100, 50, 31, 66324638306863423796047200, 100891344545564193334812497256),
    rule(5, [141, 142, 143, 144, 719])
).
proof_step(
    2,
    722,
    choose_step(100, 37, 18, 30664510802988208300, 3420029547493938143902737600),
    rule(5, [430, 194, 195, 196, 720])
).
proof_step(
    2,
    723,
    choose_step(100, 50, 30, 29372339821610944823963760, 100891344545564193334812497256),
    rule(5, [145, 146, 147, 148, 721])
).
proof_step(
    2,
    724,
    choose_step(100, 37, 17, 6650134872937201800, 3420029547493938143902737600),
    rule(5, [431, 198, 199, 200, 722])
).
proof_step(
    2,
    725,
    choose_step(100, 50, 29, 12410847811948286545336800, 100891344545564193334812497256),
    rule(5, [149, 150, 151, 152, 723])
).
proof_step(
    2,
    726,
    choose_step(100, 37, 16, 1345860629046814650, 3420029547493938143902737600),
    rule(5, [432, 202, 203, 204, 724])
).
proof_step(
    2,
    727,
    choose_step(100, 50, 28, 4998813702034726525205100, 100891344545564193334812497256),
    rule(5, [153, 154, 155, 156, 725])
).
proof_step(
    2,
    728,
    choose_step(100, 37, 15, 253338471349988640, 3420029547493938143902737600),
    rule(5, [433, 206, 207, 208, 726])
).
proof_step(
    2,
    729,
    choose_step(100, 50, 27, 1917353200780443050763600, 100891344545564193334812497256),
    rule(5, [157, 158, 159, 160, 727])
).
proof_step(
    2,
    730,
    choose_step(100, 37, 14, 44186942677323600, 3420029547493938143902737600),
    rule(5, [434, 210, 211, 212, 728])
).
proof_step(
    2,
    731,
    choose_step(100, 50, 26, 699574816500972464467800, 100891344545564193334812497256),
    rule(5, [161, 162, 163, 164, 729])
).
proof_step(
    2,
    732,
    choose_step(100, 37, 13, 7110542499799200, 3420029547493938143902737600),
    rule(5, [435, 214, 215, 216, 730])
).
proof_step(
    2,
    733,
    choose_step(100, 50, 25, 242519269720337121015504, 100891344545564193334812497256),
    rule(5, [165, 166, 167, 168, 731])
).
proof_step(
    2,
    734,
    choose_step(100, 37, 12, 1050421051106700, 3420029547493938143902737600),
    rule(5, [436, 218, 219, 220, 732])
).
proof_step(
    2,
    735,
    choose_step(100, 50, 24, 79776075565900368755100, 100891344545564193334812497256),
    rule(5, [169, 170, 171, 172, 733])
).
proof_step(
    2,
    736,
    choose_step(100, 37, 11, 141629804643600, 3420029547493938143902737600),
    rule(5, [437, 38, 222, 223, 734])
).
proof_step(
    2,
    737,
    choose_step(100, 50, 23, 24865270306254660391200, 100891344545564193334812497256),
    rule(5, [173, 174, 175, 176, 735])
).
proof_step(
    2,
    738,
    choose_step(100, 37, 10, 17310309456440, 3420029547493938143902737600),
    rule(5, [438, 43, 225, 226, 736])
).
proof_step(
    2,
    739,
    choose_step(100, 50, 22, 7332066885177656269200, 100891344545564193334812497256),
    rule(5, [177, 178, 179, 180, 737])
).
proof_step(
    2,
    740,
    choose_step(100, 37, 9, 1902231808400, 3420029547493938143902737600),
    rule(5, [439, 47, 228, 229, 738])
).
proof_step(
    2,
    741,
    choose_step(100, 50, 21, 2041841411062132125600, 100891344545564193334812497256),
    rule(5, [181, 182, 183, 184, 739])
).
proof_step(
    2,
    742,
    choose_step(100, 37, 8, 186087894300, 3420029547493938143902737600),
    rule(5, [440, 51, 231, 232, 740])
).
proof_step(
    2,
    743,
    choose_step(100, 50, 20, 535983370403809682970, 100891344545564193334812497256),
    rule(5, [185, 186, 187, 188, 741])
).
proof_step(
    2,
    744,
    choose_step(100, 37, 7, 16007560800, 3420029547493938143902737600),
    rule(5, [441, 55, 234, 235, 742])
).
proof_step(
    2,
    745,
    choose_step(100, 50, 19, 132341572939212267400, 100891344545564193334812497256),
    rule(5, [189, 190, 191, 192, 743])
).
proof_step(
    2,
    746,
    choose_step(100, 37, 6, 1192052400, 3420029547493938143902737600),
    rule(5, [442, 3, 237, 238, 744])
).
proof_step(
    2,
    747,
    choose_step(100, 50, 18, 30664510802988208300, 100891344545564193334812497256),
    rule(5, [193, 194, 195, 196, 745])
).
proof_step(
    2,
    748,
    choose_step(100, 37, 5, 75287520, 3420029547493938143902737600),
    rule(5, [443, 7, 240, 241, 746])
).
proof_step(
    2,
    749,
    choose_step(100, 50, 17, 6650134872937201800, 100891344545564193334812497256),
    rule(5, [197, 198, 199, 200, 747])
).
proof_step(
    2,
    750,
    choose_step(100, 37, 4, 3921225, 3420029547493938143902737600),
    rule(5, [444, 11, 243, 244, 748])
).
proof_step(
    2,
    751,
    choose_step(100, 50, 16, 1345860629046814650, 100891344545564193334812497256),
    rule(5, [201, 202, 203, 204, 749])
).
proof_step(
    2,
    752,
    choose_step(100, 37, 3, 161700, 3420029547493938143902737600),
    rule(5, [445, 15, 246, 247, 750])
).
proof_step(
    2,
    753,
    choose_step(100, 50, 15, 253338471349988640, 100891344545564193334812497256),
    rule(5, [205, 206, 207, 208, 751])
).
proof_step(
    2,
    754,
    choose_step(100, 37, 2, 4950, 3420029547493938143902737600),
    rule(5, [446, 19, 249, 250, 752])
).
proof_step(
    2,
    755,
    choose_step(100, 50, 14, 44186942677323600, 100891344545564193334812497256),
    rule(5, [209, 210, 211, 212, 753])
).
proof_step(
    2,
    756,
    choose_step(100, 37, 1, 100, 3420029547493938143902737600),
    rule(5, [447, 23, 252, 253, 754])
).
proof_step(
    2,
    757,
    choose_step(100, 50, 13, 7110542499799200, 100891344545564193334812497256),
    rule(5, [213, 214, 215, 216, 755])
).
proof_step(
    2,
    758,
    choose_step(100, 37, 0, 1, 3420029547493938143902737600),
    rule(5, [448, 27, 255, 256, 756])
).
proof_step(
    2,
    759,
    choose_step(100, 50, 12, 1050421051106700, 100891344545564193334812497256),
    rule(5, [217, 218, 219, 220, 757])
).
proof_step(
    2,
    760,
    choose(100, 37, 3420029547493938143902737600),
    rule(3, [449, 450, 451, 758])
).
proof_step(
    2,
    761,
    choose(100, 63, 3420029547493938143902737600),
    rule(3, [452, 453, 454, 758])
).
proof_step(
    2,
    762,
    choose_step(100, 50, 11, 141629804643600, 100891344545564193334812497256),
    rule(5, [221, 38, 222, 223, 759])
).
proof_step(2, 763, symmetric(100, 37), rule(6, [760, 455, 761])).
proof_step(
    2,
    764,
    choose_step(100, 50, 10, 17310309456440, 100891344545564193334812497256),
    rule(5, [224, 43, 225, 226, 762])
).
proof_step(
    2,
    765,
    choose_step(100, 50, 9, 1902231808400, 100891344545564193334812497256),
    rule(5, [227, 47, 228, 229, 764])
).
proof_step(
    2,
    766,
    choose_step(100, 50, 8, 186087894300, 100891344545564193334812497256),
    rule(5, [230, 51, 231, 232, 765])
).
proof_step(
    2,
    767,
    choose_step(100, 50, 7, 16007560800, 100891344545564193334812497256),
    rule(5, [233, 55, 234, 235, 766])
).
proof_step(
    2,
    768,
    choose_step(100, 50, 6, 1192052400, 100891344545564193334812497256),
    rule(5, [236, 3, 237, 238, 767])
).
proof_step(
    2,
    769,
    choose_step(100, 50, 5, 75287520, 100891344545564193334812497256),
    rule(5, [239, 7, 240, 241, 768])
).
proof_step(
    2,
    770,
    choose_step(100, 50, 4, 3921225, 100891344545564193334812497256),
    rule(5, [242, 11, 243, 244, 769])
).
proof_step(
    2,
    771,
    choose_step(100, 50, 3, 161700, 100891344545564193334812497256),
    rule(5, [245, 15, 246, 247, 770])
).
proof_step(
    2,
    772,
    choose_step(100, 50, 2, 4950, 100891344545564193334812497256),
    rule(5, [248, 19, 249, 250, 771])
).
proof_step(
    2,
    773,
    choose_step(100, 50, 1, 100, 100891344545564193334812497256),
    rule(5, [251, 23, 252, 253, 772])
).
proof_step(
    2,
    774,
    choose_step(100, 50, 0, 1, 100891344545564193334812497256),
    rule(5, [254, 27, 255, 256, 773])
).
proof_step(
    2,
    775,
    choose(100, 50, 100891344545564193334812497256),
    rule(3, [257, 258, 259, 774])
).
proof_step(
    2,
    776,
    binomial_answer(choose_100_50, 100891344545564193334812497256),
    rule(10, [775])
).
proof_step(
    2,
    777,
    '$aggregate:r7:1'([binding('M', 10), binding('N', 12), binding('R', 8)], 319770),
    aggregate(rule(7), 1, 1)
).
proof_step(2, 778, vandermonde_sum(12, 10, 8, 319770), rule(7, [777])).
proof_step(2, 779, vandermonde(12, 10, 8, 319770), rule(8, [407, 684, 778])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 1).
proof_boundary_steps(2, 1, 33, 33).
proof_boundary_steps(2, 1, 68, 68).
proof_boundary_steps(2, 1, 273, 273).
proof_boundary_steps(2, 1, 301, 301).
proof_boundary_steps(2, 1, 305, 305).
proof_boundary_steps(2, 1, 313, 313).
proof_boundary_steps(2, 1, 318, 318).
proof_boundary_steps(2, 1, 327, 327).
proof_boundary_steps(2, 1, 337, 337).
proof_boundary_steps(2, 1, 347, 347).
proof_boundary_steps(2, 1, 373, 373).
proof_boundary_steps(2, 1, 376, 376).
proof_boundary_steps(2, 1, 381, 381).
proof_boundary_steps(2, 1, 384, 384).
proof_boundary_steps(2, 1, 391, 391).
proof_boundary_steps(2, 1, 398, 398).
proof_boundary_steps(2, 1, 408, 408).
proof_boundary_steps(2, 1, 411, 411).
proof_boundary_steps(2, 1, 456, 776).
proof_boundary_call(2, 1, between(0, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(0, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(1, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(10, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(11, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(12, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(2, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(2, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(3, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(3, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(4, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(4, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(5, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(5, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(6, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(6, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(7, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(7, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(8, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(8, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, between(9, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(0, 0, 1)).
proof_boundary_call(2, 1, choose(10, 0, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 4, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 5, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 7, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(10, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(100, 37, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(100, 50, 100891344545564193334812497256)).
proof_boundary_call(2, 1, choose(100, 50, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(100, 63, 3420029547493938143902737600)).
proof_boundary_call(2, 1, choose(12, 0, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 11, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 2, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 3, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 4, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 5, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 6, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 7, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(12, 9, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(22, 8, 319770)).
proof_boundary_call(2, 1, choose(22, 8, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(24, 12, 2704156)).
proof_boundary_call(2, 1, choose(24, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(24, 17, 346104)).
proof_boundary_call(2, 1, choose(24, 7, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose(5, -1, 0)).
proof_boundary_call(2, 1, choose(5, 6, 0)).
proof_boundary_call(2, 1, choose_step(0, 0, 0, 1, 1)).
proof_boundary_call(2, 1, choose_step(10, 0, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 1, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 1, 1, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 2, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 2, 1, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 2, 2, 45, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 3, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 3, 1, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 3, 2, 45, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 3, 3, 120, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 4, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 4, 1, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 4, 2, 45, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 4, 3, 120, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 4, 4, 210, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 1, 10, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 2, 45, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 3, 120, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 4, 210, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(10, 5, 5, 252, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(100, 37, 0, 1, 3420029547493938143902737600)).
proof_boundary_call(2, 1, choose_step(100, 37, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(100, 37, 1, 100, 3420029547493938143902737600)).
proof_boundary_call(2, 1, choose_step(100, 37, 1, 100, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 10, 17310309456440, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 10, 17310309456440, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 11, 141629804643600, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 11, 141629804643600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 12, 1050421051106700, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 12, 1050421051106700, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 13, 7110542499799200, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 13, 7110542499799200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 14, 44186942677323600, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 14, 44186942677323600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 15, 253338471349988640, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 15, 253338471349988640, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 16, 1345860629046814650, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 16, 1345860629046814650, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 17, 6650134872937201800, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 17, 6650134872937201800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 18, 30664510802988208300, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 18, 30664510802988208300, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 19, 132341572939212267400, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 19, 132341572939212267400, variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, choose_step(100, 37, 2, 4950, 3420029547493938143902737600)).
proof_boundary_call(2, 1, choose_step(100, 37, 2, 4950, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 20, 535983370403809682970, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 20, 535983370403809682970, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 21, 2041841411062132125600, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 21, 2041841411062132125600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 22, 7332066885177656269200, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 22, 7332066885177656269200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 23, 24865270306254660391200, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 23, 24865270306254660391200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 24, 79776075565900368755100, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 24, 79776075565900368755100, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 25, 242519269720337121015504, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 25, 242519269720337121015504, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 26, 699574816500972464467800, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 26, 699574816500972464467800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 27, 1917353200780443050763600, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 27, 1917353200780443050763600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 28, 4998813702034726525205100, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 28, 4998813702034726525205100, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 29, 12410847811948286545336800, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 29, 12410847811948286545336800, variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, choose_step(100, 37, 3, 161700, 3420029547493938143902737600)).
proof_boundary_call(2, 1, choose_step(100, 37, 3, 161700, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 30, 29372339821610944823963760, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 30, 29372339821610944823963760, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 31, 66324638306863423796047200, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 31, 66324638306863423796047200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 32, 143012501349174257560226775, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 32, 143012501349174257560226775, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 33, 294692427022540894366527900, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 33, 294692427022540894366527900, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 34, 580717429720889409486981450, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 34, 580717429720889409486981450, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 35, 1095067153187962886461165020, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 35, 1095067153187962886461165020, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 36, 1977204582144932989443770175, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 36, 1977204582144932989443770175, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 37, 3420029547493938143902737600, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 37, 3420029547493938143902737600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 4, 3921225, 3420029547493938143902737600)
).
proof_boundary_call(2, 1, choose_step(100, 37, 4, 3921225, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 5, 75287520, 3420029547493938143902737600)
).
proof_boundary_call(2, 1, choose_step(100, 37, 5, 75287520, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 6, 1192052400, 3420029547493938143902737600)
).
proof_boundary_call(2, 1, choose_step(100, 37, 6, 1192052400, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 7, 16007560800, 3420029547493938143902737600)
).
proof_boundary_call(2, 1, choose_step(100, 37, 7, 16007560800, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 8, 186087894300, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 8, 186087894300, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 9, 1902231808400, 3420029547493938143902737600)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 37, 9, 1902231808400, variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, choose_step(100, 50, 0, 1, 100891344545564193334812497256)).
proof_boundary_call(2, 1, choose_step(100, 50, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(100, 50, 1, 100, 100891344545564193334812497256)).
proof_boundary_call(2, 1, choose_step(100, 50, 1, 100, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 10, 17310309456440, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 10, 17310309456440, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 11, 141629804643600, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 11, 141629804643600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 12, 1050421051106700, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 12, 1050421051106700, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 13, 7110542499799200, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 13, 7110542499799200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 14, 44186942677323600, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 14, 44186942677323600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 15, 253338471349988640, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 15, 253338471349988640, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 16, 1345860629046814650, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 16, 1345860629046814650, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 17, 6650134872937201800, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 17, 6650134872937201800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 18, 30664510802988208300, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 18, 30664510802988208300, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 19, 132341572939212267400, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 19, 132341572939212267400, variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, choose_step(100, 50, 2, 4950, 100891344545564193334812497256)).
proof_boundary_call(2, 1, choose_step(100, 50, 2, 4950, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 20, 535983370403809682970, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 20, 535983370403809682970, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 21, 2041841411062132125600, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 21, 2041841411062132125600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 22, 7332066885177656269200, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 22, 7332066885177656269200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 23, 24865270306254660391200, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 23, 24865270306254660391200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 24, 79776075565900368755100, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 24, 79776075565900368755100, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 25, 242519269720337121015504, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 25, 242519269720337121015504, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 26, 699574816500972464467800, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 26, 699574816500972464467800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 27, 1917353200780443050763600, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 27, 1917353200780443050763600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 28, 4998813702034726525205100, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 28, 4998813702034726525205100, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 29, 12410847811948286545336800, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 29, 12410847811948286545336800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 3, 161700, 100891344545564193334812497256)
).
proof_boundary_call(2, 1, choose_step(100, 50, 3, 161700, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 30, 29372339821610944823963760, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 30, 29372339821610944823963760, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 31, 66324638306863423796047200, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 31, 66324638306863423796047200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        32,
        143012501349174257560226775,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 32, 143012501349174257560226775, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        33,
        294692427022540894366527900,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 33, 294692427022540894366527900, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        34,
        580717429720889409486981450,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 34, 580717429720889409486981450, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        35,
        1095067153187962886461165020,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 35, 1095067153187962886461165020, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        36,
        1977204582144932989443770175,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 36, 1977204582144932989443770175, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        37,
        3420029547493938143902737600,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 37, 3420029547493938143902737600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        38,
        5670048986634686922786117600,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 38, 5670048986634686922786117600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        39,
        9013924030034630492634340800,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 39, 9013924030034630492634340800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 4, 3921225, 100891344545564193334812497256)
).
proof_boundary_call(2, 1, choose_step(100, 50, 4, 3921225, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        40,
        13746234145802811501267369720,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 40, 13746234145802811501267369720, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        41,
        20116440213369968050635175200,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 41, 20116440213369968050635175200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        42,
        28258808871162574166368460400,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 42, 28258808871162574166368460400, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        43,
        38116532895986727945334202400,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 43, 38116532895986727945334202400, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        44,
        49378235797073715747364762200,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 44, 49378235797073715747364762200, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        45,
        61448471214136179596720592960,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 45, 61448471214136179596720592960, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        46,
        73470998190814997343905056800,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 46, 73470998190814997343905056800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        47,
        84413487283064039501507937600,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 47, 84413487283064039501507937600, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        48,
        93206558875049876949581681100,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 48, 93206558875049876949581681100, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        49,
        98913082887808032681188722800,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 49, 98913082887808032681188722800, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 5, 75287520, 100891344545564193334812497256)
).
proof_boundary_call(2, 1, choose_step(100, 50, 5, 75287520, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(
        100,
        50,
        50,
        100891344545564193334812497256,
        100891344545564193334812497256
    )
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 50, 100891344545564193334812497256, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 6, 1192052400, 100891344545564193334812497256)
).
proof_boundary_call(2, 1, choose_step(100, 50, 6, 1192052400, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 7, 16007560800, 100891344545564193334812497256)
).
proof_boundary_call(2, 1, choose_step(100, 50, 7, 16007560800, variable("_EyeplCall0"))).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 8, 186087894300, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 8, 186087894300, variable("_EyeplCall0"))
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 9, 1902231808400, 100891344545564193334812497256)
).
proof_boundary_call(
    2,
    1,
    choose_step(100, 50, 9, 1902231808400, variable("_EyeplCall0"))
).
proof_boundary_call(2, 1, choose_step(12, 0, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 1, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 1, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 2, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 2, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 2, 2, 66, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 3, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 3, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 3, 2, 66, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 3, 3, 220, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 4, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 4, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 4, 2, 66, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 4, 3, 220, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 4, 4, 495, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 2, 66, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 3, 220, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 4, 495, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 5, 5, 792, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 1, 12, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 2, 66, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 3, 220, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 4, 495, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 5, 792, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(12, 6, 6, 924, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 0, 1, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 1, 22, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 1, 22, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 2, 231, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 2, 231, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 3, 1540, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 3, 1540, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 4, 7315, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 4, 7315, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 5, 26334, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 5, 26334, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 6, 74613, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 6, 74613, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 7, 170544, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 7, 170544, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(22, 8, 8, 319770, 319770)).
proof_boundary_call(2, 1, choose_step(22, 8, 8, 319770, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 0, 1, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 1, 24, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 1, 24, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 10, 1961256, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 10, 1961256, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 11, 2496144, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 11, 2496144, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 12, 2704156, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 12, 2704156, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 2, 276, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 2, 276, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 3, 2024, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 3, 2024, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 4, 10626, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 4, 10626, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 5, 42504, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 5, 42504, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 6, 134596, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 6, 134596, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 7, 346104, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 7, 346104, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 8, 735471, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 8, 735471, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 12, 9, 1307504, 2704156)).
proof_boundary_call(2, 1, choose_step(24, 12, 9, 1307504, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 0, 1, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 0, 1, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 1, 24, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 1, 24, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 2, 276, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 2, 276, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 3, 2024, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 3, 2024, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 4, 10626, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 4, 10626, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 5, 42504, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 5, 42504, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 6, 134596, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 6, 134596, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, choose_step(24, 7, 7, 346104, 346104)).
proof_boundary_call(2, 1, choose_step(24, 7, 7, 346104, variable("_EyeplCall0"))).
proof_boundary_call(2, 1, symmetric(100, 37)).
proof_boundary_call(2, 1, symmetric(24, 7)).
proof_claim(2, answer(2, [779])).

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
