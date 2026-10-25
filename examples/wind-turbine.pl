% Finding reasons for turbine maintenance
%
% List maintenance reasons for four illustrative wind turbines. Separate
% rules check elapsed time since maintenance, turbine age, reported issues,
% and efficiency. A turbine can receive more than one reason.
%
% Age is in years, time since maintenance in months, and efficiency in
% percent. The thresholds are supplied example rules. A problem-based reason
% requires a nonempty issue list. The queries report all reasons and check a
% turbine that triggers none.

turbine(t123, 5, 8, [], 92).
turbine(t456, 12, 15, [vibration], 78).
turbine(t789, 8, 7, [noise], 85).
turbine(t101, 15, 5, [], 65).

% Maintenance Rules
needs_maintenance(Turbine, time_based_maintenance) :-
    turbine(Turbine, _, LastMaint, _, _),
    LastMaint >= 12.    % Rule 1: Time-based maintenance

needs_maintenance(Turbine, age_based_maintenance) :-
    turbine(Turbine, Age, LastMaint, _, _),
    Age > 10,           % Rule 2: Age-based maintenance
    LastMaint >= 6.

needs_maintenance(Turbine, problem_based_maintenance) :-
    turbine(Turbine, _, _, [_ | _], _).    % Rule 3: Problem-based maintenance

needs_maintenance(Turbine, performance_based_maintenance) :-
    turbine(Turbine, _, _, _, Efficiency),
    Efficiency < 80.    % Rule 4: Performance-based maintenance

% Answer
?- needs_maintenance(Turbine, Reason).

% Reason
?- why.

% Answer
?- needs_maintenance(t123, Reason).

% Check
?- check(needs_maintenance(t456, time_based_maintenance)).
?- check(needs_maintenance(t456, age_based_maintenance)).
?- check(needs_maintenance(t456, problem_based_maintenance)).
?- check(needs_maintenance(t456, performance_based_maintenance)).
?- check(needs_maintenance(t789, problem_based_maintenance)).
?- check(needs_maintenance(t101, performance_based_maintenance)).
?- check(aggregate_all(count, needs_maintenance(Turbine, Reason), 6)).
?- check(aggregate_all(count, needs_maintenance(t123, Reason), 0)).
?- check(\+ needs_maintenance(t101, age_based_maintenance)).
