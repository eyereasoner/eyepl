% Finding paths that visit every vertex exactly once
%
% A six-vertex undirected graph has 120 directed Hamiltonian paths. Each
% visits all six vertices once, following an edge at every step. Reversing
% a path counts separately, so the result represents 60 routes up to reversal.
% The finite rule lists six positions explicitly. A recursive list helper
% checks that each new vertex differs from every vertex in the prefix.
% The proof selects one path; the count and additional checks cover the
% complete answer set.

:- table not_member/2.

not_member(_, []).
not_member(X, [Y | Rest]) :- X \= Y, not_member(X, Rest).

edge(v1, v2).
edge(v1, v3).
edge(v1, v5).
edge(v1, v6).
edge(v2, v3).
edge(v2, v4).
edge(v2, v6).
edge(v3, v4).
edge(v3, v6).
edge(v4, v5).
edge(v4, v6).

adjacent(V, U) :- edge(V, U).
adjacent(V, U) :- edge(U, V).

vertex(v1).
vertex(v2).
vertex(v3).
vertex(v4).
vertex(v5).
vertex(v6).

hamiltonian_path([A, B, C, D, E, F]) :-
  vertex(A),
  vertex(B), adjacent(A, B), not_member(B, [A]),
  vertex(C), adjacent(B, C), not_member(C, [A, B]),
  vertex(D), adjacent(C, D), not_member(D, [A, B, C]),
  vertex(E), adjacent(D, E), not_member(E, [A, B, C, D]),
  vertex(F), adjacent(E, F), not_member(F, [A, B, C, D, E]).

hasHamiltonianPath(graph, true) :-
  hamiltonian_path(_path).

hamiltonianPath(graph, Path) :-
  hamiltonian_path(Path).

% Answer
?- aggregate_all(count, hamiltonian_path(Path), Count).
?- hamiltonian_path([v5, v1, v2, v3, v6, Last]).

% Reason
?- why(hamiltonian_path([v5, v1, v2, v3, v6, v4])).

% Check
?- check.
?- check(aggregate_all(count, hamiltonian_path(Path), 120)).
?- check(hamiltonian_path([v5, v1, v2, v3, v6, v4])).
?- check(\+ hamiltonian_path([v1, v2, v3, v4, v5, v1])).
?- check(\+ hamiltonian_path([v1, v2, v3, v4, v6, v5])).
