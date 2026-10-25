% Calculating a resistor-capacitor filter's response
%
% Calculate the response time and cutoff frequency of a low-pass filter made
% from a resistor (R) and capacitor (C). Its time constant is R*C seconds;
% its cutoff frequency is 1/(2*pi*R*C) hertz.
%
% Supply positive resistance in ohms and capacitance in farads. The model
% assumes ideal components and no load on the output; it omits component
% tolerances.

components(filter1, 10000.0, 0.000001).

response(Filter, Tau, Cutoff) :-
  components(Filter, R, C), R > 0, C > 0,
  Tau is R*C,
  Cutoff is 1/(2*pi*Tau).

cutoff_hz(Filter, Rounded) :-
  response(Filter, _, Raw),
  Rounded is round(Raw*100000000)/100000000.

% Answer
?- cutoff_hz(Filter, Cutoff).

% Reason
?- why.

% Answer
?- response(Filter, Tau, _).

% Check
?- check(response(filter1, 0.01, _)).
?- check((response(filter1, Tau, F), abs(2*pi*Tau*F-1) < 1.0e-12)).
?- check((response(filter1, _, F), F > 15.91, F < 15.92)).
