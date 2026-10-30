% Answer 1
rounded_area(t1, 6.0).
rounded_area(t2, 0.433012701892).
rounded_area(t3, 12.0).
rounded_area(t4, 26.832815729997).
rounded_area(t5, 0.0).
rounded_area(t6, 5.846051552116).

% Answer 2
status(t1, proper).
status(t2, proper).
status(t3, proper).
status(t4, proper).
status(t5, degenerate).
status(t6, proper).
status(t7, invalid_sides).

% Answer 3
area(t1, 6.0).

% Reason 3
proof_step(3, 1, triangle(t1, 3, 4, 5), source(1)).
proof_step(3, 2, '>'(3, 0), builtin).
proof_step(3, 3, '>'(4, 0), builtin).
proof_step(3, 4, '>'(5, 0), builtin).
proof_step(3, 5, is(6.0, '/'('+'('+'(3, 4), 5), 2)), builtin).
proof_step(
    3,
    6,
    is(36.0, '*'('*'('*'(6.0, '-'(6.0, 3)), '-'(6.0, 4)), '-'(6.0, 5))),
    builtin
).
proof_step(3, 7, radicand(t1, 36.0), rule(1, [1, 2, 3, 4, 5, 6])).
proof_step(3, 8, '>='(36.0, 0), builtin).
proof_step(3, 9, is(6.0, sqrt(36.0)), builtin).
proof_step(3, 10, area(t1, 6.0), rule(5, [7, 8, 9])).
proof_claim(3, answer(3, [10])).

% Check 3
proof_check(3, checked, [
    steps(10),
    claims(1),
    source_facts(1),
    rule_applications(2),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(3, 0)).
proof_condition(3, c2, "well-foundedness", checked(2, 0)).
proof_condition(3, c3, "justification", checked(11, 0)).
proof_condition(3, c4, "coverage", checked(14, 0)).
proof_condition(3, c5, "re-decision", checked(7, 0)).
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

% Goal check 12
check_result(12, true).
