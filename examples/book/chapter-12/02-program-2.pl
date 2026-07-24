% From The Art of Eyepl, Chapter 12.
false :-
  assigned(Person, Role),
  incompatible_roles(Role, Other),
  assigned(Person, Other).
