% Counting a course's examiners
%
% Wittgenstein participates in the philosophy course that Russell and
% Wittgenstein both teach. Participants are students, and a teacher who is
% not a student is an examiner. Every course with a participant also needs
% some examiner, so that rule introduces a fresh one. Russell already
% satisfies it, so no fresh examiner is created and the course has exactly
% one examiner.
%
% The example shows completed negation, a fresh/1 witness that is introduced
% only when no fact of a lower stratum already satisfies its conclusion, and
% a count over the result. See https://arxiv.org/abs/2607.28778

teacher(philosophy, russell).
teacher(philosophy, wittgenstein).
participant(philosophy, wittgenstein).

student(Person) :-
    participant(Course, Person).

examiner(Course, Person) :-
    teacher(Course, Person),
    \+ student(Person).

examiner(Course, Examiner) :-
    participant(Course, Person),
    fresh(Examiner).

examiners(Course, Count) :-
    participant(Course, Person),
    aggregate_all(count, examiner(Course, Examiner), Count).

% Answer
?- examiner(Course, Examiner).
?- examiners(Course, Count).

% Reason
?- why.

% Check
?- check.
