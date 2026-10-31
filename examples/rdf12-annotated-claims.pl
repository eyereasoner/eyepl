% Ranking conflicting RDF 1.2 annotated claims
%
% The transport authority says the bridge is closed, with confidence 98, and
% an anonymous post says it is open, with confidence 35. Each claim is a
% reifier of its status triple, and each source has a trust score. The claims
% are ranked by confidence times trust, and the top claim decides when its
% score reaches 8000: the authority's 9310 does, so the decision is to avoid
% the bridge.
%
% Numbers in RDF are typed literals whose value is text: atom_chars/2 and
% number_chars/2 read '98' as the integer 98 and spell computed scores back as
% text, and aggregate_all/3 counts the claims ranked ahead of each one.

rdf(iri('https://example.org/bridge'), iri('https://example.org/status'), iri('https://example.org/closed'), default_graph).
rdf(iri('https://example.org/authorityClaim'), iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'), triple(iri('https://example.org/bridge'), iri('https://example.org/status'), iri('https://example.org/closed')), default_graph).
rdf(iri('https://example.org/authorityClaim'), iri('https://example.org/assertedBy'), iri('https://example.org/transportAuthority'), default_graph).
rdf(iri('https://example.org/authorityClaim'), iri('https://example.org/confidence'), literal('98', datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph).
rdf(iri('https://example.org/bridge'), iri('https://example.org/status'), iri('https://example.org/open'), default_graph).
rdf(iri('https://example.org/socialClaim'), iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'), triple(iri('https://example.org/bridge'), iri('https://example.org/status'), iri('https://example.org/open')), default_graph).
rdf(iri('https://example.org/socialClaim'), iri('https://example.org/assertedBy'), iri('https://example.org/anonymousPost'), default_graph).
rdf(iri('https://example.org/socialClaim'), iri('https://example.org/confidence'), literal('35', datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph).
rdf(iri('https://example.org/transportAuthority'), iri('https://example.org/trustScore'), literal('95', datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph).
rdf(iri('https://example.org/anonymousPost'), iri('https://example.org/trustScore'), literal('20', datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph).

ranked_claim(Rank, Status, Source, Score) :-
    annotated_status_claim(Status, Source, Score),
    aggregate_all(count, claim_ahead(Score, Status, _OtherStatus, _OtherSource), Ahead),
    Rank is Ahead + 1.
claim_ahead(Score, _Status, OtherStatus, OtherSource) :-
    annotated_status_claim(OtherStatus, OtherSource, OtherScore),
    OtherScore > Score.
claim_ahead(Score, Status, OtherStatus, OtherSource) :-
    annotated_status_claim(OtherStatus, OtherSource, Score),
    OtherStatus @< Status.

annotated_status_claim(Status, Source, Score) :-
    status_resource(Status, StatusIri),
    source_resource(Source, SourceIri),
    rdf(
        iri('https://example.org/bridge'),
        iri('https://example.org/status'),
        iri(StatusIri),
        default_graph
    ),
    rdf(
        Reifier,
        iri('http://www.w3.org/1999/02/22-rdf-syntax-ns#reifies'),
        triple(
            iri('https://example.org/bridge'),
            iri('https://example.org/status'),
            iri(StatusIri)
        ),
        default_graph
    ),
    rdf(
        Reifier,
        iri('https://example.org/assertedBy'),
        iri(SourceIri),
        default_graph
    ),
    rdf_number(Reifier, 'https://example.org/confidence', Confidence),
    rdf_number(iri(SourceIri), 'https://example.org/trustScore', Trust),
    Score is Confidence * Trust.

% The top-ranked claim decides when its score is high enough.
bridge_decision(Action, Source, Score) :-
    ranked_claim(1, Status, Source, Score),
    Score >= 8000,
    status_action(Status, Action).
bridge_decision(verify_manually, no_trusted_source, Score) :-
    ranked_claim(1, _Status, _Source, Score),
    Score < 8000.
bridge_decision(verify_manually, no_trusted_source, 0) :-
    \+ status_claimed.

status_claimed :-
    annotated_status_claim(_Status, _Source, _Score).

rdf_number(Subject, PredicateIri, Number) :-
    rdf(
        Subject,
        iri(PredicateIri),
        literal(Text, datatype(_Datatype)),
        default_graph
    ),
    atom_chars(Text, Chars),
    number_chars(Number, Chars).

status_action(closed, avoid_bridge).
status_action(open, cross_bridge).

status_resource(closed, 'https://example.org/closed').
status_resource(open, 'https://example.org/open').
source_resource(transport_authority, 'https://example.org/transportAuthority').
source_resource(anonymous_post, 'https://example.org/anonymousPost').

% RDF form of the bridge decision and the ranked evidence.
result_rdf(iri('https://example.org/bridge'), iri('https://example.org/decision'), iri(DecisionIri), default_graph) :-
    bridge_decision(Action, _Source, _Score),
    atom_concat('https://example.org/', Action, DecisionIri).
result_rdf(iri('https://example.org/bridge'), iri('https://example.org/trustedSource'), iri(SourceIri), default_graph) :-
    bridge_decision(_Action, Source, _Score),
    source_result_iri(Source, SourceIri).
result_rdf(iri('https://example.org/bridge'), iri('https://example.org/score'), literal(ScoreText, datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph) :-
    bridge_decision(_Action, _Source, Score),
    number_atom(Score, ScoreText).
result_rdf(iri(StatusIri), iri('https://example.org/rank'), literal(RankText, datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph) :-
    ranked_claim(Rank, Status, _Source, _Score),
    status_resource(Status, StatusIri), number_atom(Rank, RankText).
result_rdf(iri(StatusIri), iri('https://example.org/assertedBy'), iri(SourceIri), default_graph) :-
    ranked_claim(_Rank, Status, Source, _Score),
    status_resource(Status, StatusIri), source_resource(Source, SourceIri).
result_rdf(iri(StatusIri), iri('https://example.org/score'), literal(ScoreText, datatype('http://www.w3.org/2001/XMLSchema#integer')), default_graph) :-
    ranked_claim(_Rank, Status, _Source, Score),
    status_resource(Status, StatusIri), number_atom(Score, ScoreText).

source_result_iri(no_trusted_source, 'https://example.org/noTrustedSource').
source_result_iri(Source, Iri) :- source_resource(Source, Iri).
number_atom(Number, Atom) :- number_chars(Number, Chars), atom_chars(Atom, Chars).

% Answer
?- result_rdf(S, P, O, G).

% Reason
?- why.

% Check
?- check.
?- check(result_rdf(iri('https://example.org/bridge'), iri('https://example.org/decision'), iri('https://example.org/avoid_bridge'), default_graph)).
