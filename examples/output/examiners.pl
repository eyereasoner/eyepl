% Answer 1
examiner(philosophy, russell).

% Answer 2
examiners(philosophy, 1).

% Reason 2
proof_step(2, 1, teacher(philosophy, russell), source(1)).
proof_step(2, 2, teacher(philosophy, wittgenstein), source(2)).
proof_step(2, 3, participant(philosophy, wittgenstein), source(3)).
proof_step(2, 4, student(wittgenstein), rule(1, [3])).
proof_step(2, 5, student(russell), absent(1)).
proof_step(2, 6, examiner(philosophy, russell), rule(2, [1, 5])).
proof_step(2, 7, '$satisfied:1'(philosophy), rule(5, [6])).
proof_step(
    2,
    8,
    '$aggregate:r4:2'(
        [binding('Course', philosophy), binding('Person', wittgenstein)],
        1
    ),
    aggregate(rule(4), 2, 2)
).
proof_step(2, 9, examiners(philosophy, 1), rule(4, [3, 8])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 4).
proof_boundary(2, 2, 2).
proof_boundary_steps(2, 2, 1, 4).
proof_boundary_steps(2, 2, 6, 7).
proof_claim(2, answer(2, [9])).

% Check 2
proof_check(2, checked, [
    steps(9),
    claims(1),
    source_facts(3),
    rule_applications(4),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(7, 0)).
proof_condition(2, c2, "well-foundedness", checked(6, 0)).
proof_condition(2, c3, "justification", checked(12, 0)).
proof_condition(2, c4, "coverage", checked(29, 0)).
proof_condition(2, c5, "re-decision", checked(1, 0)).
proof_condition(2, c6, "boundary consistency", checked(4, 0)).
proof_condition(2, c7, "relevance", checked(11, 0)).
proof_condition(2, c8, "witness integrity", checked(0, 0)).
proof_condition(2, c9, "query isolation", checked(1, 0)).
