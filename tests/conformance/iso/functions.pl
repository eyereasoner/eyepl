% ISO evaluable functors on their shared input modes.
% Approximate transcendental results are checked by numerical bounds.
?- X is abs(-7).
?- X is abs(-2.5).
?- X is sign(-7).
?- X is floor(-2.5).
?- X is ceiling(-2.5).
?- X is truncate(-2.5).
?- X is round(-2.5).
?- X is float_integer_part(-2.5).
?- X is float_fractional_part(-2.5).
?- X is sqrt(9).
?- X is 2 ** 3.
?- X is 2 ^ 10.
?- abs(sin(0)) < 1e-12, abs(cos(0) - 1) < 1e-12.
?- abs(log(exp(1)) - 1) < 1e-12.
?- abs(tan(atan(1)) - 1) < 1e-12.
?- abs(asin(0)) < 1e-12, abs(acos(1)) < 1e-12.
?- X is min(2,3), Y is max(2,3).
?- X is sign(0), Y is sign(9).
?- abs(atan2(1,1) - pi / 4) < 1e-12.
?- X is 2 ^ -2.
