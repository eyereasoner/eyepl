% Deriving relationships from a declared property chain
%
% Alice is Bob's parent, Bob is Carol's parent, and Carol is Dave's parent.
% A declaration defines grandparent as a chain of two parent links. Rules
% follow the declared list to derive Alice's and Bob's grandparent links.
%
% Property names are ordinary atoms stored in triple/3. The program implements
% this property-chain rule explicitly; it does not implement the rest of OWL.

:- table follow_chain/3.

property_chain(grandparent, [parent, parent]).
triple(alice, parent, bob).
triple(bob, parent, carol).
triple(carol, parent, dave).

triple(Start, Property, End) :-
    property_chain(Property, [First | Rest]),
    triple(Start, First, Middle),
    follow_chain(Rest, Middle, End).
follow_chain([], Node, Node).
follow_chain([Property | Rest], Start, End) :-
    triple(Start, Property, Middle), follow_chain(Rest, Middle, End).

% Answer
?- triple(Person, grandparent, Grandchild).

% Reason
?- why.

% Check
?- check.
?- check(triple(alice, grandparent, carol)).
?- check(triple(bob, grandparent, dave)).
?- check(aggregate_all(count, triple(Person, grandparent, Grandchild), 2)).
?- check(follow_chain([], alice, alice)).
?- check(\+ triple(alice, grandparent, dave)).
