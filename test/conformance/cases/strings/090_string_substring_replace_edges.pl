% Reference 9.6: substring and replace have finite boundary behavior.
materialize(answer, 2).
answer(prefix, X) :- substring("derivalanglet", 0, 6, X).
answer(middle, X) :- substring("derivalanglet", 6, 2, X).
answer(suffix, X) :- substring("derivalanglet", 5, 3, X).
answer(empty_at_end, X) :- substring("derivalanglet", 13, 0, X).
answer(out_of_range_rejected, ok) :- not(substring("derivalanglet", 13, 2, X)).
answer(replace_all, X) :- replace("banana", "na", "NA", X).
answer(replace_missing, X) :- replace("banana", "x", "y", X).
