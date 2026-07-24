% From The Art of Eyepl, Chapter 3.
eligible(Person) :-
  age(Person, Years),
  ge(Years, 18),
  registered(Person).
