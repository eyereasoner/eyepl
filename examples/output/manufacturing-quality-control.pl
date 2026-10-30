% Answer 1
cpk(line7_shift_a, 0.6666666666666673).
cpk(line8_shift_b, 1.6666666666666607).

% Answer 2
status(line7_shift_a, needs_process_adjustment).
status(line8_shift_b, capable_process).

% Answer 3
status(line8_shift_b, capable_process).

% Reason 3
proof_step(3, 1, spec(line8_shift_b, lower_mm, 10.0), source(7)).
proof_step(3, 2, spec(line8_shift_b, upper_mm, 10.2), source(8)).
proof_step(3, 3, summary(line8_shift_b, mean_mm, 10.1), source(9)).
proof_step(3, 4, summary(line8_shift_b, sigma_mm, 0.02), source(10)).
proof_step(3, 5, capability_threshold(cpk, 1.33), source(11)).
proof_step(3, 6, is(0.09999999999999964, '-'(10.1, 10.0)), builtin).
proof_step(
    3,
    7,
    lower_margin_mm(line8_shift_b, 0.09999999999999964),
    rule(2, [3, 1, 6])
).
proof_step(3, 8, is(0.09999999999999964, '-'(10.2, 10.1)), builtin).
proof_step(
    3,
    9,
    upper_margin_mm(line8_shift_b, 0.09999999999999964),
    rule(1, [2, 3, 8])
).
proof_step(3, 10, is(0.06, '*'(3.0, 0.02)), builtin).
proof_step(3, 11, three_sigma_mm(line8_shift_b, 0.06), rule(4, [4, 10])).
proof_step(
    3,
    12,
    is(0.09999999999999964, min(0.09999999999999964, 0.09999999999999964)),
    builtin
).
proof_step(
    3,
    13,
    nearest_spec_margin_mm(line8_shift_b, 0.09999999999999964),
    rule(3, [9, 7, 12])
).
proof_step(3, 14, is(1.6666666666666607, '/'(0.09999999999999964, 0.06)), builtin).
proof_step(3, 15, cpk(line8_shift_b, 1.6666666666666607), rule(5, [13, 11, 14])).
proof_step(3, 16, '>='(1.6666666666666607, 1.33), builtin).
proof_step(3, 17, capable(line8_shift_b), rule(6, [15, 5, 16])).
proof_step(3, 18, status(line8_shift_b, capable_process), rule(8, [17])).
proof_claim(3, answer(3, [18])).

% Check 3
proof_check(3, checked, [
    steps(18),
    claims(1),
    source_facts(5),
    rule_applications(7),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(12, 0)).
proof_condition(3, c2, "well-foundedness", checked(7, 0)).
proof_condition(3, c3, "justification", checked(19, 0)).
proof_condition(3, c4, "coverage", checked(32, 0)).
proof_condition(3, c5, "re-decision", checked(6, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(18, 0)).
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
