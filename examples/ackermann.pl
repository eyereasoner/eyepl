% Calculating a rapidly growing function
%
% Calculate the Ackermann function, whose values grow rapidly even for small
% inputs. Supply a pair [M, N] of nonnegative integers to ask for A(M, N).
%
% The helper takes [Level, Count, Base] and progresses from addition and
% multiplication to powers and repeated powers. Integer results retain every
% digit. The supplied queries include very large answers; increasing the
% inputs can require much more time and memory.

:- table ackermann/2.

ackermann([M, N], _Calc2) :-
    M >= 0,
    N >= 0,
    _Calc1 is (N + 3),
    ackermann([M, _Calc1, 2], Result),
    _Calc2 is (Result - 3).
ackermann([0, Count, Base], _Calc1) :-
    Count >= 0,
    _Calc1 is (Count + 1).
ackermann([1, Count, Base], _Calc1) :-
    Count >= 0,
    Base >= 0,
    _Calc1 is (Count + Base).
ackermann([2, Count, Base], _Calc1) :-
    Count >= 0,
    Base >= 0,
    _Calc1 is (Count * Base).
ackermann([3, Count, Base], _Calc1) :-
    Count >= 0,
    Base >= 0,
    _Calc1 is (Base ^ Count).
ackermann([Level, 0, Base], 1) :-
    Level > 3,
    Base >= 0.
ackermann([Level, Count, Base], Result) :-
    Level > 3,
    Count > 0,
    Base >= 0,
    _Calc1 is (Count - 1),
    ackermann([Level, _Calc1, Base], Previous),
    _Calc2 is (Level - 1),
    ackermann([_Calc2, Previous, Base], Result).

% Answer
?- ackermann([0, 0], What).
?- ackermann([0, 6], What).
?- ackermann([1, 2], What).
?- ackermann([1, 7], What).
?- ackermann([2, 2], What).
?- ackermann([2, 9], What).
?- ackermann([3, 4], What).
?- ackermann([3, 1000], What).
?- ackermann([4, 0], What).
?- ackermann([4, 1], What).
?- ackermann([4, 2], What).

% Reason
?- why.

% Answer
?- ackermann([5, 0], What).

% Reason
?- why.

% Check
?- check((ackermann([0, 0], 1))).
?- check((ackermann([0, 6], 7))).
?- check((ackermann([1, 2], 4))).
?- check((ackermann([1, 7], 9))).
?- check((ackermann([2, 2], 7))).
?- check((ackermann([2, 9], 21))).
?- check((ackermann([3, 4], 125))).
?- check((_Calc1 is ((2 ^ 1003) - 3), ackermann([3, 1000], _Calc1))).
?- check((ackermann([4, 0], 13))).
?- check((ackermann([4, 1], 65533))).
?- check((_Calc1 is ((2 ^ 65536) - 3), ackermann([4, 2], _Calc1))).
?- check((ackermann([5, 0], 65533))).
