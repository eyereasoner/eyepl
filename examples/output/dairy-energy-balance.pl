% Answer 1
report(early_lactation, -43.5, 26.40625, negative).
report(mid_lactation, 7.05, 30.203125, near).
report(late_lactation, 20.4, 24.375, positive).
report(pasture, -8.0, 11.5, near).

% Answer 2
energy_status(early_lactation, negative).

% Reason 2
proof_step(2, 1, cow(early_lactation, 650.0, 40.0, 6.5, 21.0), source(1)).
proof_step(2, 2, is(52.0, '*'(0.08, 650.0)), builtin).
proof_step(2, 3, maintenance(early_lactation, 52.0), rule(1, [1, 2])).
proof_step(2, 4, is(128.0, '*'(3.2, 40.0)), builtin).
proof_step(2, 5, milk_energy(early_lactation, 128.0), rule(2, [1, 4])).
proof_step(2, 6, is(136.5, '*'(6.5, 21.0)), builtin).
proof_step(2, 7, supply(early_lactation, 136.5), rule(4, [1, 6])).
proof_step(2, 8, is(180.0, '+'(52.0, 128.0)), builtin).
proof_step(2, 9, requirement(early_lactation, 180.0), rule(3, [3, 5, 8])).
proof_step(2, 10, is(-43.5, '-'(136.5, 180.0)), builtin).
proof_step(2, 11, balance(early_lactation, -43.5), rule(5, [7, 9, 10])).
proof_step(2, 12, '<'(-43.5, -10), builtin).
proof_step(2, 13, energy_status(early_lactation, negative), rule(7, [11, 12])).
proof_claim(2, answer(2, [13])).

% Check 2
proof_check(2, checked, [
    steps(13),
    claims(1),
    source_facts(1),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(7, 0)).
proof_condition(2, c2, "well-foundedness", checked(6, 0)).
proof_condition(2, c3, "justification", checked(14, 0)).
proof_condition(2, c4, "coverage", checked(23, 0)).
proof_condition(2, c5, "re-decision", checked(6, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(13, 0)).
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

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).
