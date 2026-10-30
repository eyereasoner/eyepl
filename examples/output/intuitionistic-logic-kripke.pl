% Answer 1
intuitionistic_result(monotone_p_reaches_both, both, atom(p), true).
intuitionistic_result(root_does_not_decide_branch, root, or(atom(p), atom(q)), false).
intuitionistic_result(
    excluded_middle_not_forced,
    root,
    or(atom(p), neg(atom(p))),
    false
).
intuitionistic_result(
    constructive_case_analysis,
    root,
    implies(atom(p), or(atom(p), atom(q))),
    true
).
intuitionistic_result(
    double_negated_branch_information,
    root,
    neg(neg(or(atom(p), atom(q)))),
    true
).

% Answer 2
evaluate(both, atom(p), true).

% Reason 2
proof_step(2, 1, world(both), source(4)).
proof_step(2, 2, step(left, both), source(9)).
proof_step(2, 3, base(left, p), source(11)).
proof_step(2, 4, leq(both, both), rule(1, [1])).
proof_step(2, 5, leq(left, both), rule(2, [2, 4])).
proof_step(2, 6, known(both, p), rule(3, [5, 3])).
proof_step(2, 7, atomic_value(both, p, true), rule(4, [6])).
proof_step(2, 8, evaluate(both, atom(p), true), rule(8, [7])).
proof_claim(2, answer(2, [8])).

% Check 2
proof_check(2, checked, [
    steps(8),
    claims(1),
    source_facts(3),
    rule_applications(5),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(8, 0)).
proof_condition(2, c2, "well-foundedness", checked(5, 0)).
proof_condition(2, c3, "justification", checked(9, 0)).
proof_condition(2, c4, "coverage", checked(17, 0)).
proof_condition(2, c5, "re-decision", checked(0, 0)).
proof_condition(2, c6, "boundary consistency", checked(0, 0)).
proof_condition(2, c7, "relevance", checked(8, 0)).
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

% Goal check 9
check_result(9, true).

% Goal check 10
check_result(10, true).
