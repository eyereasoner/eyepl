% Deriving a friendship from a rule
%
% Infer that Milo is a friend from the facts that Milo likes Luna and Luna is
% a cat. Here, "friend" has the program's specific meaning: someone who likes
% a cat. No rule makes that relationship mutual.

likes(milo, luna).
is_a(luna, cat).

is_a(Person, friend) :-
    likes(Person, Friend),
    is_a(Friend, cat).

% Answer
?- is_a(Who, friend).
?- likes(Who, luna).
?- likes(milo, What).

% Reason
?- why((is_a(milo, friend))).

% Check
?- check((is_a(milo, friend))).
?- check((aggregate_all(count, is_a(Subject, friend), 1))).
?- check((\+ (is_a(luna, friend)))).
