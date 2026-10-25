% Deriving permissions from roles and exclusions
%
% Derive read and write permissions from users' roles, then exclude suspended
% users. Alice is an editor, Bob is a viewer, and Carol is a suspended
% editor.
%
% The queries distinguish permissions suggested by a role from actions that
% remain allowed after exclusions. A user is treated as unsuspended when the
% completed program has no suspended fact for that user.

role(alice, editor).
role(bob, viewer).
role(carol, editor).
permits(editor, read).
permits(editor, write).
permits(viewer, read).
suspended(carol).

candidate(User, Action) :-
    role(User, Role),
    permits(Role, Action).
allowed(User, Action) :-
    candidate(User, Action),
    \+ suspended(User).

% Answer
?- allowed(User, Action).

% Reason
?- why.

% Answer
?- candidate(carol, Action).

% Reason
?- why.

% Check
?- check(allowed(alice, read)).
?- check(allowed(alice, write)).
?- check(allowed(bob, read)).
?- check(\+ allowed(bob, write)).
?- check(candidate(carol, read)).
?- check(candidate(carol, write)).
?- check(\+ allowed(carol, read)).
?- check(\+ allowed(carol, write)).
?- check(aggregate_all(count, allowed(User, Action), 3)).
