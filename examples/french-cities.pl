% Finding routes between French cities
%
% Find which French cities can reach one another through the supplied road
% network. A connects(From, To) fact permits travel only in the written
% direction. A route can use one road or several roads in sequence. The
% queries find starting cities that can reach Nantes and check routes from
% Paris to Nantes and Tours, including a failed reverse-direction query.

:- table reaches/2.
connects(paris, orleans).
connects(paris, chartres).
connects(paris, amiens).
connects(orleans, blois).
connects(orleans, bourges).
connects(blois, tours).
connects(chartres, lemans).
connects(lemans, angers).
connects(lemans, tours).
connects(angers, nantes).

reaches(From, To) :-
    connects(From, To).
reaches(From, To) :-
    connects(From, Via),
    reaches(Via, To).

% Answer
?- reaches(Who, nantes).
?- reaches(paris, nantes).

% Reason
?- why.

% Answer
?- reaches(paris, tours).

% Reason
?- why.

% Answer
?- reaches(nantes, paris).

% Check
?- check((reaches(paris, nantes))).
?- check((reaches(chartres, nantes))).
?- check((reaches(lemans, nantes))).
?- check((reaches(angers, nantes))).
?- check((reaches(paris, tours))).
?- check((\+ (reaches(nantes, paris)))).
?- check((\+ (reaches(tours, nantes)))).
