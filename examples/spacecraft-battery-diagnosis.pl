% Combining battery telemetry into a diagnosis and response
%
% A sample battery exceeds temperature, heating-rate, and cell-imbalance
% limits. Its resistive heating I^2*R is 16 watts, above 12 watts of cooling.
% Together these observations support a modeled thermal-runaway precursor.
% An independent temperature channel also exceeds its limit, supporting an
% isolate-and-cool recommendation. Temperatures use degrees Celsius, current
% amperes, resistance ohms, and cell differences volts. Values and limits
% are illustrative; the program records conclusions and performs no action.

telemetry(bp1, temperature_c, 78.0).
telemetry(bp1, temperature_rise_c_per_min, 4.2).
telemetry(bp1, current_a, 32.0).
telemetry(bp1, internal_resistance_ohm, 0.015625).
telemetry(bp1, cell_delta_v, 0.19).

redundant_telemetry(bp1, temperature_c, 76.0).

safety_limit(max_safe_temperature_c, 60.0).
safety_limit(max_temperature_rise_c_per_min, 1.5).
safety_limit(max_cell_delta_v, 0.08).
cooling_capacity_w(bp1, 12.0).

metric(Pack, thermal_margin_c, Margin) :-
  safety_limit(max_safe_temperature_c, Maximum),
  telemetry(Pack, temperature_c, Temperature),
  (Margin is Maximum - Temperature).

metric(Pack, resistive_heating_w, Heating) :-
  telemetry(Pack, current_a, Current),
  telemetry(Pack, internal_resistance_ohm, Resistance),
  (CurrentSquared is Current * Current),
  (Heating is CurrentSquared * Resistance).

over_temperature(Pack) :-
  telemetry(Pack, temperature_c, Temperature),
  safety_limit(max_safe_temperature_c, Maximum),
  (Temperature > Maximum).

rapid_heating(Pack) :-
  telemetry(Pack, temperature_rise_c_per_min, Rate),
  safety_limit(max_temperature_rise_c_per_min, Maximum),
  (Rate > Maximum).

cell_imbalance(Pack) :-
  telemetry(Pack, cell_delta_v, Delta),
  safety_limit(max_cell_delta_v, Maximum),
  (Delta > Maximum).

heating_exceeds_cooling(Pack) :-
  metric(Pack, resistive_heating_w, Heating),
  cooling_capacity_w(Pack, Capacity),
  (Heating > Capacity).

corroborated_over_temperature(Pack) :-
  telemetry(Pack, temperature_c, Primary),
  redundant_telemetry(Pack, temperature_c, Redundant),
  safety_limit(max_safe_temperature_c, Maximum),
  (Primary > Maximum),
  (Redundant > Maximum).

diagnosis(Pack, thermal_runaway_precursor) :-
  over_temperature(Pack),
  rapid_heating(Pack),
  cell_imbalance(Pack),
  heating_exceeds_cooling(Pack).

action(Pack, isolate_and_cool) :-
  diagnosis(Pack, thermal_runaway_precursor),
  corroborated_over_temperature(Pack).

% Answer
?- metric(Pack, Metric, Value).
?- diagnosis(Pack, Diagnosis).
?- action(Pack, Action).

% Reason
?- why(action(bp1, isolate_and_cool)).

% Check
?- check.
?- check(metric(bp1, thermal_margin_c, -18.0)).
?- check(metric(bp1, resistive_heating_w, 16.0)).
?- check(corroborated_over_temperature(bp1)).
?- check(diagnosis(bp1, thermal_runaway_precursor)).
?- check(action(bp1, isolate_and_cool)).
?- check(aggregate_all(count, diagnosis(Pack, Diagnosis), 1)).
