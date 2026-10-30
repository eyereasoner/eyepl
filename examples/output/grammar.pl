% Answer 1
sentence([open, door], command(open, door), []).

% Answer 2
sentence([close, window, please], command(close, window), [please]).

% Answer 3
sentence([open, door], command(open, door), []).

% Reason 3
proof_step(3, 1, verb([open, door], open, [door]), rule(1, [])).
proof_step(3, 2, noun([door], door, []), rule(3, [])).
proof_step(3, 3, sentence([open, door], command(open, door), []), rule(5, [1, 2])).
proof_claim(3, answer(3, [3])).

% Check 3
proof_check(3, checked, [
    steps(3),
    claims(1),
    source_facts(0),
    rule_applications(3),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(3, 0)).
proof_condition(3, c2, "well-foundedness", checked(3, 0)).
proof_condition(3, c3, "justification", checked(4, 0)).
proof_condition(3, c4, "coverage", checked(7, 0)).
proof_condition(
    3,
    c5,
    "re-decision",
    not_applicable("program uses no built-ins or aggregates")
).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(3, 0)).
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
