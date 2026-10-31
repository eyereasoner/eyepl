% Ancestors within a TriG named graph
%
% The family graph says Alice is Bob's parent and Bob is Carol's. The rules
% derive ancestors within that graph, one and two generations up, and keep
% each conclusion in the graph it came from. The fourth argument of
% rdf(S, P, O, Graph) is the graph: iri(Name) for a named graph, default_graph
% for the default one.

rdf(iri('https://example.org/alice'), iri('https://example.org/parent'), iri('https://example.org/bob'), iri('https://example.org/family')).
rdf(iri('https://example.org/bob'), iri('https://example.org/parent'), iri('https://example.org/carol'), iri('https://example.org/family')).

result_rdf(S, iri('https://example.org/ancestor'), O, G) :-
    rdf(S, iri('https://example.org/parent'), O, G).

result_rdf(S, iri('https://example.org/ancestor'), O, G) :-
    rdf(S, iri('https://example.org/parent'), M, G),
    rdf(M, iri('https://example.org/parent'), O, G).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/alice'), iri('https://example.org/ancestor'), iri('https://example.org/carol'), iri('https://example.org/family'))).
