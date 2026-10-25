% Counting ways to divide a set into groups
%
% The Stirling number S(N,K) counts ways to divide N distinct items into K
% nonempty, unordered groups. Bell numbers count all such divisions, allowing
% any number of groups. Inclusion-exclusion computes the Stirling counts;
% a binomial recurrence computes Bell numbers with an explicit recursive sum.
% Tabling shares repeated subproblems. Exact powers and integer division
% preserve integral counts. Supply nonnegative integer inputs. The proof
% traces the smaller Bell count B(4)=15.

:- table factorial/2, binomial/3, stirling2/3, bell/2, bell_sum/4, in_range/3.

factorial(0, 1).
factorial(N, F) :- N > 0, Before is N-1, factorial(Before, P), F is N*P.
binomial(0, 0, 1).
binomial(N, 0, 1) :- N > 0.
binomial(N, N, 1) :- N > 0.
binomial(N, K, C) :-
    N > 0, K > 0, K < N, N1 is N-1, K1 is K-1,
    binomial(N1, K1, Left), binomial(N1, K, Right), C is Left+Right.
in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

signed_term(N, K, I, Term) :-
    binomial(K, I, Choose), Term is (-1)^(K-I) * Choose * I^N.
stirling2(0, 0, 1).
stirling2(N, 0, 0) :- N > 0.
stirling2(0, K, 0) :- K > 0.
stirling2(N, K, Count) :-
    N > 0, K > 0,
    aggregate_all(sum(Term), (in_range(0, K, I), signed_term(N, K, I, Term)), Sum),
    factorial(K, F), Sum mod F =:= 0, Count is Sum div F.
bell(0, 1).
bell(N, Count) :- N > 0, Last is N-1, bell_sum(0, Last, Last, Count).
bell_sum(K, Last, _, 0) :- K > Last.
bell_sum(K, Last, N, Sum) :-
    K =< Last, binomial(N, K, Choose), bell(K, B),
    Next is K+1, bell_sum(Next, Last, N, Rest), Sum is Choose*B+Rest.

stirling_bell_answer(stirling_10_4, C) :- stirling2(10, 4, C).
stirling_bell_answer(stirling_12_5, C) :- stirling2(12, 5, C).
stirling_bell_answer(bell_10, C) :- bell(10, C).
stirling_bell_answer(bell_12, C) :- bell(12, C).

% Answer
?- stirling_bell_answer(Kind, Count).

% Reason
?- why(bell(4, Count)).

% Check
?- check.
?- check(stirling2(0, 0, 1)).
?- check(stirling2(4, 2, 7)).
?- check(stirling2(3, 4, 0)).
?- check(stirling2(10, 4, 34105)).
?- check(stirling2(12, 5, 1379400)).
?- check(bell(0, 1)).
?- check(bell(10, 115975)).
?- check(bell(12, 4213597)).
?- check((aggregate_all(sum(S), (in_range(0, 6, K), stirling2(6, K, S)), Total), bell(6, Total))).
