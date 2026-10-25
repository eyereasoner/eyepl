% Calculating with complex numbers
%
% Calculate powers and inverse trigonometric functions of complex numbers,
% which have a real part and an imaginary part. The sample input for inverse
% sine and cosine is 5.22, outside their real-valued input range.
%
% The power rules use a magnitude and angle. The checks square the calculated
% square root of -1, check Euler's identity, and compare i^i with exp(-pi/2).
% The inverse-function formulas choose complex results and check them by
% applying sine or cosine again. Real-number calculations are approximate;
% the rounded input for -pi/2 uses a looser checking tolerance.

:- table radius/2.
:- table angle/2.
:- table 'log-radius'/2.
:- table 'left-distance'/2.
:- table 'right-distance'/2.
:- table difference/2.
:- table average/2.
:- table 'imaginary-size'/2.
:- table 'hyperbolic-cosine'/2.
:- table 'hyperbolic-sine'/2.
is_a(input, 'complex-number').
real(input, 5.22).
imaginary(input, 0).
is_a('minus-one', 'complex-number').
real('minus-one', -1).
imaginary('minus-one', 0).
is_a(half, 'complex-number').
real(half, 0.5).
imaginary(half, 0).
is_a(euler, 'complex-number').
real(euler, 2.718281828459045).
imaginary(euler, 0).
is_a(i, 'complex-number').
real(i, 0).
imaginary(i, 1).
is_a('i-pi', 'complex-number').
real('i-pi', 0).
imaginary('i-pi', 3.141592653589793).
is_a('minus-half-pi', 'complex-number').
real('minus-half-pi', -1.57079632679).
imaginary('minus-half-pi', 0).
is_a('sqrt-minus-one', power).
base('sqrt-minus-one', 'minus-one').
exponent('sqrt-minus-one', half).
is_a('e-to-i-pi', power).
base('e-to-i-pi', euler).
exponent('e-to-i-pi', 'i-pi').
is_a('i-to-i', power).
base('i-to-i', i).
exponent('i-to-i', i).
is_a('e-to-minus-half-pi', power).
base('e-to-minus-half-pi', euler).
exponent('e-to-minus-half-pi', 'minus-half-pi').
is_a('asin-result', 'inverse-sine').
input('asin-result', input).
is_a('acos-result', 'inverse-cosine').
input('acos-result', input).

radius(Number, _Calc1) :-
    real(Number, Real),
    imaginary(Number, Imaginary),
    _Calc1 is sqrt(((Real * Real) + (Imaginary * Imaginary))).
angle(Number, Angle) :-
    real(Number, Real),
    imaginary(Number, Imaginary),
    Signed is atan2(Imaginary, Real),
    normalized_angle(Signed, Angle).
% Express the polar angle in [0, 2*pi), including a rounded full turn as zero.
normalized_angle(Angle, Angle) :- Angle >= 0.
normalized_angle(Signed, Angle) :-
    Signed < 0,
    Shifted is Signed + 2*pi,
    Angle is Shifted - floor(Shifted / (2*pi)) * (2*pi).
'log-radius'(Number, _Calc1) :-
    radius(Number, Radius),
    _Calc1 is log(Radius).
size(Power, _Calc1) :-
    is_a(Power, power),
    base(Power, Base),
    exponent(Power, Exponent),
    radius(Base, Radius),
    angle(Base, Angle),
    real(Exponent, Real),
    imaginary(Exponent, Imaginary),
    _Calc1 is ((Radius ^ Real) * exp((0 - (Imaginary * Angle)))).
phase(Power, _Calc1) :-
    is_a(Power, power),
    base(Power, Base),
    exponent(Power, Exponent),
    'log-radius'(Base, LogRadius),
    angle(Base, Angle),
    real(Exponent, Real),
    imaginary(Exponent, Imaginary),
    _Calc1 is ((Imaginary * LogRadius) + (Real * Angle)).
real(Power, _Calc1) :-
    is_a(Power, power),
    size(Power, Size),
    phase(Power, Phase),
    _Calc1 is (Size * cos(Phase)).
imaginary(Power, _Calc1) :-
    is_a(Power, power),
    size(Power, Size),
    phase(Power, Phase),
    _Calc1 is (Size * sin(Phase)).
is_a(Function, 'inverse-function') :-
    is_a(Function, 'inverse-sine').
is_a(Function, 'inverse-function') :-
    is_a(Function, 'inverse-cosine').
'left-distance'(Function, _Calc1) :-
    input(Function, Input),
    real(Input, Real),
    imaginary(Input, Imaginary),
    _Calc1 is sqrt((((1 + Real) ^ 2) + (Imaginary ^ 2))).
'right-distance'(Function, _Calc1) :-
    input(Function, Input),
    real(Input, Real),
    imaginary(Input, Imaginary),
    _Calc1 is sqrt((((1 - Real) ^ 2) + (Imaginary ^ 2))).
difference(Function, _Calc1) :-
    'left-distance'(Function, Left),
    'right-distance'(Function, Right),
    _Calc1 is ((Left - Right) / 2).
average(Function, _Calc1) :-
    'left-distance'(Function, Left),
    'right-distance'(Function, Right),
    _Calc1 is ((Left + Right) / 2).
'imaginary-size'(Function, _Calc1) :-
    average(Function, Average),
    _Calc1 is log((Average + sqrt(((Average ^ 2) - 1)))).
