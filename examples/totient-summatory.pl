% Counting integers that share no common factor
%
% Euler's totient phi(N) counts the integers from 1 through N whose greatest
% common divisor with N is 1. Euclid's remainder algorithm supplies the gcd;
% count and sum aggregates give individual totients and a cumulative total.
% The queries include phi(36), phi(97), and the sum through 30. Supply positive
% integer inputs. Shared tabled calls keep the finite calculations small,
% and all results are exact integers. The proof traces one coprimality test.

:- table in_range/3, totient/2, coprime_upto/2, summatory_totient/2.

in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

:- table gcd/3.

gcd(A, 0, A) :- (A >= 0).
gcd(A, B, G) :-
  (B > 0),
  (R is A mod B),
  gcd(B, R, G).

coprime_upto(N, K) :-
  in_range(1, N, K),
  gcd(N, K, 1).

totient(N, Count) :-
  (N > 0),
  aggregate_all(count, coprime_upto(N, _k), Count).

summatory_totient(Limit, Sum) :-
  aggregate_all(sum(Phi), (in_range(1, Limit, N), totient(N, Phi)), Sum).

totient_answer(phi_36, Phi) :- totient(36, Phi).
totient_answer(phi_97, Phi) :- totient(97, Phi).
totient_answer(coprime_count_84, Count) :- totient(84, Count).
totient_answer(summatory_phi_30, Sum) :- summatory_totient(30, Sum).

% Answer
?- totient_answer(Kind, Count).

% Reason
?- why(coprime_upto(9, 5)).

% Check
?- check.
?- check(totient(1, 1)).
?- check(totient(36, 12)).
?- check(totient(97, 96)).
?- check(totient(84, 24)).
?- check(summatory_totient(30, 278)).
?- check(gcd(84, 30, 6)).
