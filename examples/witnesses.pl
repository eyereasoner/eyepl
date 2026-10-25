% A distinct ticket for each visitor
%
% Each registered visitor receives a ticket with a fresh opaque identity.
% Wheye creates one witness per rule firing, and another rule can carry
% that same identity onward. The proof checker verifies its origin under C8.

visitor(ada).
visitor(bea).

ticket(Visitor, Ticket) :- visitor(Visitor), fresh(Ticket).
admitted(Visitor, Ticket) :- ticket(Visitor, Ticket).

% Answer
?- admitted(Visitor, Ticket).
