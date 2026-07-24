% From The Art of Eyepl, Chapter 3.
adult(Person) :-
  age(Person, Years),
  ge(Years, 18).
