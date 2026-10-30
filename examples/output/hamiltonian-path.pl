% Answer 1
answer(1, [
    binding("Count", 120)
]).

% Answer 2
hamiltonian_path([v5, v1, v2, v3, v6, v4]).

% Answer 3
hamiltonian_path([v5, v1, v2, v3, v6, v4]).

% Reason 3
proof_step(3, 1, edge(v1, v2), source(1)).
proof_step(3, 2, edge(v1, v5), source(3)).
proof_step(3, 3, edge(v2, v3), source(5)).
proof_step(3, 4, edge(v3, v6), source(9)).
proof_step(3, 5, edge(v4, v6), source(11)).
proof_step(3, 6, vertex(v1), source(12)).
proof_step(3, 7, vertex(v2), source(13)).
proof_step(3, 8, vertex(v3), source(14)).
proof_step(3, 9, vertex(v4), source(15)).
proof_step(3, 10, vertex(v5), source(16)).
proof_step(3, 11, vertex(v6), source(17)).
proof_step(3, 12, not_member(v2, []), rule(1, [])).
proof_step(3, 13, not_member(v3, []), rule(1, [])).
proof_step(3, 14, not_member(v6, []), rule(1, [])).
proof_step(3, 15, not_member(v1, []), rule(1, [])).
proof_step(3, 16, not_member(v4, []), rule(1, [])).
proof_step(3, 17, '\\='(v2, v1), builtin).
proof_step(3, 18, '\\='(v3, v1), builtin).
proof_step(3, 19, '\\='(v3, v2), builtin).
proof_step(3, 20, '\\='(v6, v1), builtin).
proof_step(3, 21, '\\='(v6, v2), builtin).
proof_step(3, 22, '\\='(v6, v3), builtin).
proof_step(3, 23, '\\='(v1, v5), builtin).
proof_step(3, 24, '\\='(v4, v2), builtin).
proof_step(3, 25, '\\='(v4, v3), builtin).
proof_step(3, 26, '\\='(v4, v5), builtin).
proof_step(3, 27, '\\='(v4, v6), builtin).
proof_step(3, 28, '\\='(v4, v1), builtin).
proof_step(3, 29, '\\='(v2, v5), builtin).
proof_step(3, 30, '\\='(v3, v5), builtin).
proof_step(3, 31, '\\='(v6, v5), builtin).
proof_step(3, 32, adjacent(v1, v2), rule(3, [1])).
proof_step(3, 33, adjacent(v5, v1), rule(4, [2])).
proof_step(3, 34, adjacent(v2, v3), rule(3, [3])).
proof_step(3, 35, adjacent(v3, v6), rule(3, [4])).
proof_step(3, 36, adjacent(v6, v4), rule(4, [5])).
proof_step(3, 37, not_member(v2, [v1]), rule(2, [17, 12])).
proof_step(3, 38, not_member(v3, [v2]), rule(2, [19, 13])).
proof_step(3, 39, not_member(v6, [v3]), rule(2, [22, 14])).
proof_step(3, 40, not_member(v1, [v5]), rule(2, [23, 15])).
proof_step(3, 41, not_member(v4, [v6]), rule(2, [27, 16])).
proof_step(3, 42, not_member(v2, [v5, v1]), rule(2, [29, 37])).
proof_step(3, 43, not_member(v3, [v1, v2]), rule(2, [18, 38])).
proof_step(3, 44, not_member(v6, [v2, v3]), rule(2, [21, 39])).
proof_step(3, 45, not_member(v4, [v3, v6]), rule(2, [25, 41])).
proof_step(3, 46, not_member(v3, [v5, v1, v2]), rule(2, [30, 43])).
proof_step(3, 47, not_member(v6, [v1, v2, v3]), rule(2, [20, 44])).
proof_step(3, 48, not_member(v4, [v2, v3, v6]), rule(2, [24, 45])).
proof_step(3, 49, not_member(v6, [v5, v1, v2, v3]), rule(2, [31, 47])).
proof_step(3, 50, not_member(v4, [v1, v2, v3, v6]), rule(2, [28, 48])).
proof_step(3, 51, not_member(v4, [v5, v1, v2, v3, v6]), rule(2, [26, 50])).
proof_step(
    3,
    52,
    hamiltonian_path([v5, v1, v2, v3, v6, v4]),
    rule(5, [10, 6, 33, 40, 7, 32, 42, 8, 34, 46, 11, 35, 49, 9, 36, 51])
).
proof_claim(3, answer(3, [52])).

% Check 3
proof_check(3, checked, [
    steps(52),
    claims(1),
    source_facts(11),
    rule_applications(26),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(3, c1, "resolution", checked(37, 0)).
proof_condition(3, c2, "well-foundedness", checked(26, 0)).
proof_condition(3, c3, "justification", checked(53, 0)).
proof_condition(3, c4, "coverage", checked(90, 0)).
proof_condition(3, c5, "re-decision", checked(15, 0)).
proof_condition(3, c6, "boundary consistency", checked(0, 0)).
proof_condition(3, c7, "relevance", checked(52, 0)).
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
