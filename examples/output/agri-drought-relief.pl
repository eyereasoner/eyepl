% Witnesses
witness(w1, W) :- fresh(W).

% Answer 1
status(dr01, submitted).
status(dr01, approved).

% Answer 2
issued_payment(dr01, W1) :-
    witness(w1, W1).

% Reason 2
proof_witness(2, w1, "r5:g2:{\"App\": Symbol(\"dr01\")}").
proof_step(2, 1, application(dr01, drought_relief, alpha), source(1)).
proof_step(2, 2, status(dr01, submitted), source(2)).
proof_step(2, 3, evidence(dr01, area), source(3)).
proof_step(2, 4, evidence(dr01, rainfall), source(4)).
proof_step(2, 5, evidence(dr01, yield), source(5)).
proof_step(2, 6, farm(alpha, 8, 12, 100, 60), source(6)).
proof_step(2, 7, '>='(8, 5), builtin).
proof_step(2, 8, '<'(12, 20), builtin).
proof_step(2, 9, is(40, '-'(100, 60)), builtin).
proof_step(2, 10, '>='(40, 30), builtin).
proof_step(2, 11, '$fresh:r5:2'(dr01, witness(w1)), fresh(5, 2)).
proof_step(2, 12, '>='(5, 5), builtin).
proof_step(2, 13, '<'(19, 20), builtin).
proof_step(2, 14, is(30, '-'(100, 70)), builtin).
proof_step(2, 15, '>='(30, 30), builtin).
proof_step(2, 16, qualifies(8, 12, 100, 60), rule(1, [7, 8, 9, 10])).
proof_step(2, 17, qualifies(5, 19, 100, 70), rule(1, [12, 13, 14, 15])).
proof_step(2, 18, eligible(dr01, true), rule(2, [1, 6, 16])).
proof_step(2, 19, status(dr01, approved), rule(3, [18, 2])).
proof_step(2, 20, '$satisfied:1'(dr01), absent(1)).
proof_step(2, 21, '$lean:1'(dr01), rule(7, [19, 20])).
proof_step(2, 22, issued_payment(dr01, witness(w1)), rule(5, [21, 11])).
proof_boundary(2, 1, 0).
proof_boundary_steps(2, 1, 1, 6).
proof_boundary_steps(2, 1, 16, 19).
proof_boundary_call(2, 1, qualifies(4, 12, 100, 60)).
proof_boundary_call(2, 1, qualifies(5, 19, 100, 70)).
proof_boundary_call(2, 1, qualifies(8, 12, 100, 60)).
proof_boundary_call(2, 1, qualifies(8, 12, 100, 71)).
proof_boundary_call(2, 1, qualifies(8, 20, 100, 60)).
proof_claim(2, answer(2, [22])).

% Check 2
proof_check(2, checked, [
    steps(22),
    claims(1),
    source_facts(6),
    rule_applications(6),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(2, c1, "resolution", checked(12, 0)).
proof_condition(2, c2, "well-foundedness", checked(7, 0)).
proof_condition(2, c3, "justification", checked(24, 0)).
proof_condition(2, c4, "coverage", checked(44, 0)).
proof_condition(2, c5, "re-decision", checked(8, 0)).
proof_condition(2, c6, "boundary consistency", checked(2, 0)).
proof_condition(2, c7, "relevance", checked(23, 0)).
proof_condition(2, c8, "witness integrity", checked(3, 0)).
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

% Goal check 11
check_result(11, true).

% Goal check 12
check_result(12, true).
