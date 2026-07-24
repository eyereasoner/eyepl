% From The Art of Eyepl, Chapter 6.
square(N, Square) :-
  between(1, 10, N),
  mul(N, N, Square).
