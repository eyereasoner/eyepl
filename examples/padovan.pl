% Generating a sequence and its neighboring-term ratios
%
% Generate the integer sequence starting with P(0)=0, P(1)=1, and P(2)=1,
% then using P(n)=P(n-2)+P(n-3). This example uses that stated indexing of
% the Padovan sequence and keeps even very large integer values exactly.
%
% Ratios of neighboring terms approach about 1.324718, called the plastic
% constant. The ratio calculations use approximate real arithmetic.
%
% See https://en.wikipedia.org/wiki/Padovan_sequence

:- table padovan/2, padovan/5, plastic_ratio/2.

padovan(A, B) :-
    padovan(A, 0, 1, 1, B).

padovan(0, A, _, _, A).
padovan(1, _, A, _, A).
padovan(2, _, _, A, A).
padovan(A, B, C, D, E) :-
    A > 2,
    F is A-1,
    G is B+C,
    padovan(F, C, D, G, E).

plastic_ratio(A, B) :-
    padovan(A, C),
    D is A+1,
    padovan(D, E),
    B is E/C.

% Answer
?- padovan(1, Value).
?- padovan(2, Value).
?- padovan(3, Value).
?- padovan(4, Value).
?- padovan(5, Value).

% Reason
?- why.

% Answer
?- padovan(91, Value).
?- padovan(283, Value).
?- padovan(3674, Value).
?- plastic_ratio(1, Ratio).
?- plastic_ratio(10, Ratio).
?- plastic_ratio(100, Ratio).
?- plastic_ratio(1000, Ratio).

% Check
?- check(padovan(0, 0)).
?- check(padovan(5, 2)).
?- check(padovan(91, 70748973084)).
?- check(padovan(283, 19834325738278984504790864536272129)).
?- check((padovan(3674, Value), padovan(3672, A), padovan(3671, B), Value =:= A + B)).
?- check((plastic_ratio(1000, Ratio), abs(Ratio - 1.324717957244746) < 1.0e-14)).
