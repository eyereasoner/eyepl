% Answer 1
answer(1, 3, 3, 5).

% Reason 1
proof_step(1, 1, buggy_list_max([3], 3), rule(1, [])).
proof_step(1, 2, '>'(5, 3), builtin).
proof_step(1, 3, '='(3, 3), builtin).
proof_step(1, 4, '=<'(1, 3), builtin).
proof_step(1, 5, fixed_list_max([3], 3), rule(4, [])).
proof_step(1, 6, '=<'(1, 5), builtin).
proof_step(1, 7, buggy_list_max([5, 3], 3), rule(2, [1, 2, 3])).
proof_step(1, 8, fixed_list_max([5, 3], 5), rule(5, [5, 2])).
proof_step(1, 9, buggy_list_max([1, 5, 3], 1), rule(3, [7, 4])).
proof_step(1, 10, fixed_list_max([1, 5, 3], 5), rule(6, [8, 6])).
proof_step(1, 11, answer(1, 3, 3, 5), rule(7, [9, 7, 1, 10])).
proof_claim(1, answer(1, [11])).

% Check 1
proof_check(1, checked, [
    steps(11),
    claims(1),
    source_facts(0),
    rule_applications(7),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(7, 0)).
proof_condition(1, c2, "well-foundedness", checked(7, 0)).
proof_condition(1, c3, "justification", checked(12, 0)).
proof_condition(1, c4, "coverage", checked(22, 0)).
proof_condition(1, c5, "re-decision", checked(4, 0)).
proof_condition(1, c6, "boundary consistency", checked(0, 0)).
proof_condition(1, c7, "relevance", checked(11, 0)).
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
