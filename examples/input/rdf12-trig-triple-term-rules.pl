% Project a triple term while preserving its named-graph context.
rdf(S, iri("https://example.org/knows"), O, G) :-
  rdf(
    _,
    iri("https://example.org/claims"),
    triple(S, iri("https://example.org/knows"), O),
    G
  ).
