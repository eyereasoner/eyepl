% Checking a canary deployment against an error budget
%
% A sample deployment serves 5,000 requests with 75 errors and a 180 ms
% 95th-percentile latency. Its 1.5 percent error rate exceeds a 1 percent
% budget even though latency stays below the 200 ms limit. The rules
% recommend rollback and retain the independent latency result.
% These are illustrative measurements and thresholds. The result is a
% recommendation recorded as a relation; no deployment is changed.

canary(canary42, 5000.0, 75.0, 180.0).
threshold(canary42, maximum_error_rate, 0.01).
threshold(canary42, maximum_p95_latency_ms, 200.0).

error_rate(Release, Rate) :-
  canary(Release, Requests, Errors, _p95latency),
  (Rate is Errors / Requests).

latency_ok(Release) :-
  canary(Release, _requests, _errors, P95latency),
  threshold(Release, maximum_p95_latency_ms, Maximum),
  (P95latency < Maximum).

error_budget_exceeded(Release) :-
  error_rate(Release, Rate),
  threshold(Release, maximum_error_rate, Maximum),
  (Rate > Maximum).

rollback_recommended(Release) :-
  error_budget_exceeded(Release).

errorRate(Release, Rate) :-
  error_rate(Release, Rate).

p95Latency_ms(Release, P95latency) :-
  canary(Release, _requests, _errors, P95latency).

latencyCheck(Release, ok) :-
  latency_ok(Release).

status(Release, rollback_recommended) :-
  rollback_recommended(Release).

reason(Release, "canary error rate exceeds the allowed budget") :-
  rollback_recommended(Release).

% Answer
?- error_rate(Release, Rate).
?- latencyCheck(Release, Result).
?- status(Release, Status).

% Reason
?- why(rollback_recommended(canary42)).

% Check
?- check.
?- check((error_rate(canary42, Rate), abs(Rate-0.015) < 1.0e-12)).
?- check(latency_ok(canary42)).
?- check(error_budget_exceeded(canary42)).
?- check(rollback_recommended(canary42)).
