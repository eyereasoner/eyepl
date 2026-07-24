% From The Art of Eyepl, Chapter 21 — Failure rewinds choices, not facts.
eligible(Person) :-
  applicant(Person),
  age(Person, Age),
  ge(Age, 18),
  verified(Person).
