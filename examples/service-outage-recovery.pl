% Choosing repairs that restore business functions
%
% Find which functions fail when services are unavailable, then choose the
% least-cost repair plan that restores both required business functions.
%
% Each service needs every listed requirement; each requirement can have
% alternative providers. Healthy or repaired services with no requirements
% provide the starting evidence for availability. The independent risk cache
% supports the payment/risk dependency cycle; a cycle cannot make itself
% available without such evidence. The program checks all sixteen subsets of
% the four repair choices using illustrative availability assumptions and
% costs.

:- table member/2, subset/2, hardware_available/2, operating/2,
         all_groups/2, group_operating/2, all_operating/2, repair_cost/2, impacted/2.

node(catalog_primary, []).
node(catalog_replica, []).
node(bank_primary, []).
node(bank_backup, []).
node(risk_cache, []).
node(risk_engine, [risk_signal]).
node(payment_service, [bank, risk]).
node(checkout_api, [catalog, payment]).
node(web_store, [checkout]).
node(mobile_app, [checkout]).
provider(catalog, catalog_primary).
provider(catalog, catalog_replica).
provider(bank, bank_primary).
provider(bank, bank_backup).
provider(risk, risk_engine).
provider(risk_signal, risk_cache).
provider(risk_signal, payment_service).
provider(payment, payment_service).
provider(checkout, checkout_api).
failed(catalog_primary).
failed(catalog_replica).
failed(bank_primary).
failed(bank_backup).
repair_candidates([catalog_primary, catalog_replica, bank_primary, bank_backup]).
repair_price(catalog_primary, 3).
repair_price(catalog_replica, 2).
repair_price(bank_primary, 4).
repair_price(bank_backup, 1).
critical_services([web_store, mobile_app]).
business_function(place_order, web_store).
business_function(mobile_checkout, mobile_app).

member(Head, [Head | _]).
member(Value, [_ | Rest]) :- member(Value, Rest).
subset([], []).
subset([Head | Rest], [Head | Chosen]) :- subset(Rest, Chosen).
subset([_ | Rest], Chosen) :- subset(Rest, Chosen).
healthy(Node) :- node(Node, _), \+ failed(Node).
hardware_available(Node, _Plan) :- healthy(Node).
hardware_available(Node, Plan) :- failed(Node), member(Node, Plan).
operating(Node, Plan) :- hardware_available(Node, Plan), node(Node, Groups), all_groups(Groups, Plan).
all_groups([], _Plan).
all_groups([Group | Rest], Plan) :- group_operating(Group, Plan), all_groups(Rest, Plan).
group_operating(Group, Plan) :- provider(Group, Node), operating(Node, Plan).
all_operating([], _Plan).
all_operating([Node | Rest], Plan) :- operating(Node, Plan), all_operating(Rest, Plan).

% Reachability shows possible propagation; operating/2 additionally models redundancy.
depends_on(Node, Provider) :- node(Node, Groups), member(Group, Groups), provider(Group, Provider).
impacted(Node, Failed) :- depends_on(Node, Failed).
impacted(Node, Failed) :- depends_on(Node, Parent), impacted(Parent, Failed).
potential_impact(Failed, Node) :- failed(Failed), impacted(Node, Failed).
unavailable(Node) :- node(Node, _), \+ operating(Node, []).
affected_function(Function) :- business_function(Function, Node), unavailable(Node).
repair_cost([], 0).
repair_cost([Node | Rest], Cost) :- repair_price(Node, Own), repair_cost(Rest, Tail), Cost is Own + Tail.
feasible_repair(Plan, Cost) :-
  repair_candidates(Candidates), subset(Candidates, Plan), critical_services(Required),
  all_operating(Required, Plan), repair_cost(Plan, Cost).
best_repair(Plan, Cost) :-
  aggregate_all(min(Value), feasible_repair(Candidate, Value), Cost), feasible_repair(Plan, Cost).
restored(Node) :- best_repair(Plan, _), unavailable(Node), operating(Node, Plan).

% Answer
?- potential_impact(Failed, Node).
?- affected_function(Function).
?- best_repair(Plan, Cost).

% Reason
?- why.

% Answer
?- restored(Node).

% Check
?- check(best_repair([catalog_replica, bank_backup], 3)).
?- check(affected_function(place_order)).
?- check(affected_function(mobile_checkout)).
?- check(restored(web_store)).
?- check(restored(mobile_app)).
?- check(operating(risk_engine, [])).
?- check(\+ operating(payment_service, [])).
?- check(operating(payment_service, [bank_backup])).
?- check(\+ operating(checkout_api, [bank_backup])).
?- check(aggregate_all(count, feasible_repair(Plan, Cost), 9)).
