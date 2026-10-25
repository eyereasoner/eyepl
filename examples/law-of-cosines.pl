% Finding a triangle's missing side from an angle
%
% Two sides and the angle between them determine the opposite side through
% the law of cosines: W^2 = U^2 + V^2 - 2*U*V*cos(Angle). Six cases solve
% sides named a, b, or c, including the familiar 3-4-5 and 5-12-13 triangles.
%
% Angles are in radians and must lie strictly between zero and pi. Side
% lengths are positive and share one unit. Calculations use approximate real
% arithmetic; displayed lengths are rounded to twelve decimal places.

% given(Case, SideToFind, FirstSide, SecondSide, IncludedAngle).
given(t1, c, 3, 4, 1.5707963267948966).
given(t2, c, 5, 7, 1.0471975511965976).
given(t3, a, 5, 6, 1.0471975511965976).
given(t4, b, 3, 2, 0.5235987755982988).
given(t5, c, 8, 15, 1.3089969389957472).
given(t6, a, 5, 12, 1.5707963267948966).

side(Case, Which, Length) :-
    given(Case, Which, U, V, Angle),
    U > 0, V > 0, Angle > 0, Angle < pi,
    Squared is U*U + V*V - 2*U*V*cos(Angle),
    Squared >= 0, Length is sqrt(Squared).
rounded_side(Case, Which, Rounded) :-
    side(Case, Which, Raw), Rounded is round(Raw*1000000000000)/1000000000000.
identity_holds(Case) :-
    given(Case, Which, U, V, Angle), side(Case, Which, W),
    abs(W*W + 2*U*V*cos(Angle) - U*U - V*V) < 1.0e-10.

% Answer
?- rounded_side(Case, Which, Length).

% Reason
?- why(side(t1, c, Length)).

% Check
?- check.
?- check((side(t1, c, L), abs(L-5) < 1.0e-12)).
?- check((side(t2, c, L), abs(L*L-39) < 1.0e-12)).
?- check((side(t3, a, L), abs(L*L-31) < 1.0e-12)).
?- check((side(t4, b, L), abs(L*L-(13-6*sqrt(3))) < 1.0e-12)).
?- check((side(t6, a, L), abs(L-13) < 1.0e-12)).
?- check(aggregate_all(count, identity_holds(Case), 6)).
