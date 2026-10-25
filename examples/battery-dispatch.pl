% Planning battery use
%
% Choose when to charge or discharge a battery to minimize grid energy cost
% while keeping enough energy in reserve at the end.
%
% Each time slot supplies demand, solar power, duration, and a price. Power
% is in kilowatts (kW), stored energy in kilowatt-hours (kWh), and prices in
% cents per kWh. Positive battery power charges; negative power discharges.
% The model excludes grid export and assumes no energy losses or battery
% wear. It finds all cheapest plans among the supplied slots and five integer
% power choices, reusing the cost calculated for each time-and-charge state.

:- table best_cost/3, minimum_actions/4, candidate_cost/4, transition/4,
         step_values/6, optimal_from/4, member/2.

capacity_kwh(4).
reserve_kwh(1).
power_limit_kw(2).
grid_limit_kw(3).
initial_charge_kwh(2).
final_charge_kwh(2).
last_slot(4).
actions([-2, -1, 0, 1, 2]).
% slot(Index, LoadKw, SolarKw, TariffCentsPerKwh, Hours).
slot(1, 2, 0, 2, 1).
slot(2, 4, 1, 8, 1).
slot(3, 1, 3, 2, 1).
slot(4, 3, 0, 7, 1).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
terminal_slot(Time) :- last_slot(Last), Time is Last + 1.
step_values(Time, Charge, Power, NextCharge, Grid, Cost) :-
  slot(Time, Load, Solar, Tariff, Hours),
  NextCharge is Charge + Power * Hours,
  Grid is Load - Solar + Power,
  Cost is Grid * Hours * Tariff.
step_problem(NextCharge, _Grid, _Power, below_reserve) :- reserve_kwh(Reserve), NextCharge < Reserve.
step_problem(NextCharge, _Grid, _Power, above_capacity) :- capacity_kwh(Capacity), NextCharge > Capacity.
step_problem(_NextCharge, Grid, _Power, would_export) :- Grid < 0.
step_problem(_NextCharge, Grid, _Power, grid_limit) :- grid_limit_kw(Limit), Grid > Limit.
step_problem(_NextCharge, _Grid, Power, power_limit) :- power_limit_kw(Limit), abs(Power) > Limit.
transition(Time, Charge, Power, infeasible) :-
  step_values(Time, Charge, Power, NextCharge, Grid, _), step_problem(NextCharge, Grid, Power, _).
transition(Time, Charge, Power, feasible(NextCharge, Grid, Cost)) :-
  step_values(Time, Charge, Power, NextCharge, Grid, Cost),
  reserve_kwh(Reserve), capacity_kwh(Capacity), grid_limit_kw(GridLimit), power_limit_kw(PowerLimit),
  NextCharge >= Reserve, NextCharge =< Capacity, Grid >= 0, Grid =< GridLimit, abs(Power) =< PowerLimit.

best_cost(Time, Charge, value(0)) :-
  terminal_slot(Time), final_charge_kwh(Final), capacity_kwh(Capacity), Charge >= Final, Charge =< Capacity.
best_cost(Time, Charge, infeasible) :- terminal_slot(Time), final_charge_kwh(Final), Charge < Final.
best_cost(Time, Charge, Best) :-
  last_slot(Last), Time =< Last, Time >= 1, actions(Actions), minimum_actions(Actions, Time, Charge, Best).
minimum_actions([], _Time, _Charge, infeasible).
minimum_actions([Power | Rest], Time, Charge, Best) :-
  candidate_cost(Time, Charge, Power, Cost), minimum_actions(Rest, Time, Charge, Remaining), minimum(Cost, Remaining, Best).
candidate_cost(Time, Charge, Power, infeasible) :- transition(Time, Charge, Power, infeasible).
candidate_cost(Time, Charge, Power, Cost) :-
  transition(Time, Charge, Power, feasible(NextCharge, _Grid, Own)),
  NextTime is Time + 1, best_cost(NextTime, NextCharge, Future), add_cost(Own, Future, Cost).
add_cost(_Own, infeasible, infeasible).
add_cost(Own, value(Future), value(Cost)) :- Cost is Own + Future.
minimum(infeasible, Right, Right).
minimum(value(Left), infeasible, value(Left)).
minimum(value(Left), value(Right), value(Best)) :- Best is min(Left, Right).

optimal_from(Time, Charge, [], 0) :- terminal_slot(Time), best_cost(Time, Charge, value(0)).
optimal_from(Time, Charge, [dispatch(Time, Power, Grid, NextCharge) | Rest], Cost) :-
  last_slot(Last), Time =< Last, actions(Actions), member(Power, Actions),
  transition(Time, Charge, Power, feasible(NextCharge, Grid, Own)),
  NextTime is Time + 1, best_cost(NextTime, NextCharge, value(Future)),
  best_cost(Time, Charge, value(Cost)), Cost =:= Own + Future,
  optimal_from(NextTime, NextCharge, Rest, Future).
dispatch_plan(Plan, Cost) :- initial_charge_kwh(Charge), optimal_from(1, Charge, Plan, Cost).

% Answer
?- dispatch_plan(Plan, Cost).

% Reason
?- why.

% Check
?- check(dispatch_plan([dispatch(1, 1, 3, 3), dispatch(2, -2, 1, 1), dispatch(3, 2, 0, 3), dispatch(4, -1, 2, 2)], 28)).
?- check(best_cost(1, 2, value(28))).
?- check(aggregate_all(count, dispatch_plan(Plan, Cost), 1)).
?- check(transition(2, 3, -2, feasible(1, 1, 8))).
?- check(transition(3, 1, 2, feasible(3, 0, 0))).
?- check(best_cost(5, 1, infeasible)).
?- check(best_cost(5, 2, value(0))).
?- check(transition(1, 2, 2, infeasible)).
?- check(transition(3, 1, 0, infeasible)).
