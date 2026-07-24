% From The Art of Eyepl, Chapter 32 — Compare specification and implementation.
reference_square(N, S) :-
  between(0, 20, N),
  mul(N, N, S).

optimized_square(N, S) :-
  between(0, 20, N),
  mul(N, N, S).

disagreement(N, S) :-
  reference_square(N, S),
  not(optimized_square(N, S)).

query(disagreement(N, S)).
