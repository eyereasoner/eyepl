% Checking possibility and necessity in a finite world model
%
% Four worlds have explicit accessibility links. A formula diamond(F) holds
% when at least one accessible world satisfies F; box(F) requires every such
% world to satisfy it. At w0 every accessible world is clear, and repair is
% possible but not necessary. Formula terms are data interpreted by rules.
% Boolean folds over collected successor worlds express the universal and
% existential tests without recursive negation. Only missing atomic evidence
% uses stratified negation, within this finite closed model.

:- table evaluate/3, all_worlds/3, some_world/3.

world(w0).
world(w1).
world(w2).
world(w3).
proposition(clear).
proposition(repaired).
accessible(w0, w1).
accessible(w0, w2).
accessible(w1, w1).
accessible(w1, w3).
accessible(w2, w2).
accessible(w3, w3).
true_at(w1, clear).
true_at(w2, clear).
true_at(w3, clear).
true_at(w2, repaired).

atomic_value(W, P, true) :- true_at(W, P).
atomic_value(W, P, false) :- world(W), proposition(P), \+ true_at(W, P).
successors(W, Worlds) :- world(W), aggregate_all(list(Next), accessible(W, Next), Worlds).

bool_and(true, true, true).
bool_and(true, false, false).
bool_and(false, true, false).
bool_and(false, false, false).
bool_or(true, true, true).
bool_or(true, false, true).
bool_or(false, true, true).
bool_or(false, false, false).

evaluate(W, top, true) :- world(W).
evaluate(W, atom(P), Value) :- atomic_value(W, P, Value).
evaluate(W, and(A, B), Value) :-
    evaluate(W, A, AV), evaluate(W, B, BV), bool_and(AV, BV, Value).
evaluate(W, box(F), Value) :- successors(W, Worlds), all_worlds(Worlds, F, Value).
evaluate(W, diamond(F), Value) :- successors(W, Worlds), some_world(Worlds, F, Value).
all_worlds([], _, true).
all_worlds([W | Rest], F, Value) :-
    evaluate(W, F, Head), all_worlds(Rest, F, Tail), bool_and(Head, Tail, Value).
some_world([], _, false).
some_world([W | Rest], F, Value) :-
    evaluate(W, F, Head), some_world(Rest, F, Tail), bool_or(Head, Tail, Value).

formula(all_accessible_worlds_clear, w0, box(atom(clear))).
formula(repair_is_possible, w0, diamond(atom(repaired))).
formula(nested_possibility, w1, diamond(and(atom(clear), atom(clear)))).
formula(repair_not_necessary, w0, box(atom(repaired))).
modal_result(Name, World, Formula, Value) :- formula(Name, World, Formula), evaluate(World, Formula, Value).

% Answer
?- modal_result(Name, World, Formula, Value).

% Reason
?- why(evaluate(w0, box(atom(clear)), true)).

% Check
?- check.
?- check(evaluate(w0, box(atom(clear)), true)).
?- check(evaluate(w0, diamond(atom(repaired)), true)).
?- check(evaluate(w0, box(atom(repaired)), false)).
?- check(evaluate(w1, diamond(and(atom(clear), atom(clear))), true)).
?- check(aggregate_all(count, modal_result(Name, W, F, true), 3)).
?- check(aggregate_all(count, modal_result(Name, W, F, false), 1)).
