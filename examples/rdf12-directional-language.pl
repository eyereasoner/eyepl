% RDF 1.2 directional language strings
%
% A welcome label exists in Arabic, written right to left, and in English,
% written left to right. A display rule turns every label into a display label
% and keeps the base direction, so a screen can lay out each text the right
% way. literal(Text, lang(Tag, Direction)) carries the direction ltr or rtl,
% and a rule that passes the literal on whole cannot lose it.

rdf(iri('https://example.org/welcome'), iri('https://example.org/label'), literal('مرحبا', lang('ar', rtl)), default_graph).
rdf(iri('https://example.org/welcome'), iri('https://example.org/label'), literal('Welcome', lang('en', ltr)), default_graph).

result_rdf(S, iri('https://example.org/displayLabel'), Label, G) :-
    rdf(S, iri('https://example.org/label'), Label, G).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/welcome'), iri('https://example.org/displayLabel'), literal('Welcome', lang(en, ltr)), default_graph)).
