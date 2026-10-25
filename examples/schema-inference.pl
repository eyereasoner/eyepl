% Extending classifications and relationships with a schema
%
% Infer additional classifications and relationships from a small schema.
% Cats are mammals and mammals are animals, so Koko's cat classification also
% implies both broader classifications.
%
% Likewise, a parent_of link implies related_to and connected_to links. The
% domain and range rules classify the source and target of a parent_of link
% as people. These are the schema rules explicitly implemented below.

subclass(cat, mammal).
subclass(mammal, animal).
subproperty(parent_of, related_to).
subproperty(related_to, connected_to).
domain(parent_of, person).
range(parent_of, person).
type(koko, cat).
triple(alice, parent_of, bob).

subclass(A, C) :-
    subclass(A, B),
    subclass(B, C).
subproperty(P, R) :-
    subproperty(P, Q),
    subproperty(Q, R).
type(X, B) :-
    type(X, A),
    subclass(A, B).
triple(S, Q, O) :-
    triple(S, P, O),
    subproperty(P, Q).
type(S, Class) :-
    triple(S, P, _),
    domain(P, Class).
type(O, Class) :-
    triple(_, P, O),
    range(P, Class).

% Answer
?- type(Who, Class).

% Reason
?- why(type(koko, animal)).

% Answer
?- triple(Subject, Property, Object).

% Reason
?- why(triple(alice, connected_to, bob)).

% Answer
?- type(alice, person).

% Reason
?- why.

% Check
?- check(subclass(cat, animal)).
?- check(subproperty(parent_of, connected_to)).
?- check(type(koko, mammal)).
?- check(type(koko, animal)).
?- check(type(alice, person)).
?- check(type(bob, person)).
?- check(triple(alice, related_to, bob)).
?- check(triple(alice, connected_to, bob)).
?- check(aggregate_all(count, triple(Subject, Property, Object), 3)).
?- check(aggregate_all(count, type(Who, Class), 5)).
