% ISO arithmetic through Corrigenda 1-3: operator priorities.
?- X is 1 \/ 2 + 1.
?- X is 2 /\ 1 + 1.
?- X is 1 << 2 + 1.
?- X is 16 >> 1 * 2.
?- X is 16 >> (1 * 2).
?- X is \ 1 + 2.
?- X is -2 ^ 2 * 3.
?- X is 2 ^ -2.0.
?- +3 = '+'(3).
?- +3 = 3.
?- X is 2 ** -2.
?- X is 2 ^ +3.
