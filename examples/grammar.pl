% Parsing a tiny command language
%
% Read a command consisting of open or close followed by door or window.
% List patterns consume each word and build a command(Verb, Object) term.
% The parser also returns any unconsumed words, so a caller can require a
% complete command or continue parsing a longer input.

:- table verb/3, noun/3, sentence/3.

verb([open | Rest], open, Rest).
verb([close | Rest], close, Rest).
noun([door | Rest], door, Rest).
noun([window | Rest], window, Rest).
sentence(Input, command(Verb, Object), Rest) :-
    verb(Input, Verb, Middle), noun(Middle, Object, Rest).

% Answer
?- sentence([open, door], Command, []).
?- sentence([close, window, please], Command, Rest).

% Reason
?- why(sentence([open, door], Command, [])).

% Check
?- check.
?- check(sentence([close, door], command(close, door), [])).
?- check(sentence([open, window], command(open, window), [])).
?- check(\+ sentence([open, door, please], command(open, door), [])).
?- check(\+ sentence([paint, door], command(paint, door), [])).
?- check(\+ sentence([open], command(open, door), [])).
