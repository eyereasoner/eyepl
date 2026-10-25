% Comparing reaction rates with a competitive inhibitor
%
% A simplified enzyme assay uses Michaelis-Menten kinetics. An inhibitor
% raises the effective Km from 30 to 90 micromolar, lowering the modeled rate
% from 75 to about 42.857 micromolar per second. The fractional decrease
% exceeds the supplied 0.25 significance threshold.
% Concentrations are micromolar and rates micromolar per second. Inputs are
% illustrative fixed assay values; real arithmetic is approximate.

assay(assay1, vmax_uM_s, 120.0).
assay(assay1, substrate_uM, 50.0).
assay(assay1, km_uM, 30.0).
assay(assay1, inhibitor_uM, 10.0).
assay(assay1, ki_uM, 5.0).
threshold(assay1, significant_inhibition_fraction, 0.25).

competitive_multiplier(Assay, Multiplier) :-
  assay(Assay, inhibitor_uM, Inhibitor),
  assay(Assay, ki_uM, Ki),
  (Ratio is Inhibitor / Ki),
  (Multiplier is 1.0 + Ratio).

effective_km(Assay, Effectivekm) :-
  assay(Assay, km_uM, Km),
  competitive_multiplier(Assay, Multiplier),
  (Effectivekm is Km * Multiplier).

uninhibited_rate(Assay, Rate) :-
  assay(Assay, vmax_uM_s, Vmax),
  assay(Assay, substrate_uM, Substrate),
  assay(Assay, km_uM, Km),
  (Numerator is Vmax * Substrate),
  (Denominator is Km + Substrate),
  (Rate is Numerator / Denominator).

inhibited_rate(Assay, Rate) :-
  assay(Assay, vmax_uM_s, Vmax),
  assay(Assay, substrate_uM, Substrate),
  effective_km(Assay, Effectivekm),
  (Numerator is Vmax * Substrate),
  (Denominator is Effectivekm + Substrate),
  (Rate is Numerator / Denominator).

inhibition_fraction(Assay, Fraction) :-
  uninhibited_rate(Assay, Uninhibited),
  inhibited_rate(Assay, Inhibited),
  (Delta is Uninhibited - Inhibited),
  (Fraction is Delta / Uninhibited).

significant_inhibition(Assay) :-
  inhibition_fraction(Assay, Fraction),
  threshold(Assay, significant_inhibition_fraction, Limit),
  (Fraction > Limit).

effectiveKm_uM(Assay, Effectivekm) :-
  effective_km(Assay, Effectivekm).

uninhibitedRate_uM_s(Assay, Rate) :-
  uninhibited_rate(Assay, Rate).

inhibitedRate_uM_s(Assay, Rate) :-
  inhibited_rate(Assay, Rate).

inhibitionFraction(Assay, Fraction) :-
  inhibition_fraction(Assay, Fraction).

status(Assay, significant_inhibition) :-
  significant_inhibition(Assay).

reason(Assay, "competitive inhibitor raises effective Km and lowers reaction rate") :-
  significant_inhibition(Assay).

% Answer
?- effective_km(Assay, EffectiveKm).
?- uninhibited_rate(Assay, Rate).
?- inhibited_rate(Assay, Rate).
?- status(Assay, Status).

% Reason
?- why(significant_inhibition(assay1)).

% Check
?- check.
?- check(effective_km(assay1, 90.0)).
?- check(uninhibited_rate(assay1, 75.0)).
?- check((inhibited_rate(assay1, R), abs(R-300/7) < 1.0e-10)).
?- check((inhibition_fraction(assay1, F), abs(F-3/7) < 1.0e-12)).
?- check(significant_inhibition(assay1)).
