% ISO list notation and '.'/2, restricted here to proper/partial lists.
?- [a,b] = [Head|Tail].
?- '.'(a,[]) = [a].
?- '.'(a,'.'(b,[])) = [a,b].
?- [X|Tail] = [a,b], Tail = [Y].
?- [a] = [].
?- [a,b] = [a].
?- [[a],point(b)] = [Head|Tail].
