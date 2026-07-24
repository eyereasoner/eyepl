% From The Art of Eyepl, Chapter 17 — The same relation, a different computation.
adult(Person) :- person(Person), age(Person, Age), ge(Age, 18).

adult(Person) :- ge(Age, 18), age(Person, Age), person(Person).
