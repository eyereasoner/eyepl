% A triple term inside a named graph
%
% The claims graph records that Alice claims Bob knows Carol. Accepting the
% claim asserts that Bob knows Carol in the same claims graph, so the result
% stays apart from the default graph. The graph is a variable of the rule like
% the subject and object, so one rule serves every graph.

rdf(iri('https://example.org/alice'), iri('https://example.org/claims'), triple(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol')), iri('https://example.org/claimsGraph')).

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
?- check(result_rdf(iri('https://example.org/bob'), iri('https://example.org/knows'), iri('https://example.org/carol'), iri('https://example.org/claimsGraph'))).
