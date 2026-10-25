% Calculating a triangle's area from its sides
%
% Heron's formula uses the semiperimeter S = (A+B+C)/2 to calculate
% area = sqrt(S*(S-A)*(S-B)*(S-C)). Seven cases include a right triangle,
% equal sides, decimal lengths, a flat triangle, and impossible side lengths.
%
% Side lengths must be positive and use one common unit. Areas use that
% unit squared. A zero radicand means a degenerate triangle; a negative one
% means invalid sides and produces no area. Real arithmetic is approximate,
% so displayed areas are rounded to twelve decimal places.

triangle(t1, 3, 4, 5).
triangle(t2, 1, 1, 1).
triangle(t3, 5, 5, 6).
triangle(t4, 7, 8, 9).
triangle(t5, 1, 2, 3).
triangle(t6, 2.5, 4.7, 5.1).
triangle(t7, 1, 2, 4).

radicand(Case, R) :-
    triangle(Case, A, B, C), A > 0, B > 0, C > 0,
    S is (A+B+C)/2, R is S*(S-A)*(S-B)*(S-C).
status(Case, proper) :- radicand(Case, R), R > 0.
status(Case, degenerate) :- radicand(Case, R), R =:= 0.
status(Case, invalid_sides) :- radicand(Case, R), R < 0.
area(Case, Area) :- radicand(Case, R), R >= 0, Area is sqrt(R).
rounded_area(Case, Rounded) :-
    area(Case, Raw), Rounded is round(Raw*1000000000000)/1000000000000.

% Answer
?- rounded_area(Case, Area).
?- status(Case, Status).

% Reason
?- why(area(t1, Area)).

% Check
?- check.
?- check(area(t1, 6.0)).
?- check(area(t3, 12.0)).
?- check(area(t5, 0.0)).
?- check((area(t2, A), abs(A-sqrt(3)/4) < 1.0e-12)).
?- check((area(t4, A), abs(A*A-720) < 1.0e-10)).
?- check((area(t6, A), abs(A-5.846051552116183) < 1.0e-10)).
?- check(status(t7, invalid_sides)).
?- check(aggregate_all(count, area(t7, Area), 0)).
?- check(aggregate_all(count, area(Case, Area), 6)).
