% Calculating a polygon's oriented area
%
% A closed polygon is a list of [X,Y] points whose last point repeats its
% first. Each adjacent pair contributes (X1*Y2-Y1*X2)/2 to the shoelace sum.
% The supplied six-sided outline has oriented area 7.5 square units; reversing
% the point order reverses its sign. Coordinates share one length unit.
% This calculation assumes a simple closed polygon and does not validate
% self-intersections or close an open list automatically.

:- table area/2.

sample_polygon([[3, 2], [6, 2], [7, 6], [4, 6], [5, 5], [5, 3], [3, 2]]).

area([_point], 0).
area([[A, B], [C, D]|Rest], Total) :-
  area([[C, D]|Rest], Subtotal),
  (Ad is A * D),
  (Bc is B * C),
  (Cross is Ad - Bc),
  (Half is Cross / 2.0),
  (Total is Half + Subtotal).

polygon_area(sample, Area) :-
  sample_polygon(Points),
  area(Points, Area).

% Answer
?- polygon_area(Polygon, Area).

% Reason
?- why.

% Check
?- check.
?- check(polygon_area(sample, 7.5)).
?- check(area([[3, 2]], 0)).
?- check(area([[3, 2], [5, 3], [5, 5], [4, 6], [7, 6], [6, 2], [3, 2]], -7.5)).
?- check(area([[0, 0], [2, 0], [0, 2], [0, 0]], 2.0)).
