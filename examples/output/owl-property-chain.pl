% Answer 1
triple(alice, grandparent, carol).
triple(bob, grandparent, dave).

% Reason 1
proof_step(1, 1, property_chain(grandparent, [parent, parent]), source(1)).
proof_step(1, 2, triple(alice, parent, bob), source(2)).
proof_step(1, 3, triple(bob, parent, carol), source(3)).
proof_step(1, 4, triple(carol, parent, dave), source(4)).
proof_step(1, 5, follow_chain([], carol, carol), rule(2, [])).
proof_step(1, 6, follow_chain([], dave, dave), rule(2, [])).
proof_step(1, 7, follow_chain([parent], bob, carol), rule(3, [3, 5])).
proof_step(1, 8, follow_chain([parent], carol, dave), rule(3, [4, 6])).
proof_step(1, 9, triple(alice, grandparent, carol), rule(1, [1, 2, 7])).
proof_step(1, 10, triple(bob, grandparent, dave), rule(1, [1, 3, 8])).
proof_claim(1, answer(1, [9])).
proof_claim(1, answer(1, [10])).

% Check 1
proof_check(1, checked, [
    steps(10),
    claims(2),
    source_facts(4),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(10, 0)).
proof_condition(1, c2, "well-foundedness", checked(6, 0)).
proof_condition(1, c3, "justification", checked(12, 0)).
proof_condition(1, c4, "coverage", checked(24, 0)).
proof_condition(1, c5, "re-decision", checked(0, 0)).
proof_condition(1, c6, "boundary consistency", checked(0, 0)).
proof_condition(1, c7, "relevance", checked(10, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(2, 0)).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).

% Goal check 4
check_result(4, true).

% Goal check 5
check_result(5, true).

% Goal check 6
check_result(6, true).
