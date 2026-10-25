% Updating probabilities from observations
%
% Update the probabilities of four possible conditions using observed
% symptoms. This is an illustrative Bayesian model with invented
% probabilities.
%
% The conditions are treated as alternatives, and symptoms are assumed
% independent once a condition is fixed. A present symptom contributes its
% listed probability; an observed absence contributes one minus that value.
% Unobserved symptoms contribute no factor. Each condition's prior
% probability is multiplied by these factors, then divided by the total
% weight. The checks reject invalid probabilities and verify that the
% resulting probabilities sum to one.

:- table factor/2.
:- table likelihood/2.
:- table score/2.
:- table scores/2.
:- table sum/2.
:- table posteriors/2.
is_a(covid19, disease).
is_a(influenza, disease).
is_a('allergic-rhinitis', disease).
is_a('bacterial-pneumonia', disease).
prior(covid19, 0.05).
prior(influenza, 0.03).
prior('allergic-rhinitis', 0.1).
prior('bacterial-pneumonia', 0.01).
probability([covid19, fever], 0.7).
probability([covid19, 'dry-cough'], 0.65).
probability([covid19, 'loss-of-smell'], 0.4).
probability([covid19, sneezing], 0.15).
probability([covid19, 'short-breath'], 0.2).
probability([influenza, fever], 0.8).
probability([influenza, 'dry-cough'], 0.5).
probability([influenza, 'loss-of-smell'], 0.05).
probability([influenza, sneezing], 0.2).
probability([influenza, 'short-breath'], 0.1).
probability(['allergic-rhinitis', fever], 0.05).
probability(['allergic-rhinitis', 'dry-cough'], 0.15).
probability(['allergic-rhinitis', 'loss-of-smell'], 0.1).
probability(['allergic-rhinitis', sneezing], 0.8).
probability(['allergic-rhinitis', 'short-breath'], 0.05).
probability(['bacterial-pneumonia', fever], 0.7).
probability(['bacterial-pneumonia', 'dry-cough'], 0.6).
probability(['bacterial-pneumonia', 'loss-of-smell'], 0.02).
probability(['bacterial-pneumonia', sneezing], 0.05).
probability(['bacterial-pneumonia', 'short-breath'], 0.6).
is_a(case, 'patient-case').
diseases(case, [covid19, influenza, 'allergic-rhinitis', 'bacterial-pneumonia']).
evidence(case, [[fever, present], ['dry-cough', present], ['loss-of-smell', present], [sneezing, absent], ['short-breath', present]]).
sum([], 0).

factor([Disease, [Symptom, present]], Probability) :-
    probability([Disease, Symptom], Probability).
factor([Disease, [Symptom, absent]], _Calc1) :-
    probability([Disease, Symptom], Probability),
    _Calc1 is (1 - Probability).
likelihood([Disease, []], 1) :-
    is_a(Disease, disease).
likelihood([Disease, [Observation | Rest]], _Calc1) :-
    factor([Disease, Observation], Factor),
    likelihood([Disease, Rest], Remaining),
    _Calc1 is (Factor * Remaining).
score([Disease, Case], _Calc1) :-
    prior(Disease, Prior),
    evidence(Case, Evidence),
    likelihood([Disease, Evidence], Likelihood),
    _Calc1 is (Prior * Likelihood).
scores([[], Case], []) :-
    is_a(Case, 'patient-case').
scores([[Disease | Rest], Case], [Score | Remaining]) :-
    score([Disease, Case], Score),
    scores([Rest, Case], Remaining).
sum([Value | Rest], _Calc1) :-
    sum(Rest, Remaining),
    _Calc1 is (Value + Remaining).
scores(Case, Scores) :-
    is_a(Case, 'patient-case'),
    diseases(Case, Diseases),
    scores([Diseases, Case], Scores).
'evidence-total'(Case, Total) :-
    is_a(Case, 'patient-case'),
    scores(Case, Scores),
    sum(Scores, Total).
candidates(Case, Diseases) :-
    is_a(Case, 'patient-case'),
    diseases(Case, Diseases).
candidates(Case, Rest) :-
    candidates(Case, [Disease | Rest]).
posterior([Disease, Case], _Calc1) :-
    candidates(Case, [Disease | Rest]),
    score([Disease, Case], Score),
    'evidence-total'(Case, Total),
    Total > 0,
    _Calc1 is (Score / Total).
posteriors([[], Case], []) :-
    is_a(Case, 'patient-case').
posteriors([[Disease | Rest], Case], [Posterior | Remaining]) :-
    posterior([Disease, Case], Posterior),
    posteriors([Rest, Case], Remaining).
'posterior-total'(Case, Total) :-
    is_a(Case, 'patient-case'),
    diseases(Case, Diseases),
    posteriors([Diseases, Case], Posteriors),
    sum(Posteriors, Total).
is_a([prior, Disease], 'invalid-probability') :-
    prior(Disease, Probability),
    Probability < 0.
is_a([prior, Disease], 'invalid-probability') :-
    prior(Disease, Probability),
    Probability > 1.
is_a([probability, Pair], 'invalid-probability') :-
    probability(Pair, Probability),
    Probability < 0.
is_a([probability, Pair], 'invalid-probability') :-
    probability(Pair, Probability),
    Probability > 1.
is_a(Case, 'normalizable-case') :-
    'evidence-total'(Case, Total),
    Total > 0.
is_a(Case, 'normalized-case') :-
    'posterior-total'(Case, Total),
    _Calc1 is abs((Total - 1)),
    _Calc1 =< 1e-12.

% Answer
?- scores(case, What).
?- 'evidence-total'(case, What).
?- posterior([covid19, case], What).
?- posterior([influenza, case], What).
?- posterior(['allergic-rhinitis', case], What).
?- posterior(['bacterial-pneumonia', case], What).

% Reason
?- why.

% Check
?- check((aggregate_all(count, is_a(Subject, 'invalid-probability'), 0))).
?- check((is_a(case, 'normalizable-case'))).
?- check((is_a(case, 'normalized-case'))).
