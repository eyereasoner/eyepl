% Following a classification chain 10 levels deep
%
% Follow 10 classification steps from n0 through n10. The individual
% ind starts with label n0 and acquires the next n label plus two side
% labels, i and j, at each step. The final n label implies a2.
%
% The query asks which individual has label a2, and the proof traces
% the supporting chain. Longer versions produce larger proofs.

is_a(ind, n0).

is_a(Entity, a2) :-
    is_a(Entity, n10).
is_a(Entity, n1) :-
    is_a(Entity, n0).
is_a(Entity, i1) :-
    is_a(Entity, n0).
is_a(Entity, j1) :-
    is_a(Entity, n0).
is_a(Entity, n2) :-
    is_a(Entity, n1).
is_a(Entity, i2) :-
    is_a(Entity, n1).
is_a(Entity, j2) :-
    is_a(Entity, n1).
is_a(Entity, n3) :-
    is_a(Entity, n2).
is_a(Entity, i3) :-
    is_a(Entity, n2).
is_a(Entity, j3) :-
    is_a(Entity, n2).
is_a(Entity, n4) :-
    is_a(Entity, n3).
is_a(Entity, i4) :-
    is_a(Entity, n3).
is_a(Entity, j4) :-
    is_a(Entity, n3).
is_a(Entity, n5) :-
    is_a(Entity, n4).
is_a(Entity, i5) :-
    is_a(Entity, n4).
is_a(Entity, j5) :-
    is_a(Entity, n4).
is_a(Entity, n6) :-
    is_a(Entity, n5).
is_a(Entity, i6) :-
    is_a(Entity, n5).
is_a(Entity, j6) :-
    is_a(Entity, n5).
is_a(Entity, n7) :-
    is_a(Entity, n6).
is_a(Entity, i7) :-
    is_a(Entity, n6).
is_a(Entity, j7) :-
    is_a(Entity, n6).
is_a(Entity, n8) :-
    is_a(Entity, n7).
is_a(Entity, i8) :-
    is_a(Entity, n7).
is_a(Entity, j8) :-
    is_a(Entity, n7).
is_a(Entity, n9) :-
    is_a(Entity, n8).
is_a(Entity, i9) :-
    is_a(Entity, n8).
is_a(Entity, j9) :-
    is_a(Entity, n8).
is_a(Entity, n10) :-
    is_a(Entity, n9).
is_a(Entity, i10) :-
    is_a(Entity, n9).
is_a(Entity, j10) :-
    is_a(Entity, n9).

% Answer
?- is_a(Who, a2).

% Reason
?- why.

% Check
?- check((is_a(ind, a2))).
?- check((is_a(ind, n10))).
?- check((is_a(ind, i10))).
?- check((is_a(ind, j10))).
?- check((\+ (is_a(ind, n11)))).
