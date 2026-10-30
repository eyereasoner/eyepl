% ISO 8.16.4: atom_chars/2 in both directions, including the empty atom.
?- atom_chars(abc,L).
?- atom_chars(A,[a,b,c]).
?- atom_chars('',L).
?- atom_chars(A,[]).
?- atom_chars(ab,[X,Y]).
?- atom_chars(abc,[a,b]).
