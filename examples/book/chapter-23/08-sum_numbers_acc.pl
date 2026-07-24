% From The Art of Eyepl, Chapter 23.
sum_numbers_acc(List, Sum) :- sum_from(List, 0, Sum).

sum_from([], Accumulator, Accumulator).
sum_from([X | Xs], Accumulator, Sum) :-
  add(Accumulator, X, Next),
  sum_from(Xs, Next, Sum).
