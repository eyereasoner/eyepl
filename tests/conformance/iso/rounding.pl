% ISO arithmetic through Corrigenda 1-3: rounding.
?- X is float(7).
?- X is float(7.5).
?- X is sign(-2.5).
?- X is sign(0.0).
?- X is sign(2.5).
?- X is sign(-2).
?- X is round(-2.5).
?- X is round(-1.5).
?- X is round(-0.5).
?- X is round(0.5).
?- X is round(2.5).
?- X is round(-2.5000000000000004).
?- X is round(0.49999999999999994).
?- X is round(4503599627370497.0).
?- X is floor(float(3)).
?- X is float_integer_part(-2.5).
?- X is float_fractional_part(-2.5).
