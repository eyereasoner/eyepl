% Counting unordered sums of positive integers
%
% The partitions of 4 are 4, 3+1, 2+2, 2+1+1, and 1+1+1+1. Rules count
% such sums without enumerating every list: include the largest allowed
% part or exclude it, then add the two counts. There is one empty partition
% of zero. Tabling reuses repeated subproblems, and an aggregate totals a
% finite range of completed counts. Supply nonnegative integer totals and
% part limits. The sample queries reach total 16; arithmetic stays exact.

:- table in_range/3, partition_count/2.

in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

:- table partitions/3.

partitions(0, _k, 1).
partitions(N, 0, 0) :- (N > 0).
partitions(N, K, Count) :-
  (N > 0),
  (K > 0),
  (K > N),
  (K1 is K - 1),
  partitions(N, K1, Count).
partitions(N, K, Count) :-
  (N > 0),
  (K > 0),
  (K =< N),
  (Remainder is N - K),
  partitions(Remainder, K, Withk),
  (K1 is K - 1),
  partitions(N, K1, Withoutk),
  (Count is Withk + Withoutk).

partition_count(N, Count) :- partitions(N, N, Count).

partition_answer(p_12, Count) :- partition_count(12, Count).
partition_answer(p_15, Count) :- partition_count(15, Count).
partition_answer(p_16_using_parts_at_most_5, Count) :- partitions(16, 5, Count).
partition_answer(cumulative_p_1_to_8, Sum) :- aggregate_all(sum(C), (in_range(1, 8, N), partition_count(N, C)), Sum).

% Answer
?- partition_answer(Kind, Count).

% Reason
?- why(partition_count(4, Count)).

% Check
?- check.
?- check(partition_count(0, 1)).
?- check(partition_count(4, 5)).
?- check(partition_count(12, 77)).
?- check(partition_count(15, 176)).
?- check(partitions(4, 1, 1)).
?- check(partitions(3, 0, 0)).
?- check(partition_answer(cumulative_p_1_to_8, 66)).
