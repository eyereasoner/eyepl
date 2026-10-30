% Answer 1
convergent_answer(convergent_10, fraction(8119, 5741)).
convergent_answer(convergent_15, fraction(665857, 470832)).
convergent_answer(pell_error_15, 1).
convergent_answer(numerator_sum_0_to_10, 13859).

% Answer 2
conv(3, 17, 12).

% Reason 2
proof_step(2, 1, conv(0, 1, 1), source(1)).
proof_step(2, 2, conv(1, 3, 2), source(2)).
proof_step(2, 3, '>'(2, 1), builtin).
proof_step(2, 4, is(1, '-'(2, 1)), builtin).
proof_step(2, 5, is(0, '-'(2, 2)), builtin).
proof_step(2, 6, is(6, '*'(2, 3)), builtin).
proof_step(2, 7, is(7, '+'(6, 1)), builtin).
proof_step(2, 8, is(4, '*'(2, 2)), builtin).
proof_step(2, 9, is(5, '+'(4, 1)), builtin).
proof_step(2, 10, '>'(3, 1), builtin).
proof_step(2, 11, is(2, '-'(3, 1)), builtin).
proof_step(2, 12, is(1, '-'(3, 2)), builtin).
proof_step(2, 13, is(14, '*'(2, 7)), builtin).
proof_step(2, 14, is(17, '+'(14, 3)), builtin).
proof_step(2, 15, is(10, '*'(2, 5)), builtin).
proof_step(2, 16, is(12, '+'(10, 2)), builtin).
proof_step(2, 17, conv(2, 7, 5), rule(3, [3, 4, 5, 2, 1, 6, 7, 8, 9])).
proof_step(2, 18, conv(3, 17, 12), rule(3, [10, 11, 12, 17, 2, 13, 14, 15, 16])).
proof_claim(2, answer(2, [18])).

% Check 2
proof_check(2, checked, [
    steps(18),
    claims(1),
    source_facts(2),
    rule_applications(2),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(4, 0)).
proof_condition(2, c2, "well-foundedness", checked(2, 0)).
proof_condition(2, c3, "justification", checked(19, 0)).
proof_condition(2, c4, "coverage", checked(24, 0)).
proof_condition(2, c5, "re-decision", checked(14, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(18, 0)).
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
