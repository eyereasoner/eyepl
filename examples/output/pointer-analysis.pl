% Answer 1
points_to(x, object_a).
points_to(z, object_b).
points_to(y, object_a).
points_to(q, object_b).
points_to(r, object_b).

% Answer 2
field_points_to(object_a, object_b).

% Answer 3
points_to(r, object_b).

% Reason 3
proof_step(3, 1, addr(x, object_a), source(1)).
proof_step(3, 2, addr(z, object_b), source(2)).
proof_step(3, 3, assign(y, x), source(3)).
proof_step(3, 4, store(y, z), source(4)).
proof_step(3, 5, load(q, x), source(5)).
proof_step(3, 6, assign(r, q), source(6)).
proof_step(3, 7, points_to(x, object_a), rule(1, [1])).
proof_step(3, 8, points_to(z, object_b), rule(1, [2])).
proof_step(3, 9, points_to(y, object_a), rule(2, [3, 7])).
proof_step(3, 10, field_points_to(object_a, object_b), rule(3, [4, 9, 8])).
proof_step(3, 11, points_to(q, object_b), rule(4, [5, 7, 10])).
proof_step(3, 12, points_to(r, object_b), rule(2, [6, 11])).
proof_claim(3, answer(3, [12])).

% Check 3
proof_check(3, checked, [
    steps(12),
    claims(1),
    source_facts(6),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(12, 0)).
proof_condition(3, c2, "well-foundedness", checked(6, 0)).
proof_condition(3, c3, "justification", checked(13, 0)).
proof_condition(3, c4, "coverage", checked(26, 0)).
proof_condition(3, c5, "re-decision", checked(0, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(12, 0)).
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
