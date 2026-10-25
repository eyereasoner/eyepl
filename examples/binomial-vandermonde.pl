% Counting combinations in two ways
%
% Count how many ways K items can be chosen from N items, without regard to
% order. The result is the binomial coefficient C(N,K).
%
% The program also checks Vandermonde's identity: choosing R items from two
% groups gives the same count whether the groups are combined first or the
% counts for each possible split are added. Calculations use exact integers.
% Supply bound nonnegative integers; a choice size K greater than N fails.

:- table choose/3, choose_step/5, between/3, symmetric/2.

between(Low, High, Low) :- Low =< High.
between(Low, High, Value) :- Low < High, Next is Low + 1, between(Next, High, Value).
choose(N, K, C) :- K >= 0, K =< N, Steps is min(K, N-K), choose_step(N, Steps, 0, 1, C).
choose_step(_N, K, K, Accumulator, Accumulator).
choose_step(N, K, I, Accumulator, C) :-
  I < K,
  Next is I + 1,
  Numerator is Accumulator * (N-I),
  Updated is Numerator // Next,
  choose_step(N, K, Next, Updated, C).
symmetric(N, K) :- choose(N, K, C), Other is N-K, choose(N, Other, C).

vandermonde_sum(N, M, R, Sum) :-
  aggregate_all(sum(Product),
    (between(0, R, K), Other is R-K, choose(N, K, A), choose(M, Other, B), Product is A*B), Sum).
vandermonde(N, M, R, Sum) :- Total is N+M, choose(Total, R, Sum), vandermonde_sum(N, M, R, Sum).

binomial_answer(choose_24_12, C) :- choose(24, 12, C).
binomial_answer(choose_100_50, C) :- choose(100, 50, C).
binomial_answer(symmetry_24_7, true) :- symmetric(24, 7).
binomial_answer(vandermonde_12_10_8, Sum) :- vandermonde(12, 10, 8, Sum).
binomial_answer(row_12_sum, Sum) :- aggregate_all(sum(C), (between(0, 12, K), choose(12, K, C)), Sum).

% Answer
?- binomial_answer(Kind, Value).

% Reason
?- why(vandermonde(12, 10, 8, Sum)).

% Check
?- check(choose(0, 0, 1)).
?- check(choose(24, 12, 2704156)).
?- check(choose(100, 50, 100891344545564193334812497256)).
?- check(vandermonde(12, 10, 8, 319770)).
?- check(binomial_answer(row_12_sum, 4096)).
?- check(symmetric(100, 37)).
?- check(\+ choose(5, 6, 0)).
?- check(\+ choose(5, -1, 0)).
