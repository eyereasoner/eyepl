% Wheye stores and projects answer sets, and missing relations are empty.
item(a).
item(a).
item(b).
project(X) :- item(X).
project(X) :- item(X).
?- project(X).
?- item(_).
?- missing(a).
?- \+ missing(a).
