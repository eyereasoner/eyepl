% Finding cousins in a labeled family tree
%
% Identify cousin pairs in a supplied family tree by comparing generation
% numbers and inherited branch labels. In this model, people count as cousins
% when they share a generation but belong to different labeled branches. This
% is a classification for the given tree, rather than a general calculation
% of cousin degree or generations removed.

parent(adam, bob).
parent(adam, carol).
parent(bob, dave).
parent(bob, eve).
parent(carol, frank).
parent(carol, grace).
parent(dave, heidi).
parent(eve, ivan).
parent(frank, judy).
generation(adam, 0).
branch(dave, b).
branch(eve, b).
branch(frank, c).
branch(grace, c).

generation(Child, Next) :-
    parent(Parent, Child),
    generation(Parent, N),
    Next is N + 1.
branch(Child, Branch) :-
    parent(Parent, Child),
    branch(Parent, Branch).
cousin(X, Y) :-
    generation(X, N),
    generation(Y, N),
    branch(X, A),
    branch(Y, B),
    A \= B.

% Answer
?- cousin(X, Y).

% Reason
?- why(cousin(heidi, judy)).

% Answer
?- generation(heidi, N).
?- branch(judy, Branch).

% Check
?- check(cousin(dave, frank)).
?- check(cousin(frank, dave)).
?- check(cousin(heidi, judy)).
?- check(cousin(judy, heidi)).
?- check(\+ cousin(dave, eve)).
?- check(\+ cousin(dave, judy)).
?- check(\+ cousin(dave, dave)).
?- check(generation(heidi, 3)).
?- check(branch(judy, c)).
?- check(aggregate_all(count, cousin(X, Y), 12)).
