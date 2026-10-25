% Calculating pressure with an ideal-gas model
%
% A gas cell has one mole at 300 kelvin in 0.024 cubic meters. The supplied
% rounded gas constant is 8 joules per mole-kelvin, giving 100,000 pascals.
% Rules compare the pressure with a strict 95,000 to 105,000 pascal band.
% This uses P*V = n*R*T for an ideal gas, with positive volume; the chosen
% constant is part of this illustrative calculation.

gas_cell(cell1, 1.0, 8.0, 300.0, 0.024).
pressure_limit(cell1, low_Pa, 95000.0).
pressure_limit(cell1, high_Pa, 105000.0).

pressure(Cell, Pressure) :-
  gas_cell(Cell, Moles, Gasconstant, Temperature, Volume),
  (Nr is Moles * Gasconstant),
  (Nrt is Nr * Temperature),
  (Pressure is Nrt / Volume).

near_atmospheric(Cell) :-
  pressure(Cell, Pressure),
  pressure_limit(Cell, low_Pa, Low),
  pressure_limit(Cell, high_Pa, High),
  (Pressure > Low),
  (Pressure < High).

pressure_Pa(Cell, Pressure) :-
  pressure(Cell, Pressure).

status(Cell, near_atmospheric) :-
  near_atmospheric(Cell).

reason(Cell, "pressure is inside the one-atmosphere tolerance band") :-
  near_atmospheric(Cell).

% Answer
?- pressure(Cell, Pascals).
?- status(Cell, Status).

% Reason
?- why(near_atmospheric(cell1)).

% Check
?- check.
?- check(pressure(cell1, 100000.0)).
?- check(near_atmospheric(cell1)).
?- check(aggregate_all(count, status(Cell, Status), 1)).
