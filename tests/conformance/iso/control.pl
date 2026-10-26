% ISO 7.8: true, conjunction, and ground negation of single goals.
present(a).
?- true.
?- true, true.
?- (X = a, (Y = b, true)).
?- \+ present(b).
?- \+ present(a).
?- \+ (1 = 2).
?- \+ (1 = 1).
?- X = a, \+ (X = b).
