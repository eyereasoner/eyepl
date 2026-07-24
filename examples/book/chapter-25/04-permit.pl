% From The Art of Eyepl, Chapter 25 — Decision, reasons, and proof.
permit(Person, Zone) :-
  active_badge(Person, Badge),
  cleared_for(Badge, Zone),
  prepared_for(Person, Zone),
  in_good_standing(Person).

reason(Person, Zone, badge_and_training_verified) :-
  permit(Person, Zone).

query(permit(Person, Zone)).
query(reason(Person, Zone, Reason)).
