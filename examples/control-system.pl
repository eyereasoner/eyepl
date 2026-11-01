% Calculating actuator commands
%
% Calculate commands for two actuators from sample measurements and a target.
% The first command scales a measured input and subtracts compensation for a
% measured disturbance. The second combines the difference from the target
% with a nonlinear correction based on the previous observation.
%
% A measurement pair [A, B] contributes sqrt(B-A) when A < B, and A
% otherwise. These are illustrative control formulas with supplied constants.
% Two of them are guarded, so no input can stop the run with an arithmetic
% error: the compensation takes the logarithm of the disturbance only when it
% is positive, and the nonlinear factor divides by the difference from the
% target only when it is nonzero; on target, the nonlinear part is left out.

measurement1(input1, [6, 11]).
measurement1(disturbance2, [45, 39]).
measurement2(input2, true).
measurement3(input3, 56967).
measurement3(disturbance1, 35766).
measurement4(output2, 24).

% Observations
observation1(state1, 80).
observation2(state2, false).
observation3(state3, 22).

% Targets
target2(output2, 29).

% Rules
control1(actuator1, C) :-
    measurement10(input1, M1),
    measurement2(input2, true),
    measurement3(disturbance1, D1),
    D1 > 0,                     % the logarithm needs a positive disturbance
    C1 is M1 * 19.6,            % proportional part
    C2 is log(D1) / log(10),    % compensation part
    C is C1 - C2.               % simple feedforward control

control1(actuator2, C) :-
    observation3(state3, P3),
    measurement4(output2, M4),
    target2(output2, T2),
    E is T2 - M4,               % error
    D is P3 - M4,               % differential error
    C1 is 5.8 * E,              % proportional part
    nonlinear_part(E, D, C2),   % nonlinear differential part
    C is C1 + C2.               % PND feedback control

% The nonlinear factor 7.3 / E grows without bound as the error shrinks, and
% is undefined at zero error; on target, the nonlinear part is left out.
nonlinear_part(E, D, C2) :-
    E =\= 0,
    N is 7.3 / E,               % nonlinear factor
    C2 is N * D.
nonlinear_part(E, _, 0) :-
    E =:= 0.

measurement10(I, M) :-
    measurement1(I, [M1, M2]),
    M1 < M2,
    M3 is M2 - M1,
    M is sqrt(M3).

measurement10(I, M1) :-
    measurement1(I, [M1, M2]),
    M1 >= M2.

% Answer
?- control1(Actuator, Command).

% Reason
?- why.

% Answer
?- measurement10(disturbance2, Value).

% Reason
?- why.

% Check
% Compare real-valued commands with independent expected values and tolerances.
?- check((control1(actuator1, C), abs(C - 39.27346198678276) < 1.0e-10)).
?- check((control1(actuator2, C), abs(C - 26.08) < 1.0e-12)).
?- check(measurement10(disturbance2, 45)).
?- check(aggregate_all(count, control1(Actuator, Command), 2)).
