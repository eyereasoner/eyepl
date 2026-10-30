% Answer 1
end_to_end_latency(edge_path, 47.0).

% Answer 2
status(edge_path, sla_compliant).

% Answer 3
sla_compliant(edge_path).

% Reason 3
proof_step(3, 1, path(edge_path, [link_a, link_b, link_c]), source(1)).
proof_step(3, 2, link_latency(link_a, 12.0), source(2)).
proof_step(3, 3, link_latency(link_b, 18.0), source(3)).
proof_step(3, 4, link_latency(link_c, 9.0), source(4)).
proof_step(3, 5, jitter(edge_path, 8.0), source(5)).
proof_step(3, 6, sla(edge_path, maximum_latency_ms, 50.0), source(6)).
proof_step(3, 7, latency_sum([], 0.0), source(7)).
proof_step(3, 8, is(9.0, '+'(9.0, 0.0)), builtin).
proof_step(3, 9, is(27.0, '+'(18.0, 9.0)), builtin).
proof_step(3, 10, is(39.0, '+'(12.0, 27.0)), builtin).
proof_step(3, 11, is(47.0, '+'(39.0, 8.0)), builtin).
proof_step(3, 12, '<'(47.0, 50.0), builtin).
proof_step(3, 13, latency_sum([link_c], 9.0), rule(1, [4, 7, 8])).
proof_step(3, 14, latency_sum([link_b, link_c], 27.0), rule(1, [3, 13, 9])).
proof_step(3, 15, latency_sum([link_a, link_b, link_c], 39.0), rule(1, [2, 14, 10])).
proof_step(3, 16, end_to_end_latency(edge_path, 47.0), rule(2, [1, 15, 5, 11])).
proof_step(3, 17, sla_compliant(edge_path), rule(3, [16, 6, 12])).
proof_claim(3, answer(3, [17])).

% Check 3
proof_check(3, checked, [
    steps(17),
    claims(1),
    source_facts(7),
    rule_applications(5),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(12, 0)).
proof_condition(3, c2, "well-foundedness", checked(5, 0)).
proof_condition(3, c3, "justification", checked(18, 0)).
proof_condition(3, c4, "coverage", checked(30, 0)).
proof_condition(3, c5, "re-decision", checked(5, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(17, 0)).
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
