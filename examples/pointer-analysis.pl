% Following possible pointer targets through assignments and memory
%
% A tiny program takes addresses, copies pointers, stores through a pointer,
% and loads the stored value. Inclusion rules propagate possible targets
% until no new facts appear. The load q = *x recovers object_b through the
% store *y = z, since x and y both point to object_a; copying q gives r the
% same target. Objects and their single abstract fields are ordinary atoms.
% This is a finite, flow-insensitive analysis of the listed statements.

addr(x, object_a).
addr(z, object_b).
assign(y, x).
store(y, z).
load(q, x).
assign(r, q).

points_to(Var, Object) :- addr(Var, Object).
points_to(To, Object) :- assign(To, From), points_to(From, Object).

field_points_to(Heap_object, Value_object) :-
  store(Pointer, Value),
  points_to(Pointer, Heap_object),
  points_to(Value, Value_object).
points_to(To, Value_object) :-
  load(To, Pointer),
  points_to(Pointer, Heap_object),
  field_points_to(Heap_object, Value_object).

pointsTo(Var, Object) :- points_to(Var, Object).
heapField(Heap_object, Value_object) :- field_points_to(Heap_object, Value_object).
pointerFlow(load_q_from_x, Object) :- points_to(q, Object).
pointerConclusion(case, "the load q = *x recovers object_b through the store *y = z and y = x") :-
  points_to(q, object_b).

% Answer
?- points_to(Variable, Object).
?- field_points_to(HeapObject, ValueObject).

% Reason
?- why(points_to(r, object_b)).

% Check
?- check.
?- check(points_to(x, object_a)).
?- check(points_to(y, object_a)).
?- check(points_to(q, object_b)).
?- check(points_to(r, object_b)).
?- check(field_points_to(object_a, object_b)).
?- check(\+ points_to(q, object_a)).
?- check(aggregate_all(count, points_to(Variable, Object), 5)).
