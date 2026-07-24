% From The Art of Eyepl, Chapter 29 — Examples suggest; proofs compel.
counterexample_to_odd_square(N) :-
  between(1, 10000, N),
  mod(N, 2, 1),
  mul(N, N, Square),
  mod(Square, 2, Remainder),
  neq(Remainder, 1).

query(counterexample_to_odd_square(N)).
