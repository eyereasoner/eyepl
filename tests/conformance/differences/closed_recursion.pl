% Left recursion and cycles terminate through tables; negation waits for
% completed producers. Queries see later source facts and clauses.
?- path(a,To).
?- \+ path(a,d).
path(X,Z) :- path(X,Y), edge(Y,Z).
path(X,Y) :- edge(X,Y).
edge(a,b).
edge(b,c).
edge(c,b).
