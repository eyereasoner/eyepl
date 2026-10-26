% Closed-world negation requires a stratified dependency graph.
p :- \+ q.
q :- p.
?- p.
