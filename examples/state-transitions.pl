% Following an account balance through an event log
%
% Calculate an account's balance after each event in an ordered log. Events
% have consecutive numbers: the balance after event N uses the balance after
% event N-1 and the event's deposit or withdrawal. Earlier states remain
% available as facts; no stored balance is overwritten.

:- table balance/2.
:- table between/3.

% Enumerate an inclusive range with bound integer endpoints.
between(Low, High, Low) :- Low =< High.
between(Low, High, Value) :-
    Low < High,
    Next is Low + 1,
    between(Next, High, Value).

opening_balance(100).
event(1, deposit, 25).
event(2, withdraw, 40).
event(3, withdraw, 20).

balance(0, Amount) :-
    opening_balance(Amount).
balance(N, Amount) :-
    N > 0,
    event(N, deposit, Value),
    Before is N - 1,
    balance(Before, Previous),
    Amount is Previous + Value.
balance(N, Amount) :-
    N > 0,
    event(N, withdraw, Value),
    Before is N - 1,
    balance(Before, Previous),
    Amount is Previous - Value.

% Answer
?- balance(3, Amount).

% Reason
?- why.

% Answer
?- between(0, 3, N), balance(N, Amount).

% Reason
?- why.

% Check
?- check(balance(0, 100)).
?- check(balance(1, 125)).
?- check(balance(2, 85)).
?- check(balance(3, 65)).
?- check(aggregate_all(count, balance(4, Amount), 0)).
