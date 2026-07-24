% From The Art of Eyepl, Chapter 23.
can_board(Person) :-
  registered(Person),
  identity_checked(Person),
  not(suspended(Person)),
  has_ticket(Person).

can_enter_lounge(Person) :-
  registered(Person),
  identity_checked(Person),
  not(suspended(Person)),
  lounge_pass(Person).