real(Function, _Calc1) :-
    is_a(Function, 'inverse-sine'),
    difference(Function, Difference),
    _Calc1 is asin(Difference).
imaginary(Function, Size) :-
    is_a(Function, 'inverse-sine'),
    'imaginary-size'(Function, Size).
real(Function, _Calc1) :-
    is_a(Function, 'inverse-cosine'),
    difference(Function, Difference),
    _Calc1 is acos(Difference).
imaginary(Function, _Calc1) :-
    is_a(Function, 'inverse-cosine'),
    'imaginary-size'(Function, Size),
    _Calc1 is (0 - Size).
'hyperbolic-cosine'(Function, _Calc1) :-
    imaginary(Function, Imaginary),
    _Calc1 is ((exp(Imaginary) + exp((0 - Imaginary))) / 2).
'hyperbolic-sine'(Function, _Calc1) :-
    imaginary(Function, Imaginary),
    _Calc1 is ((exp(Imaginary) - exp((0 - Imaginary))) / 2).
'recovered-real'(Function, _Calc1) :-
    is_a(Function, 'inverse-sine'),
    real(Function, Real),
    'hyperbolic-cosine'(Function, Cosh),
    _Calc1 is (sin(Real) * Cosh).
'recovered-imaginary'(Function, _Calc1) :-
    is_a(Function, 'inverse-sine'),
    real(Function, Real),
    'hyperbolic-sine'(Function, Sinh),
    _Calc1 is (cos(Real) * Sinh).
'recovered-real'(Function, _Calc1) :-
    is_a(Function, 'inverse-cosine'),
    real(Function, Real),
    'hyperbolic-cosine'(Function, Cosh),
    _Calc1 is (cos(Real) * Cosh).
'recovered-imaginary'(Function, _Calc1) :-
    is_a(Function, 'inverse-cosine'),
    real(Function, Real),
    'hyperbolic-sine'(Function, Sinh),
    _Calc1 is (0 - (sin(Real) * Sinh)).
'real-error'(Function, _Calc1) :-
    input(Function, Input),
    real(Input, Expected),
    'recovered-real'(Function, Actual),
    _Calc1 is abs((Expected - Actual)).
'imaginary-error'(Function, _Calc1) :-
    input(Function, Input),
    imaginary(Input, Expected),
    'recovered-imaginary'(Function, Actual),
    _Calc1 is abs((Expected - Actual)).
is_a(Function, 'checked-inverse') :-
    is_a(Function, 'inverse-function'),
    'real-error'(Function, RealError),
    RealError =< 1e-12,
    'imaginary-error'(Function, ImaginaryError),
    ImaginaryError =< 1e-12.
'squared-real'('sqrt-minus-one', _Calc1) :-
    real('sqrt-minus-one', Real),
    imaginary('sqrt-minus-one', Imaginary),
    _Calc1 is ((Real * Real) - (Imaginary * Imaginary)).
'squared-imaginary'('sqrt-minus-one', _Calc1) :-
    real('sqrt-minus-one', Real),
    imaginary('sqrt-minus-one', Imaginary),
    _Calc1 is ((2 * Real) * Imaginary).
is_a('sqrt-minus-one', 'checked-square-root') :-
    'squared-real'('sqrt-minus-one', ActualReal),
    real('minus-one', ExpectedReal),
    _Calc1 is abs((ActualReal - ExpectedReal)),
    _Calc1 =< 1e-12,
    'squared-imaginary'('sqrt-minus-one', ActualImaginary),
    imaginary('minus-one', ExpectedImaginary),
    _Calc2 is abs((ActualImaginary - ExpectedImaginary)),
    _Calc2 =< 1e-12.
is_a('e-to-i-pi', 'checked-identity') :-
    real('e-to-i-pi', Real),
    _Calc1 is abs((Real + 1)),
    _Calc1 =< 1e-12,
    imaginary('e-to-i-pi', Imaginary),
    _Calc2 is abs(Imaginary),
    _Calc2 =< 1e-12.
is_a('i-to-i', 'checked-identity') :-
    real('i-to-i', ActualReal),
    real('e-to-minus-half-pi', ExpectedReal),
    _Calc1 is abs((ActualReal - ExpectedReal)),
    _Calc1 =< 1e-10,
    imaginary('i-to-i', ActualImaginary),
    _Calc2 is abs(ActualImaginary),
    _Calc2 =< 1e-12,
    imaginary('e-to-minus-half-pi', ExpectedImaginary),
    _Calc3 is abs(ExpectedImaginary),
    _Calc3 =< 1e-12.

% Answer
?- real('sqrt-minus-one', What).
?- imaginary('sqrt-minus-one', What).
?- real('e-to-i-pi', What).
?- imaginary('e-to-i-pi', What).
?- real('i-to-i', What).
?- imaginary('i-to-i', What).
?- real('e-to-minus-half-pi', What).
?- imaginary('e-to-minus-half-pi', What).
?- real('asin-result', What).
?- imaginary('asin-result', What).
?- real('acos-result', What).
?- imaginary('acos-result', What).

% Reason
?- why.

% Check
?- check((is_a('sqrt-minus-one', 'checked-square-root'))).
?- check((is_a('e-to-i-pi', 'checked-identity'))).
?- check((is_a('i-to-i', 'checked-identity'))).
?- check((is_a('asin-result', 'checked-inverse'))).
?- check((is_a('acos-result', 'checked-inverse'))).
