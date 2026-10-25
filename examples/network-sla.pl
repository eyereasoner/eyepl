% Checking a network path's latency limit
%
% Three links contribute 12, 18, and 9 milliseconds; another 8 milliseconds
% accounts for jitter. List recursion totals the links, and the modeled
% end-to-end latency of 47 ms passes a strict 50 ms service-level limit.
% The link delays and jitter are supplied constants rather than live
% measurements. A value equal to the limit would not pass.

:- table latency_sum/2.

path(edge_path, [link_a, link_b, link_c]).
link_latency(link_a, 12.0).
link_latency(link_b, 18.0).
link_latency(link_c, 9.0).
jitter(edge_path, 8.0).
sla(edge_path, maximum_latency_ms, 50.0).

latency_sum([], 0.0).
latency_sum([Link|Links], Total) :-
  link_latency(Link, Linklatency),
  latency_sum(Links, Rest),
  (Total is Linklatency + Rest).

end_to_end_latency(Path, Latency) :-
  path(Path, Links),
  latency_sum(Links, Linklatency),
  jitter(Path, Jitter),
  (Latency is Linklatency + Jitter).

sla_compliant(Path) :-
  end_to_end_latency(Path, Latency),
  sla(Path, maximum_latency_ms, Maximum),
  (Latency < Maximum).

endToEndLatency_ms(Path, Latency) :-
  end_to_end_latency(Path, Latency).

slaLimit_ms(Path, Maximum) :-
  sla(Path, maximum_latency_ms, Maximum).

status(Path, sla_compliant) :-
  sla_compliant(Path).

reason(Path, "path latency including jitter is below the SLA limit") :-
  sla_compliant(Path).

% Answer
?- end_to_end_latency(Path, Milliseconds).
?- status(Path, Status).

% Reason
?- why(sla_compliant(edge_path)).

% Check
?- check.
?- check(latency_sum([], 0.0)).
?- check(latency_sum([link_a, link_b, link_c], 39.0)).
?- check(end_to_end_latency(edge_path, 47.0)).
?- check(sla_compliant(edge_path)).
?- check(aggregate_all(count, status(Path, Status), 1)).
