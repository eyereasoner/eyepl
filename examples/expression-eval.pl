% Evaluating an expression graph
%
% Evaluate an arithmetic expression stored as a graph of named nodes. Literal
% nodes supply numbers; addition, subtraction, and multiplication nodes
% combine the values of their children. The sample expression computes 2*3 +
% (10-4), giving 12.

literal(n2, 2).
literal(n3, 3).
literal(n10, 10).
literal(n4, 4).
expression(product, mul, n2, n3).
expression(difference, sub, n10, n4).
expression(total, add, product, difference).
root(example, total).

value(Node, Value) :-
    literal(Node, Value).
value(Node, Value) :-
    expression(Node, Operation, Left, Right),
    value(Left, L),
    value(Right, R),
    calculate(Operation, L, R, Value).

calculate(add, L, R, Value) :-
    Value is L + R.
calculate(sub, L, R, Value) :-
    Value is L - R.
calculate(mul, L, R, Value) :-
    Value is L * R.

result(Name, Value) :-
    root(Name, Node),
    value(Node, Value).

% Answer
?- result(Name, Value).

% Reason
?- why.

% Check
?- check(result(example, 12)).
?- check(value(product, 6)).
?- check(value(difference, 6)).
?- check(value(total, 12)).
?- check(aggregate_all(count, value(Node, Value), 7)).
