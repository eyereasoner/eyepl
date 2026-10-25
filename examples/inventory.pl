% Calculating an invoice
%
% Calculate an invoice from three items. Each item fact supplies its name,
% quantity, and unit price. The rules multiply quantity by price for each
% line, then sum the completed line totals. Prices use the same unspecified
% unit; the sample invoice totals 28.

item(apple, 3, 2).
item(pear, 4, 3).
item(plum, 2, 5).
line_total(Name, Total) :-
    item(Name, Quantity, Price),
    Total is Quantity * Price.
invoice(Total) :- aggregate_all(sum(Amount), line_total(Name, Amount), Total).

% Answer
?- invoice(Total).

% Reason
?- why.

% Answer
?- line_total(Item, Amount).

% Check
?- check(line_total(apple, 6)).
?- check(line_total(pear, 12)).
?- check(line_total(plum, 10)).
?- check(invoice(28)).
?- check(aggregate_all(count, line_total(Item, Amount), 3)).
