% From The Art of Eyepl, Chapter 31 — Positive and negative observers.
edge(a, b).
edge(b, c).

path(X, Y) :- edge(X, Y).
path(X, Z) :- edge(X, Y), path(Y, Z).

query(path(a, b)).
query(path(a, c)).
