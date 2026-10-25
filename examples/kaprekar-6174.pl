% Following the four-digit Kaprekar routine
%
% Sort a number's four digits in ascending and descending order, then
% subtract the smaller number from the larger. Leading zeros count as
% digits: 999 is treated as 0999. Repeating this operation reaches 6174 for
% the selected non-repeated-digit inputs; 6174 then maps to itself.
%
% Lists record each resulting number through the first 6174. Starting at
% 6174 gives [6174]. Repeated-digit inputs reach zero and have no such list.
% Supply an integer from 0 through 9999. Tabled list rules sort four digits,
% and all subtraction is exact. The queries select five starting numbers.

:- table insert/3, sort_digits/2, step/2, kaprekar/2.

start(3524).
start(6174).
start(2111).
start(1000).
start(9999).

insert(X, [], [X]).
insert(X, [Y | Rest], [X, Y | Rest]) :- X =< Y.
insert(X, [Y | Rest], [Y | Sorted]) :- X > Y, insert(X, Rest, Sorted).
sort_digits([], []).
sort_digits([Head | Tail], Sorted) :-
    sort_digits(Tail, Before), insert(Head, Before, Sorted).

step(N, Next) :-
    N >= 0, N =< 9999,
    A is N div 1000, B is (N div 100) mod 10,
    C is (N div 10) mod 10, D is N mod 10,
    sort_digits([A, B, C, D], [Low, MidLow, MidHigh, High]),
    Next is 999*(High-Low) + 90*(MidHigh-MidLow).

kaprekar(6174, [6174]).
kaprekar(N, [6174]) :- N =\= 6174, step(N, 6174).
kaprekar(N, [Next | Rest]) :-
    N =\= 6174, step(N, Next), Next > 0, Next =\= 6174,
    kaprekar(Next, Rest).
trajectory(N, Sequence) :- start(N), kaprekar(N, Sequence).

% Answer
?- trajectory(Start, Sequence).

% Reason
?- why(trajectory(3524, Sequence)).

% Check
?- check.
?- check(kaprekar(3524, [3087, 8352, 6174])).
?- check(kaprekar(6174, [6174])).
?- check(kaprekar(2111, [999, 8991, 8082, 8532, 6174])).
?- check(step(999, 8991)).
?- check(step(6174, 6174)).
?- check(step(9999, 0)).
?- check(aggregate_all(count, kaprekar(9999, Sequence), 0)).
?- check(aggregate_all(count, kaprekar(0, Sequence), 0)).
?- check(aggregate_all(count, trajectory(Start, Sequence), 4)).
