% Simulating a counter that changes one bit at a time
%
% Simulate a three-bit Gray-code counter, whose successive count states
% differ in one bit. Logic-gate truth tables calculate the next state.
%
% Supply a list of clock inputs and an initial three-bit state. A clock input
% of 1 loads the new state; 0 holds the current state. The result lists the
% state after each input, including a full cycle back to [0, 0, 0].
%
% Code from "Clause and Effect", Chapter 8.

:- table gcc/3, dff/4.

gcc([], _, []).
gcc([C|Cs], S, [N|Ns]) :-
    gcc(C, S, N),
    gcc(Cs, N, Ns).

gcc(C, [Qa, Qb, Qc], [Za, Zb, Zc]) :-
    neta(Qa, Qb, D1),
    netb(Qa, Qb, Qc, D2, D3),
    dff(D1, C, Qc, Zc),
    dff(D2, C, Qa, Za),
    dff(D3, C, Qb, Zb).

neta(A, B, Q) :-
    and(A, B, T1),
    inv(A, NA),
    inv(B, NB),
    and(NA, NB, T2),
    or(T1, T2, Q).

netb(A, B, C, Q1, Q2) :-
    and(A, C, T1),
    inv(C, NC),
    and(B, NC, T2),
    inv(A, NA),
    and(NA, C, T3),
    or(T1, T2, Q1),
    or(T2, T3, Q2).

dff(_, 0, Q, Q).
dff(D, 1, _, D).

and(0, 0, 0).
and(0, 1, 0).
and(1, 0, 0).
and(1, 1, 1).

or(0, 0, 0).
or(0, 1, 1).
or(1, 0, 1).
or(1, 1, 1).

inv(0, 1).
inv(1, 0).

% Answer
?- gcc([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0], States).

% Reason
?- why.

% Answer
?- gcc([0, 1, 0], [0, 0, 0], States).

% Check
?- check(gcc([1, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 0],
    [[0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0], [1, 1, 1],
     [1, 0, 1], [1, 0, 0], [0, 0, 0], [0, 0, 1]])).
?- check(gcc([0, 1, 0], [0, 0, 0], [[0, 0, 0], [0, 0, 1], [0, 0, 1]])).
?- check(gcc([], [0, 0, 0], [])).
