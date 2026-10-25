% Finding complex roots of small polynomials
%
% Find approximate complex roots of polynomials of degree one through four.
% Supply coefficients in descending power order, using c(Real, Imaginary) for
% each complex number and a nonzero leading coefficient.
%
% The formulas solve linear and quadratic equations, use Cardano's formula
% for cubics, and factor quartics into quadratics. Root lists retain repeated
% roots and are not numerically sorted. Calculations use approximate real
% arithmetic; repeated or closely spaced roots can lose accuracy. Other
% degrees and zero leading coefficients have no answer.

polynomial(real_quartic, [c(1, 0), c(-10, 0), c(35, 0), c(-50, 0), c(24, 0)]).
polynomial(complex_quartic, [c(1, 0), c(-9, -5), c(14, 33), c(24, -44), c(-26, 0)]).
polynomial(repeated, [c(1, 0), c(-4, 0), c(6, 0), c(-4, 0), c(1, 0)]).

:- table roots/2, monic_quadratic/3, depressed_cubic/3, cubic_pair/3,
  depressed_quartic/4, c_add/3, c_sub/3, c_mul/3, c_div/3, c_scale/3,
  c_norm/2, c_sqrt/2, c_cbrt/2, larger/3, evaluate/2, shift/3, rounded/2.

c_add(c(A, B), c(C, D), c(E, F)) :- E is A+C, F is B+D.
c_sub(c(A, B), c(C, D), c(E, F)) :- E is A-C, F is B-D.
c_mul(c(A, B), c(C, D), c(E, F)) :- E is A*C-B*D, F is A*D+B*C.
c_scale(c(A, B), Scale, c(C, D)) :- C is A*Scale, D is B*Scale.
c_norm(c(A, B), Norm) :- Norm is A*A+B*B.
c_div(c(A, B), c(C, D), c(E, F)) :-
  Denominator is C*C+D*D, Denominator > 0,
  E is (A*C+B*D)/Denominator, F is (B*C-A*D)/Denominator.

% Principal square root: nonnegative real part; the negative real axis has
% nonnegative imaginary part. The two clauses also handle an exact zero.
c_sqrt(c(A, B), c(R, I)) :-
  B >= 0, Radius is sqrt(A*A+B*B),
  R is sqrt(max(0.0, (Radius+A)/2)),
  I is sqrt(max(0.0, (Radius-A)/2)).
c_sqrt(c(A, B), c(R, I)) :-
  B < 0, Radius is sqrt(A*A+B*B),
  R is sqrt(max(0.0, (Radius+A)/2)),
  I is -sqrt(max(0.0, (Radius-A)/2)).
c_cbrt(c(A, B), c(R, I)) :-
  Radius is sqrt(A*A+B*B)**(1/3), Phase is atan2(B, A)/3,
  R is Radius*cos(Phase), I is Radius*sin(Phase).

% Prefer the larger Cardano radicand to reduce cancellation before division.
larger(A, B, A) :- c_norm(A, NA), c_norm(B, NB), NA >= NB.
larger(A, B, B) :- c_norm(A, NA), c_norm(B, NB), NA < NB.

% Explicit expression dispatch: no constructed goals or meta-call builtin.
evaluate(c(R, I), c(R, I)).
evaluate(add(A, B), C) :- evaluate(A, X), evaluate(B, Y), c_add(X, Y, C).
evaluate(sub(A, B), C) :- evaluate(A, X), evaluate(B, Y), c_sub(X, Y, C).
evaluate(mul(A, B), C) :- evaluate(A, X), evaluate(B, Y), c_mul(X, Y, C).
evaluate(div(A, B), C) :- evaluate(A, X), evaluate(B, Y), c_div(X, Y, C).

roots([A, B], [Root]) :- c_scale(B, -1, Negative), c_div(Negative, A, Root).
roots([A, B0, C0], Roots) :-
  c_div(B0, A, B), c_div(C0, A, C), monic_quadratic(B, C, Roots).
roots([A, B0, C0, D0], Roots) :-
  c_div(B0, A, B), c_div(C0, A, C), c_div(D0, A, D),
  evaluate(sub(C, div(mul(B, B), c(3, 0))), P),
  evaluate(add(sub(div(mul(c(2, 0), mul(B, mul(B, B))), c(27, 0)),
    div(mul(B, C), c(3, 0))), D), Q),
  depressed_cubic(P, Q, Raw), c_scale(B, 1/3, Offset), shift(Raw, Offset, Roots).
