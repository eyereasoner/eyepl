% Herbrand terms denote themselves: distinct names and constructor applications
% remain distinct without extra unique-name or free-constructor axioms.

% Output declaration: materialize/2 selects the relation written to this
% example's golden output.
materialize(different, 2).

% Under unrestricted Tarskian semantics, alice and bob could denote the same
% element. In Deriva's Herbrand universe, their different syntax is enough.
different(alice, bob) :-
  neq(alice, bob).

% A general Tarskian function need not be injective. Herbrand compound terms
% are free constructors, so different arguments produce different terms.
different(ticket(alice), ticket(bob)) :-
  neq(ticket(alice), ticket(bob)).
