% Checking types in a small expression language
%
% Determine the result types of expressions in a small language with
% functions, function calls, arithmetic, conditionals, and pairs. Function
% parameters carry explicit type labels, and rules check that their uses
% agree.
%
% The labels t0, t1, and t2 are ordinary atoms naming schematic types in the
% examples. They are not fresh logic variables. This program checks the
% stated annotations and lexical variable lookup; it does not implement
% general type-variable inference or let-polymorphism, where one definition
% can be used at several inferred types.

:- table type_expr/3, lookup/3.

program(id, lam(x, t0, var(x))).
program(const, lam(x, t0, lam(y, t1, var(x)))).
program(apply_id, app(lam(x, int, var(x)), int_lit(42))).
program(compose,
  lam(f, fun(t1, t2),
    lam(g, fun(t0, t1),
      lam(x, t0,
        app(var(f), app(var(g), var(x))))))).
program(branch,
  if(bool_lit(true), add(int_lit(20), int_lit(22)), int_lit(0))).
program(first_of_pair, fst(pair(bool_lit(true), int_lit(7)))).

lookup(Name, [[Name, Type] | _], Type).
lookup(Name, [[Other, _] | Rest], Type) :-
  Name \= Other,
  lookup(Name, Rest, Type).

type_expr(_, int_lit(_), int).
type_expr(_, bool_lit(_), bool).
type_expr(Env, var(Name), Type) :- lookup(Name, Env, Type).
type_expr(Env, lam(Name, Arg_type, Body), fun(Arg_type, Body_type)) :-
  type_expr([[Name, Arg_type] | Env], Body, Body_type).
type_expr(Env, app(Fn, Arg), Result_type) :-
  type_expr(Env, Fn, fun(Arg_type, Result_type)),
  type_expr(Env, Arg, Arg_type).
type_expr(Env, add(Left, Right), int) :-
  type_expr(Env, Left, int),
  type_expr(Env, Right, int).
type_expr(Env, if(Cond, Then, Else), Type) :-
  type_expr(Env, Cond, bool),
  type_expr(Env, Then, Type),
  type_expr(Env, Else, Type).
type_expr(Env, pair(Left, Right), pair(Left_type, Right_type)) :-
  type_expr(Env, Left, Left_type),
  type_expr(Env, Right, Right_type).
type_expr(Env, fst(Pair), Left_type) :-
  type_expr(Env, Pair, pair(Left_type, _)).
type_expr(Env, snd(Pair), Right_type) :-
  type_expr(Env, Pair, pair(_, Right_type)).

type_answer(Name, Type) :- program(Name, Expr), type_expr([], Expr, Type).
type_reason(compose, "application unifies f with t1 -> t2 and g with t0 -> t1") :-
  type_answer(compose, _).
type_reason(apply_id, "the identity function's parameter type is unified with int") :-
  type_answer(apply_id, int).

% Answer
?- type_answer(Name, Type).

% Reason
?- why(type_answer(compose, Type)).

% Answer
?- type_reason(Name, Reason).

% Check
?- check(type_answer(id, fun(t0, t0))).
?- check(type_answer(const, fun(t0, fun(t1, t0)))).
?- check(type_answer(apply_id, int)).
?- check(type_answer(compose, fun(fun(t1, t2), fun(fun(t0, t1), fun(t0, t2))))).
?- check(type_answer(branch, int)).
?- check(type_answer(first_of_pair, bool)).
?- check(aggregate_all(count, type_answer(Name, Type), 6)).
?- check(\+ type_expr([], add(bool_lit(true), int_lit(1)), int)).
?- check(\+ type_expr([], if(bool_lit(true), int_lit(1), bool_lit(false)), int)).
?- check(type_expr([[x, bool], [x, int]], var(x), bool)).
?- check(\+ type_expr([[x, bool], [x, int]], var(x), int)).
