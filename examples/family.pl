% Finding grandparents
%
% Two generations of parent relationships connect a small family.
% eyepl joins those relationships to identify grandparents.
% Repeated variables require the same person across both premises.

parent(ada, bea).
parent(bea, cleo).
parent(bea, dan).
parent(eli, finn).

grandparent(Older, Younger) :- parent(Older, Middle), parent(Middle, Younger).

% Answer
?- grandparent(Who, Whom).
?- parent(ada, Child), parent(Child, Grandchild).
