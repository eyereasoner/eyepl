% ISO 8.16.7: number_chars/2 writing numbers and reading them back.
?- number_chars(33,L).
?- number_chars(N,['3','3']).
?- number_chars(N,['-','2','5']).
?- number_chars(N,['0','.','5']).
?- number_chars(N,[' ','7']).
?- number_chars(N,['1','e','2']).
?- number_chars(1,['0','1']).
?- number_chars(2,['3']).
