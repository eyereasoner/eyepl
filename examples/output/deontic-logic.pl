% Answer 1
violation(alice, missed_obligation(obtain_consent)).
violation(alice, prohibited_action(share_record)).

% Answer 2
compensation(alice, compensation(share_record, notify_dpo)).

% Answer 3
status(alice, requires_review).

% Answer 4
status(alice, requires_review).

% Reason 4
proof_step(4, 1, obliged(alice, obtain_consent), source(4)).
proof_step(4, 2, not_performed(alice, obtain_consent), source(9)).
proof_step(4, 3, violation(alice, missed_obligation(obtain_consent)), rule(1, [1, 2])).
proof_step(
    4,
    4,
    uncompensated_violation(alice, missed_obligation(obtain_consent)),
    rule(4, [3])
).
proof_step(4, 5, status(alice, requires_review), rule(7, [4])).
proof_claim(4, answer(4, [5])).

% Check 4
proof_check(4, checked, [
    steps(5),
    claims(1),
    source_facts(2),
    rule_applications(3),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(4, c1, "resolution", checked(5, 0)).
proof_condition(4, c2, "well-foundedness", checked(3, 0)).
proof_condition(4, c3, "justification", checked(6, 0)).
proof_condition(4, c4, "coverage", checked(11, 0)).
proof_condition(4, c5, "re-decision", checked(0, 0)).
proof_condition(4, c6, "boundary consistency", checked(0, 0)).
proof_condition(4, c7, "relevance", checked(5, 0)).
proof_condition(
    4,
    c8,
    "witness integrity",
    not_applicable("program uses no fresh witnesses")
).
proof_condition(4, c9, "query isolation", checked(1, 0)).

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
