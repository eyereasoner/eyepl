% Estimating how far a beam bends
%
% Estimate how far a beam bends when it is fixed at one end and a force is
% applied at the free end. Compare that displacement with a stated limit.
%
% The formula delta = F*L^3/(3*E*I) assumes a uniform beam, elastic behavior,
% and small deflections. F is force in newtons, L is length in meters, E is
% Young's modulus in pascals, and I is the cross-section's second moment of
% area in m^4. The reported displacement and limit are in millimeters.

beam(demo, 1200.0, 2.5, 200000000000.0, 0.000008, 5.0).

deflection_mm(Beam, Delta) :-
  beam(Beam, Force, Length, Modulus, Moment, _),
  Force >= 0, Length > 0, Modulus > 0, Moment > 0,
  Delta is 1000*Force*Length**3/(3*Modulus*Moment).

within_limit(Beam) :-
  deflection_mm(Beam, Delta), beam(Beam, _, _, _, _, Limit),
  Delta =< Limit.

% Answer
?- deflection_mm(Beam, Delta).

% Reason
?- why.

% Answer
?- within_limit(Beam).

% Check
?- check(deflection_mm(demo, 3.90625)).
?- check(within_limit(demo)).
?- check((deflection_mm(demo, Delta), beam(demo, F, L, E, I, _), abs(Delta*3*E*I-1000*F*L**3) < 1.0e-6)).
