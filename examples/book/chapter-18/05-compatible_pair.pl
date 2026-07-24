% From The Art of Eyepl, Chapter 18.
compatible_pair(A, B) :-
  person(A),
  person(B),
  neq(A, B),
  not(conflict(A, B)).
