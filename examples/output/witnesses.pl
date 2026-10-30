% Witnesses
witness(w1, W) :- fresh(W).
witness(w2, W) :- fresh(W).

% Answer 1
admitted(ada, W1) :-
    witness(w1, W1).
admitted(bea, W2) :-
    witness(w2, W2).
