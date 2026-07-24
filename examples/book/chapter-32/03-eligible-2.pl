% From The Art of Eyepl, Chapter 32.
eligible(Person) :-
  age(Person, Age),
  ge(Age, 18).
