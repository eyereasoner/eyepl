% Grouping the six rearrangements of three objects
%
% Explore S3, the group of six ways to rearrange three objects. A permutation
% lists where 1, 2, and 3 go; product P*Q applies Q first and then P.
%
% The subgroup containing the identity and the swap of 1 and 2 has two
% members. Multiplying it on the left gives three disjoint two-member sets,
% called left cosets. Their sizes illustrate Lagrange's identity: 6 = 2*3.
% The program also finds a difference between left and right cosets, showing
% that this subgroup is not normal. Checks cover this supplied finite group.

:- table apply/3, compose/3.

element(e,    [1, 2, 3]).
element(t12,  [2, 1, 3]).
element(t13,  [3, 2, 1]).
element(t23,  [1, 3, 2]).
element(c123, [2, 3, 1]).
element(c132, [3, 1, 2]).
subgroup(e).
subgroup(t12).

apply([A, _, _], 1, A).
apply([_, B, _], 2, B).
apply([_, _, C], 3, C).
compose(P, [A, B, C], [X, Y, Z]) :- apply(P, A, X), apply(P, B, Y), apply(P, C, Z).
product(P, Q, R) :- element(P, ImagesP), element(Q, ImagesQ), compose(ImagesP, ImagesQ, ImagesR), element(R, ImagesR).
inverse(P, Q) :- product(P, Q, e), product(Q, P, e).
left_member(P, Member) :- element(P, _), subgroup(H), product(P, H, Member).
right_member(P, Member) :- element(P, _), subgroup(H), product(H, P, Member).
smaller_left_member(P) :- left_member(P, Member), Member @< P.
left_coset(P, Member) :- left_member(P, Member), \+ smaller_left_member(P).
representative(P) :- left_coset(P, _).
covered(Member) :- left_coset(_, Member).
cosets_overlap :- left_coset(P, Member), left_coset(Q, Member), P \= Q.
normality_counterexample(P, Member) :- left_member(P, Member), \+ right_member(P, Member).
associativity_failure :-
  product(P, Q, PQ), product(PQ, R, Left), product(Q, R, QR), product(P, QR, Right), Left \= Right.
identity_failure :- element(P, _), product(e, P, Left), Left \= P.
identity_failure :- element(P, _), product(P, e, Right), Right \= P.
subgroup_closure_failure :- subgroup(P), subgroup(Q), product(P, Q, R), \+ subgroup(R).
lagrange(Order, SubgroupOrder, Index) :-
  aggregate_all(count, element(P, Images), Order),
  aggregate_all(count, subgroup(P), SubgroupOrder),
  aggregate_all(count, representative(P), Index),
  Order =:= SubgroupOrder * Index.

% Answer
?- left_coset(Representative, Member).

% Reason
?- why(left_coset(c123, Member)).

% Answer
?- lagrange(Order, SubgroupOrder, Index).

% Reason
?- why.

% Answer
?- normality_counterexample(Permutation, Member).

% Check
?- check(lagrange(6, 2, 3)).
?- check(aggregate_all(count, product(P, Q, R), 36)).
?- check(aggregate_all(count, inverse(P, Q), 6)).
?- check(aggregate_all(count, covered(P), 6)).
?- check(aggregate_all(count, left_coset(P, Member), 6)).
?- check(\+ cosets_overlap).
?- check(\+ associativity_failure).
?- check(\+ identity_failure).
?- check(\+ subgroup_closure_failure).
?- check(normality_counterexample(c123, t13)).
?- check(product(c123, c132, e)).
