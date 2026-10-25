% Counting dogs for a licensing rule
%
% Count each listed owner's dogs and apply the example's licensing rule: an
% owner needs a license when the count is greater than four. Alice has five
% dogs, Carol has exactly four, and Dana has none. The threshold is supplied
% by this program rather than taken from a jurisdiction's licensing rules.

owns(alice, dog1).
owns(alice, dog2).
owns(alice, dog3).
owns(alice, dog4).
owns(alice, dog5).
owns(bob, dog6).
owns(bob, dog7).
owns(carol, dog8).
owns(carol, dog9).
owns(carol, dog10).
owns(carol, dog11).
owner(alice).
owner(bob).
owner(carol).
owner(dana).

dog_count(Owner, N) :-
    owner(Owner),
    aggregate_all(count, owns(Owner, Dog), N).
requires(Owner, dog_license) :-
    dog_count(Owner, N),
    N > 4.

% Answer
?- dog_count(Owner, Count).

% Reason
?- why.

% Answer
?- requires(Owner, dog_license).

% Reason
?- why.

% Check
?- check(dog_count(alice, 5)).
?- check(dog_count(bob, 2)).
?- check(dog_count(carol, 4)).
?- check(dog_count(dana, 0)).
?- check(requires(alice, dog_license)).
?- check(\+ requires(bob, dog_license)).
?- check(\+ requires(carol, dog_license)).
?- check(\+ requires(dana, dog_license)).
?- check(aggregate_all(count, requires(Owner, dog_license), 1)).
