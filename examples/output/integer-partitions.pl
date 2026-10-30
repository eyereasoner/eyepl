% Answer 1
partition_answer(p_12, 77).
partition_answer(p_16_using_parts_at_most_5, 101).
partition_answer(p_15, 176).
partition_answer(cumulative_p_1_to_8, 66).

% Answer 2
partition_count(4, 5).

% Reason 2
proof_step(2, 1, partitions(0, 1, 1), rule(3, [])).
proof_step(2, 2, '>'(1, 0), builtin).
proof_step(2, 3, '=<'(1, 1), builtin).
proof_step(2, 4, is(0, '-'(1, 1)), builtin).
proof_step(2, 5, is(1, '+'(1, 0)), builtin).
proof_step(2, 6, '>'(2, 0), builtin).
proof_step(2, 7, '>'(2, 1), builtin).
proof_step(2, 8, is(1, '-'(2, 1)), builtin).
proof_step(2, 9, '>'(3, 0), builtin).
proof_step(2, 10, '>'(3, 1), builtin).
proof_step(2, 11, is(2, '-'(3, 1)), builtin).
proof_step(2, 12, '>'(4, 0), builtin).
proof_step(2, 13, is(3, '-'(4, 1)), builtin).
proof_step(2, 14, partitions(0, 2, 1), rule(3, [])).
proof_step(2, 15, '=<'(1, 2), builtin).
proof_step(2, 16, '=<'(2, 2), builtin).
proof_step(2, 17, is(0, '-'(2, 2)), builtin).
proof_step(2, 18, is(2, '+'(1, 1)), builtin).
proof_step(2, 19, '=<'(1, 3), builtin).
proof_step(2, 20, '=<'(1, 4), builtin).
proof_step(2, 21, '=<'(2, 4), builtin).
proof_step(2, 22, is(2, '-'(4, 2)), builtin).
proof_step(2, 23, is(3, '+'(2, 1)), builtin).
proof_step(2, 24, partitions(0, 4, 1), rule(3, [])).
proof_step(2, 25, '=<'(3, 4), builtin).
proof_step(2, 26, is(1, '-'(4, 3)), builtin).
proof_step(2, 27, is(4, '+'(1, 3)), builtin).
proof_step(2, 28, '=<'(4, 4), builtin).
proof_step(2, 29, is(0, '-'(4, 4)), builtin).
proof_step(2, 30, is(5, '+'(1, 4)), builtin).
proof_step(2, 31, partitions(1, 0, 0), rule(4, [2])).
proof_step(2, 32, partitions(2, 0, 0), rule(4, [6])).
proof_step(2, 33, partitions(3, 0, 0), rule(4, [9])).
proof_step(2, 34, partitions(4, 0, 0), rule(4, [12])).
proof_step(2, 35, partitions(1, 1, 1), rule(6, [2, 2, 3, 4, 1, 4, 31, 5])).
proof_step(2, 36, partitions(1, 2, 1), rule(5, [2, 6, 7, 8, 35])).
proof_step(2, 37, partitions(2, 1, 1), rule(6, [6, 2, 15, 8, 35, 4, 32, 5])).
proof_step(2, 38, partitions(1, 3, 1), rule(5, [2, 9, 10, 11, 36])).
proof_step(2, 39, partitions(2, 2, 2), rule(6, [6, 6, 16, 17, 14, 8, 37, 18])).
proof_step(2, 40, partitions(3, 1, 1), rule(6, [9, 2, 19, 11, 37, 4, 33, 5])).
proof_step(2, 41, partitions(4, 1, 1), rule(6, [12, 2, 20, 13, 40, 4, 34, 5])).
proof_step(2, 42, partitions(4, 2, 3), rule(6, [12, 6, 21, 22, 39, 8, 41, 23])).
proof_step(2, 43, partitions(4, 3, 4), rule(6, [12, 9, 25, 26, 38, 11, 42, 27])).
proof_step(2, 44, partitions(4, 4, 5), rule(6, [12, 12, 28, 29, 24, 13, 43, 30])).
proof_step(2, 45, partition_count(4, 5), rule(7, [44])).
proof_claim(2, answer(2, [45])).

% Check 2
proof_check(2, checked, [
    steps(45),
    claims(1),
    source_facts(0),
    rule_applications(18),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(18, 0)).
proof_condition(2, c2, "well-foundedness", checked(18, 0)).
proof_condition(2, c3, "justification", checked(46, 0)).
proof_condition(2, c4, "coverage", checked(99, 0)).
proof_condition(2, c5, "re-decision", checked(27, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(45, 0)).
proof_condition(
    2,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(2, c9, "query isolation", checked(1, 0)).

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
