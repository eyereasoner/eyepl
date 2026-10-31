% Nested RDF 1.2 triple terms
%
% An auditor reviews Alice's claim that Bob knows Carol: a triple term
% inside a triple term, none of it asserted. One rule reaches through both
% levels with a single pattern and asserts the innermost relationship, that Bob
% knows Carol. Triple terms nest like any other terms.

rdf(iri('https://example.org/auditor'), iri('https://example.org/reviews'), triple(iri('https://example.org/alice'), iri('https://example.org/claims'), triple(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol'))), default_graph).

result_rdf(S, iri('https://example.org/knows'), O, G) :-
    rdf(
        _,
        iri('https://example.org/reviews'),
        triple(
            _,
            iri('https://example.org/claims'),
            triple(S, iri('https://example.org/knows'), O)
        ),
        G
    ).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol'), default_graph)).
