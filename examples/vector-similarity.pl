% Comparing numeric vectors
%
% Compare two numeric vectors by their dot product, lengths, and cosine
% similarity. The dot product adds matching-coordinate products; a vector's
% Euclidean length is the square root of the sum of its squared coordinates.
%
% Cosine similarity divides the dot product by both lengths, measuring how
% closely the vectors point in the same direction. Supply equal-length lists
% for the dot product and nonzero lengths for cosine similarity. Recursive
% list rules perform the calculations using approximate real arithmetic.

:- table dot/3, sum_squares/2, norm/2.

vector(pair1, a, [1.0, 2.0, 3.0]).
vector(pair1, b, [4.0, -5.0, 6.0]).

% Recursive list folds compute dot products and sums of squares.
dot([], [], 0.0).
dot([A|As], [B|Bs], Dot) :-
  (Product is A * B),
  dot(As, Bs, Rest),
  (Dot is Product + Rest).

sum_squares([], 0.0).
sum_squares([X|Xs], Total) :-
  (Squared is X ** 2.0),
  sum_squares(Xs, Rest),
  (Total is Squared + Rest).

norm(Vector, Norm) :-
  sum_squares(Vector, Sumsquares),
  (Norm is Sumsquares ** 0.5).

% cosine = dot(A,B) / (norm(A) * norm(B)).
cosine_similarity(Case, Similarity) :-
  vector(Case, a, A),
  vector(Case, b, B),
  dot(A, B, Dot),
  norm(A, Norma),
  norm(B, Normb),
  (Denominator is Norma * Normb),
  (Similarity is Dot / Denominator).

dotProduct(Case, Dot) :-
  vector(Case, a, A),
  vector(Case, b, B),
  dot(A, B, Dot).

normA(Case, Norma) :-
  vector(Case, a, A),
  norm(A, Norma).

normB(Case, Normb) :-
  vector(Case, b, B),
  norm(B, Normb).

cosineSimilarity(Case, Similarity) :-
  cosine_similarity(Case, Similarity).

% Answer
?- dotProduct(pair1, Dot).
?- normA(pair1, Norm).
?- normB(pair1, Norm).
?- cosineSimilarity(pair1, Similarity).

% Reason
?- why.

% Check
?- check(dotProduct(pair1, 12.0)).
?- check((vector(pair1, a, A), sum_squares(A, 14.0))).
?- check((vector(pair1, b, B), sum_squares(B, 77.0))).
?- check((normA(pair1, A), abs(A*A - 14) < 1.0e-12)).
?- check((normB(pair1, B), abs(B*B - 77) < 1.0e-12)).
?- check((cosineSimilarity(pair1, S), abs(S - 0.3654869423239036) < 1.0e-12)).
?- check(dot([], [], 0.0)).
?- check(\+ dot([1.0], [], 0.0)).
