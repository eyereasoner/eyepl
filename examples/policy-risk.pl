% Scoring findings in a policy rulebook
%
% Score findings in six illustrative policy clauses, attach reasons and
% suggested changes, and rank findings by the number of distinct higher
% scores. The checks cover missing safeguards, short notice, sharing without
% consent, and a prohibition on export.
%
% Scores, thresholds, and suggested changes are supplied model choices. The
% output describes this rulebook's assessment rather than a determination of
% legal compliance.

permission(c1, remove_account).
permission(c2, change_terms).
permission(c3, share_data).
prohibition(c4, export_data).
notice_days(c2, 3).
permission(c5, share_data).
safeguard(c5, consent).
permission(c6, change_terms).
notice_days(c6, 14).
importance(retention, 20).
importance(prior_notice, 15).
importance(consent, 12).
importance(portability, 10).
required_notice(14).
has_notice(Clause) :- notice_days(Clause, Days), Days >= 0.
finding(Clause, Raw, no_removal_safeguards, add_notice_and_inform) :-
    permission(Clause, remove_account), importance(retention, Weight),
    \+ has_notice(Clause), \+ safeguard(Clause, inform), Raw is 90+Weight.
finding(Clause, Raw, short_notice(Days, Required), increase_notice(Required)) :-
    permission(Clause, change_terms), notice_days(Clause, Days),
    required_notice(Required), Days < Required,
    importance(prior_notice, Weight), Raw is 70+Weight.
finding(Clause, Raw, sharing_without_consent, require_consent) :-
    permission(Clause, share_data), \+ safeguard(Clause, consent),
    importance(consent, Weight), Raw is 85+Weight.
finding(Clause, Raw, export_prohibited, permit_export) :-
    prohibition(Clause, export_data), importance(portability, Weight), Raw is 60+Weight.
score(Clause, 100) :- finding(Clause, Raw, Why, Fix), Raw > 100.
score(Clause, Raw) :- finding(Clause, Raw, Why, Fix), Raw =< 100.
severity(Score, high) :- Score >= 80.
severity(Score, moderate) :- Score >= 50, Score < 80.
severity(Score, low) :- Score < 50.
higher(Score, Other) :- score(Clause, Other), Other > Score.
report(Rank, Clause, Score, Severity, Why, Fix) :-
    score(Clause, Score), finding(Clause, Raw, Why, Fix), severity(Score, Severity),
    aggregate_all(count, higher(Score, Other), Count), Rank is Count + 1.

% Answer
?- report(Rank, Clause, Score, Severity, Why, Fix).

% Reason
?- why.

% Check
?- check(report(1, c1, 100, high, no_removal_safeguards, add_notice_and_inform)).
?- check(report(2, c3, 97, high, sharing_without_consent, require_consent)).
?- check(report(3, c2, 85, high, short_notice(3, 14), increase_notice(14))).
?- check(report(4, c4, 70, moderate, export_prohibited, permit_export)).
?- check(aggregate_all(count, report(Rank, Clause, Score, Severity, Why, Fix), 4)).
?- check(aggregate_all(count, score(c5, Score), 0)).
?- check(aggregate_all(count, score(c6, Score), 0)).
