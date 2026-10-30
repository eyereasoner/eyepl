% Non-unifiability can succeed with free variables in ISO Prolog, but eyepl
% cannot record this successful decision as ground built-in evidence.
?- f(X,a) \= f(b,X).
