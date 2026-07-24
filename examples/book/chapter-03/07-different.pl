% From The Art of Eyepl, Chapter 3 — Why terms denote themselves.
different(alice, bob) :- neq(alice, bob).
different(ticket(alice), ticket(bob)) :-
  neq(ticket(alice), ticket(bob)).
