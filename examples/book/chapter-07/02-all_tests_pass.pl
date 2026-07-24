% From The Art of Eyepl, Chapter 7.
all_tests_pass(Suite) :-
  forall(test_in(Suite, Test), passed(Test)).
