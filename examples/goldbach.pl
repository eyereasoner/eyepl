% Finding prime pairs for selected even numbers
%
% Split each of eight even integers into two primes P and Q, with P no
% greater than Q so that reversing a pair does not count it twice. Trial
% division checks possible factors until their square exceeds the number.
%
% The largest supplied integer is 50. These finite results illustrate
% Goldbach's conjecture; they do not establish it for all even integers.

:- table in_range/3, prime/1, no_factor/2.

even(4).
even(6).
even(8).
even(10).
even(12).
even(20).
even(28).
even(50).

in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

no_factor(N, Divisor) :- Divisor * Divisor > N.
no_factor(N, Divisor) :-
    Divisor * Divisor =< N,
    N mod Divisor =\= 0,
    Next is Divisor + 1,
    no_factor(N, Next).
prime(N) :- N > 1, no_factor(N, 2).

partition(N, P, Q) :-
    even(N), Half is N div 2, in_range(2, Half, P),
    Q is N - P, prime(P), prime(Q).

% Answer
?- partition(N, P, Q).

% Reason
?- why(partition(50, 19, 31)).

% Check
?- check.
?- check(partition(4, 2, 2)).
?- check(partition(28, 5, 23)).
?- check(partition(50, 3, 47)).
?- check(aggregate_all(count, partition(50, P, Q), 4)).
?- check(prime(2)).
?- check(prime(47)).
?- check(\+ prime(1)).
?- check(\+ prime(49)).
?- check(\+ partition(10, 7, 3)).
