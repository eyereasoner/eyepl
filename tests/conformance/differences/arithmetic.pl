% Wheye preserves exact integer comparisons, even with real operands.
% It extends integer inputs to rounding/float-part functions, and sign/1
% always returns an integer. These are not ISO compatibility assertions.
?- 9007199254740993 > 9007199254740992.0.
?- 9007199254740993 =:= 9007199254740992.0.
?- X is min(9007199254740993,9007199254740992.0).
?- X is floor(9007199254740993).
?- X is ceiling(3), Y is round(3), Z is truncate(3).
?- X is float_integer_part(3), Y is float_fractional_part(3).
?- X is sign(-2.5).
?- X is atan2(0,0).
