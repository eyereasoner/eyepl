% RDF 1.2 triple terms
%
% Alice claims that Bob knows Carol. An RDF 1.2 triple term,
% <<( bob knows carol )>>, names that triple the way a quoted sentence does,
% without asserting it. A rule that accepts Alice's claims asserts the triple:
% Bob knows Carol.
%
% RDF data is ordinary terms: iri(Text) for an IRI, triple(S, P, O) for a
% triple term, and rdf(S, P, O, Graph) for a quad. The rule matches inside the
% triple term by unification, like any other term.

rdf(iri('https://example.org/alice'), iri('https://example.org/claims'), triple(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol')), default_graph).

result_rdf(S, iri('https://example.org/knows'), O, G) :-
    rdf(
        _,
        iri('https://example.org/claims'),
        triple(S, iri('https://example.org/knows'), O),
        G
    ).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol'), default_graph)).
