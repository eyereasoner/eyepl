% Strings are a separate type; [] is distinct from the quoted atom '[]'.
% Unicode codes are scalar values, while lexical ordering uses UTF-16.
?- "abc" = abc.
?- "abc" = [97,98,99].
?- [] = '[]'.
?- "abc" =.. Parts.
?- atom_codes('é🙂',Codes).
?- string_codes("é🙂",Codes).
?- '\u0021' = '!'.
?- '🙂' @< '\uE000'.
