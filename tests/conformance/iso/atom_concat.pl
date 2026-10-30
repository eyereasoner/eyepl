% ISO 8.16.2: atom_concat/3 in modes where two arguments are bound atoms.
?- atom_concat(hello,' world',A).
?- atom_concat('',abc,A).
?- atom_concat(abc,'',A).
?- atom_concat(ab,cd,abcd).
?- atom_concat(ab,cd,abc).
?- atom_concat(hello,B,'hello world').
?- atom_concat(A,world,'hello world').
?- atom_concat(abc,B,abc).
?- atom_concat(x,B,abc).
