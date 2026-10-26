% ISO 6.1 / 7.4: anonymous variables, sharing, and clause scope.
pair(a,b).
same(X,X).
left(X) :- X = a.
right(X) :- X = b.
?- pair(_,_).
?- pair(_Shared,_Shared).
?- pair(_Left,_Right).
?- same(a,b).
?- same(a,X).
?- left(X), right(Y).
?- X = b.
