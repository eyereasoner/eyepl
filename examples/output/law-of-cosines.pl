% Answer 1
rounded_side(t1, c, 5.0).
rounded_side(t2, c, 6.244997998398).
rounded_side(t3, a, 5.56776436283).
rounded_side(t4, b, 1.614835952841).
rounded_side(t5, c, 15.062650137854).
rounded_side(t6, a, 13.0).

% Answer 2
side(t1, c, 5.0).

% Reason 2
proof_step(2, 1, given(t1, c, 3, 4, 1.5707963267948966), source(1)).
proof_step(2, 2, '>'(3, 0), builtin).
proof_step(2, 3, '>'(4, 0), builtin).
proof_step(2, 4, '>'(1.5707963267948966, 0), builtin).
proof_step(2, 5, '<'(1.5707963267948966, pi), builtin).
proof_step(
    2,
    6,
    is(
        25.0,
        '-'('+'('*'(3, 3), '*'(4, 4)), '*'('*'('*'(2, 3), 4), cos(1.5707963267948966)))
    ),
    builtin
).
proof_step(2, 7, '>='(25.0, 0), builtin).
proof_step(2, 8, is(5.0, sqrt(25.0)), builtin).
proof_step(2, 9, side(t1, c, 5.0), rule(1, [1, 2, 3, 4, 5, 6, 7, 8])).
proof_claim(2, answer(2, [9])).

% Check 2
proof_check(2, checked, [
    steps(9),
    claims(1),
    source_facts(1),
    rule_applications(1),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(2, 0)).
proof_condition(2, c2, "well-foundedness", checked(1, 0)).
proof_condition(2, c3, "justification", checked(10, 0)).
proof_condition(2, c4, "coverage", checked(12, 0)).
proof_condition(2, c5, "re-decision", checked(7, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(9, 0)).
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
