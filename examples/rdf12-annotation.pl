% An RDF 1.2 annotation
%
% The triple "Alice's name is Alice" is asserted, and a reifier, claim1, stands
% for it through rdf:reifies and records that Carol stated it on 2025-01-15.
% The rules recover the asserted triple together with its annotations, and
% only for a triple that is both asserted and reified.
%
% A typed literal is literal(Text, datatype(IRI)): the date keeps its text and
% its datatype, so it goes back to RDF unchanged.

rdf(iri('https://example.org/alice'), iri('https://example.org/name'), literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string')), default_graph).
rdf(iri('https://example.org/claim1'), iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'), triple(iri('https://example.org/alice'), iri('https://example.org/name'), literal('Alice', datatype('http://www.w3.org/2001/XMLSchema#string'))), default_graph).
rdf(iri('https://example.org/claim1'), iri('https://example.org/statedBy'), iri('https://example.org/carol'), default_graph).
rdf(iri('https://example.org/claim1'), iri('https://example.org/recorded'), literal('2025-01-15', datatype('http://www.w3.org/2001/XMLSchema#date')), default_graph).

annotated_claim(S, P, O, Reifier, Source, Date) :-
    rdf(S, P, O, default_graph),
    rdf(
        Reifier,
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(S, P, O),
        default_graph
    ),
    rdf(
        Reifier,
        iri('https://example.org/statedBy'),
        Source,
        default_graph
    ),
    rdf(
        Reifier,
        iri('https://example.org/recorded'),
        Date,
        default_graph
    ).

% RDF form of the recovered annotated claim.
result_rdf(S, P, O, default_graph) :-
    annotated_claim(S, P, O, _Reifier, _Source, _Date).
result_rdf(Reifier, iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'), triple(S, P, O), default_graph) :-
    annotated_claim(S, P, O, Reifier, _Source, _Date).
result_rdf(Reifier, iri('https://example.org/statedBy'), Source, default_graph) :-
    annotated_claim(_S, _P, _O, Reifier, Source, _Date).
result_rdf(Reifier, iri('https://example.org/recorded'), Date, default_graph) :-
    annotated_claim(_S, _P, _O, Reifier, _Source, Date).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/claim1'), iri('https://example.org/statedBy'), iri('https://example.org/carol'), default_graph)).
