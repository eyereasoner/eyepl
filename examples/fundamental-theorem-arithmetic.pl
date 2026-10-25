% Factoring an integer and reconstructing its value
%
% Repeatedly remove the smallest divisor of 202,692,987 to obtain
% [3,3,7,829,3881]. A reversed list gives the factors in descending order.
% Rules multiply the factors back together, verify their primality, and
% count four distinct prime factors. Trial division stops once a divisor's
% square exceeds the remaining number. This is a readable factorizer for
% the supplied positive integer, not a method for large cryptographic inputs.
% The proof follows the smaller factorization of 49 to keep it brief.

:- table smallest_divisor_from/3, factor_largest/2, append/3, reverse/2, reverse_into/3, member/2.

smallest_divisor_from(N, D, N) :- D*D > N.
smallest_divisor_from(N, D, D) :- D*D =< N, N mod D =:= 0.
smallest_divisor_from(N, D, Factor) :-
    D*D =< N, N mod D =\= 0, Next is D+1,
    smallest_divisor_from(N, Next, Factor).
append([], Ys, Ys).
append([X | Xs], Ys, [X | Rest]) :- append(Xs, Ys, Rest).
reverse(List, Reversed) :- reverse_into(List, [], Reversed).
reverse_into([], Acc, Acc).
reverse_into([X | Xs], Acc, Result) :- reverse_into(Xs, [X | Acc], Result).
member(X, [X | _]).
member(X, [_ | Rest]) :- member(X, Rest).

:- table factor_smallest/2.

case(fta, 202692987).
expected_factors(fta, [3, 3, 7, 829, 3881]).

divides(A, B) :-
  (A > 0),
  (B > 0),
  (0 is B mod A).

trial_prime(2).
trial_prime(3).
trial_prime(P) :-
  (P > 3),
  smallest_divisor_from(P, 2, P).

factor_smallest(N, []) :-
  (N < 2).

factor_smallest(N, [N]) :-
  (N >= 2),
  smallest_divisor_from(N, 2, N).

factor_smallest(N, Factors) :-
  (N >= 2),
  smallest_divisor_from(N, 2, D),
  (D \= N),
  (Q is N // D),
  factor_smallest(D, Left),
  factor_smallest(Q, Right),
  append(Left, Right, Factors).

factor_largest(N, Factors) :-
  factor_smallest(N, Smallest),
  reverse(Smallest, Factors).

factor_product([], 1).
factor_product([X|Rest], P) :-
  factor_product(Rest, P0),
  (P is X * P0).

all_expected_primes(true) :-
  trial_prime(3),
  trial_prime(7),
  trial_prime(829),
  trial_prime(3881).

n(case, N) :-
  case(fta, N).

factorsSmallest(case, Factors) :-
  case(fta, N),
  factor_smallest(N, Factors).

factorsLargest(case, Factors) :-
  case(fta, N),
  factor_largest(N, Factors).

product(case, Product) :-
  case(fta, N),
  factor_smallest(N, Factors),
  factor_product(Factors, Product).

expectedFactorsMatched(case, true) :-
  case(fta, N),
  expected_factors(fta, Factors),
  factor_smallest(N, Factors).

productReconstructsInput(case, true) :-
  case(fta, N),
  factor_smallest(N, Factors),
  factor_product(Factors, N).

prime_factor(P) :- case(fta, N), factor_smallest(N, Factors), member(P, Factors).
distinctPrimeCount(case, Count) :- aggregate_all(count, prime_factor(P), Count).

smallestPrimeFactor(case, 3) :-
  case(fta, N),
  factor_smallest(N, [3|_]).

largestPrimeFactor(case, 3881) :-
  case(fta, N),
  factor_largest(N, [3881|_]).

% Answer
?- factorsSmallest(Case, Factors).
?- factorsLargest(Case, Factors).
?- product(Case, Product).
?- distinctPrimeCount(Case, Count).

% Reason
?- why(factor_smallest(49, [7, 7])).

% Check
?- check.
?- check(expectedFactorsMatched(case, true)).
?- check(productReconstructsInput(case, true)).
?- check(distinctPrimeCount(case, 4)).
?- check(all_expected_primes(true)).
?- check(factor_smallest(1, [])).
?- check(factor_smallest(49, [7, 7])).
?- check(factor_smallest(13, [13])).
