% ISO 6.4: quoted atoms, decimal numbers, layout, and comments.
% The quoted comment markers also cover Neumerkel syntax rows 35-37:
% https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing
% These test term values directly; read/1 and writeq/1 are not implemented.
?- alpha = 'alpha'.
?- 'can''t' = 'can\'t'.
?- atom_codes('\t',[9]).
?- atom_codes('\n',[10]).
?- atom_codes('\\',[92]).
?- atom_codes('/*',[47,42]).
?- atom_codes('/**',[47,42,42]).
?- atom_codes('*/',[42,47]).
?- X = /* inline comment */ point(a,
    b). % comment after a term
?- 1.25e2 = 125.0.
?- 1.25e-2 = 0.0125.
