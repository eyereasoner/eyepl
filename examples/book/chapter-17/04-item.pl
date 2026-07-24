% From The Art of Eyepl, Chapter 17.
item(X, [X | _]).
item(X, [_ | Rest]) :- item(X, Rest).
