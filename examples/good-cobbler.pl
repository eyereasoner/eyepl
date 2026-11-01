% Keeping a description tied to a trade
%
% Extract a person's trade from a structured description such as [good,
% cobbler]. Whatever the quality, the trade classifies the person, so Joe and
% Sam are cobblers and Jane is a carpenter. Only the quality good makes
% someone good at a trade, and only at that trade: Joe at cobbling and Jane at
% carpentry, but not Sam, the novice. Keeping the trade in the description
% avoids treating "good" as a property that applies to every activity the
% person undertakes.

description(joe, [good, cobbler]).
description(jane, [good, carpenter]).
description(sam, [novice, cobbler]).

% Only good, and only for the trade it describes.
good_at(Person, Trade) :-
    description(Person, [good, Trade]).
% Any quality: a novice cobbler is still a cobbler.
classified_as(Person, Trade) :-
    description(Person, [_, Trade]).

% Answer
?- good_at(Person, Trade).

% Reason
?- why.

% Answer
?- classified_as(Person, Trade).

% Reason
?- why.

% Check
?- check(good_at(joe, cobbler)).
?- check(good_at(jane, carpenter)).
?- check(classified_as(joe, cobbler)).
?- check(classified_as(jane, carpenter)).
?- check(\+ good_at(joe, carpenter)).
?- check(\+ good_at(sam, cobbler)).
?- check(classified_as(sam, cobbler)).
?- check(aggregate_all(count, good_at(Person, Trade), 2)).
?- check(aggregate_all(count, classified_as(Person, Trade), 3)).
