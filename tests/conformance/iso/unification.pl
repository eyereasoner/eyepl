% ISO 8.2: finite structural unification and non-unifiability.
?- X = a.
?- X = Y, Y = point(2,3).
?- pair(X,X) = pair(a,b).
?- pair(X,Y) = pair(a,b).
?- f(a) = g(a).
?- f(a) = f(a,b).
?- 1 = 1.0.
?- '1' = 1.
?- X \= a.
?- f(a) \= f(b).
?- X = a, f(X,a) \= f(b,X).
?- X = a, X \= b.
?- X = a, X \= a.
