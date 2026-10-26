% ISO 8.5: =../2 decomposition and construction, with proper lists.
?- point(2,3) =.. Parts.
?- Term =.. [point,2,3].
?- a =.. Parts.
?- 42 =.. Parts.
?- 1.5 =.. Parts.
?- [] =.. Parts.
?- [a,b] =.. Parts.
?- Term =.. ['.',a,[]].
?- Term =.. [point,X], X = a.
?- point(a) =.. [point,b].
