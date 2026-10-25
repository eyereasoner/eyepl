% Fitting a straight line to data
%
% Fit a straight line Y = Slope*X + Intercept to a list of point(X, Y)
% values. Ordinary least squares chooses the line that minimizes the sum of
% squared vertical errors. The program reports its slope, intercept, and R^2,
% the fraction of variation in Y explained by the fitted line.
%
% This implementation requires at least two points and variation in both X
% and Y. A constant response has no R^2 result here, so regression/4 fails
% for that case.

dataset(demo, [point(1, 2), point(2, 3), point(3, 5), point(4, 4)]).

:- table stats/7, regression/4.
stats([], 0, 0, 0, 0, 0, 0).
stats([point(X, Y)|Rest], N, SX, SY, SXX, SXY, SYY) :-
  stats(Rest, N0, X0, Y0, XX0, XY0, YY0),
  N is N0+1, SX is X0+X, SY is Y0+Y,
  SXX is XX0+X*X, SXY is XY0+X*Y, SYY is YY0+Y*Y.

regression(Points, Slope, Intercept, R2) :-
  stats(Points, N, SX, SY, SXX, SXY, SYY), N >= 2,
  DX is N*SXX-SX*SX, DY is N*SYY-SY*SY,
  DX > 0, DY > 0,
  Cross is N*SXY-SX*SY,
  Slope is Cross/DX,
  Intercept is (SY-Slope*SX)/N,
  R2 is Cross*Cross/(DX*DY).

fit(Name, Slope, Intercept, R2) :-
  dataset(Name, Points), regression(Points, Slope, Intercept, R2).

% Answer
?- fit(Name, Slope, Intercept, R2).

% Reason
?- why.

% Check
?- check((fit(demo, Slope, Intercept, R2), abs(Slope-0.8) < 1.0e-12, abs(Intercept-1.5) < 1.0e-12, abs(R2-0.64) < 1.0e-12)).
?- check(regression([point(0, 3), point(1, 1), point(2, -1)], -2.0, 3.0, 1.0)).
?- check(aggregate_all(count, regression([point(1, 2), point(1, 3)], _, _, _), 0)).
?- check(aggregate_all(count, regression([point(0, 2), point(1, 2)], _, _, _), 0)).
