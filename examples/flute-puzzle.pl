% Solving a puzzle about occupations and instruments
%
% Find who plays the flute by assigning distinct occupations and instruments
% to Chris, Sandy, and Pat. The occupations are doctor, lawyer, and engineer;
% the instruments are piano, violin, and flute.
%
% Chris is married to the doctor, the lawyer plays the piano, Chris is not
% the engineer, and Sandy is a patient of the violinist. The rules treat the
% violinist as the doctor, require Chris to differ from the doctor, and
% require Sandy to differ from the violinist. They test assignments against
% these clues.
%
% Original code: https://www.cs.toronto.edu/~hector/PublicTCSlides.pdf

person(chris).
person(sandy).
person(pat).

% solve puzzle
solution(Flute) :-
    uniq_people(Doctor, Lawyer, Engineer),
    uniq_people(Piano, Violin, Flute),
    chris \= Doctor,        % Chris is married to the doctor.
    Lawyer = Piano,         % The lawyer plays the piano.
    Engineer \= chris,      % The engineer is not Chris.
    Violin = Doctor,        % Sandy is a patient of the violinist.
    sandy \= Violin.

uniq_people(A, B, C) :-
    person(A),
    person(B),
    person(C),
    A \= B,
    A \= C,
    B \= C.

% Answer
?- solution(Flute).

% Reason
?- why.

% Check
?- check(solution(sandy)).
?- check(\+ solution(chris)).
?- check(\+ solution(pat)).
?- check(aggregate_all(count, solution(Flute), 1)).
?- check(aggregate_all(count, uniq_people(A, B, C), 6)).
