% Comparing stopping distances with available gaps
%
% Calculate a stopping distance as the distance traveled while reacting plus
% the distance needed to brake. Compare it with the available gap in four
% illustrative road scenarios.
%
% The model assumes a level road, constant tire-road friction, and no air
% resistance. Speeds are in meters per second, reaction time in seconds,
% gravity in m/s^2, and distances in meters. Each status describes whether
% the gap is sufficient under these supplied assumptions.

gravity(9.8).
reaction_time(1.0).
% scenario(Name, Speed, FrictionCoefficient, AvailableDistance).
scenario(city_dry, 13.9, 0.8, 40.0).
scenario(highway_short_gap, 27.8, 0.8, 60.0).
scenario(city_wet, 13.9, 0.4, 40.0).
scenario(city_ice, 13.9, 0.2, 30.0).

distance(Name, Reaction, Braking, Total) :-
  scenario(Name, Speed, Mu, _), gravity(G), reaction_time(T),
  Speed >= 0, Mu > 0, Mu =< 1, G > 0, T >= 0,
  Reaction is Speed*T,
  Braking is Speed*Speed/(2*Mu*G),
  Total is Reaction+Braking.

gap_status(Name, sufficient_in_model) :-
  distance(Name, _, _, Total), scenario(Name, _, _, Available),
  Total =< Available.
gap_status(Name, insufficient_in_model) :-
  distance(Name, _, _, Total), scenario(Name, _, _, Available),
  Total > Available.

% Round displayed distances to six decimal places; checks use raw values.
stopping_distance_m(Name, Rounded) :-
  distance(Name, _, _, Total),
  Rounded is round(Total*1000000)/1000000.

% Answer
?- gap_status(Name, Status).

% Reason
?- why.

% Answer
?- stopping_distance_m(Name, Distance).

% Check
?- check(gap_status(city_dry, sufficient_in_model)).
?- check(gap_status(city_wet, sufficient_in_model)).
?- check(gap_status(highway_short_gap, insufficient_in_model)).
?- check(gap_status(city_ice, insufficient_in_model)).
?- check((distance(city_dry, _, _, Dry), distance(city_wet, _, _, Wet), distance(city_ice, _, _, Ice), Dry < Wet, Wet < Ice)).
?- check((distance(city_dry, R, B, D), abs(D-R-B) < 1.0e-12)).
