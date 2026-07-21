% Derive relationships inside the named graph that supplied the source data.
rdf(S, iri("https://example.org/ancestor"), O, G) :-
  rdf(S, iri("https://example.org/parent"), O, G).

rdf(S, iri("https://example.org/ancestor"), O, G) :-
  rdf(S, iri("https://example.org/parent"), M, G),
  rdf(M, iri("https://example.org/parent"), O, G).
