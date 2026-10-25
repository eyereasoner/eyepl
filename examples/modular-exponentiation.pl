% Finding the remainder of a large power
%
% Calculate the remainder when an integer power is divided by a positive
% integer. Repeated squaring halves the exponent at each recursive step and
% reduces intermediate results modulo the divisor. Supply a bound integer
% base, a nonnegative integer exponent, and a positive integer modulus.
%
% The example also shows that 7^560 has remainder 1 modulo 561 even though
% 561 = 3*11*17 is composite. Passing this Fermat congruence does not prove
% that a number is prime.

:- table pow_mod/4.
pow_mod(_, 0, Modulus, Result) :-
  Modulus > 0, Result is 1 mod Modulus.
pow_mod(Base, Exponent, Modulus, Result) :-
  Exponent > 0, Modulus > 0, Exponent mod 2 =:= 0,
  Half is Exponent//2,
  pow_mod(Base, Half, Modulus, Value),
  Result is (Value*Value) mod Modulus.
pow_mod(Base, Exponent, Modulus, Result) :-
  Exponent > 0, Modulus > 0, Exponent mod 2 =:= 1,
  Half is Exponent//2,
  pow_mod(Base, Half, Modulus, Value),
  Result is (Base*Value*Value) mod Modulus.

% Answer
?- pow_mod(7, 560, 561, Result).

% Reason
?- why.

% Answer
?- pow_mod(2, 1000, 1009, Result).
?- pow_mod(12345678901234567890, 12345, 1000000007, Result).

% Check
?- check(pow_mod(7, 560, 561, 1)).
?- check(pow_mod(2, 1000, 1009, 942)).
?- check(pow_mod(99, 0, 1, 0)).
?- check(pow_mod(-2, 5, 7, 3)).
?- check(aggregate_all(count, pow_mod(2, -1, 7, _), 0)).
