% ISO permits unbounded integers; these cases exercise eyepl's choice.
?- X is 9223372036854775807 + 1.
?- X is -9223372036854775808 - 1.
?- X is 9007199254740993 * 3.
?- X is 2 ^ 100.
?- X is 1 << 100.
?- 9007199254740993 > 9007199254740992.
