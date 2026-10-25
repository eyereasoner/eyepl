% Building and processing lists
%
% Join two lists, square each number in a list, and add a list's numbers.
% Each operation is defined by a case for the empty list and a recursive case
% for the first item and remaining items. Supply finite input lists; table
% declarations keep list-building rules from generating answers without a
% call.

:- table append/3, squares/2, sum/2.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

squares([], []).
squares([X | Xs], [Y | Ys]) :-
    Y is X * X,
    squares(Xs, Ys).

sum([], 0).
sum([X | Xs], Total) :-
    sum(Xs, Rest),
    Total is X + Rest.

% Answer
?- append([a, b], [c, d], Joined).

% Reason
?- why.

% Answer
?- squares([1, 2, 3, 4], Squared).

% Reason
?- why.

% Answer
?- sum([1, 2, 3, 4], Total).

% Reason
?- why.

% Check
?- check(append([a, b], [c, d], [a, b, c, d])).
?- check(squares([1, 2, 3, 4], [1, 4, 9, 16])).
?- check(sum([1, 2, 3, 4], 10)).
?- check(append([], [a], [a])).
?- check(squares([], [])).
?- check(sum([], 0)).
