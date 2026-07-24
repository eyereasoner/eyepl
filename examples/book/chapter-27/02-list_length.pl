% From The Art of Eyepl, Chapter 27 — Structural induction and data design.
list_length([], 0).
list_length([_ | Tail], N) :-
  list_length(Tail, M),
  add(M, 1, N).
