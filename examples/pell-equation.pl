% Finding exact integer solutions to Pell's equation
%
% Generate nonnegative integer pairs satisfying x^2 - 2*y^2 = 1, known as
% Pell's equation. Starting from (1, 0), each step computes x_next = 3*x +
% 4*y and y_next = 2*x + 3*y.
%
% Supply a nonnegative integer step number. Calculations remain exact through
% the fiftieth solution shown here. Goal checks substitute the results into
% the original equation as a separate check on the recurrence.

:- table pell/3, pell_holds/2, between/3.

between(Low, High, Low) :- Low =< High.
between(Low, High, Value) :- Low < High, Next is Low + 1, between(Next, High, Value).

% N=0 is the neutral solution; each recursive step multiplies by 3 + 2*sqrt(2).
pell(0, 1, 0).
pell(N, X, Y) :-
  (N > 0),
  (N1 is N - 1),
  pell(N1, X0, Y0),
  (Ax is 3 * X0),
  (By is 4 * Y0),
  (X is Ax + By),
  (Cx is 2 * X0),
  (Dy is 3 * Y0),
  (Y is Cx + Dy).

% Check the defining Diophantine equation separately from the recurrence.
pell_holds(N, true) :-
  pell(N, X, Y),
  (X2 is X * X),
  (Y2 is Y * Y),
  (Twicey2 is 2 * Y2),
  (1 is X2 - Twicey2).

pell_answer(solution_5, solution(X, Y)) :- pell(5, X, Y).
pell_answer(solution_8, solution(X, Y)) :- pell(8, X, Y).
pell_answer(solution_50, solution(X, Y)) :- pell(50, X, Y).
pell_answer(check_8, true) :- pell_holds(8, true).
pell_answer(y_sum_1_to_8, Sum) :-
  aggregate_all(sum(Y), (between(1, 8, N), pell(N, X, Y)), Sum).

% Answer
?- pell_answer(Kind, Value).

% Reason
?- why(pell(8, X, Y)).

% Check
?- check(pell(0, 1, 0)).
?- check(pell(5, 3363, 2378)).
?- check(pell(8, 665857, 470832)).
?- check(pell(50, 94741125149636933417873079920900017937, 66992092050551637663438906713182313772)).
?- check(pell_holds(50, true)).
?- check(\+ pell(-1, 1, 0)).
?- check(aggregate_all(count, (between(0, 12, N), pell_holds(N, true)), 13)).
