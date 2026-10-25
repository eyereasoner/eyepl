% Finding a safe sequence of river crossings
%
% A traveler must carry a wolf, goat, and cabbage from the west bank to the
% east bank. The boat carries the traveler and at most one other item. The
% wolf cannot stay with the goat, nor the goat with the cabbage, unless the
% traveler is on their bank.
%
% A state records the banks of the traveler, wolf, goat, and cabbage in that
% order. Rules derive safe crossings and enumerate routes without revisiting
% a state. A minimum aggregate selects both seven-crossing solutions; each
% crossing costs one, including a crossing with an empty boat.

:- table move/3, member/2, crossings/6.

side(west).
side(east).
change(west, east).
change(east, west).

unsafe(state(Person, Wolf, Goat, Cabbage)) :-
    side(Person), side(Wolf), side(Goat), side(Cabbage),
    Wolf = Goat, Person \= Goat.
unsafe(state(Person, Wolf, Goat, Cabbage)) :-
    side(Person), side(Wolf), side(Goat), side(Cabbage),
    Goat = Cabbage, Person \= Goat.
safe(state(Person, Wolf, Goat, Cabbage)) :-
    side(Person), side(Wolf), side(Goat), side(Cabbage),
    \+ unsafe(state(Person, Wolf, Goat, Cabbage)).

move(state(X, X, G, C), wolf, state(Y, Y, G, C)) :- change(X, Y).
move(state(X, W, X, C), goat, state(Y, W, Y, C)) :- change(X, Y).
move(state(X, W, G, X), cabbage, state(Y, W, G, Y)) :- change(X, Y).
move(state(X, W, G, C), nothing, state(Y, W, G, C)) :- change(X, Y).
crossing(From, Item, To) :- safe(From), move(From, Item, To), safe(To).

member(X, [X | _]).
member(X, [_ | Rest]) :- member(X, Rest).
crossings(Goal, Goal, _, [Goal], [], 0).
crossings(State, Goal, Visited, [State | States], [Item | Moves], Cost) :-
    State \= Goal, crossing(State, Item, Next), \+ member(Next, Visited),
    crossings(Next, Goal, [Next | Visited], States, Moves, Before),
    Cost is Before + 1.
route(States, Moves, Cost) :-
    crossings(state(west, west, west, west), state(east, east, east, east),
        [state(west, west, west, west)], States, Moves, Cost).
solution(Moves, Cost) :-
    aggregate_all(min(Value), route(States, Items, Value), Cost),
    route(Path, Moves, Cost).

% Answer
?- solution(Moves, Cost).

% Reason
?- why(solution([goat, nothing, wolf, goat, cabbage, nothing, goat], 7)).

% Check
?- check.
?- check(solution([goat, nothing, wolf, goat, cabbage, nothing, goat], 7)).
?- check(solution([goat, nothing, cabbage, goat, wolf, nothing, goat], 7)).
?- check(aggregate_all(count, solution(Moves, Cost), 2)).
?- check(aggregate_all(count, safe(State), 10)).
?- check(\+ safe(state(east, west, west, east))).
?- check(\+ safe(state(east, east, west, west))).
?- check(\+ crossing(state(west, west, west, west), nothing, state(east, west, west, west))).
