% Comparing process variation with manufacturing tolerances
%
% Two production summaries supply a mean and standard deviation in millimeters
% against limits of 10.0 and 10.2 mm. Cpk is the nearer specification margin
% divided by three standard deviations. One line misses the supplied 1.33
% threshold while the other meets it. The summaries define this simplified
% capability assessment; the program does not estimate a distribution from
% raw measurements. Arithmetic is approximate.

run(line7_shift_a).
run(line8_shift_b).

spec(line7_shift_a, lower_mm, 10.0).
spec(line7_shift_a, upper_mm, 10.2).
summary(line7_shift_a, mean_mm, 10.12).
summary(line7_shift_a, sigma_mm, 0.04).

spec(line8_shift_b, lower_mm, 10.0).
spec(line8_shift_b, upper_mm, 10.2).
summary(line8_shift_b, mean_mm, 10.1).
summary(line8_shift_b, sigma_mm, 0.02).

capability_threshold(cpk, 1.33).

upper_margin_mm(Run, Margin) :-
  spec(Run, upper_mm, Upper),
  summary(Run, mean_mm, Mean),
  (Margin is Upper - Mean).

lower_margin_mm(Run, Margin) :-
  summary(Run, mean_mm, Mean),
  spec(Run, lower_mm, Lower),
  (Margin is Mean - Lower).

nearest_spec_margin_mm(Run, Margin) :-
  upper_margin_mm(Run, Uppermargin),
  lower_margin_mm(Run, Lowermargin),
  (Margin is min(Uppermargin, Lowermargin)).

three_sigma_mm(Run, Threesigma) :-
  summary(Run, sigma_mm, Sigma),
  (Threesigma is 3.0 * Sigma).

cpk(Run, Cpk) :-
  nearest_spec_margin_mm(Run, Margin),
  three_sigma_mm(Run, Threesigma),
  (Cpk is Margin / Threesigma).

capable(Run) :-
  cpk(Run, Cpk),
  capability_threshold(cpk, Threshold),
  (Cpk >= Threshold).

needs_adjustment(Run) :-
  cpk(Run, Cpk),
  capability_threshold(cpk, Threshold),
  (Cpk < Threshold).

status(Run, capable_process) :-
  capable(Run).

status(Run, needs_process_adjustment) :-
  needs_adjustment(Run).

reason(Run, "Cpk meets the production capability threshold") :-
  capable(Run).

reason(Run, "Cpk is below the production capability threshold") :-
  needs_adjustment(Run).

% Answer
?- cpk(Run, Index).
?- status(Run, Status).

% Reason
?- why(status(line8_shift_b, capable_process)).

% Check
?- check.
?- check(status(line7_shift_a, needs_process_adjustment)).
?- check(status(line8_shift_b, capable_process)).
?- check((cpk(line7_shift_a, C), abs(C-2/3) < 1.0e-12)).
?- check((cpk(line8_shift_b, C), abs(C-5/3) < 1.0e-12)).
?- check(aggregate_all(count, status(Run, Status), 2)).
