% Answer 1
pressure(cell1, 100000.0).

% Answer 2
status(cell1, near_atmospheric).

% Answer 3
near_atmospheric(cell1).

% Reason 3
proof_step(3, 1, gas_cell(cell1, 1.0, 8.0, 300.0, 0.024), source(1)).
proof_step(3, 2, pressure_limit(cell1, low_Pa, 95000.0), source(2)).
proof_step(3, 3, pressure_limit(cell1, high_Pa, 105000.0), source(3)).
proof_step(3, 4, is(8.0, '*'(1.0, 8.0)), builtin).
proof_step(3, 5, is(2400.0, '*'(8.0, 300.0)), builtin).
proof_step(3, 6, is(100000.0, '/'(2400.0, 0.024)), builtin).
proof_step(3, 7, pressure(cell1, 100000.0), rule(1, [1, 4, 5, 6])).
proof_step(3, 8, '>'(100000.0, 95000.0), builtin).
proof_step(3, 9, '<'(100000.0, 105000.0), builtin).
proof_step(3, 10, near_atmospheric(cell1), rule(2, [7, 2, 3, 8, 9])).
proof_claim(3, answer(3, [10])).

% Check 3
proof_check(3, checked, [
    steps(10),
    claims(1),
    source_facts(3),
    rule_applications(2),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(5, 0)).
proof_condition(3, c2, "well-foundedness", checked(2, 0)).
proof_condition(3, c3, "justification", checked(11, 0)).
proof_condition(3, c4, "coverage", checked(16, 0)).
proof_condition(3, c5, "re-decision", checked(5, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(10, 0)).
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
