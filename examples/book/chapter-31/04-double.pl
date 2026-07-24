% From The Art of Eyepl, Chapter 31 — Properties over finite domains.
double(N, D) :- add(N, N, D).

double_is_even(N) :-
  double(N, D),
  mod(D, 2, 0).

bounded_double_law :-
  forall(between(-100, 100, N), double_is_even(N)).

query(bounded_double_law).