roots([A, B0, C0, D0, E0], Roots) :-
  c_div(B0, A, B), c_div(C0, A, C), c_div(D0, A, D), c_div(E0, A, E),
  c_mul(B, B, B2), c_mul(B2, B, B3), c_mul(B2, B2, B4),
  evaluate(sub(C, mul(c(0.375, 0), B2)), P),
  evaluate(add(sub(mul(c(0.125, 0), B3), div(mul(B, C), c(2, 0))), D), Q),
  evaluate(add(sub(add(mul(c(-0.01171875, 0), B4), div(mul(B2, C), c(16, 0))),
    div(mul(B, D), c(4, 0))), E), R),
  depressed_quartic(P, Q, R, Raw), c_scale(B, 0.25, Offset), shift(Raw, Offset, Roots).

monic_quadratic(B, C, [X, Y]) :-
  evaluate(sub(mul(B, B), mul(c(4, 0), C)), Discriminant),
  c_sqrt(Discriminant, S), c_scale(B, -1, Negative),
  c_add(Negative, S, Plus), c_sub(Negative, S, Minus),
  c_scale(Plus, 0.5, X), c_scale(Minus, 0.5, Y).

depressed_cubic(P, Q, [X, Y, Z]) :-
  evaluate(add(div(mul(Q, Q), c(4, 0)), div(mul(P, mul(P, P)), c(27, 0))), Delta),
  c_sqrt(Delta, S), c_scale(Q, -0.5, Half),
  c_add(Half, S, Plus), c_sub(Half, S, Minus), larger(Plus, Minus, Radicand),
  c_cbrt(Radicand, U), cubic_pair(P, U, V),
  OmegaI is sqrt(3)/2, NegativeOmegaI is -OmegaI,
  c_add(U, V, X),
  evaluate(add(mul(c(-0.5, OmegaI), U), mul(c(-0.5, NegativeOmegaI), V)), Y),
  evaluate(add(mul(c(-0.5, NegativeOmegaI), U), mul(c(-0.5, OmegaI), V)), Z).
cubic_pair(_, U, c(0.0, 0.0)) :- c_norm(U, Norm), Norm =:= 0.
cubic_pair(P, U, V) :-
  c_norm(U, Norm), Norm > 0, c_scale(P, -1/3, NegativeThird), c_div(NegativeThird, U, V).

% With no odd term, solve a quadratic in x^2, including zero/repeated roots.
depressed_quartic(P, Q, R, [A, B, C, D]) :-
  c_norm(Q, Norm), Norm =:= 0,
  monic_quadratic(P, R, [U, V]), c_sqrt(U, A), c_scale(A, -1, B),
  c_sqrt(V, C), c_scale(C, -1, D).
% Otherwise z=s^2 solves z^3+2*p*z^2+(p^2-4*r)*z-q^2=0.
% Its largest-magnitude root avoids dividing by a small s when factoring.
depressed_quartic(P, Q, R, [A, B, C, D]) :-
  c_norm(Q, Norm), Norm > 0,
  c_scale(P, 2, TwiceP), evaluate(sub(mul(P, P), mul(c(4, 0), R)), Middle),
  evaluate(sub(c(0, 0), mul(Q, Q)), Constant),
  roots([c(1, 0), TwiceP, Middle, Constant], [Z1, Z2, Z3]),
  larger(Z1, Z2, Z12), larger(Z12, Z3, Z), c_sqrt(Z, S),
  evaluate(div(sub(add(P, Z), div(Q, S)), c(2, 0)), T),
  evaluate(div(add(add(P, Z), div(Q, S)), c(2, 0)), U),
  monic_quadratic(S, T, [A, B]), c_scale(S, -1, NegativeS),
  monic_quadratic(NegativeS, U, [C, D]).

shift([], _, []).
shift([X|Rest], Offset, [Y|Tail]) :- c_sub(X, Offset, Y), shift(Rest, Offset, Tail).
rounded([], []).
rounded([c(R, I)|Rest], [c(RR, RI)|Tail]) :-
  RR is round(R*1000000000)/1000000000,
  RI is round(I*1000000000)/1000000000, rounded(Rest, Tail).
solution(Name, Roots) :- polynomial(Name, Coefficients), roots(Coefficients, Raw), rounded(Raw, Roots).

% Answer
?- solution(real_quartic, Roots).

% Reason
?- why.

% Answer
?- solution(complex_quartic, Roots).
?- solution(repeated, Roots).

% Check
?- check(solution(real_quartic, [c(4.0, 0.0), c(1.0, 0.0), c(3.0, 0.0), c(2.0, 0.0)])).
?- check(solution(complex_quartic, [c(1.0, 1.0), c(0.0, 1.0), c(5.0, 1.0), c(3.0, 2.0)])).
?- check(solution(repeated, [c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0)])).
?- check((roots([c(1, 0), c(0, 0), c(1, 0)], Raw), rounded(Raw, [c(0.0, 1.0), c(0.0, -1.0)]))).
?- check(aggregate_all(count, roots([c(0, 0), c(1, 0)], _), 0)).
