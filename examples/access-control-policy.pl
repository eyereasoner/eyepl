% Checking an access policy
%
% Check whether the sample request satisfies a policy with three kinds of
% condition: all required attributes, at least one alternative attribute, and
% none of the forbidden attributes. The queries show both the overall
% decision and the result of each condition. Missing attributes are
% determined from the facts in this program.

policy(test1, 'PolicyX').
has(test1, 'A').
has(test1, 'B').
has(test1, 'C').
policy('PolicyX').
allOf('PolicyX', 'A').
allOf('PolicyX', 'B').
anyOf('PolicyX', 'C').
noneOf('PolicyX', 'D').

% A helper records a missing required attribute. Negation then tests one
% completed, ground policy rather than a nested negative conjunction.
missing_all(Policy) :-
    policy(Request, Policy),
    policy(Policy),
    allOf(Policy, Attribute),
    \+ has(Request, Attribute).
matched_any(Policy) :-
    policy(Request, Policy),
    policy(Policy),
    anyOf(Policy, Attribute),
    has(Request, Attribute).
matched_none(Policy) :-
    policy(Request, Policy),
    policy(Policy),
    noneOf(Policy, Attribute),
    has(Request, Attribute).

pass(Policy, allOfTest) :-
    policy(Policy),
    \+ missing_all(Policy).
pass(Policy, anyOfTest) :-
    policy(Policy),
    matched_any(Policy).
pass(Policy, noneOfTest) :-
    policy(Policy),
    \+ matched_none(Policy).
accepted(Policy) :-
    policy(Policy),
    pass(Policy, allOfTest),
    pass(Policy, anyOfTest),
    pass(Policy, noneOfTest).

% Answer
?- accepted(Policy).

% Reason
?- why.

% Answer
?- pass('PolicyX', Test).

% Check
?- check(accepted('PolicyX')).
?- check(pass('PolicyX', allOfTest)).
?- check(pass('PolicyX', anyOfTest)).
?- check(pass('PolicyX', noneOfTest)).
?- check(aggregate_all(count, pass('PolicyX', Test), 3)).
?- check(\+ missing_all('PolicyX')).
?- check(\+ matched_none('PolicyX')).
