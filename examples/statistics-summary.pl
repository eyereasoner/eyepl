% Summarizing a list of observations
%
% Calculate the count, mean, population variance, and population standard
% deviation of the sample [2, 4, 4, 4, 5, 5, 7, 9]. Its mean is 5, variance
% is 4, and standard deviation is 2.
%
% The values are stored in one list, so repeated observations remain
% separate. Population variance divides the sum of squared deviations by the
% number of observations, rather than the sample-variance divisor of one
% less.

:- table sum/2, squared_error_sum/3, length/2.

sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]).

sum([], 0.0).
% sum/2 and squared_error_sum/3 are recursive folds; the public relations then
% derive count, mean, population variance, and standard deviation.
sum([X|Xs], Total) :-
  sum(Xs, Rest),
  (Total is X + Rest).

mean(Name, Mean) :-
  sample(Name, Values),
  sum(Values, Total),
  length(Values, Count),
  (Mean is Total / Count).

squared_error_sum([], _mean, 0.0).
squared_error_sum([X|Xs], Mean, Total) :-
  (Delta is X - Mean),
  (Squared is Delta ** 2.0),
  squared_error_sum(Xs, Mean, Rest),
  (Total is Squared + Rest).

population_variance(Name, Variance) :-
  sample(Name, Values),
  mean(Name, Mean),
  squared_error_sum(Values, Mean, Sumsquarederrors),
  length(Values, Count),
  (Variance is Sumsquarederrors / Count).

population_stddev(Name, Stddev) :-
  population_variance(Name, Variance),
  (Stddev is Variance ** 0.5).

count(Name, Count) :-
  sample(Name, Values),
  length(Values, Count).

populationVariance(Name, Variance) :-
  population_variance(Name, Variance).

populationStddev(Name, Stddev) :-
  population_stddev(Name, Stddev).

length([], 0).
length([_ | Rest], Count) :-
  length(Rest, Previous),
  Count is Previous + 1.

% Answer
?- count(scores, Count).
?- mean(scores, Mean).
?- populationVariance(scores, Variance).
?- populationStddev(scores, Stddev).

% Reason
?- why.

% Check
?- check(count(scores, 8)).
?- check(mean(scores, 5.0)).
?- check(populationVariance(scores, 4.0)).
?- check(populationStddev(scores, 2.0)).
?- check((sample(scores, Values), sum(Values, 40.0))).
?- check((sample(scores, Values), squared_error_sum(Values, 5.0, 32.0))).
?- check(sum([], 0.0)).
?- check(length([], 0)).
