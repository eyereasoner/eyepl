% Expressing a greatest common divisor as an integer combination
%
% Find the greatest common divisor G of two integers A and B, together with
% coefficients S and T satisfying A*S + B*T = G. The extended Euclidean
% algorithm tracks these coefficients while repeatedly taking remainders.
%
% The six cases cover common factors, coprime inputs, zero, and a negative
% input. Supply bound integers, not both zero. All calculations are exact;
% the checks compare the result with gcd/2 and the defining identity.

:- table bezout/5, euclid/9.

pair(c1, 48, 18).
pair(c2, 101, 462).
pair(c3, 0, 5).
pair(c4, 270, 192).
pair(c5, -27, 36).
pair(c6, 123456, 7890).

bezout(A, B, G, S, T) :-
    abs(A) + abs(B) > 0,
    R0 is abs(A), R1 is abs(B),
    euclid(R0, R1, 1, 0, 0, 1, G, U, V),
    S is sign(A) * U,
    T is sign(B) * V.

euclid(R0, 0, S0, _, T0, _, R0, S0, T0).
euclid(R0, R1, S0, S1, T0, T1, G, S, T) :-
    R1 > 0,
    Q is R0 div R1,
    R2 is R0 - Q * R1,
    S2 is S0 - Q * S1,
    T2 is T0 - Q * T1,
    euclid(R1, R2, S1, S2, T1, T2, G, S, T).

answer(Case, G, S, T) :- pair(Case, A, B), bezout(A, B, G, S, T).
identity_holds(Case) :-
    pair(Case, A, B), answer(Case, G, S, T),
    A*S + B*T =:= G, G =:= gcd(A, B).

% Answer
?- answer(Case, G, S, T).

% Reason
?- why(answer(c5, G, S, T)).

% Check
?- check.
?- check(answer(c1, 6, -1, 3)).
?- check(answer(c2, 1, 215, -47)).
?- check(answer(c3, 5, 0, 1)).
?- check(answer(c4, 6, 5, -7)).
?- check(answer(c5, 9, 1, 1)).
?- check(aggregate_all(count, identity_holds(Case), 6)).
?- check(bezout(5, 0, 5, 1, 0)).
?- check(bezout(0, -5, 5, 0, -1)).
?- check(\+ bezout(0, 0, 0, 0, 0)).
