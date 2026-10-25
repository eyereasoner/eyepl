% Scheduling jobs on shared machines
%
% Schedule three jobs that each need a mill operation and a lathe operation.
% Operations must follow each job's stated order, and a machine can handle
% only one operation at a time.
%
% The program tries integer start times from 0 to 6 and returns every
% feasible schedule with the earliest overall finish, also called the minimum
% makespan. One operation may start exactly when another finishes. The result
% is optimal within this finite set of start times.

:- table between/3, nonoverlap/4.
between(Low, High, Low) :- Low =< High.
between(Low, High, Value) :- Low < High, Next is Low + 1, between(Next, High, Value).

% Two operations on the same machine are compatible when either one finishes before the other starts.
nonoverlap(_starta, Enda, Startb, _endb) :- (Enda =< Startb).
nonoverlap(Starta, _enda, _startb, Endb) :- (Endb =< Starta).

feasible_schedule(Makespan, [
  op(j1_mill, J1millstart, J1millend),
  op(j1_lathe, J1lathestart, J1latheend),
  op(j2_lathe, J2lathestart, J2latheend),
  op(j2_mill, J2millstart, J2millend),
  op(j3_mill, J3millstart, J3millend),
  op(j3_lathe, J3lathestart, J3latheend)
]) :-
  between(0, 6, J1millstart), (J1millend is J1millstart + 3),
  between(0, 6, J1lathestart), (J1latheend is J1lathestart + 2),
  (J1millend =< J1lathestart),

  between(0, 6, J2lathestart), (J2latheend is J2lathestart + 2),
  between(0, 6, J2millstart), (J2millend is J2millstart + 4),
  (J2latheend =< J2millstart),

  between(0, 6, J3millstart), (J3millend is J3millstart + 2),
  between(0, 6, J3lathestart), (J3latheend is J3lathestart + 3),
  (J3millend =< J3lathestart),

  nonoverlap(J1millstart, J1millend, J2millstart, J2millend),
  nonoverlap(J1millstart, J1millend, J3millstart, J3millend),
  nonoverlap(J2millstart, J2millend, J3millstart, J3millend),
  nonoverlap(J1lathestart, J1latheend, J2lathestart, J2latheend),
  nonoverlap(J1lathestart, J1latheend, J3lathestart, J3latheend),
  nonoverlap(J2lathestart, J2latheend, J3lathestart, J3latheend),

  Makespan is max(J1latheend, max(J2millend, J3latheend)).

best_schedule(Makespan, Schedule) :-
  aggregate_all(min(Time), feasible_schedule(Time, Candidate), Makespan),
  feasible_schedule(Makespan, Schedule).
job_shop_answer(best_makespan, Makespan) :- best_schedule(Makespan, _).
job_shop_answer(best_schedule, Schedule) :- best_schedule(_, Schedule).
job_shop_answer(feasible_schedule_count, Count) :- aggregate_all(count, feasible_schedule(Time, Schedule), Count).

% Answer
?- job_shop_answer(Kind, Value).

% Reason
?- why(job_shop_answer(best_makespan, Makespan)).

% Check
?- check(job_shop_answer(best_makespan, 9)).
?- check(job_shop_answer(feasible_schedule_count, 35)).
?- check(aggregate_all(count, best_schedule(Time, Schedule), 11)).
?- check(aggregate_all(count, best_schedule(8, Schedule), 0)).
