% Relations containing RDF-shaped data
%
% Full IRIs name a person and two classes in an ordinary triple relation.
% A rule carries membership along a subclass link to derive mortality.
% This is eyepl syntax, not an N3 or Turtle parser.

triple('https://example.org/Socrates', type, 'https://example.org/Human').
triple('https://example.org/Human', subclass, 'https://example.org/Mortal').

triple(Thing, type, Superclass) :-
    triple(Thing, type, Class),
    triple(Class, subclass, Superclass).

% Answer
?- triple(Who, type, 'https://example.org/Mortal').
