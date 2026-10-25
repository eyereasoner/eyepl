% Counting tree shapes, parenthesizations, and triangulations
%
% Catalan numbers count several families of arrangements. C(0)=1, and each
% later count adds the products for every split into two smaller structures.
% The same count gives triangulations of an (N+2)-sided polygon and ways to
% parenthesize (N+1) factors. An explicit recursive sum handles the convolution;
% tabling reuses smaller counts. Only the final finite summary uses an
% aggregate. Supply nonnegative integer indices; all counts are exact.

:- table catalan/2, convolution/3, in_range/3.

catalan(0, 1).
catalan(N, Count) :- N > 0, Last is N-1, convolution(0, Last, Count).
convolution(I, Last, 0) :- I > Last.
convolution(I, Last, Count) :-
    I =< Last, J is Last-I, catalan(I, Left), catalan(J, Right),
    Next is I+1, convolution(Next, Last, Rest), Count is Left*Right+Rest.
polygon_triangulations(Sides, Count) :- Sides >= 3, N is Sides-2, catalan(N, Count).
parenthesizations(Factors, Count) :- Factors >= 1, N is Factors-1, catalan(N, Count).
in_range(Low, High, Low) :- Low =< High.
in_range(Low, High, Value) :-
    Low < High, Next is Low + 1, in_range(Next, High, Value).

catalan_answer(catalan_12, C) :- catalan(12, C).
catalan_answer(triangulations_14_gon, C) :- polygon_triangulations(14, C).
catalan_answer(parenthesizations_13_factors, C) :- parenthesizations(13, C).
catalan_answer(first_ten_sum, Sum) :-
    aggregate_all(sum(C), (in_range(0, 9, N), catalan(N, C)), Sum).

% Answer
?- catalan_answer(Kind, Count).

% Reason
?- why(catalan(4, Count)).

% Check
?- check.
?- check(catalan(0, 1)).
?- check(catalan(4, 14)).
?- check(catalan(12, 208012)).
?- check(polygon_triangulations(3, 1)).
?- check(parenthesizations(1, 1)).
?- check(catalan_answer(first_ten_sum, 6918)).
?- check(\+ catalan(-1, 0)).
