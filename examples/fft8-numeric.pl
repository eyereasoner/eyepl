% Turning eight samples into frequency components
%
% Convert eight real samples into eight complex frequency components using a
% fast Fourier transform (FFT). The radix-2 method repeatedly splits the
% samples into even and odd positions, then combines their smaller
% transforms.
%
% Complex numbers are c(Real, Imaginary) terms. The forward transform uses
% exp(-2*pi*i*k*n/8) and does not divide the results by eight. Fixed
% approximate rotation factors make each arithmetic step visible; displayed
% components are rounded, while checks also use unrounded values.

wave(ramp, [0, 1, 2, 3, 4, 5, 6, 7]).
wave(alternating, [1, -1, 1, -1, 1, -1, 1, -1]).
w8(1, c(0.7071067811865476, -0.7071067811865476)).
w8(2, c(0.0, -1.0)).
w8(3, c(-0.7071067811865476, -0.7071067811865476)).

:- table c_add/3, c_sub/3, c_mul/3, fft2/2, fft4/2, fft8/2, rounded/2.
c_add(c(A, B), c(C, D), c(E, F)) :- E is A+C, F is B+D.
c_sub(c(A, B), c(C, D), c(E, F)) :- E is A-C, F is B-D.
c_mul(c(A, B), c(C, D), c(E, F)) :- E is A*C-B*D, F is A*D+B*C.

fft2([A, B], [c(Sum, 0.0), c(Difference, 0.0)]) :-
  Sum is A+B, Difference is A-B.

fft4([A, B, C, D], [Y0, Y1, Y2, Y3]) :-
  fft2([A, C], [E0, E1]), fft2([B, D], [O0, O1]),
  w8(2, W), c_mul(W, O1, T),
  c_add(E0, O0, Y0), c_add(E1, T, Y1),
  c_sub(E0, O0, Y2), c_sub(E1, T, Y3).

fft8([A, B, C, D, E, F, G, H], [Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7]) :-
  fft4([A, C, E, G], [E0, E1, E2, E3]),
  fft4([B, D, F, H], [O0, O1, O2, O3]),
  w8(1, W1), w8(2, W2), w8(3, W3),
  c_mul(W1, O1, T1), c_mul(W2, O2, T2), c_mul(W3, O3, T3),
  c_add(E0, O0, Y0), c_add(E1, T1, Y1),
  c_add(E2, T2, Y2), c_add(E3, T3, Y3),
  c_sub(E0, O0, Y4), c_sub(E1, T1, Y5),
  c_sub(E2, T2, Y6), c_sub(E3, T3, Y7).

% Round only the report to eight decimal places; tests also check raw bins.
rounded([], []).
rounded([c(R, I)|Rest], [c(RR, RI)|Tail]) :-
  RR is round(float(R)*100000000)/100000000,
  RI is round(float(I)*100000000)/100000000,
  rounded(Rest, Tail).
spectrum(Name, Bins) :-
  wave(Name, Samples), fft8(Samples, Raw), rounded(Raw, Bins).

% Answer
?- spectrum(ramp, Bins).

% Reason
?- why.

% Answer
?- spectrum(alternating, Bins).

% Check
?- check(spectrum(ramp, [c(28.0, 0.0), c(-4.0, 9.65685425), c(-4.0, 4.0), c(-4.0, 1.65685425), c(-4.0, 0.0), c(-4.0, -1.65685425), c(-4.0, -4.0), c(-4.0, -9.65685425)])).
?- check(spectrum(alternating, [c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(8.0, 0.0), c(0.0, 0.0), c(0.0, 0.0), c(0.0, 0.0)])).
?- check((fft8([1, 0, 0, 0, 0, 0, 0, 0], Raw), rounded(Raw, [c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0), c(1.0, 0.0)]))).
