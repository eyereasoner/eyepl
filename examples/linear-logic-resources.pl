% Making resources consumable in a reusable rule system
%
% Wheat, yeast, and heat can become bread through milling, mixing, and baking.
% Each step removes its input tokens from a state list and adds its outputs.
% A wallet with one coin cannot buy both flour and yeast: the first purchase
% consumes the only coin, so the second has no matching token.
% These are ordinary rules over explicit resource lists, not a new logic
% operator. Repeated tokens are separate list entries. The kitchen plan is
% bounded to three steps, and absence checks use completed helper goals.

:- table select/3, append/3, consume_all/3, linear_step/3, run_linear/4, double_spend_possible/1.

select(X, [X | Rest], Rest).
select(X, [Head | Tail], [Head | Rest]) :- select(X, Tail, Rest).
append([], Ys, Ys).
append([X | Xs], Ys, [X | Rest]) :- append(Xs, Ys, Rest).

initial(kitchen, [wheat, yeast, heat]).
initial(wallet, [coin]).

linear_rule(mill, [wheat], [flour]).
linear_rule(mix, [flour, yeast], [dough]).
linear_rule(bake, [dough, heat], [bread]).
linear_rule(buy_flour, [coin], [flour]).
linear_rule(buy_yeast, [coin], [yeast]).

consume_all([], State, State).
consume_all([Need | Needs], State0, State2) :-
  select(Need, State0, State1),
  consume_all(Needs, State1, State2).

linear_step(State0, Rule, State2) :-
  linear_rule(Rule, Inputs, Outputs),
  consume_all(Inputs, State0, Rest),
  append(Outputs, Rest, State2).

run_linear(0, State, [], State).
run_linear(Steps, State0, [Rule | Plan], State2) :-
  (Steps > 0),
  linear_step(State0, Rule, State1),
  (Remaining is Steps - 1),
  run_linear(Remaining, State1, Plan, State2).

linear_result(kitchen, Plan, Finalstate) :-
  initial(kitchen, State),
  run_linear(3, State, Plan, Finalstate),
  (Finalstate = [bread]).

linear_check(double_spend_rejected, yes) :-
  initial(wallet, State),
  \+ double_spend_possible(State).

double_spend_possible(State) :- run_linear(2, State, [buy_flour, buy_yeast], Final).

% Answer
?- linear_result(Scenario, Plan, Final).
?- linear_check(Check, Result).

% Reason
?- why(linear_result(kitchen, [mill, mix, bake], [bread])).

% Check
?- check.
?- check(linear_result(kitchen, [mill, mix, bake], [bread])).
?- check(linear_check(double_spend_rejected, yes)).
?- check(consume_all([coin, coin], [coin, coin], [])).
?- check(aggregate_all(count, consume_all([coin, coin], [coin], Rest), 0)).
?- check(aggregate_all(count, linear_result(Scenario, Plan, Final), 1)).
