% Comparing an age with a threshold
%
% Check whether Pat is strictly older than a given number of years on a
% specified date. The sample birthday is 21 August 1944, and the comparison
% date is 12 October 2026; the program does not read the current date.
%
% The rules compare the year, month, and day. On the birthday that reaches
% the requested age, the person is exactly that age, so the strict test
% fails. Supply valid calendar dates; this example does not validate them.

:- table 'is-older-than'/2.
birthday('pat-h', [1944, 8, 21]).
date(today, [2026, 10, 12]).
person(test, 'pat-h').
'age-limit'(test, 80).

'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 > Years.
'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 = Years,
    Month > BirthMonth.
'is-older-than'(Person, Years) :-
    birthday(Person, [BirthYear, BirthMonth, BirthDay]),
    date(today, [Year, Month, Day]),
    _Calc1 is (Year - BirthYear),
    _Calc1 = Years,
    Month = BirthMonth,
    Day > BirthDay.
is_a(test, 'passed-check') :-
    person(test, Person),
    'age-limit'(test, Years),
    'is-older-than'(Person, Years).

% Answer
?- 'is-older-than'(Who, 80).
?- is_a(test, 'passed-check').

% Reason
?- why.

% Check
?- check(('is-older-than'('pat-h', 80))).
?- check(('is-older-than'('pat-h', 82))).
?- check((\+ ('is-older-than'('pat-h', 83)))).
?- check((is_a(test, 'passed-check'))).
?- check((aggregate_all(count, is_a(Subject, 'passed-check'), 1))).
