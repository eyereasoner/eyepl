% Joining data about a graph with data in it
%
% The default graph says which station reported the sensor graph, and the
% sensor graph holds a temperature reading. The rule joins the two and
% concludes, in the default graph, that the sensor's reading was reported by
% station 7. A graph's name is an IRI like any other, so data about a graph
% and data in that graph meet in one rule.

rdf(iri('https://example.org/sensorGraph'), iri('https://example.org/reportedBy'), iri('https://example.org/station7'), default_graph).
rdf(iri('https://example.org/sensor1'), iri('https://example.org/temperature'), literal('21.5', datatype('http://www.w3.org/2001/XMLSchema#string')), iri('https://example.org/sensorGraph')).

result_rdf(S, iri('https://example.org/reportedBy'), Station, default_graph) :-
    rdf(
        iri('https://example.org/sensorGraph'),
        iri('https://example.org/reportedBy'),
        Station,
        default_graph
    ),
    rdf(
        S,
        iri('https://example.org/temperature'),
        _,
        iri('https://example.org/sensorGraph')
    ).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/sensor1'), iri('https://example.org/reportedBy'), iri('https://example.org/station7'), default_graph)).
