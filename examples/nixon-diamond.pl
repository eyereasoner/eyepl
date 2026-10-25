% Guarding a default against contrary evidence
%
% In this fictional rulebook, Quakers are normally classified as pacifists,
% while Republicans are classified as nonpacifists. Nixon belongs to both
% groups. The pacifist default applies only after the nonpacifist rules have
% finished and found no contrary evidence. Ada supplies a Quaker-only case.
%
% Stratified negation gives the nonpacifist rule priority within this model.
% Group membership and these defaults are supplied assumptions, not claims
% about people's actual beliefs. Positive and absent evidence stay distinct.

quaker(nixon).
republican(nixon).
quaker(ada).

pacifist(Person) :- quaker(Person), \+ nonpacifist(Person).
nonpacifist(Person) :- republican(Person).

classification(Person, quaker) :- quaker(Person).
classification(Person, republican) :- republican(Person).
classification(Person, pacifist) :- pacifist(Person).
classification(Person, nonpacifist) :- nonpacifist(Person).

% Answer
?- classification(Person, Class).

% Reason
?- why(pacifist(ada)).

% Check
?- check.
?- check(nonpacifist(nixon)).
?- check(\+ pacifist(nixon)).
?- check(pacifist(ada)).
?- check(\+ nonpacifist(ada)).
?- check(aggregate_all(count, classification(nixon, Class), 3)).
