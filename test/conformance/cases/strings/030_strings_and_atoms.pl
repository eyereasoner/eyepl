% Reference 9.6: atom and string built-ins.
answer(str_concat, X) :- str_concat("der", "iva", X).
answer(contains, true) :- contains("deriva", "de").
materialize(answer, 2).
