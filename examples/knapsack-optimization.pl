% Choosing the most valuable pack within a weight limit
%
% Choose an expedition pack with the greatest total value while staying
% within a weight limit. Each listed item can be included once or left out;
% this is the 0/1 knapsack problem.
%
% The rules enumerate item subsets, add their weights and values, reject
% overweight packs, and retain all feasible packs with the highest value.
% Weights and values are supplied scores in consistent, unspecified units.

:- table subset/2, total_weight/2, total_value/2.

capacity(15).
items([atlas, battery, camera, drone, emergency_radio, field_laptop, medkit, sensor]).

item(atlas, 2, 6).
item(battery, 4, 10).
item(camera, 3, 8).
item(drone, 6, 13).
item(emergency_radio, 5, 11).
item(field_laptop, 7, 16).
item(medkit, 4, 9).
item(sensor, 2, 7).

% The include/exclude subset generator explores every 0/1 choice once.
subset([], []).
subset([Item|Rest], [Item|Chosen]) :- subset(Rest, Chosen).
subset([_item|Rest], Chosen) :- subset(Rest, Chosen).

item_weight(Item, Weight) :- item(Item, Weight, _value).
item_value(Item, Value) :- item(Item, _weight, Value).

total_weight([], 0).
total_weight([Item | Rest], Weight) :-
  item_weight(Item, Own),
  total_weight(Rest, Remaining),
  Weight is Own + Remaining.
total_value([], 0).
total_value([Item | Rest], Value) :-
  item_value(Item, Own),
  total_value(Rest, Remaining),
  Value is Own + Remaining.

feasible_pack(Pack, Weight, Value) :-
  items(All),
  subset(All, Pack),
  total_weight(Pack, Weight),
  capacity(Capacity),
  (Weight =< Capacity),
  total_value(Pack, Value).

best_pack(Pack, Weight, Value) :-
  aggregate_all(max(CandidateValue),
    feasible_pack(CandidatePack, CandidateWeight, CandidateValue), Value),
  feasible_pack(Pack, Weight, Value).

knapsack_answer(best_pack, Pack) :- best_pack(Pack, _weight, _value).
knapsack_answer(total_weight, Weight) :- best_pack(_pack, Weight, _value).
knapsack_answer(total_value, Value) :- best_pack(_pack, _weight, Value).
knapsack_answer(feasible_pack_count, Count) :- aggregate_all(count, feasible_pack(_Pack, _Weight, _Value), Count).

% Answer
?- knapsack_answer(Kind, Value).

% Reason
?- why(best_pack(Pack, Weight, Value)).

% Check
?- check(best_pack([atlas, battery, camera, medkit, sensor], 15, 40)).
?- check(knapsack_answer(feasible_pack_count, 113)).
?- check(aggregate_all(count, best_pack(Pack, Weight, Value), 1)).
?- check(feasible_pack([], 0, 0)).
?- check(total_weight([field_laptop, drone, camera], 16)).
?- check(\+ feasible_pack([field_laptop, drone, camera], 16, 37)).
?- check(\+ best_pack([], 0, 0)).
