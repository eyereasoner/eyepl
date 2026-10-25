% Estimating conductive heat loss through a wall
%
% A uniform wall separates rooms at 21 and -4 degrees Celsius. Rules compute
% the temperature difference, resistance L/(k*A), and heat flow DeltaT/R.
% The result exceeds the example's 1,000-watt classification threshold.
% Thickness is in meters, area in square meters, conductivity in W/(m*K),
% and resistance in K/W. This one-dimensional steady-state model omits air
% films, thermal bridges, and other heat-transfer mechanisms.

wall(wall1, conductivity_W_mK, 0.8).
wall(wall1, area_m2, 12.0).
wall(wall1, thickness_m, 0.2).
wall(wall1, indoor_C, 21.0).
wall(wall1, outdoor_C, -4.0).

temperature_difference(Wall, Deltat) :-
  wall(Wall, indoor_C, Indoor),
  wall(Wall, outdoor_C, Outdoor),
  (Deltat is Indoor - Outdoor).

thermal_resistance(Wall, Resistance) :-
  wall(Wall, thickness_m, Thickness),
  wall(Wall, conductivity_W_mK, Conductivity),
  wall(Wall, area_m2, Area),
  (Conductance is Conductivity * Area),
  (Resistance is Thickness / Conductance).

heat_loss(Wall, Heatloss) :-
  temperature_difference(Wall, Deltat),
  thermal_resistance(Wall, Resistance),
  (Heatloss is Deltat / Resistance).

type(Wall, conduction_heat_loss) :-
  wall(Wall, thickness_m, _thickness).

temperatureDifference_K(Wall, Deltat) :-
  temperature_difference(Wall, Deltat).

thermalResistance_K_W(Wall, Resistance) :-
  thermal_resistance(Wall, Resistance).

heatLoss_W(Wall, Heatloss) :-
  heat_loss(Wall, Heatloss).

status(Wall, high_heat_loss) :-
  heat_loss(Wall, Heatloss),
  (Heatloss > 1000.0).

% Answer
?- temperature_difference(Wall, Kelvin).
?- thermal_resistance(Wall, KelvinPerWatt).
?- heat_loss(Wall, Watts).
?- status(Wall, Status).

% Reason
?- why(status(wall1, high_heat_loss)).

% Check
?- check.
?- check(temperature_difference(wall1, 25.0)).
?- check((heat_loss(wall1, W), abs(W-1200) < 1.0e-9)).
?- check((thermal_resistance(wall1, R), abs(R*48-1) < 1.0e-12)).
