% Separating obligations, observed actions, and compensation
%
% Alice was obliged to obtain consent and prohibited from sharing a record.
% The supplied observations explicitly record missing consent and sharing.
% A configured notification compensates for the sharing violation; it does
% not remove the separate missed obligation, so review is still required.
% The rulebook is illustrative. Explicit not_performed facts differ from
% missing observations, and compensation records do not erase violations
% or establish legal compliance.

actor(alice).
action(share_record).
action(delete_unneeded_copy).

obliged(alice, obtain_consent).
prohibited(alice, share_record).
compensates(share_record, notify_dpo).

performed(alice, share_record).
performed(alice, notify_dpo).
not_performed(alice, obtain_consent).
not_performed(alice, delete_unneeded_copy).

violation(Actor, missed_obligation(Action)) :-
  obliged(Actor, Action),
  not_performed(Actor, Action).

violation(Actor, prohibited_action(Action)) :-
  prohibited(Actor, Action),
  performed(Actor, Action).

compensated_violation(Actor, Action, Compensation) :-
  prohibited(Actor, Action),
  performed(Actor, Action),
  compensates(Action, Compensation),
  performed(Actor, Compensation).

uncompensated_violation(Actor, missed_obligation(Action)) :-
  violation(Actor, missed_obligation(Action)).

uncompensated_violation(Actor, prohibited_action(Action)) :-
  violation(Actor, prohibited_action(Action)),
  \+ has_compensation(Actor, Action).

compensation(Actor, compensation(Action, Compensation)) :-
  compensated_violation(Actor, Action, Compensation).

status(Actor, requires_review) :-
  uncompensated_violation(Actor, _violation).

has_compensation(Actor, Action) :- compensated_violation(Actor, Action, Compensation).

% Answer
?- violation(Actor, Violation).
?- compensation(Actor, Compensation).
?- status(Actor, Status).

% Reason
?- why(status(alice, requires_review)).

% Check
?- check.
?- check(violation(alice, missed_obligation(obtain_consent))).
?- check(violation(alice, prohibited_action(share_record))).
?- check(compensation(alice, compensation(share_record, notify_dpo))).
?- check(\+ uncompensated_violation(alice, prohibited_action(share_record))).
?- check(uncompensated_violation(alice, missed_obligation(obtain_consent))).
?- check(\+ violation(alice, missed_obligation(delete_unneeded_copy))).
?- check(aggregate_all(count, violation(Actor, Violation), 2)).
