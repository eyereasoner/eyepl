% Comparing a dairy cow's feed energy with its requirements
%
% Four cows have different body weights, milk yields, and feed intakes.
% Rules add modeled maintenance and milk-production energy, compare that
% requirement with the ration's energy, and calculate the milk the ration
% could support after maintenance.
%
% Weight is in kilograms, milk and dry-matter intake in kg/day, and feed
% density in megajoules of net energy per kilogram of dry matter. Energy
% results are MJ/day. The supplied coefficients define a simplified model:
% maintenance = 0.08*weight and milk energy = 3.2*yield. Balances from -10
% through 10 inclusive are near balance. Displayed values are rounded to
% six decimal places; checks retain unrounded values.

% cow(Name, BodyWeight, MilkYield, FeedEnergyDensity, DryMatterIntake).
cow(early_lactation, 650.0, 40.0, 6.5, 21.0).
cow(mid_lactation, 620.0, 28.0, 6.5, 22.5).
cow(late_lactation, 650.0, 18.0, 6.5, 20.0).
cow(pasture, 600.0, 14.0, 5.3, 16.0).

maintenance(Cow, Energy) :- cow(Cow, Weight, _, _, _), Energy is 0.08*Weight.
milk_energy(Cow, Energy) :- cow(Cow, _, Yield, _, _), Energy is 3.2*Yield.
requirement(Cow, Energy) :-
    maintenance(Cow, M), milk_energy(Cow, Milk), Energy is M + Milk.
supply(Cow, Energy) :- cow(Cow, _, _, Density, Intake), Energy is Density*Intake.
balance(Cow, Energy) :- supply(Cow, S), requirement(Cow, R), Energy is S-R.
milk_supported(Cow, Milk) :- supply(Cow, S), maintenance(Cow, M), Milk is (S-M)/3.2.

energy_status(Cow, negative) :- balance(Cow, E), E < -10.
energy_status(Cow, near) :- balance(Cow, E), E >= -10, E =< 10.
energy_status(Cow, positive) :- balance(Cow, E), E > 10.
report(Cow, Balance, Milk, Status) :-
    balance(Cow, E), milk_supported(Cow, M), energy_status(Cow, Status),
    Balance is round(E*1000000)/1000000, Milk is round(M*1000000)/1000000.

% Answer
?- report(Cow, Balance, SupportedMilk, Status).

% Reason
?- why(energy_status(early_lactation, negative)).

% Check
?- check.
?- check((balance(early_lactation, E), abs(E+43.5) < 1.0e-10)).
?- check((balance(mid_lactation, E), abs(E-7.05) < 1.0e-10)).
?- check((balance(late_lactation, E), abs(E-20.4) < 1.0e-10)).
?- check((balance(pasture, E), abs(E+8) < 1.0e-10)).
?- check((milk_supported(early_lactation, M), abs(M-26.40625) < 1.0e-10)).
?- check(energy_status(mid_lactation, near)).
?- check(energy_status(late_lactation, positive)).
?- check(energy_status(pasture, near)).
?- check(aggregate_all(count, report(Cow, Balance, Milk, Status), 4)).
