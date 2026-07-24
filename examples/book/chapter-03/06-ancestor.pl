% From The Art of Eyepl, Chapter 3.
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
