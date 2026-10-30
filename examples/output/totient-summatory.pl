% Answer 1
totient_answer(phi_36, 12).
totient_answer(phi_97, 96).
totient_answer(coprime_count_84, 24).
totient_answer(summatory_phi_30, 278).

% Answer 2
coprime_upto(9, 5).

% Reason 2
proof_step(2, 1, is(2, '+'(1, 1)), builtin).
proof_step(2, 2, '>='(1, 0), builtin).
proof_step(2, 3, is(3, '+'(2, 1)), builtin).
proof_step(2, 4, '>'(1, 0), builtin).
proof_step(2, 5, is(4, '+'(3, 1)), builtin).
proof_step(2, 6, is(5, '+'(4, 1)), builtin).
proof_step(2, 7, '>'(5, 0), builtin).
proof_step(2, 8, is(0, mod(4, 1)), builtin).
proof_step(2, 9, '>'(4, 0), builtin).
proof_step(2, 10, is(1, mod(5, 4)), builtin).
proof_step(2, 11, is(4, mod(9, 5)), builtin).
proof_step(2, 12, '<'(1, 9), builtin).
proof_step(2, 13, '<'(2, 9), builtin).
proof_step(2, 14, '<'(3, 9), builtin).
proof_step(2, 15, '=<'(5, 9), builtin).
proof_step(2, 16, '<'(4, 9), builtin).
proof_step(2, 17, gcd(1, 0, 1), rule(3, [2])).
proof_step(2, 18, in_range(5, 9, 5), rule(1, [15])).
proof_step(2, 19, gcd(4, 1, 1), rule(4, [4, 8, 17])).
proof_step(2, 20, in_range(4, 9, 5), rule(2, [16, 6, 18])).
proof_step(2, 21, gcd(5, 4, 1), rule(4, [9, 10, 19])).
proof_step(2, 22, in_range(3, 9, 5), rule(2, [14, 5, 20])).
proof_step(2, 23, gcd(9, 5, 1), rule(4, [7, 11, 21])).
proof_step(2, 24, in_range(2, 9, 5), rule(2, [13, 3, 22])).
proof_step(2, 25, in_range(1, 9, 5), rule(2, [12, 1, 24])).
proof_step(2, 26, coprime_upto(9, 5), rule(5, [25, 23])).
proof_claim(2, answer(2, [26])).

% Check 2
proof_check(2, checked, [
    steps(26),
    claims(1),
    source_facts(0),
    rule_applications(10),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(10, 0)).
proof_condition(2, c2, "well-foundedness", checked(10, 0)).
proof_condition(2, c3, "justification", checked(27, 0)).
proof_condition(2, c4, "coverage", checked(37, 0)).
proof_condition(2, c5, "re-decision", checked(16, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(26, 0)).
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
