% ISO 8.16: atom_codes/2 on the common character set and supported modes.
?- atom_codes(abc,Codes).
?- atom_codes(Atom,[97,98,99]).
?- atom_codes('',Codes).
?- atom_codes(Atom,[]).
?- atom_codes(ab,[A,B]).
?- atom_codes(abc,[97,98]).
?- atom_codes(abc,[97,98,100]).
