% Names, text, and numbers
%
% Three records store an atom, a string, and an integer as different values.
% Wheye selects the record with a string value, then lists every record.
% Quoted atoms allow complete IRIs and names with spaces or punctuation.

value(atom_record, '42').
value(text_record, "42").
value(number_record, 42).
label('https://example.org/city/Brussels', "Bruxelles").

% Answer
?- value(Record, "42").
?- value(Record, Value).
