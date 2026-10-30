% Answer 1
discriminant(eq1, 1.0).
discriminant(eq2, 64.0).

% Answer 2
root(eq1, 3.0).
root(eq1, 2.0).
root(eq2, 3.0).
root(eq2, -1.0).

% Answer 3
root(eq1, 2.0).

% Reason 3
proof_step(3, 1, equation(eq1, 1.0, -5.0, 6.0), source(1)).
proof_step(3, 2, is(25.0, '**'(-5.0, 2)), builtin).
proof_step(3, 3, is(4.0, '*'(4.0, 1.0)), builtin).
proof_step(3, 4, is(24.0, '*'(4.0, 6.0)), builtin).
proof_step(3, 5, is(1.0, '-'(25.0, 24.0)), builtin).
proof_step(3, 6, discriminant(eq1, 1.0), rule(1, [1, 2, 3, 4, 5])).
proof_step(3, 7, is(5.0, '-'(-5.0)), builtin).
proof_step(3, 8, negative_b(eq1, 5.0), rule(3, [1, 7])).
proof_step(3, 9, is(2.0, '*'(2.0, 1.0)), builtin).
proof_step(3, 10, denominator(eq1, 2.0), rule(4, [1, 9])).
proof_step(3, 11, '>='(1.0, 0.0), builtin).
proof_step(3, 12, is(1.0, '**'(1.0, 0.5)), builtin).
proof_step(3, 13, sqrt_discriminant(eq1, 1.0), rule(2, [6, 11, 12])).
proof_step(3, 14, is(4.0, '-'(5.0, 1.0)), builtin).
proof_step(3, 15, is(2.0, '/'(4.0, 2.0)), builtin).
proof_step(3, 16, root_minus(eq1, 2.0), rule(6, [8, 13, 10, 14, 15])).
proof_step(3, 17, root(eq1, 2.0), rule(8, [16])).
proof_claim(3, answer(3, [17])).

% Check 3
proof_check(3, checked, [
    steps(17),
    claims(1),
    source_facts(1),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(7, 0)).
proof_condition(3, c2, "well-foundedness", checked(6, 0)).
proof_condition(3, c3, "justification", checked(18, 0)).
proof_condition(3, c4, "coverage", checked(27, 0)).
proof_condition(3, c5, "re-decision", checked(10, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(17, 0)).
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

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).

% Goal check 11
check_result(11, true).
