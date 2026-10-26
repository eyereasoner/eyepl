% Wheye rejects cyclic unifications rather than creating rational trees.
?- X = f(X).
?- X = Y, Y = f(X).
?- X = [a|X].
?- X = f(Y), Y = a.
