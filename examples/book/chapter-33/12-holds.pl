% From The Art of Eyepl, Chapter 33 — Readiness, determinism, and fallback.
holds((ready, name(alice, "Alice"), route(alice, bob, 7)), Name, Args).
functor(route(alice, bob, 7), route, 3).
arg(2, route(alice, bob, 7), bob).
compound_name_arguments(Term, route, [alice, bob, 7]).
compound_name_arguments(nil, nil, []).
