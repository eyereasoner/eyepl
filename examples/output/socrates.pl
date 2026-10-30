% Answer 1
mortal(socrates).

% Reason 1
proof_step(1, 1, human(socrates), source(1)).
proof_step(1, 2, mortal(socrates), rule(1, [1])).
proof_claim(1, answer(1, [2])).

% Check 1
proof_check(1, checked, [
    steps(2),
    claims(1),
    source_facts(1),
    rule_applications(1),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(2, 0)).
proof_condition(1, c2, "well-foundedness", checked(1, 0)).
proof_condition(1, c3, "justification", checked(3, 0)).
proof_condition(1, c4, "coverage", checked(5, 0)).
proof_condition(1, c5, "re-decision", checked(0, 0)).
proof_condition(1, c6, "boundary consistency", checked(0, 0)).
proof_condition(1, c7, "relevance", checked(2, 0)).
proof_condition(
    1,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(1, c9, "query isolation", checked(1, 0)).

% Goal check 2
check_result(2, true).

% Goal check 3
check_result(3, true).
