% From The Art of Eyepl, Chapter 23.
adult(Person) :-
  recorded_age(Person, Age),
  ge(Age, 18).
