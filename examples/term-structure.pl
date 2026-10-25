% Inspecting records and constructing receipts
%
% Check whether each record has an expected name and number of arguments,
% then construct a receipt for accepted records. For example,
% temperature(room, 21) matches the temperature schema, which expects two
% arguments.
%
% The =../2 builtin decomposes a term into [Name | Arguments] or constructs a
% term from such a list. Constructing a term treats it as data; it does not
% execute it as a goal.

:- table member/2, length/2.

batch([temperature(room, 21), location(sensor, north, 3),
       location(sensor, north), unexpected(on)]).
schema(temperature, 2).
schema(location, 3).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
length([], 0).
length([_ | Rest], Count) :- length(Rest, Previous), Count is Previous + 1.

record_shape(Record, Name, Arity) :-
  batch(Records),
  member(Record, Records),
  Record =.. [Name | Arguments],
  length(Arguments, Arity).

accepted(Record) :-
  record_shape(Record, Name, Arity),
  schema(Name, Arity).
rejected(Record, Name, Arity) :-
  record_shape(Record, Name, Arity),
  \+ schema(Name, Arity).

receipt(Record, Receipt) :-
  accepted(Record),
  Record =.. [Name | Arguments],
  Receipt =.. [accepted_record, Name, Arguments].

% Answer
?- record_shape(Record, Name, Arity).
?- rejected(Record, Name, Arity).

% Reason
?- why.

% Answer
?- receipt(Record, Receipt).

% Check
?- check(accepted(temperature(room, 21))).
?- check(accepted(location(sensor, north, 3))).
?- check(rejected(location(sensor, north), location, 2)).
?- check(rejected(unexpected(on), unexpected, 1)).
?- check(aggregate_all(count, accepted(Record), 2)).
?- check(aggregate_all(count, rejected(Record, Name, Arity), 2)).
?- check(receipt(temperature(room, 21), accepted_record(temperature, [room, 21]))).
?- check(([a, b] =.. ['.', a, [b]])).
?- check((List =.. ['.', a, [b]], List = [a, b])).
?- check((Term =.. [reading, Value], Value = 42, Term = reading(42))).
