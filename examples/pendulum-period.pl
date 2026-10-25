% Calculating a small-angle pendulum period
%
% For small oscillations, the period is 2*pi*sqrt(length/gravity). A one-meter
% pendulum uses the supplied gravity pi squared meters per second squared,
% so its period matches a two-second target within 0.01 seconds.
% Length is in meters, gravity in m/s^2, and periods in seconds. This model
% ignores friction and large-amplitude effects; calculations are approximate.

constant(pi, 3.141592653589793).
experiment(pendulum1, length_m, 1.0).
experiment(pendulum1, gravity_m_s2, 9.869604401089358).
limit(pendulum1, target_period_s, 2.0).
limit(pendulum1, tolerance_s, 0.01).

period(Experiment, Period) :-
  experiment(Experiment, length_m, Length),
  experiment(Experiment, gravity_m_s2, Gravity),
  (Ratio is Length / Gravity),
  (Root is Ratio ** 0.5),
  constant(pi, Pi),
  (Twopi is 2.0 * Pi),
  (Period is Twopi * Root).

period_error(Experiment, Error) :-
  period(Experiment, Period),
  limit(Experiment, target_period_s, Target),
  (Rawerror is Period - Target),
  (Error is abs(Rawerror)).

within_period_tolerance(Experiment) :-
  period_error(Experiment, Error),
  limit(Experiment, tolerance_s, Tolerance),
  (Error < Tolerance).

period_s(Experiment, Period) :-
  period(Experiment, Period).

periodError_s(Experiment, Error) :-
  period_error(Experiment, Error).

status(Experiment, within_period_tolerance) :-
  within_period_tolerance(Experiment).

reason(Experiment, "small-angle period matches the two-second target") :-
  within_period_tolerance(Experiment).

% Answer
?- period_s(Experiment, Period).
?- periodError_s(Experiment, Error).
?- status(Experiment, Status).

% Reason
?- why(within_period_tolerance(pendulum1)).

% Check
?- check.
?- check((period(pendulum1, T), abs(T-2) < 1.0e-12)).
?- check(within_period_tolerance(pendulum1)).
?- check((period_error(pendulum1, E), E < 0.01)).
