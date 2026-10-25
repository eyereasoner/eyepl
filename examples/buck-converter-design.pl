% Checking an ideal voltage converter
%
% Calculate the current and voltage ripple in an ideal buck converter, which
% reduces a DC supply voltage. Ripple is the variation between minimum and
% maximum current or voltage during a switching cycle.
%
% The model requires the inductor current to stay positive and ignores the
% capacitor's internal resistance. It compares the calculated ripple with two
% limits; passing those limits does not establish control-system stability.
% Inputs use volts, amperes, hertz, henries, and farads.

converter(demo, 24.0, 5.0, 2.0, 500000.0, 0.000022, 0.000047).
limits(demo, 0.30, 0.05).

ripple(Name, Duty, CurrentPP, Ratio, VoltagePP) :-
  converter(Name, Vin, Vout, Load, Frequency, L, C),
  Vin > Vout, Vout > 0, Load > 0, Frequency > 0, L > 0, C > 0,
  Duty is Vout/Vin,
  CurrentPP is (Vin-Vout)*Duty/(L*Frequency),
  CurrentPP < 2*Load,
  Ratio is CurrentPP/Load,
  VoltagePP is CurrentPP/(8*Frequency*C).

within_ripple_limits(Name) :-
  ripple(Name, _, _, Ratio, Voltage), limits(Name, MaxRatio, MaxVoltage),
  Ratio =< MaxRatio, Voltage =< MaxVoltage.

% Round the report to eight decimal places; evaluate limits on raw values.
ripple_report(Name, Duty, CurrentPP, VoltagePP) :-
  ripple(Name, D, I, _, V),
  Duty is round(D*100000000)/100000000,
  CurrentPP is round(I*100000000)/100000000,
  VoltagePP is round(V*100000000)/100000000.

% Answer
?- ripple_report(Name, Duty, CurrentPP, VoltagePP).

% Reason
?- why.

% Answer
?- within_ripple_limits(Name).

% Check
?- check(within_ripple_limits(demo)).
?- check((ripple(demo, D, I, Ratio, V), abs(D-5/24) < 1.0e-12, I > 0.35, I < 0.37, Ratio < 0.30, V < 0.002)).
