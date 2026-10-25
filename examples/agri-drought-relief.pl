% Deciding a farm's drought-relief application
%
% A farm qualifies under this illustrative policy when its area is at least
% 5 hectares, rainfall over the last 30 days is below 20 millimeters, and
% yield has fallen by at least 30 kilograms per hectare. The drop is an
% absolute difference, not a percentage. Farm Alpha meets all three tests.
%
% An eligible submitted application gains an approved status and a distinct
% payment record. Submitted remains a recorded status; no fact is replaced
% and no payment is sent. Rejection requires explicit false eligibility,
% rather than missing evidence. Facts supply the required input fields;
% these rules do not validate a schema.

:- table qualifies/4.

application(dr01, drought_relief, alpha).
status(dr01, submitted).
evidence(dr01, area).
evidence(dr01, rainfall).
evidence(dr01, yield).
% farm(Name, AreaHectares, RainMillimeters, BaselineYield, CurrentYield).
farm(alpha, 8, 12, 100, 60).

qualifies(Area, Rain, Baseline, Current) :-
    Area >= 5, Rain < 20, Drop is Baseline-Current, Drop >= 30.
eligible(App, true) :-
    application(App, drought_relief, Farm), farm(Farm, Area, Rain, Baseline, Current),
    qualifies(Area, Rain, Baseline, Current).
status(App, approved) :- eligible(App, true), status(App, submitted).
status(App, rejected) :- eligible(App, false), status(App, submitted).
issued_payment(App, Payment) :- status(App, approved), fresh(Payment).

% Answer
?- status(Application, Status).
?- issued_payment(Application, Payment).

% Reason
?- why.

% Check
?- check.
?- check(eligible(dr01, true)).
?- check(status(dr01, approved)).
?- check(status(dr01, submitted)).
?- check(aggregate_all(count, issued_payment(dr01, Payment), 1)).
?- check(aggregate_all(count, evidence(dr01, Kind), 3)).
?- check(qualifies(5, 19, 100, 70)).
?- check(\+ qualifies(4, 12, 100, 60)).
?- check(\+ qualifies(8, 20, 100, 60)).
?- check(\+ qualifies(8, 12, 100, 71)).
?- check(\+ status(dr01, rejected)).
