% Checked customer vouchers
%
% A shop totals each customer's purchases and gives eligible customers a
% distinct voucher. eyepl combines aggregation, a closed-world exclusion,
% an arithmetic comparison, and a fresh witness. Its certificate exercises
% all nine proof-checking conditions, including closure and witness integrity.

customer(ada).
customer(bea).
line(ada, book, 12).
line(ada, pen, 3).
line(bea, map, 7).
blocked(bea).

subtotal(Customer, Total) :-
    customer(Customer),
    aggregate_all(sum(Price), (line(Customer, Item, Price)), Total).

eligible(Customer, Total) :-
    subtotal(Customer, Total),
    \+ blocked(Customer),
    Total >= 10.

voucher(Customer, Voucher, Total) :-
    eligible(Customer, Total),
    fresh(Voucher).

% Answer
?- voucher(Customer, Voucher, Total).

% Reason
?- why.

% Check
?- check.
