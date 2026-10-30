% Answer 1
linear_result(kitchen, [mill, mix, bake], [bread]).

% Answer 2
linear_check(double_spend_rejected, yes).

% Answer 3
linear_result(kitchen, [mill, mix, bake], [bread]).

% Reason 3
proof_step(3, 1, initial(kitchen, [wheat, yeast, heat]), source(1)).
proof_step(3, 2, linear_rule(mill, [wheat], [flour]), source(3)).
proof_step(3, 3, linear_rule(mix, [flour, yeast], [dough]), source(4)).
proof_step(3, 4, linear_rule(bake, [dough, heat], [bread]), source(5)).
proof_step(3, 5, select(wheat, [wheat, yeast, heat], [yeast, heat]), rule(1, [])).
proof_step(3, 6, consume_all([], [yeast, heat], [yeast, heat]), rule(5, [])).
proof_step(3, 7, append([], [yeast, heat], [yeast, heat]), rule(3, [])).
proof_step(3, 8, select(flour, [flour, yeast, heat], [yeast, heat]), rule(1, [])).
proof_step(3, 9, select(yeast, [yeast, heat], [heat]), rule(1, [])).
proof_step(3, 10, consume_all([], [heat], [heat]), rule(5, [])).
proof_step(3, 11, append([], [heat], [heat]), rule(3, [])).
proof_step(3, 12, select(dough, [dough, heat], [heat]), rule(1, [])).
proof_step(3, 13, select(heat, [heat], []), rule(1, [])).
proof_step(3, 14, consume_all([], [], []), rule(5, [])).
proof_step(3, 15, append([], [], []), rule(3, [])).
proof_step(3, 16, run_linear(0, [bread], [], [bread]), rule(8, [])).
proof_step(3, 17, '>'(1, 0), builtin).
proof_step(3, 18, is(0, '-'(1, 1)), builtin).
proof_step(3, 19, '>'(2, 0), builtin).
proof_step(3, 20, is(1, '-'(2, 1)), builtin).
proof_step(3, 21, '>'(3, 0), builtin).
proof_step(3, 22, is(2, '-'(3, 1)), builtin).
proof_step(3, 23, '='([bread], [bread]), builtin).
proof_step(
    3,
    24,
    consume_all([wheat], [wheat, yeast, heat], [yeast, heat]),
    rule(6, [5, 6])
).
proof_step(3, 25, append([flour], [yeast, heat], [flour, yeast, heat]), rule(4, [7])).
proof_step(3, 26, consume_all([yeast], [yeast, heat], [heat]), rule(6, [9, 10])).
proof_step(3, 27, append([dough], [heat], [dough, heat]), rule(4, [11])).
proof_step(3, 28, consume_all([heat], [heat], []), rule(6, [13, 14])).
proof_step(3, 29, append([bread], [], [bread]), rule(4, [15])).
proof_step(
    3,
    30,
    linear_step([wheat, yeast, heat], mill, [flour, yeast, heat]),
    rule(7, [2, 24, 25])
).
proof_step(
    3,
    31,
    consume_all([flour, yeast], [flour, yeast, heat], [heat]),
    rule(6, [8, 26])
).
proof_step(3, 32, consume_all([dough, heat], [dough, heat], []), rule(6, [12, 28])).
proof_step(
    3,
    33,
    linear_step([flour, yeast, heat], mix, [dough, heat]),
    rule(7, [3, 31, 27])
).
proof_step(3, 34, linear_step([dough, heat], bake, [bread]), rule(7, [4, 32, 29])).
proof_step(
    3,
    35,
    run_linear(1, [dough, heat], [bake], [bread]),
    rule(9, [17, 34, 18, 16])
).
proof_step(
    3,
    36,
    run_linear(2, [flour, yeast, heat], [mix, bake], [bread]),
    rule(9, [19, 33, 20, 35])
).
proof_step(
    3,
    37,
    run_linear(3, [wheat, yeast, heat], [mill, mix, bake], [bread]),
    rule(9, [21, 30, 22, 36])
).
proof_step(
    3,
    38,
    linear_result(kitchen, [mill, mix, bake], [bread]),
    rule(10, [1, 37, 23])
).
proof_claim(3, answer(3, [38])).

% Check 3
proof_check(3, checked, [
    steps(38),
    claims(1),
    source_facts(4),
    rule_applications(27),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(31, 0)).
proof_condition(3, c2, "well-foundedness", checked(27, 0)).
proof_condition(3, c3, "justification", checked(39, 0)).
proof_condition(3, c4, "coverage", checked(70, 0)).
proof_condition(3, c5, "re-decision", checked(7, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(38, 0)).
proof_condition(
    3,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(3, c9, "query isolation", checked(1, 0)).

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
