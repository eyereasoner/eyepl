% From The Art of Eyepl, Chapter 22 — A grammar without special syntax.
sentence(Input, Rest) :-
  noun_phrase(Input, AfterNoun),
  verb_phrase(AfterNoun, Rest).

noun_phrase([the | Input], Rest) :- noun(Input, Rest).
noun_phrase([a | Input], Rest) :- noun(Input, Rest).

noun([robot | Rest], Rest).
noun([scientist | Rest], Rest).

verb_phrase(Input, Rest) :-
  verb(Input, AfterVerb),
  noun_phrase(AfterVerb, Rest).

verb([helps | Rest], Rest).
verb([observes | Rest], Rest).

complete_sentence(Words) :- sentence(Words, []).

query(complete_sentence([the, robot, helps, a, scientist])).
