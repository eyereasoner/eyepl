% Comparing a crop's nitrogen supply and demand
%
% Compare nitrogen available to a crop with its demand over one season. The
% model adds soil and fertilizer inputs, subtracts a fixed loss fraction, and
% calculates any remaining deficit or surplus.
%
% Quantities are kilograms of nitrogen per hectare. Available nitrogen within
% 10 percent of demand is classified as balanced. The surplus-times-loss
% index is a defined comparison score, rather than a measured leaching rate.
%
% field(Name, SoilN, FertilizerN, LossFraction, CropDemand).

field(low_input, 40.0, 60.0, 0.15, 130.0).
field(balanced_loam, 50.0, 90.0, 0.15, 130.0).
field(high_input, 60.0, 180.0, 0.25, 160.0).
field(sandy_high_input, 40.0, 240.0, 0.40, 150.0).

balance(Field, Total, Lost, Available, Deficit, Surplus, Index) :-
  field(Field, Soil, Fertilizer, Loss, Demand),
  Soil >= 0, Fertilizer >= 0, Loss >= 0, Loss =< 1, Demand >= 0,
  Total is Soil+Fertilizer,
  Lost is Total*Loss,
  Available is Total-Lost,
  Deficit is max(0.0, Demand-Available),
  Surplus is max(0.0, Available-Demand),
  Index is Surplus*Loss.

status(Field, under) :-
  balance(Field, _, _, Available, _, _, _), field(Field, _, _, _, Demand),
  Available < 0.9*Demand.
status(Field, balanced) :-
  balance(Field, _, _, Available, _, _, _), field(Field, _, _, _, Demand),
  Available >= 0.9*Demand, Available =< 1.1*Demand.
status(Field, over) :-
  balance(Field, _, _, Available, _, _, _), field(Field, _, _, _, Demand),
  Available > 1.1*Demand.

% Answer
?- status(Field, Status).

% Reason
?- why.

% Answer
?- balance(Field, Total, Lost, Available, Deficit, Surplus, Index).

% Check
?- check(status(low_input, under)).
?- check(status(balanced_loam, balanced)).
?- check(status(high_input, over)).
?- check(status(sandy_high_input, over)).
?- check(balance(low_input, 100.0, 15.0, 85.0, 45.0, 0.0, 0.0)).
?- check((balance(sandy_high_input, Total, Lost, Available, _, Surplus, Index), abs(Total-Lost-Available) < 1.0e-12, abs(Surplus-18.0) < 1.0e-12, abs(Index-7.2) < 1.0e-12)).
