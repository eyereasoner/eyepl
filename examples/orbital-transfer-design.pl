% Estimating a transfer between Earth and Mars orbits
%
% Estimate the speed changes and travel time for a Hohmann transfer: an
% elliptical path joining two circular orbits around the Sun in the same
% plane. The sample uses Earth and Mars orbital radii.
%
% The calculation includes only the Sun's gravity and instantaneous speed
% changes at departure and arrival. It omits launch, capture, changes of
% orbital plane, and other bodies. Radii use kilometers, the gravitational
% parameter mu uses km^3/s^2, speed changes use km/s, and travel time uses
% days.

transfer(earth_mars, 132712440018.0, 149597870.7, 227939200.0).

hohmann(Name, DepartureDV, ArrivalDV, Days) :-
  transfer(Name, Mu, R1, R2), Mu > 0, R1 > 0, R2 > 0,
  Axis is (R1+R2)/2,
  DepartureDV is abs(sqrt(Mu*(2/R1-1/Axis))-sqrt(Mu/R1)),
  ArrivalDV is abs(sqrt(Mu/R2)-sqrt(Mu*(2/R2-1/Axis))),
  Days is pi*sqrt(Axis**3/Mu)/86400.

% Round displayed delta-v and days to six decimal places.
transfer_report(Name, TotalDV, Days) :-
  hohmann(Name, Departure, Arrival, Time),
  TotalDV is round((Departure+Arrival)*1000000)/1000000,
  Days is round(Time*1000000)/1000000.

% Answer
?- transfer_report(Name, DeltaV, Days).

% Reason
?- why.

% Check
?- check((hohmann(earth_mars, D1, D2, Days), D1 > 2.9, D1 < 3.0, D2 > 2.6, D2 < 2.7, Days > 258, Days < 260)).
?- check((hohmann(earth_mars, D1, D2, _), D1+D2 < 6)).
