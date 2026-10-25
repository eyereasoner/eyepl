% Finding the tasks that determine a project's duration
%
% Calculate when each project task can start and finish, given its duration
% and the tasks that must finish first. Trace the critical tasks that
% determine the project's earliest completion time.
%
% A task starts when its last predecessor finishes; tasks without
% dependencies start at zero. Previously calculated times are reused. The
% dependency graph must be finite and contain no cycles, and durations must
% be nonnegative. Time units are arbitrary, and the model imposes no limits
% on shared resources.

:- table earliest_start/2, finish_time/2, latest_finish/2, member/2, critical_chain/2.

% Durations are in arbitrary project time units.
task(requirements, 2, []).
task(architecture, 3, [requirements]).
task(api_design, 2, [requirements]).
task(database, 4, [architecture]).
task(backend, 6, [api_design, database]).
task(frontend, 5, [api_design]).
task(auth, 3, [architecture]).
task(integration, 4, [backend, frontend, auth]).
task(security_review, 3, [integration]).
task(load_test, 2, [integration]).
task(launch, 1, [security_review, load_test]).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
depends(Task, Predecessor) :- task(Task, _, Predecessors), member(Predecessor, Predecessors).

earliest_start(Task, Start) :- task(Task, _, Predecessors), latest_finish(Predecessors, Start).
latest_finish([], 0).
latest_finish([Predecessor | Rest], Latest) :-
  finish_time(Predecessor, Finish),
  latest_finish(Rest, Remaining),
  Latest is max(Finish, Remaining).
finish_time(Task, Finish) :-
  task(Task, Duration, _),
  earliest_start(Task, Start),
  Finish is Start + Duration.

% Retain every predecessor attaining the maximum, including tied branches.
critical_predecessor(Task, Predecessor) :-
  depends(Task, Predecessor),
  finish_time(Predecessor, Finish),
  earliest_start(Task, Finish).
project_finish(Finish) :-
  aggregate_all(max(Time), (task(Task, _, _), finish_time(Task, Time)), Finish).
final_task(Task) :- project_finish(Finish), task(Task, _, _), finish_time(Task, Finish).
critical_chain(Task, Task).
critical_chain(Task, Predecessor) :-
  critical_predecessor(Task, Parent),
  critical_chain(Parent, Predecessor).
critical_task(Task) :- final_task(Final), critical_chain(Final, Task).

critical_path_answer(project_finish, Finish) :- project_finish(Finish).
critical_path_answer(critical_task, Task) :- critical_task(Task).
critical_path_answer(schedule, task(Task, Start, Finish)) :-
  task(Task, _, _), earliest_start(Task, Start), finish_time(Task, Finish).

% Answer
?- critical_path_answer(Kind, Value).

% Reason
?- why(critical_task(launch)).
?- why(earliest_start(integration, Start)).

% Check
?- check(project_finish(23)).
?- check(earliest_start(integration, 15)).
?- check(finish_time(launch, 23)).
?- check(critical_predecessor(integration, backend)).
?- check(critical_task(database)).
?- check(\+ critical_task(frontend)).
?- check(aggregate_all(count, critical_task(Task), 7)).
?- check(aggregate_all(count, critical_path_answer(schedule, Schedule), 11)).
