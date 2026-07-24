% From The Art of Eyepl, Chapter 26 — Answers are existential witnesses.
triple(A, B, C) :-
  between(1, 20, A),
  between(A, 20, B),
  between(B, 20, C),
  mul(A, A, AA),
  mul(B, B, BB),
  add(AA, BB, Sum),
  mul(C, C, Sum).

query(triple(A, B, C)).
