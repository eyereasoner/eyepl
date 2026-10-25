% Finding problems in customer and order records
%
% Find problems in a batch of customer and order records: missing or empty
% email fields, conflicting email values, unknown customers, negative
% amounts, duplicate order keys, and unsupported record shapes.
%
% Row identifiers keep separate observations distinct even when their
% contents match. Missing data means absent from this completed batch. The
% email check requires a nonempty value; it does not validate email address
% syntax.

:- table length/2.

record(r01, customer(c1, "Ada")).
record(r02, customer(c2, "Lin")).
record(r03, customer(c3, "Mira")).
record(r04, email(c1, "ada@example.org")).
record(r05, email(c1, "ada.new@example.org")).
record(r06, email(c2, "")).
record(r07, order(o1, c1, 120)).
record(r08, order(o2, c9, 45)).
record(r09, order(o3, c2, -5)).
record(r10, order(o3, c2, 9)).
record(r11, shipment(o1)).

allowed_shape(customer, 2).
allowed_shape(email, 2).
allowed_shape(order, 3).

length([], 0).
length([_ | Rest], Count) :- length(Rest, Previous), Count is Previous + 1.
customer(Id) :- record(_, customer(Id, _)).
has_email(Id) :- record(_, email(Id, _)).
record_shape(Row, Name, Arity) :-
  record(Row, Term), Term =.. [Name | Arguments], length(Arguments, Arity).

% Each finding retains the actual offending values or source rows.
finding(record(Row), unsupported_shape(Name, Arity)) :-
  record_shape(Row, Name, Arity), \+ allowed_shape(Name, Arity).
finding(customer(Id), missing_email) :- customer(Id), \+ has_email(Id).
finding(customer(Id), empty_email) :- record(_, email(Id, "")).
finding(customer(Id), conflicting_email(Left, Right)) :-
  record(Row, email(Id, Left)),
  record(Other, email(Id, Right)),
  Row @< Other,
  Left \= Right.
finding(order(Id), unknown_customer(Customer)) :-
  record(_, order(Id, Customer, _)), \+ customer(Customer).
finding(order(Id), invalid_amount(Amount)) :-
  record(_, order(Id, _, Amount)), Amount < 0.
finding(order(Id), duplicate_key(Row, Other)) :-
  record(Row, order(Id, _, _)), record(Other, order(Id, _, _)), Row @< Other.

audit_summary(customer_count, Count) :- aggregate_all(count, customer(Id), Count).
audit_summary(finding_count, Count) :- aggregate_all(count, finding(Subject, Reason), Count).

% Answer
?- finding(Subject, Reason).

% Reason
?- why.

% Answer
?- audit_summary(Kind, Count).

% Check
?- check(finding(customer(c1), conflicting_email("ada@example.org", "ada.new@example.org"))).
?- check(finding(customer(c2), empty_email)).
?- check(finding(customer(c3), missing_email)).
?- check(finding(order(o2), unknown_customer(c9))).
?- check(finding(order(o3), invalid_amount(-5))).
?- check(finding(order(o3), duplicate_key(r09, r10))).
?- check(finding(record(r11), unsupported_shape(shipment, 1))).
?- check(audit_summary(customer_count, 3)).
?- check(audit_summary(finding_count, 7)).
?- check(\+ finding(order(o1), invalid_amount(120))).
?- check(\+ finding(customer(c1), missing_email)).
