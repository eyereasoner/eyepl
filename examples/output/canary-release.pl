% Answer 1
error_rate(canary42, 0.015).

% Answer 2
latencyCheck(canary42, ok).

% Answer 3
status(canary42, rollback_recommended).

% Answer 4
rollback_recommended(canary42).

% Reason 4
proof_step(4, 1, canary(canary42, 5000.0, 75.0, 180.0), source(1)).
proof_step(4, 2, threshold(canary42, maximum_error_rate, 0.01), source(2)).
proof_step(4, 3, is(0.015, '/'(75.0, 5000.0)), builtin).
proof_step(4, 4, error_rate(canary42, 0.015), rule(1, [1, 3])).
proof_step(4, 5, '>'(0.015, 0.01), builtin).
proof_step(4, 6, error_budget_exceeded(canary42), rule(3, [4, 2, 5])).
proof_step(4, 7, rollback_recommended(canary42), rule(4, [6])).
proof_claim(4, answer(4, [7])).

% Check 4
proof_check(4, checked, [
    steps(7),
    claims(1),
    source_facts(2),
    rule_applications(3),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(4, c1, "resolution", checked(5, 0)).
proof_condition(4, c2, "well-foundedness", checked(3, 0)).
proof_condition(4, c3, "justification", checked(8, 0)).
proof_condition(4, c4, "coverage", checked(13, 0)).
proof_condition(4, c5, "re-decision", checked(2, 0)).
proof_condition(
    4,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(4, c7, "relevance", checked(7, 0)).
proof_condition(
    4,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(4, c9, "query isolation", checked(1, 0)).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).

% Goal check 7
check_result(7, true).

% Goal check 8
check_result(8, true).
