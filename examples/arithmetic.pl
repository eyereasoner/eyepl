% Calculating with integers and real numbers
%
% Compare exact integer arithmetic with approximate real-number calculations.
% The queries cover division, rounding, bit operations, minimum and maximum,
% greatest common divisors, pi, e, and a trigonometric calculation.
%
% Division results are [quotient toward zero, quotient toward negative
% infinity, remainder, modulo]. Rounding results are [floor, ceiling, nearest
% integer, truncate, real integer part, real fractional part]; halfway cases
% round away from zero. Bit results are [AND, OR, XOR, complement, left
% shift, right shift].

:- table absolute/2.
:- table result/2.
:- table constants/2.
:- table circumference/2.
:- table 'round-trip'/2.
is_a(mathematics, 'calculation-case').
input(magnitude, -9007199254740993).
inputs(division, [-7, 3]).
input(rounding, -2.5).
inputs(extrema, [1000000000000000000001, 1e+21]).
inputs(gcd, [-42, 30]).
inputs(bits, [13, 6]).
input(trigonometry, 1).
radius(circle, 3).

absolute(Case, _Calc1) :-
    input(Case, Number),
    _Calc1 is abs(Number).
result(division, [_Calc1, _Calc2, _Calc3, _Calc4]) :-
    inputs(division, [A, B]),
    _Calc1 is (A // B),
    _Calc2 is (A div B),
    _Calc3 is (A rem B),
    _Calc4 is (A mod B).
result(rounding, [_Calc1, _Calc2, _Calc3, _Calc4, _Calc5, _Calc6]) :-
    input(rounding, Number),
    _Calc1 is floor(Number),
    _Calc2 is ceiling(Number),
    _Calc3 is round(Number),
    _Calc4 is truncate(Number),
    _Calc5 is float_integer_part(Number),
    _Calc6 is float_fractional_part(Number).
result(extrema, [_Calc1, _Calc2]) :-
    inputs(extrema, [A, B]),
    _Calc1 is min(A, B),
    _Calc2 is max(A, B).
result(gcd, _Calc1) :-
    inputs(gcd, [A, B]),
    _Calc1 is gcd(A, B).
result(bits, [_Calc1, _Calc2, _Calc3, _Calc4, _Calc5, _Calc6]) :-
    inputs(bits, [A, B]),
    _Calc1 is (A /\ B),
    _Calc2 is (A \/ B),
    _Calc3 is xor(A, B),
    _Calc4 is \ (A),
    _Calc5 is (A << 3),
    _Calc6 is (A >> 3).
constants(mathematics, [_Calc1, _Calc2]) :-
    is_a(mathematics, 'calculation-case'),
    _Calc1 is pi,
    _Calc2 is e.
circumference(Circle, _Calc1) :-
    radius(Circle, Radius),
    _Calc1 is ((2 * pi) * Radius).
'round-trip'(trigonometry, _Calc1) :-
    input(trigonometry, Number),
    _Calc1 is tan(atan(Number)).

% Answer
?- absolute(magnitude, Value).
?- result(division, What).
?- result(rounding, What).
?- result(extrema, What).
?- result(gcd, What).
?- result(bits, What).
?- constants(mathematics, What).
?- circumference(circle, What).
?- 'round-trip'(trigonometry, What).
?- result(division, What).

% Reason
?- why.

% Check
?- check((absolute(magnitude, 9007199254740993))).
?- check((result(division, [-2, -3, -1, 2]))).
?- check((_Calc1 is (((-7 // 3) * 3) + (-7 rem 3)), _Calc1 =:= -7)).
?- check((_Calc1 is (((-7 div 3) * 3) + (-7 mod 3)), _Calc1 =:= -7)).
?- check((result(rounding, [-3, -2, -3, -2, -2.0, -0.5]))).
?- check((_Calc1 is round(-1.5), _Calc1 =:= -2)).
?- check((result(extrema, [1e+21, 1000000000000000000001]))).
?- check((result(gcd, 6))).
?- check((result(bits, [4, 15, 11, -14, 104, 1]))).
?- check((_Calc1 is (1 << 100), _Calc1 =:= 1267650600228229401496703205376)).
?- check((_Calc1 is pi, _Calc1 > 3)).
?- check((_Calc1 is e, _Calc1 < 3)).
?- check((circumference(circle, 18.84955592153876))).
?- check((_Calc1 is abs((tan(atan(1)) - 1)), _Calc1 =< 1e-12)).
