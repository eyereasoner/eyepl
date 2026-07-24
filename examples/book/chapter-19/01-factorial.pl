% From The Art of Eyepl, Chapter 19 — Termination needs its own argument.
factorial(0, 1).
factorial(N, F) :-
  gt(N, 0),
  sub(N, 1, Previous),
  factorial(Previous, PF),
  mul(N, PF, F).
