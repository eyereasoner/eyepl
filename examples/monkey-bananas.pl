% Planning how a monkey can reach bananas
%
% Bananas hang at loc1, a monkey starts at loc2, and a box starts at loc3.
% The monkey can walk, push the box while on the ground, climb on or off it,
% and grab the bananas when standing on the box beneath them.
% A state lists banana location, monkey location, box location, whether the
% monkey is on the box, and whether it holds the bananas. Rules try plans
% of three, four, or five moves. The shortest successful plan has four;
% the finite depth bound prevents unending walks or climbing cycles.

:- table legal_move/3, reachable/4.

location(loc1).
location(loc2).
location(loc3).
plan_length(3).
plan_length(4).
plan_length(5).
initial_state([loc1, loc2, loc3, n, n]).

legal_move([B, M, M, n, H], climb_on, [B, M, M, y, H]).
legal_move([B, M, M, y, H], climb_off, [B, M, M, n, H]).
legal_move([B, B, B, y, n], grab, [B, B, B, y, y]).
legal_move([B, M, M, n, H], push(X), [B, X, X, n, H]) :- location(X), X \= M.
legal_move([B, M, L, n, H], go(X), [B, X, L, n, H]) :- location(X), X \= M.

reachable(State, 0, [], State).
reachable(State, Depth, [Move | Moves], Final) :-
    Depth > 0, legal_move(State, Move, Next), Rest is Depth-1,
    reachable(Next, Rest, Moves, Final).
plan(Length, Moves) :-
    plan_length(Length), initial_state(Start), reachable(Start, Length, Moves, Final),
    Final = [_, _, _, _, y].

% Answer
?- plan(Length, Moves).

% Reason
?- why(plan(4, [go(loc3), push(loc1), climb_on, grab])).

% Check
?- check.
?- check(plan(4, [go(loc3), push(loc1), climb_on, grab])).
?- check(aggregate_all(count, plan(3, Moves), 0)).
?- check(aggregate_all(count, plan(4, Moves), 1)).
?- check(\+ legal_move([loc1, loc1, loc1, n, n], grab, [loc1, loc1, loc1, n, y])).
?- check(\+ legal_move([loc1, loc1, loc1, y, n], go(loc2), [loc1, loc2, loc1, y, n])).
