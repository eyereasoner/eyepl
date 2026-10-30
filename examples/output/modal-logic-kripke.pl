% Answer 1
modal_result(all_accessible_worlds_clear, w0, box(atom(clear)), true).
modal_result(repair_is_possible, w0, diamond(atom(repaired)), true).
modal_result(repair_not_necessary, w0, box(atom(repaired)), false).
modal_result(nested_possibility, w1, diamond(and(atom(clear), atom(clear))), true).

% Answer 2
evaluate(w0, box(atom(clear)), true).

% Reason 2
proof_step(2, 1, world(w0), source(1)).
proof_step(2, 2, world(w1), source(2)).
proof_step(2, 3, world(w2), source(3)).
proof_step(2, 4, world(w3), source(4)).
proof_step(2, 5, proposition(clear), source(5)).
proof_step(2, 6, proposition(repaired), source(6)).
proof_step(2, 7, accessible(w0, w1), source(7)).
proof_step(2, 8, accessible(w0, w2), source(8)).
proof_step(2, 9, accessible(w1, w1), source(9)).
proof_step(2, 10, accessible(w1, w3), source(10)).
proof_step(2, 11, accessible(w2, w2), source(11)).
proof_step(2, 12, accessible(w3, w3), source(12)).
proof_step(2, 13, true_at(w1, clear), source(13)).
proof_step(2, 14, true_at(w2, clear), source(14)).
proof_step(2, 15, true_at(w3, clear), source(15)).
proof_step(2, 16, true_at(w2, repaired), source(16)).
proof_step(2, 17, bool_and(true, true, true), source(17)).
proof_step(2, 18, bool_and(true, false, false), source(18)).
proof_step(2, 19, bool_and(false, true, false), source(19)).
proof_step(2, 20, bool_and(false, false, false), source(20)).
proof_step(2, 21, bool_or(true, true, true), source(21)).
proof_step(2, 22, bool_or(true, false, true), source(22)).
proof_step(2, 23, bool_or(false, true, true), source(23)).
proof_step(2, 24, bool_or(false, false, false), source(24)).
proof_step(
    2,
    25,
    formula(all_accessible_worlds_clear, w0, box(atom(clear))),
    source(25)
).
proof_step(2, 26, formula(repair_is_possible, w0, diamond(atom(repaired))), source(26)).
proof_step(
    2,
    27,
    formula(nested_possibility, w1, diamond(and(atom(clear), atom(clear)))),
    source(27)
).
proof_step(2, 28, formula(repair_not_necessary, w0, box(atom(repaired))), source(28)).
proof_step(2, 29, all_worlds([], atom(clear), true), rule(9, [])).
proof_step(2, 30, some_world([], atom(repaired), false), rule(11, [])).
proof_step(2, 31, all_worlds([], atom(repaired), true), rule(9, [])).
proof_step(2, 32, some_world([], and(atom(clear), atom(clear)), false), rule(11, [])).
proof_step(2, 33, atomic_value(w1, clear, true), rule(1, [13])).
proof_step(2, 34, atomic_value(w2, clear, true), rule(1, [14])).
proof_step(2, 35, atomic_value(w3, clear, true), rule(1, [15])).
proof_step(2, 36, atomic_value(w2, repaired, true), rule(1, [16])).
proof_step(2, 37, evaluate(w1, atom(clear), true), rule(5, [33])).
proof_step(2, 38, evaluate(w2, atom(clear), true), rule(5, [34])).
proof_step(
    2,
    39,
    '$aggregate:r3:2'([binding('W', w0)], [w1, w2]),
    aggregate(rule(3), 2, 1)
).
proof_step(2, 40, all_worlds([w2], atom(clear), true), rule(10, [38, 29, 17])).
proof_step(2, 41, successors(w0, [w1, w2]), rule(3, [1, 39])).
proof_step(2, 42, all_worlds([w1, w2], atom(clear), true), rule(10, [37, 40, 17])).
proof_step(2, 43, evaluate(w0, box(atom(clear)), true), rule(7, [41, 42])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 36).
proof_claim(2, answer(2, [43])).

% Check 2
proof_check(2, checked, [
    steps(43),
    claims(1),
    source_facts(28),
    rule_applications(14),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(42, 0)).
proof_condition(2, c2, "well-foundedness", checked(15, 0)).
proof_condition(2, c3, "justification", checked(45, 0)).
proof_condition(2, c4, "coverage", checked(99, 0)).
proof_condition(2, c5, "re-decision", checked(1, 0)).
proof_condition(2, c6, "boundary consistency", checked(2, 0)).
proof_condition(2, c7, "relevance", checked(44, 0)).
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
