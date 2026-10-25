% Deriving that Socrates is mortal
%
% Infer that Socrates is mortal from the fact that Socrates is human and the
% rule that every human is mortal. The query asks who is mortal, why asks for
% the proof, and goal checks confirm the expected answer.

human(socrates).
mortal(Person) :- human(Person).

% Answer
?- mortal(Who).

% Reason
?- why.

% Check
?- check.
?- check(mortal(socrates)).
?- check(aggregate_all(count, mortal(Person), 1)).
