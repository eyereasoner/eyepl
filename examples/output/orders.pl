% Witnesses
witness(w1, W) :- fresh(W).

% Answer 1
voucher(ada, W1, 15) :-
    witness(w1, W1).

% Reason 1
proof_witness(1, w1, "r3:g2:{\"Customer\": Symbol(\"ada\"), \"Total\": Integer(15)}").
proof_step(1, 1, customer(ada), source(1)).
proof_step(1, 2, customer(bea), source(2)).
proof_step(1, 3, line(ada, book, 12), source(3)).
proof_step(1, 4, line(ada, pen, 3), source(4)).
proof_step(1, 5, line(bea, map, 7), source(5)).
proof_step(1, 6, blocked(bea), source(6)).
proof_step(
    1,
    7,
    '$aggregate:r1:2'([binding('Customer', ada)], 15),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 8, subtotal(ada, 15), rule(1, [1, 7])).
proof_step(1, 9, blocked(ada), absent(1)).
proof_step(1, 10, '>='(15, 10), builtin).
proof_step(1, 11, eligible(ada, 15), rule(2, [8, 9, 10])).
proof_step(1, 12, '$satisfied:1'(ada, 15), absent(1)).
proof_step(1, 13, '$lean:1'(ada, 15), rule(5, [11, 12])).
proof_step(1, 14, '$fresh:r3:2'(ada, 15, witness(w1)), fresh(3, 2)).
proof_step(1, 15, voucher(ada, witness(w1), 15), rule(3, [13, 14])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 6).
proof_claim(1, answer(1, [15])).

% Check 1
proof_check(1, checked, [
    steps(15),
    claims(1),
    source_facts(6),
    rule_applications(4),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(10, 0)).
proof_condition(1, c2, "well-foundedness", checked(7, 0)).
proof_condition(1, c3, "justification", checked(17, 0)).
proof_condition(1, c4, "coverage", checked(34, 0)).
proof_condition(1, c5, "re-decision", checked(2, 0)).
proof_condition(1, c6, "boundary consistency", checked(4, 0)).
proof_condition(1, c7, "relevance", checked(16, 0)).
proof_condition(1, c8, "witness integrity", checked(3, 0)).
proof_condition(1, c9, "query isolation", checked(1, 0)).
