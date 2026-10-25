% Following the Collatz sequence
%
% Generate Collatz sequences for the starting integers 1 through 20. Halve an
% even number; replace an odd number by three times that number plus one.
% Each sequence ends when it reaches 1. The checks verify these starting
% values, without establishing that every positive integer eventually reaches
% 1.

:- table trajectory/2, in_range/3.

trajectory(1, [1]).
trajectory(N, [N | Rest]) :-
    N > 1,
    0 =:= N mod 2,
    Next is N // 2,
    trajectory(Next, Rest).
trajectory(N, [N | Rest]) :-
    N > 1,
    1 =:= N mod 2,
    Next is 3 * N + 1,
    trajectory(Next, Rest).

% A range of starting values, enumerated by ordinary clauses.
in_range(Low, High, Low) :-
    Low =< High.
in_range(Low, High, N) :-
    Low < High,
    Next is Low + 1,
    in_range(Next, High, N).

% Answer
?- in_range(1, 20, N), trajectory(N, Values).

% Reason
?- why.

% Check
?- check(trajectory(1, [1])).
?- check(trajectory(6, [6, 3, 10, 5, 16, 8, 4, 2, 1])).
?- check(trajectory(20, [20, 10, 5, 16, 8, 4, 2, 1])).
?- check(aggregate_all(count, (in_range(1, 20, N), trajectory(N, Values)), 20)).
