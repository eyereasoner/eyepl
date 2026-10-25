% Approaching the square root of two with exact fractions
%
% The continued fraction [1;2,2,...] begins 1/1, 3/2, 7/5, 17/12. Each new
% numerator and denominator is twice its predecessor plus the preceding
% value. Tabled rules compute these exact integers and check that
% P*P - 2*Q*Q alternates between -1 and 1. The samples reach index 15, with
% the initial 1/1 indexed as zero; no floating approximation is needed.

:- table in_range/3, pell_error/2.

in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

:- table conv/3.

conv(0, 1, 1).
conv(1, 3, 2).
conv(N, P, Q) :-
  (N > 1),
  (N1 is N - 1),
  (N2 is N - 2),
  conv(N1, P1, Q1),
  conv(N2, P2, Q2),
  (Twicep1 is 2 * P1),
  (P is Twicep1 + P2),
  (Twiceq1 is 2 * Q1),
  (Q is Twiceq1 + Q2).

pell_error(N, Error) :-
  conv(N, P, Q),
  (P2 is P * P),
  (Q2 is Q * Q),
  (Twiceq2 is 2 * Q2),
  (Error is P2 - Twiceq2).

convergent_answer(convergent_10, fraction(P, Q)) :- conv(10, P, Q).
convergent_answer(convergent_15, fraction(P, Q)) :- conv(15, P, Q).
convergent_answer(pell_error_15, Error) :- pell_error(15, Error).
convergent_answer(numerator_sum_0_to_10, Sum) :- aggregate_all(sum(P), (in_range(0, 10, N), conv(N, P, _q)), Sum).

% Answer
?- convergent_answer(Kind, Value).

% Reason
?- why(conv(3, P, Q)).

% Check
?- check.
?- check(conv(0, 1, 1)).
?- check(conv(3, 17, 12)).
?- check(conv(10, 8119, 5741)).
?- check(pell_error(0, -1)).
?- check(pell_error(15, 1)).
?- check(aggregate_all(count, (in_range(0, 15, N), pell_error(N, E), abs(E) =:= 1), 16)).
