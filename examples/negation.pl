% Selecting players with no recorded need for rest
%
% Select players who can join a game because the completed program has no
% evidence that they need rest. Luna is listed as tired, so the rest rule
% excludes Luna; Milo and Rex remain eligible.
%
% The operator \+ tests for the absence of a matching answer after its
% supporting rules have finished. Moving the rest rule later in the file does
% not bypass it. A missing fact is treated as absent within this program,
% rather than as a general statement about the world.

is_a(milo, player).
is_a(luna, player).
is_a(rex, player).
is_a(luna, 'tired-player').

is_a(Player, 'ready-player') :-
    is_a(Player, player),
    \+ (needs(Player, rest)).
needs(Player, rest) :-
    is_a(Player, 'tired-player').
is_a(Player, 'eager-player') :-
    is_a(Player, player),
    \+ (is_a(Player, 'tired-player')).

% Answer
?- is_a(Who, 'ready-player').

% Reason
?- why.

% Answer
?- is_a(Who, 'eager-player').
?- \+ (needs(milo, rest)).

% Reason
?- why.

% Answer
?- \+ (needs(luna, rest)).

% Reason
?- why.

% Answer
?- aggregate_all(count, is_a(Subject, 'ready-player'), Result).

% Check
?- check((is_a(milo, 'ready-player'))).
?- check((is_a(rex, 'ready-player'))).
?- check((\+ (is_a(luna, 'ready-player')))).
?- check((needs(luna, rest))).
?- check((\+ (needs(milo, rest)))).
?- check((aggregate_all(count, is_a(Subject, 'ready-player'), 2))).
