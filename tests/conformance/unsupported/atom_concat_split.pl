% ISO atom_concat/3 can enumerate every split of a bound atom; eyepl needs
% two bound arguments, so this mode is rejected.
p(X,Y) :- atom_concat(X,Y,ab).
?- p(A,B).
