% Answer 1
period_s(pendulum1, 2.0).

% Answer 2
periodError_s(pendulum1, 0.0).

% Answer 3
status(pendulum1, within_period_tolerance).

% Answer 4
within_period_tolerance(pendulum1).

% Reason 4
proof_step(4, 1, constant(pi, 3.141592653589793), source(1)).
proof_step(4, 2, experiment(pendulum1, length_m, 1.0), source(2)).
proof_step(4, 3, experiment(pendulum1, gravity_m_s2, 9.869604401089358), source(3)).
proof_step(4, 4, limit(pendulum1, target_period_s, 2.0), source(4)).
proof_step(4, 5, limit(pendulum1, tolerance_s, 0.01), source(5)).
proof_step(4, 6, is(0.10132118364233778, '/'(1.0, 9.869604401089358)), builtin).
proof_step(4, 7, is(0.3183098861837907, '**'(0.10132118364233778, 0.5)), builtin).
proof_step(4, 8, is(6.283185307179586, '*'(2.0, 3.141592653589793)), builtin).
proof_step(4, 9, is(2.0, '*'(6.283185307179586, 0.3183098861837907)), builtin).
proof_step(4, 10, period(pendulum1, 2.0), rule(1, [2, 3, 6, 7, 1, 8, 9])).
proof_step(4, 11, is(0.0, '-'(2.0, 2.0)), builtin).
proof_step(4, 12, is(0.0, abs(0.0)), builtin).
proof_step(4, 13, period_error(pendulum1, 0.0), rule(2, [10, 4, 11, 12])).
proof_step(4, 14, '<'(0.0, 0.01), builtin).
proof_step(4, 15, within_period_tolerance(pendulum1), rule(3, [13, 5, 14])).
proof_claim(4, answer(4, [15])).

% Check 4
proof_check(4, checked, [
    steps(15),
    claims(1),
    source_facts(5),
    rule_applications(3),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(4, c1, "resolution", checked(8, 0)).
proof_condition(4, c2, "well-foundedness", checked(3, 0)).
proof_condition(4, c3, "justification", checked(16, 0)).
proof_condition(4, c4, "coverage", checked(24, 0)).
proof_condition(4, c5, "re-decision", checked(7, 0)).
proof_condition(
    4,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(4, c7, "relevance", checked(15, 0)).
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
