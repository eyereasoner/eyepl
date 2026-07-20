% Reference 9.6: atom and string built-ins.
answer(str_concat, X) :- str_concat("eye", "pl", X).
answer(contains, true) :- contains("eyepl", "ey").
materialize(answer, 2).
