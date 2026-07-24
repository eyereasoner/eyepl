% From The Art of Eyepl, Chapter 25 — Closed-world choice.
in_good_standing(Person) :-
  person(Person),
  not(suspended(Person)).
