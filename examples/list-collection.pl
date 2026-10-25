% Collecting each order's items into a list
%
% Build a pick list for each order by collecting item(Product, Quantity)
% terms with aggregate_all(list(Term), Goal, List). A second report includes
% only lines requesting at least ten units.
%
% Different line numbers keep identical items as separate list elements.
% Repeating the same line fact does not add another item. An order without
% matching lines gets an empty list, []; list order is unspecified.

order(alpha).
order(beta).
order(empty).
% line(Order, LineNumber, Product, Quantity).
line(alpha, 1, bolts, 4).
line(alpha, 2, nuts, 4).
line(alpha, 3, bolts, 4).
line(alpha, 3, bolts, 4).
line(beta, 1, washers, 12).

pick_list(Order, Items) :-
  order(Order),
  aggregate_all(list(item(Product, Quantity)), line(Order, Line, Product, Quantity), Items).
bulk_list(Order, Items) :-
  order(Order),
  aggregate_all(list(item(Product, Quantity)),
    (line(Order, Line, Product, Quantity), Quantity >= 10), Items).

% Check multiplicities without depending on the collected list's order.
:- table occurrences/3.
occurrences(_, [], 0).
occurrences(Item, [Item|Rest], Count) :-
  occurrences(Item, Rest, Before), Count is Before+1.
occurrences(Item, [Other|Rest], Count) :-
  Item \= Other, occurrences(Item, Rest, Count).

% Answer
?- pick_list(Order, Items).

% Reason
?- why.

% Answer
?- aggregate_all(list(Quantity), line(alpha, Line, Product, Quantity), Quantities).
?- bulk_list(Order, Items).

% Check
?- check((pick_list(alpha, Items), occurrences(item(bolts, 4), Items, 2), occurrences(item(nuts, 4), Items, 1))).
?- check(pick_list(beta, [item(washers, 12)])).
?- check(pick_list(empty, [])).
?- check(aggregate_all(list(Quantity), line(alpha, Line, Product, Quantity), [4, 4, 4])).
?- check(bulk_list(alpha, [])).
?- check(bulk_list(beta, [item(washers, 12)])).
