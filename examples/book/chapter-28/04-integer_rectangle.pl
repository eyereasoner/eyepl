% From The Art of Eyepl, Chapter 28.
integer_rectangle(Area, W, H) :-
  between(1, Area, W),
  between(W, Area, H),
  mul(W, H, Area).

query(integer_rectangle(24, W, H)).
