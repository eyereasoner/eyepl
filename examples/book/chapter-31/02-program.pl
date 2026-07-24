% From The Art of Eyepl, Chapter 31.
unexpected_path :-
  path(a, d).

expected_absence :-
  not(unexpected_path).

query(expected_absence).
