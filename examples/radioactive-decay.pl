% Calculating activity after radioactive decay
%
% Calculate how much of a sample's initial activity remains after a given
% time when its activity halves at a constant interval. The sample starts at
% 80 becquerels and reaches 20 after two half-lives.
%
% Initial activity is in becquerels (decays per second); half-life and
% elapsed time are in hours. The model assumes no replenishment. The Decayed
% result is the decrease in activity, not a count of decayed atoms.

sample(demo, 80.0, 8.0, 16.0).

decay(Sample, HalfLives, Remaining, Decayed) :-
  sample(Sample, Initial, HalfLife, Elapsed),
  Initial >= 0, HalfLife > 0, Elapsed >= 0,
  HalfLives is Elapsed/HalfLife,
  Remaining is Initial*0.5**HalfLives,
  Decayed is Initial-Remaining.

% Answer
?- decay(Sample, HalfLives, Remaining, Decayed).

% Reason
?- why.

% Check
?- check(decay(demo, 2.0, 20.0, 60.0)).
?- check((sample(demo, Initial, _, _), decay(demo, _, Remaining, Decayed), Remaining+Decayed =:= Initial)).
