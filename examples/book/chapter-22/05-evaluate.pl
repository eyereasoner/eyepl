% From The Art of Eyepl, Chapter 22 — Interpreting an expression.
evaluate(number(N), N).

evaluate(add(Left, Right), Value) :-
  evaluate(Left, L),
  evaluate(Right, R),
  add(L, R, Value).

evaluate(multiply(Left, Right), Value) :-
  evaluate(Left, L),
  evaluate(Right, R),
  mul(L, R, Value).
