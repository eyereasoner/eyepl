% Following information growth in a finite constructive model
%
% Information grows from root through left and right to both. Proposition p
% becomes known on the left and q on the right; knowledge persists upward.
% An implication holds only when every future world that forces its premise
% also forces its conclusion. Negation means implication to bottom.
% At root, p or q and excluded middle are not forced, while double negation
% of p or q is forced. Explicit Boolean evaluation and finite list folds
% encode these tests as ordinary rules, avoiding recursive negation.

:- table evaluate/3, implications/4.

world(root).
world(left).
world(right).
world(both).
proposition(p).
proposition(q).
step(root, left).
step(root, right).
step(left, both).
step(right, both).
base(left, p).
base(right, q).
leq(W, W) :- world(W).
leq(From, To) :- step(From, Mid), leq(Mid, To).
known(W, P) :- leq(Earlier, W), base(Earlier, P).
atomic_value(W, P, true) :- known(W, P).
atomic_value(W, P, false) :- world(W), proposition(P), \+ known(W, P).
future_worlds(W, Worlds) :- world(W), aggregate_all(list(Future), leq(W, Future), Worlds).

bool_and(true, true, true).
bool_and(true, false, false).
bool_and(false, true, false).
bool_and(false, false, false).
bool_or(true, true, true).
bool_or(true, false, true).
bool_or(false, true, true).
bool_or(false, false, false).

bool_implies(true, true, true).
bool_implies(true, false, false).
bool_implies(false, true, true).
bool_implies(false, false, true).

evaluate(W, bottom, false) :- world(W).
evaluate(W, atom(P), Value) :- atomic_value(W, P, Value).
evaluate(W, and(A, B), Value) :-
    evaluate(W, A, AV), evaluate(W, B, BV), bool_and(AV, BV, Value).
evaluate(W, or(A, B), Value) :-
    evaluate(W, A, AV), evaluate(W, B, BV), bool_or(AV, BV, Value).
evaluate(W, implies(A, B), Value) :-
    future_worlds(W, Worlds), implications(Worlds, A, B, Value).
evaluate(W, neg(F), Value) :- evaluate(W, implies(F, bottom), Value).
implications([], _, _, true).
implications([W | Rest], A, B, Value) :-
    evaluate(W, A, AV), evaluate(W, B, BV), bool_implies(AV, BV, Head),
    implications(Rest, A, B, Tail), bool_and(Head, Tail, Value).

formula(monotone_p_reaches_both, both, atom(p)).
formula(constructive_case_analysis, root, implies(atom(p), or(atom(p), atom(q)))).
formula(double_negated_branch_information, root, neg(neg(or(atom(p), atom(q))))).
formula(root_does_not_decide_branch, root, or(atom(p), atom(q))).
formula(excluded_middle_not_forced, root, or(atom(p), neg(atom(p)))).
intuitionistic_result(Name, W, F, Value) :- formula(Name, W, F), evaluate(W, F, Value).

% Answer
?- intuitionistic_result(Name, World, Formula, Value).

% Reason
?- why(evaluate(both, atom(p), true)).

% Check
?- check.
?- check(evaluate(both, atom(p), true)).
?- check(evaluate(both, atom(q), true)).
?- check(evaluate(root, implies(atom(p), or(atom(p), atom(q))), true)).
?- check(evaluate(root, neg(neg(or(atom(p), atom(q)))), true)).
?- check(evaluate(root, or(atom(p), atom(q)), false)).
?- check(evaluate(root, or(atom(p), neg(atom(p))), false)).
?- check(aggregate_all(count, intuitionistic_result(Name, W, F, true), 3)).
?- check(aggregate_all(count, intuitionistic_result(Name, W, F, false), 2)).
