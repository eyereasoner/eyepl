% Finding Easter Sunday
%
% Calculate Easter Sunday in the Gregorian calendar for every year from 2021
% through 2050. Each answer is a [Month, Day] pair.
%
% The calculation uses integer arithmetic and the Meeus/Jones/Butcher
% algorithm for Gregorian Easter. The easter/2 predicate restricts answers to
% the stated year range.

:- table computus/2, in_range/3.

computus(Year, [Month, Day]) :-
    A is Year rem 19,
    B is Year // 100,
    C is Year rem 100,
    D is (19*A + B - B//4 - ((B - (B + 8)//25 + 1)//3) + 15) rem 30,
    E is (32 + 2*(B rem 4) + 2*(C//4) - D - (C rem 4)) rem 7,
    F is D + E - 7*((A + 11*D + 22*E)//451) + 114,
    Month is F // 31,
    Day is F rem 31 + 1.

in_range(Low, High, Low) :-
    Low =< High.
in_range(Low, High, N) :-
    Low < High,
    Next is Low + 1,
    in_range(Next, High, N).

easter(Year, Date) :-
    in_range(2021, 2050, Year),
    computus(Year, Date).

% Answer
?- easter(Year, Date).

% Reason
?- why(easter(2026, [4, 5])).

% Check
?- check(easter(2021, [4, 4])).
?- check(easter(2024, [3, 31])).
?- check(easter(2025, [4, 20])).
?- check(easter(2026, [4, 5])).
?- check(aggregate_all(count, easter(Year, Date), 30)).
?- check(aggregate_all(count, easter(2020, Date), 0)).
?- check(aggregate_all(count, easter(2051, Date), 0)).
