% Approximating pi with an alternating series
%
% Start at 3 and add corrections 4/(2*3*4), -4/(4*5*6), and so on.
% The queries use three, seven, and eleven corrections from the Nilakantha
% series. More terms improve these particular approximations.
%
% Recursive rules carry the sum and alternate the sign. Calculations use
% approximate real arithmetic. Displayed values are rounded to twelve
% decimal places; checks use the unrounded results and an alternating-series
% bound given by the magnitude of the next correction.

:- table series/5, pi_approximation/2.

terms(3).
terms(7).
terms(11).

series(K, Last, Sum, _, Sum) :- K > Last.
series(K, Last, Accumulated, Sign, Sum) :-
    K =< Last,
    Twice is 2*K,
    Denominator is Twice*(Twice+1)*(Twice+2),
    Updated is Accumulated + Sign/Denominator,
    Opposite is -Sign, Next is K + 1,
    series(Next, Last, Updated, Opposite, Sum).
pi_approximation(Terms, Pi) :-
    Terms >= 0, series(1, Terms, 0.0, 1, Sum), Pi is 3 + 4*Sum.

approximation(Terms, Rounded) :-
    terms(Terms), pi_approximation(Terms, Raw),
    Rounded is round(Raw*1000000000000)/1000000000000.
within_next_term(Terms) :-
    terms(Terms), pi_approximation(Terms, Value), Next is 2*(Terms+1),
    abs(Value-pi) < 4/(Next*(Next+1)*(Next+2)).

% Answer
?- approximation(Terms, Pi).

% Reason
?- why(approximation(3, Pi)).

% Check
?- check.
?- check(pi_approximation(0, 3.0)).
?- check(aggregate_all(count, within_next_term(Terms), 3)).
?- check((pi_approximation(3, A), pi_approximation(7, B), pi_approximation(11, C), abs(C-pi) < abs(B-pi), abs(B-pi) < abs(A-pi))).
