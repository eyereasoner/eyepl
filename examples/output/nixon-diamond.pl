% Answer 1
classification(nixon, quaker).
classification(nixon, republican).
classification(ada, quaker).
classification(nixon, nonpacifist).
classification(ada, pacifist).

% Answer 2
pacifist(ada).

% Reason 2
proof_step(2, 1, quaker(nixon), source(1)).
proof_step(2, 2, republican(nixon), source(2)).
proof_step(2, 3, quaker(ada), source(3)).
proof_step(2, 4, classification(nixon, quaker), rule(3, [1])).
proof_step(2, 5, nonpacifist(nixon), rule(2, [2])).
proof_step(2, 6, classification(nixon, republican), rule(4, [2])).
proof_step(2, 7, classification(ada, quaker), rule(3, [3])).
proof_step(2, 8, classification(nixon, nonpacifist), rule(6, [5])).
proof_step(2, 9, nonpacifist(ada), absent(1)).
proof_step(2, 10, pacifist(ada), rule(1, [3, 9])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 8).
proof_claim(2, answer(2, [10])).

% Check 2
proof_check(2, checked, [
    steps(10),
    claims(1),
    source_facts(3),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(9, 0)).
proof_condition(2, c2, "well-foundedness", checked(7, 0)).
proof_condition(2, c3, "justification", checked(12, 0)).
proof_condition(2, c4, "coverage", checked(27, 0)).
proof_condition(2, c5, "re-decision", checked(0, 0)).
proof_condition(2, c6, "boundary consistency", checked(2, 0)).
proof_condition(2, c7, "relevance", checked(11, 0)).
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
