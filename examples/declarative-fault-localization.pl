% Locating an incorrect recursive comparison
%
% A deliberately faulty list-maximum rule keeps the smaller candidate instead
% of the larger one. Calling it on [1,5,3], then [5,3], then [3] shows the
% fault already occurs in a two-element list while the base case is correct.
% Separate guarded clauses express each comparison branch. The corrected
% rules return 5 for the original list, and an aggregate provides an
% independent reference maximum for the supplied values.

:- table buggy_list_max/2, fixed_list_max/2.

buggy_list_max([X], X).
buggy_list_max([X | Rest], M) :- buggy_list_max(Rest, Before), X > Before, M = Before.
buggy_list_max([X | Rest], X) :- buggy_list_max(Rest, Before), X =< Before.
fixed_list_max([X], X).
fixed_list_max([X | Rest], X) :- fixed_list_max(Rest, Before), X > Before.
fixed_list_max([X | Rest], Before) :- fixed_list_max(Rest, Before), X =< Before.

sample_value(1).
sample_value(5).
sample_value(3).
answer(Whole, Pair, Base, Fixed) :-
    buggy_list_max([1, 5, 3], Whole), buggy_list_max([5, 3], Pair),
    buggy_list_max([3], Base), fixed_list_max([1, 5, 3], Fixed).

% Answer
?- answer(WholeList, TwoElements, BaseCase, Fixed).

% Reason
?- why.

% Check
?- check.
?- check(answer(1, 3, 3, 5)).
?- check((fixed_list_max([1, 5, 3], M), aggregate_all(max(Value), sample_value(Value), M))).
?- check(fixed_list_max([3, 3], 3)).
?- check(\+ fixed_list_max([1, 5, 3], 1)).
