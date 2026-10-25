% Constraining answers by matching structure
%
% Use matching term structure and repeated variables to constrain answers.
% The append rules split the complete list [a, b] into every prefix and
% suffix, including empty lists. The pair(X, X) pattern requires both entries
% to match, and [Head | Tail] separates a list's first item from the
% remaining items.

:- table append/3.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

matching_pair(pair(X, X)).
head_tail([Head | Tail], Head, Tail).

% Answer
?- append(Prefix, Suffix, [a, b]).

% Reason
?- why.

% Answer
?- matching_pair(pair(same, same)).

% Reason
?- why.

% Answer
?- matching_pair(pair(a, b)).
?- head_tail([a, b, c], Head, Tail).

% Reason
?- why.

% Check
?- check(append([], [a, b], [a, b])).
?- check(append([a], [b], [a, b])).
?- check(append([a, b], [], [a, b])).
?- check(aggregate_all(count, append(Prefix, Suffix, [a, b]), 3)).
?- check(matching_pair(pair(same, same))).
?- check(\+ matching_pair(pair(a, b))).
?- check(head_tail([a, b, c], a, [b, c])).
