% Multiplying by halving and doubling
%
% Multiply integers by repeatedly halving one operand and doubling the other,
% adding the doubled values from rows where the halved operand is odd. The
% related exponentiation rule squares the base and halves the exponent,
% multiplying the selected powers.
%
% Supply nonnegative integers. Results retain every integer digit, including
% the large sample products and powers. The algorithms are often called
% peasant or Egyptian multiplication and repeated-squaring exponentiation.

:- table prod/2, pow/2.

prod([0, _], 0).
prod([X, Y], Z) :-
    X =\= 0,
    0 =:= X rem 2,
    S is X // 2,
    T is Y + Y,
    prod([S, T], Z).
prod([X, Y], Z) :-
    X =\= 0,
    1 =:= X rem 2,
    S is X // 2,
    T is Y + Y,
    prod([S, T], R),
    Z is R + Y.

pow([_, 0], 1).
pow([X, Y], Z) :-
    Y =\= 0,
    0 =:= Y rem 2,
    S is X * X,
    T is Y // 2,
    pow([S, T], Z).
pow([X, Y], Z) :-
    Y =\= 0,
    1 =:= Y rem 2,
    S is X * X,
    T is Y // 2,
    pow([S, T], R),
    Z is R * X.

% Answer
?- prod([3, 0], Product).
?- prod([5, 6], Product).

% Reason
?- why.

% Answer
?- prod([238, 13], Product).
?- prod([8367238, 27133], Product).
?- prod([62713345408367238, 40836723862713345], Product).
?- prod([4083672386271334562713345408367238, 4083672386271334562713345408367238], Product).
?- pow([3, 0], Power).
?- pow([5, 6], Power).

% Reason
?- why.

% Answer
?- pow([238, 13], Power).
?- pow([8367238, 2713], Power).

% Check
% Direct multiplication and exponentiation check the recursive algorithms.
?- check(prod([3, 0], 0)).
?- check(prod([5, 6], 30)).
?- check((prod([238, 13], Product), Product =:= 238 * 13)).
?- check((prod([8367238, 27133], Product), Product =:= 8367238 * 27133)).
?- check((prod([62713345408367238, 40836723862713345], Product),
              Product =:= 62713345408367238 * 40836723862713345)).
?- check((prod([4083672386271334562713345408367238, 4083672386271334562713345408367238], Product),
              Product =:= 4083672386271334562713345408367238 ^ 2)).
?- check(pow([3, 0], 1)).
?- check(pow([5, 6], 15625)).
?- check((pow([238, 13], Power), Power =:= 238 ^ 13)).
?- check((pow([8367238, 2713], Power), Power =:= 8367238 ^ 2713)).
