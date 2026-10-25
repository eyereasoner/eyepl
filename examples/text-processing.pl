% Building names and reading numbers from text
%
% Convert names and text to lists of Unicode character codes, then use
% ordinary list rules to build a sensor name and read an unsigned decimal
% number. The sample "0042" gives the name sensor_0042 and the integer 42.
%
% atom_codes/2 handles atoms, and string_codes/2 handles strings. Each
% Unicode character, including an emoji such as U0001f600, contributes one
% code point. Decimal parsing uses exact integer arithmetic and rejects empty
% text, signs, and nondigit characters.

:- table append/3, decimal_digits/3.

reading("0042").
label(sensor, 'café 😀').

append([], Right, Right).
append([Head | Tail], Right, [Head | Joined]) :-
  append(Tail, Right, Joined).

decimal_digits([], Value, Value).
decimal_digits([Code | Rest], Accumulator, Value) :-
  Code >= 48,
  Code =< 57,
  Next is Accumulator * 10 + Code - 48,
  decimal_digits(Rest, Next, Value).

unsigned_decimal(Text, Value) :-
  string_codes(Text, [First | Rest]),
  decimal_digits([First | Rest], 0, Value).

sensor_record(Name, Value) :-
  reading(Text),
  unsigned_decimal(Text, Value),
  atom_codes(sensor_, Prefix),
  string_codes(Text, Digits),
  append(Prefix, Digits, Codes),
  atom_codes(Name, Codes).

label_text(Name, Text) :-
  label(Name, Atom),
  atom_codes(Atom, Codes),
  string_codes(Text, Codes).

% Answer
?- sensor_record(Name, Value).

% Reason
?- why.

% Answer
?- label_text(Name, Text).
?- string_codes("café 😀", Codes).

% Check
?- check(sensor_record(sensor_0042, 42)).
?- check(label_text(sensor, "café 😀")).
?- check(string_codes("café 😀", [99, 97, 102, 233, 32, 128512])).
?- check(unsigned_decimal("900719925474099312345", 900719925474099312345)).
?- check(unsigned_decimal("0", 0)).
?- check(\+ unsigned_decimal("", 0)).
?- check(\+ unsigned_decimal("4x", 4)).
?- check(\+ unsigned_decimal("-42", -42)).
?- check(atom_codes('', [])).
?- check(string_codes("", [])).
