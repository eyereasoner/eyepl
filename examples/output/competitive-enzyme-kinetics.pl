% Answer 1
effective_km(assay1, 90.0).

% Answer 2
uninhibited_rate(assay1, 75.0).

% Answer 3
inhibited_rate(assay1, 42.857142857142854).

% Answer 4
status(assay1, significant_inhibition).

% Answer 5
significant_inhibition(assay1).

% Reason 5
proof_step(5, 1, assay(assay1, vmax_uM_s, 120.0), source(1)).
proof_step(5, 2, assay(assay1, substrate_uM, 50.0), source(2)).
proof_step(5, 3, assay(assay1, km_uM, 30.0), source(3)).
proof_step(5, 4, assay(assay1, inhibitor_uM, 10.0), source(4)).
proof_step(5, 5, assay(assay1, ki_uM, 5.0), source(5)).
proof_step(5, 6, threshold(assay1, significant_inhibition_fraction, 0.25), source(6)).
proof_step(5, 7, is(6000.0, '*'(120.0, 50.0)), builtin).
proof_step(5, 8, is(80.0, '+'(30.0, 50.0)), builtin).
proof_step(5, 9, is(75.0, '/'(6000.0, 80.0)), builtin).
proof_step(5, 10, uninhibited_rate(assay1, 75.0), rule(3, [1, 2, 3, 7, 8, 9])).
proof_step(5, 11, is(2.0, '/'(10.0, 5.0)), builtin).
proof_step(5, 12, is(3.0, '+'(1.0, 2.0)), builtin).
proof_step(5, 13, competitive_multiplier(assay1, 3.0), rule(1, [4, 5, 11, 12])).
proof_step(5, 14, is(90.0, '*'(30.0, 3.0)), builtin).
proof_step(5, 15, effective_km(assay1, 90.0), rule(2, [3, 13, 14])).
proof_step(5, 16, is(140.0, '+'(90.0, 50.0)), builtin).
proof_step(5, 17, is(42.857142857142854, '/'(6000.0, 140.0)), builtin).
proof_step(
    5,
    18,
    inhibited_rate(assay1, 42.857142857142854),
    rule(4, [1, 2, 15, 7, 16, 17])
).
proof_step(5, 19, is(32.142857142857146, '-'(75.0, 42.857142857142854)), builtin).
proof_step(5, 20, is(0.4285714285714286, '/'(32.142857142857146, 75.0)), builtin).
proof_step(
    5,
    21,
    inhibition_fraction(assay1, 0.4285714285714286),
    rule(5, [10, 18, 19, 20])
).
proof_step(5, 22, '>'(0.4285714285714286, 0.25), builtin).
proof_step(5, 23, significant_inhibition(assay1), rule(6, [21, 6, 22])).
proof_claim(5, answer(5, [23])).

% Check 5
proof_check(5, checked, [
    steps(23),
    claims(1),
    source_facts(6),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(5, c1, "resolution", checked(12, 0)).
proof_condition(5, c2, "well-foundedness", checked(6, 0)).
proof_condition(5, c3, "justification", checked(24, 0)).
proof_condition(5, c4, "coverage", checked(40, 0)).
proof_condition(5, c5, "re-decision", checked(11, 0)).
proof_condition(
    5,
    c6,
    "boundary consistency",
    not_applicable("program uses no negation or aggregation")
).
proof_condition(5, c7, "relevance", checked(23, 0)).
proof_condition(
    5,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(5, c9, "query isolation", checked(1, 0)).

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
