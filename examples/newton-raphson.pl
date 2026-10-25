% Approximating roots by repeated improvement
%
% Approximate roots of x^2-2, log(x)-1, and sin(x) using Newton-Raphson
% iteration. Each step replaces a trial value x by x-f(x)/f'(x), using the
% function and derivative selected by its number.
%
% findRoot([Number, Start, Tolerance], Root) stops when abs(f(x)) is below
% the tolerance. The supplied starts approach sqrt(2), e, and pi. Other
% starts may fail or not converge; there is no iteration limit. Displayed
% roots are rounded, and goal checks use unrounded values.
%
% See https://en.wikipedia.org/wiki/Newton%27s_method

f(1, X, Y) :- Y is X*X - 2.
f(2, X, Y) :- Y is log(X) - 1.
f(3, X, Y) :- Y is sin(X).

% function derivatives
fd(1, X, Y) :- Y is 2*X.
fd(2, X, Y) :- Y is 1/X.
fd(3, X, Y) :- Y is cos(X).

% Newton-Raphson iteration
% The two clauses express the stopping test and the next iteration.
:- table findRoot/2, rounded_root/2.
findRoot([N, X, Tolerance], X) :-
    f(N, X, FX),
    abs(FX) < Tolerance.
findRoot([N, X, Tolerance], Root) :-
    f(N, X, FX),
    abs(FX) >= Tolerance,
    fd(N, X, FDX),
    NewX is X - FX / FDX,
    findRoot([N, NewX, Tolerance], Root).

% Round displayed roots to fourteen decimal places; retain unrounded values for
% accuracy checks. The last binary64 bit may differ between runtimes.
rounded_root(Inputs, Root) :-
    findRoot(Inputs, Raw),
    Root is round(Raw * 100000000000000) / 100000000000000.

% Answer
?- rounded_root([1, 1.0, 1.0e-15], Root).

% Reason
?- why.

% Answer
?- rounded_root([2, 2.0, 1.0e-15], Root).
?- rounded_root([3, 3.0, 1.0e-15], Root).

% Check
?- check((findRoot([1, 1.0, 1.0e-15], Root), abs(Root - sqrt(2)) < 1.0e-14)).
?- check((findRoot([2, 2.0, 1.0e-15], Root), abs(Root - e) < 1.0e-14)).
?- check((findRoot([3, 3.0, 1.0e-15], Root), abs(Root - pi) < 1.0e-14)).
?- check((findRoot([1, 1.0, 1.0e-15], Root), f(1, Root, Residual), abs(Residual) < 1.0e-15)).
