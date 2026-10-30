% Answer 1
polygon_area(sample, 7.5).

% Reason 1
proof_step(
    1,
    1,
    sample_polygon([[3, 2], [6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]]),
    source(1)
).
proof_step(1, 2, area([[3, 2]], 0), rule(1, [])).
proof_step(1, 3, is(10, '*'(5, 2)), builtin).
proof_step(1, 4, is(9, '*'(3, 3)), builtin).
proof_step(1, 5, is(1, '-'(10, 9)), builtin).
proof_step(1, 6, is(0.5, '/'(1, 2.0)), builtin).
proof_step(1, 7, is(0.5, '+'(0.5, 0)), builtin).
proof_step(1, 8, is(15, '*'(5, 3)), builtin).
proof_step(1, 9, is(25, '*'(5, 5)), builtin).
proof_step(1, 10, is(-10, '-'(15, 25)), builtin).
proof_step(1, 11, is(-5.0, '/'(-10, 2.0)), builtin).
proof_step(1, 12, is(-4.5, '+'(-5.0, 0.5)), builtin).
proof_step(1, 13, is(20, '*'(4, 5)), builtin).
proof_step(1, 14, is(30, '*'(6, 5)), builtin).
proof_step(1, 15, is(-10, '-'(20, 30)), builtin).
proof_step(1, 16, is(-9.5, '+'(-5.0, -4.5)), builtin).
proof_step(1, 17, is(42, '*'(7, 6)), builtin).
proof_step(1, 18, is(24, '*'(6, 4)), builtin).
proof_step(1, 19, is(18, '-'(42, 24)), builtin).
proof_step(1, 20, is(9.0, '/'(18, 2.0)), builtin).
proof_step(1, 21, is(-0.5, '+'(9.0, -9.5)), builtin).
proof_step(1, 22, is(36, '*'(6, 6)), builtin).
proof_step(1, 23, is(14, '*'(2, 7)), builtin).
proof_step(1, 24, is(22, '-'(36, 14)), builtin).
proof_step(1, 25, is(11.0, '/'(22, 2.0)), builtin).
proof_step(1, 26, is(10.5, '+'(11.0, -0.5)), builtin).
proof_step(1, 27, is(6, '*'(3, 2)), builtin).
proof_step(1, 28, is(12, '*'(2, 6)), builtin).
proof_step(1, 29, is(-6, '-'(6, 12)), builtin).
proof_step(1, 30, is(-3.0, '/'(-6, 2.0)), builtin).
proof_step(1, 31, is(7.5, '+'(-3.0, 10.5)), builtin).
proof_step(1, 32, area([[5, 3], [3, 2]], 0.5), rule(2, [2, 3, 4, 5, 6, 7])).
proof_step(1, 33, area([[5, 5], [5, 3], [3, 2]], -4.5), rule(2, [32, 8, 9, 10, 11, 12])).
proof_step(
    1,
    34,
    area([[4, 6], [5, 5], [5, 3], [3, 2]], -9.5),
    rule(2, [33, 13, 14, 15, 11, 16])
).
proof_step(
    1,
    35,
    area([[7, 6], [4, 6], [5, 5], [5, 3], [3, 2]], -0.5),
    rule(2, [34, 17, 18, 19, 20, 21])
).
proof_step(
    1,
    36,
    area([[6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]], 10.5),
    rule(2, [35, 22, 23, 24, 25, 26])
).
proof_step(
    1,
    37,
    area([[3, 2], [6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]], 7.5),
    rule(2, [36, 27, 28, 29, 30, 31])
).
proof_step(1, 38, polygon_area(sample, 7.5), rule(3, [1, 37])).
proof_claim(1, answer(1, [38])).

% Check 1
proof_check(1, checked, [
    steps(38),
    claims(1),
    source_facts(1),
    rule_applications(8),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(9, 0)).
proof_condition(1, c2, "well-foundedness", checked(8, 0)).
proof_condition(1, c3, "justification", checked(39, 0)).
proof_condition(1, c4, "coverage", checked(49, 0)).
proof_condition(1, c5, "re-decision", checked(29, 0)).
proof_condition(
    1,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(1, c7, "relevance", checked(38, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(1, 0)).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).
