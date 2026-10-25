% Moving a stack in the Towers of Hanoi puzzle
%
% Solve the Towers of Hanoi puzzle for three disks. Move the stack between
% two pegs using a spare peg, moving one disk at a time and never placing a
% larger disk on a smaller one. Recursive rules construct the ordered list of
% moves.

:- table append/3, moves/5.

append([], Ys, Ys).
append([X | Xs], Ys, [X | Zs]) :-
    append(Xs, Ys, Zs).

moves(1, From, To, _, [move(From, To)]).
moves(N, From, To, Spare, Moves) :-
    N > 1,
    Smaller is N - 1,
    moves(Smaller, From, Spare, To, First),
    moves(Smaller, Spare, To, From, Last),
    append(First, [move(From, To) | Last], Moves).

% Answer
?- moves(3, left, right, center, Moves).

% Reason
?- why.

% Check
?- check(moves(1, left, right, center, [move(left, right)])).
?- check(moves(2, left, right, center,
    [move(left, center), move(left, right), move(center, right)])).
?- check(moves(3, left, right, center,
    [move(left, right), move(left, center), move(right, center),
     move(left, right), move(center, left), move(center, right),
     move(left, right)])).
