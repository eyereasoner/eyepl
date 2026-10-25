% Classifying animals
%
% Infer that Milo and Luna are animals from two cat facts and the rule that
% every cat is an animal. The dog query has no supporting fact or rule, so it
% fails; that failure does not establish that Milo is not a dog.

is_a(milo, cat).
is_a(luna, cat).

is_a(Animal, animal) :-
    is_a(Animal, cat).

% Answer
?- is_a(Who, animal).
?- is_a(milo, animal).

% Reason
?- why((is_a(milo, animal))).

% Answer
?- is_a(milo, dog).

% Check
?- check((is_a(milo, animal))).
?- check((is_a(luna, animal))).
?- check((aggregate_all(count, is_a(Subject, animal), 2))).
?- check((\+ (is_a(milo, dog)))).
