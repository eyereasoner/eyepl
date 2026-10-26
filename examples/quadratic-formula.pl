% Finding the real roots of two quadratic equations
%
% For A*x*x+B*x+C=0 with nonzero A, the quadratic formula gives
% (-B+sqrt(B*B-4*A*C))/(2*A) and its minus branch. The two supplied equations
% have roots {2,3} and {-1,3}. Rules expose the discriminant, denominator,
% and each branch, while checks substitute every returned root back into
% its equation. Negative discriminants produce no real roots. Arithmetic
% is approximate, and repeated derivations have set semantics.

equation(eq1, 1.0, -5.0, 6.0).
equation(eq2, 2.0, -4.0, -6.0).

discriminant(Case, D) :-
  equation(Case, A, B, C),
  (B2 is B ** 2),
  (Foura is 4.0 * A),
  (Fourac is Foura * C),
  (D is B2 - Fourac).

sqrt_discriminant(Case, S) :-
  discriminant(Case, D),
  (D >= 0.0),
  (S is D ** 0.5).

negative_b(Case, Nb) :-
  equation(Case, _a, B, _c),
  (Nb is -(B)).

denominator(Case, Den) :-
  equation(Case, A, _b, _c),
  (Den is 2.0 * A).

root_plus(Case, Root) :-
  negative_b(Case, Nb),
  sqrt_discriminant(Case, S),
  denominator(Case, Den),
  (Numerator is Nb + S),
  (Root is Numerator / Den).

root_minus(Case, Root) :-
  negative_b(Case, Nb),
  sqrt_discriminant(Case, S),
  denominator(Case, Den),
  (Numerator is Nb - S),
  (Root is Numerator / Den).

root(Case, Root) :-
  root_plus(Case, Root).

root(Case, Root) :-
  root_minus(Case, Root).

root_satisfies(Case, X) :-
    root(Case, X), equation(Case, A, B, C), abs(A*X*X+B*X+C) < 1.0e-12.

% Answer
?- discriminant(Case, Discriminant).
?- root(Case, Root).

% Reason
?- why(root(eq1, 2.0)).

% Check
?- check.
?- check(discriminant(eq1, 1.0)).
?- check(discriminant(eq2, 64.0)).
?- check(root(eq1, 2.0)).
?- check(root(eq1, 3.0)).
?- check(root(eq2, -1.0)).
?- check(root(eq2, 3.0)).
?- check(aggregate_all(count, root_satisfies(Case, X), 4)).
?- check(\+ root(eq1, 0.0)).
