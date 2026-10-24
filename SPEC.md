# Wheye specification

Version **0.1.18**. Implemented Prolog subset and independently checked proof
certificate contract. This specification does not claim full ISO Prolog conformance.

Uppercase MUST, MUST NOT, SHOULD, and MAY express requirement levels under
[RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) and
[RFC 8174](https://www.rfc-editor.org/rfc/rfc8174).
The [guide](https://eyereasoner.github.io/wheye/) gives CLI and browser usage.

## 1. Program

Programs are UTF-8 `.pl` documents with facts, clauses, queries, and directives:

```prolog
human(socrates).
mortal(Person) :- human(Person).
?- mortal(Who).
?- why.
?- check.
?- check(mortal(socrates)).
:- table fibonacci/2.
```

The entire source MUST be parsed before evaluation. Queries MAY use later facts
and clauses. Multiple input files are parsed separately and merged in order;
variable scopes remain local to clauses and requests. Queries and goal checks
MUST select output and MUST NOT become inference evidence. Only `table`
directives are supported. `why/0`, `why/1`, `check/0`, and `check/1` have
the top-level meanings given below.

## 2. Names and Values

Names are case-sensitive. Unquoted atoms match `[a-z][A-Za-z0-9_]*`.
Variables match `[A-Z_][A-Za-z0-9_]*`. A variable's scope is one clause, query,
or goal check. Repeating a variable name MUST require the same term. Every `_`
MUST be a fresh variable. Names beginning with `_` MUST remain shared when
repeated, but MUST be omitted from displayed query bindings.

Single quotes delimit atoms, including Unicode names and punctuation:
`'red-fox'`, `'Élodie'`, `'7'`. Quoted and unquoted spellings of the same atom
MUST unify. Double quotes delimit strings, which MUST remain distinct from
atoms and numbers. Quotes MAY be doubled inside the corresponding quoted
value. Supported backslash escapes are `\n`, `\r`, `\t`, `\b`, `\f`, `\\`,
`\'`, `\"`, and Unicode `\uXXXX` / `\UXXXXXXXX`.
Comments start with `%` and run to the end of the line, or use `/* ... */`.
Block comments are not nested. Quoted comment markers are literal content.
Comments and multiline terms MUST preserve diagnostic source lines.

Integers are decimal digits with an optional unary sign and MUST be exact,
using arbitrary-precision arithmetic limited by available resources. Reals
have a decimal fraction or exponent and MUST use finite binary64 values.
Integers and reals are distinct terms: `1 = 1.0` fails, while `1 =:= 1.0`
succeeds. Real overflow and non-finite arithmetic MUST raise an error.

A term MAY be an atom, integer, real, string, variable, compound term such as
`point(2, 3)`, or list. Compounds have a fixed atom functor and one or more
arguments. Arity-zero predicates use a bare atom. Lists use `[]`, `[a, b]`,
and `[Head | Tail]`; tails MUST be lists or variables. Improper lists are
outside this subset. Nested compounds and lists MUST match structurally.
The quoted constructor `'.'(Head, Tail)` is equivalent to `[Head | Tail]`
and has the same tail restrictions. The empty list `[]` is distinct from
the quoted atom `'[]'`.
Unification MUST perform an occurs check and MUST NOT create cyclic terms.
Ground facts are loaded directly. Unit clauses containing variables, such as
`append([], List, List).`, MUST act as demand-driven clauses with an empty
body; their calls MUST supply enough bindings to produce ground answers.
Compound arithmetic syntax in a fact is an ordinary compound term and MUST NOT
be implicitly evaluated.

## 3. Variables and Relations

Predicates are identified by name and arity. An ordinary predicate has no implicit
implementation outside the builtin indicators below. A functor constructs data;
it does not call or evaluate that data. A relation or compound supports at most
64 arguments. Each clause or query supports at most 64 body goals. The parser
bounds term nesting to 256 as a resource limit.

## 4. Rules and Body Goals

A clause has one ordinary predicate head and one or more body goals, separated
by commas. Goals MAY be grouped in parentheses. Multiple clauses for one
predicate provide alternative derivations. There is no separate forward-rule
syntax. Arithmetic expressions in ordinary arguments remain terms; use an
explicit `is/2` step to compute an argument or a result:

```prolog
:- table fibonacci/2.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Value) :-
    N > 1,
    PreviousIndex is N - 1,
    EarlierIndex is N - 2,
    fibonacci(PreviousIndex, Previous),
    fibonacci(EarlierIndex, Earlier),
    Value is Previous + Earlier.
```

Ordinary positive goals bind variables by structural matching. `Left = Right`
unifies terms. `Left is Expression` evaluates the right side and unifies its
numeric result with the left. Arithmetic inputs MUST be bound at that point;
computations MUST NOT solve backward. A successful materialized head MUST be
ground; calls that leave output variables unresolved MUST raise an error.

### 4.1 Built-ins and Arithmetic

The following builtin predicates MAY appear in clause bodies, queries, and
goal checks. Inputs described as bound MUST have their required values when the
goal is reached. These predicates MUST NOT be redefined by facts or clauses.

| Predicate | Syntax and behavior |
| --- | --- |
| `true/0` | `true` always succeeds, without binding variables. |
| `false/0` | `false` always fails. |
| `=/2` | `Left = Right` unifies terms structurally, with an occurs check. Either operand may contain variables. |
| `\=/2` | `Left \= Right` succeeds if the terms cannot unify at this point. Trial bindings MUST be discarded. It does not constrain later bindings: `X \= a` fails while `X` is free. |
| `is/2` | `Value is Expression` evaluates the bound expression and unifies the numeric result with `Value`. A bound result must have the same numeric term type and value. |
| `</2`, `=</2`, `>/2`, `>=/2` | Numeric less than, less than or equal, greater than, and greater than or equal. Both expressions are evaluated. |
| `=:=/2`, `=\=/2` | Numeric equality and inequality. Both expressions are evaluated; `1 =:= 1.0` succeeds. |
| `@</2`, `@=</2`, `@>/2`, `@>=/2` | Lexicographic less than, less than or equal, greater than, and greater than or equal. Both operands MUST be bound atoms, or both MUST be bound strings. Ordering compares UTF-16 code units; it does not perform locale collation or general term ordering. |
| `contains_text/2` | `contains_text(Text, Part)` requires two bound strings. It lowercases both using Unicode default case conversion, then tests literal substring containment. No Unicode normalization is performed. An empty `Part` succeeds. |
| `atom_codes/2` | `atom_codes(Atom, Codes)` relates an atom to its list of Unicode scalar values as integers. A bound atom produces codes; otherwise a bound proper list of codes produces an atom. |
| `string_codes/2` | `string_codes(String, Codes)` provides the same conversion for strings, preserving their distinction from atoms. |
| `=../2` | `Term =.. Parts` decomposes a nonvariable term into a list of its functor and arguments, or constructs a term from such a list. It does not evaluate or call the constructed term. |
| `aggregate_all/3` | `aggregate_all(Template, Goal, Result)` computes `count`, `sum(Value)`, `min(Value)`, `max(Value)`, or `list(Term)` over completed, distinct producer tuples. See Section 4.3 for binding, scope, and empty-result rules. |

For the two text conversions, a bound first argument MUST have the specified
text type. Its codes are unified with the second argument, which MAY contain
variables. If the first argument is a variable, the second MUST be a ground
proper list of integers from 0 through 1114111, excluding surrogate values
55296 through 57343. Text containing an unpaired surrogate MUST raise an
error. Supplementary characters occupy one code; empty text corresponds to
`[]`. Conversion MUST preserve code points without Unicode normalization.
Invalid decoding inputs and calls with neither required input supplied MUST
raise an error; a valid conversion with an incompatible output simply fails.

For `=../2`, a compound decomposes to `[Functor | Arguments]`, for example
`point(2, 3) =.. [point, 2, 3]`. An atom, number, or string decomposes to a
singleton list containing itself. The empty list decomposes to `[[]]`;
a nonempty list decomposes to `['.', Head, Tail]`. In the construction
direction, `Parts` MUST have a known, nonempty, proper list spine. A
singleton MUST contain a bound atom, number, string, or `[]`; a longer list
MUST begin with a bound atom functor. Arguments MAY contain variables that
are bound by subsequent goals. Constructing `'.'/2` MUST obey the list-tail
restrictions in Section 2. Neither direction introduces cyclic terms, and
displayed answers MUST still be ground. Missing inputs or invalid parts
MUST raise an error; incompatible terms and parts fail by unification.

The following special forms complete the language's built-in facilities;
they are not additional ordinary predicates:

| Form | Context and meaning |
| --- | --- |
| `\+ Goal` | Negation of one goal, with the completion and binding requirements in Section 4.2. |
| `?- why.` | Print the preceding ordinary query's proof certificate (Section 6). |
| `?- why(Goal).` | Query and print the proof of `Goal`, which may be a conjunction (Section 6). |
| `?- check.` | Independently verify the preceding ordinary query's certificate under C1–C9. |
| `?- check(Goal).` | Print `true.` if `Goal` has a solution, otherwise `false.`. |
| `:- table Name/Arity, ... .` | Declare ordinary predicates demand-driven and tabled (Section 4.2). |

Conjunction with `,` and parenthesized goal groups are supported syntax.
The predicates above introduce no mutation or I/O effects. A failed test
produces no solution; an invalid arithmetic input or an unmet input requirement
MUST raise an error rather than silently failing.

The following table is exhaustive. Rows run from lower to higher precedence;
operators on the same row share precedence. Parentheses override precedence.
All operands MUST evaluate to numbers; the integer-only operations reject reals,
even those with an integral value such as `3.0`.

| Binary operators | Associativity | Meaning |
| --- | --- | --- |
| `\/`, `xor`, `/\`, `<<`, `>>` | Left | Integer bitwise OR, XOR, AND, left shift, right shift. |
| `+`, `-` | Left | Addition and subtraction. |
| `*`, `/`, `//`, `div`, `rem`, `mod` | Left | Multiplication, real division, truncating integer quotient, flooring integer quotient, truncating remainder, flooring remainder. |
| `**`, `^` | `**` non-associative; `^` right | Real power; power preserving exact integers for integer operands and a nonnegative exponent. |

Unary `+` preserves its operand; unary `-` negates it. Unary `\` is integer
bitwise complement. Unary operators bind more tightly than multiplication and
less tightly than powers: `-2^2` evaluates to `-4`.

Addition, subtraction, and multiplication of two integers MUST be exact.
Unary signs MUST preserve the operand's numeric type. `/` and `**` MUST produce
reals. `^` MUST produce an exact integer for integer operands and a nonnegative
exponent, and a real otherwise. Other mixed integer/real arithmetic MUST convert
its operands to binary64; conversion and results MUST remain finite.

`//`, `div`, `rem`, `mod`, and bit operations MUST require integers.
`//` truncates toward zero; `div` floors. `rem` has the dividend's sign;
`mod` has the divisor's sign. With `-7` and `3`, the four results are `-2`,
`-3`, `-1`, and `2`. Division or remainder by zero MUST raise an error.
Bit operations MUST use unbounded signed two's-complement semantics.
Shift counts MUST be nonnegative; right shift preserves the sign.

Functions use ordinary argument syntax inside arithmetic expressions:
`sqrt(9)`, `min(A, B)`. The following table lists every supported function.
Arguments MUST evaluate to numbers, subject to the additional requirements
shown. Integer and real result types remain distinct terms.

| Function | Meaning and result |
| --- | --- |
| `abs/1` | Absolute value, preserving the integer or real type. |
| `sign/1` | Integer `-1`, `0`, or `1` according to the argument's sign. |
| `sqrt/1` | Real square root of a nonnegative argument. |
| `log/1`, `exp/1` | Real natural logarithm of a positive argument; real exponential. |
| `sin/1`, `cos/1`, `tan/1` | Real trigonometric functions, with input angles in radians. |
| `asin/1`, `acos/1`, `atan/1` | Real principal inverse trigonometric functions in radians. `asin` and `acos` require inputs in `[-1, 1]`; their result ranges are `[-pi/2, pi/2]` and `[0, pi]`. `atan` returns a value in `[-pi/2, pi/2]`. |
| `atan2/2` | `atan2(Y, X)` returns the real signed angle of `(X, Y)` in `[-pi, pi]`; `atan2(0, 0)` returns `0.0`. |
| `floor/1`, `ceiling/1` | Integer rounding toward negative and positive infinity respectively. |
| `round/1`, `truncate/1` | Integer rounding to nearest with halfway cases away from zero; integer rounding toward zero. |
| `float_integer_part/1` | Real integral part, truncated toward zero. |
| `float_fractional_part/1` | Real argument minus its truncated integral part. |
| `min/2`, `max/2` | Smaller or larger operand, preserving its type and exact value; select the first on numeric equality. |
| `gcd/2` | Nonnegative integer greatest common divisor of two integers, including `gcd(0, 0) = 0`. |
| `xor/2` | Integer bitwise XOR, equivalent to the infix `xor` operator. |

`pi` and `e` evaluate to the binary64 approximations
`3.141592653589793` and `2.718281828459045`. Outside arithmetic evaluation they
remain ordinary atoms. Transcendental functions return binary64 approximations;
their last result bit MAY differ between implementations.

`floor`, `ceiling`, `round`, and `truncate` MUST retain every digit of an
integer input. `float_integer_part` and `float_fractional_part` convert integer
inputs to binary64 and MUST return reals. Numeric comparisons and `min`/`max`
MUST preserve an integer operand's exact value rather than first rounding both
operands to binary64. Atoms, strings, and lists MUST NOT be coerced to numbers.
Non-finite conversions, overflow, and real function domain errors MUST raise
an error. Unsupported arithmetic functions MUST report their name and arity.

The string predicates `string_concat/3` and `string_length/2` additionally
compute a string concatenation from two bound strings and count Unicode scalar
values in a bound string, respectively. They do not coerce atoms to strings.

### 4.2 Stratified Negation

Facts and answers have set semantics. Every distinct ground tuple MUST be
stored at most once, regardless of the number of derivations. Positive
recursion MUST reach a least fixed point when its domain is finite.

The implementation evaluates range-restricted clauses forward: each head
variable and each builtin input can be bound from preceding positive goals.
It MUST evaluate other clauses using demand-driven tables. A `table` declaration
MUST make every clause of the declared predicate demand-driven, regardless of
where the declaration appears. Declarations are optional for clauses already
requiring inputs, and useful to prevent eager enumeration of recursive list
constructors. All demand-driven calls MUST be tabled. Calls differing only in
variable spelling MUST share evaluation, preserving repeated-variable
constraints. Recursive consumers MUST suspend and resume as answers arrive,
without requiring an unbounded chain of nested calls.
Tables MUST be local to each run.

This execution model differs from conventional Prolog depth-first search:
clause order MUST NOT change the answer set for terminating positive programs
whose calls supply required inputs. Answer order, duplicate derivations, cut,
and procedural side effects are not provided.

`\+ Goal` holds when no matching ground positive answer exists after its
producers complete. Negative ordinary goals MUST be ground when reached.
Negation of a conjunction and nested negation are outside this subset; define
a helper predicate. Negated tests MUST NOT introduce bindings. Negated `is/2`
and unification require bound operands, as do negated `atom_codes/2`,
`string_codes/2`, and `=../2`; negated aggregate goals require a
helper predicate.

The implementation MUST reject dependency cycles through negation or
aggregation.
A negative consumer MUST run after its producer strata finish. Dependency
analysis distinguishes predicates by name/arity and excludes producer heads
with incompatible atomic argument constants; other argument constraints MAY
be treated conservatively. Arithmetic tests have no fact producers.
Absence means no evidence in this completed program, not a claim about the
world.

No semantic depth limit is defined. Arithmetic, compound construction, or
expanding call patterns can create infinite computation. Tabling MUST NOT be
described as guaranteeing termination for arbitrary programs. The playground
MUST allow cancellation by terminating its computation worker.

### 4.3 Aggregation

A query MUST return all distinct tuples of its displayed variables, once each.
Variables beginning with `_` are existentially projected out. Successful queries
with no displayed variables yield `true.`; unsuccessful queries yield `false.`.
`false.` describes query failure, not an explicitly asserted negative fact.
Conjunctions share bindings and process goals from left to right.

```prolog
?- aggregate_all(count, mortal(Person), Count).
?- aggregate_all(sum(Value), score(Person, Value), Total).
?- aggregate_all(min(Value), score(Person, Value), Minimum).
?- aggregate_all(max(Value), score(Person, Value), Maximum).
?- aggregate_all(list(result(Person, Value)), score(Person, Value), Results).
```

`aggregate_all/3` MAY appear in a body, query, or goal check. Its goal MAY be a
parenthesized conjunction. It MUST complete all matching producer work before
aggregating, including demand-driven definitions. A bound result constrains the
computed answer. Existing outer bindings MAY constrain the producer call;
local producer variables MUST NOT escape into the caller.

Aggregation operates on distinct tuples of all producer variables under the
set semantics of this interpreter. It does not count repeated proof paths.
Equal values from distinct subjects contribute separately. Empty counts and
sums yield integer zero; empty minima and maxima fail. Counts and integer sums
MUST be exact; sums and extrema also support finite real arithmetic. A producer
that requires unavailable input bindings MUST report an error.

`list(Term)` MUST collect one instance of `Term` per distinct producer tuple,
without evaluating arithmetic expressions inside that term. Elements MAY be
atoms, strings, numbers, compounds, or lists, but MUST be ground. Empty
collections MUST yield `[]`. Equal projected terms from different producer
tuples MUST remain repeated list elements; repeated facts or proof paths MUST
NOT add elements. List order is unspecified. A supplied result or list pattern
MUST unify with the computed list; it MUST NOT bind producer variables or
filter the producer before collection. Unlike Prolog's `findall/3`, this
operation does not collect nonground answers or repeated derivations.

### 4.4 Fresh Witnesses

```prolog
ticket(Person, Witness) :- registered(Person), fresh(Witness).
```

`fresh/1` is an explicit additional predicate for typed witnesses. Its call
syntax is ordinary Prolog syntax. It MUST occur only as the final goal of a
forward rule, with a new output variable; queries and aggregate bodies MUST NOT
create witnesses. The source rule ID, goal position, and complete preceding
substitution determine the opaque identity. Repeating a firing reuses its
identity; different firings cannot share it. Other rules MAY carry witnesses as
values. Source facts MUST NOT supply witness constants. The certificate-only
notation `~"identity"` distinguishes a witness from an atom or string.
C8 checks both its type and binding to one source-rule firing.

## 5. Meaning and Execution

wheye MUST use
[Herbrand semantics](https://logical.stanford.edu/intrologic/chapters/chapter_07.html)
for ordinary predicates, with the interpreted builtins specified in Section 4.1.
Ground terms denote themselves:
`socrates` denotes the atom `socrates`, and `point(2, 3)` denotes that compound
term. A functor constructs data; it does not implicitly call a function.
Distinct ground terms MUST remain distinct after the lexical normalization
and structural matching described in Section 2. For example, `socrates` and
`plato` are different values, while `socrates` and `'socrates'` are the same
atom. Asserting a relation between two terms does not make them identical.

The **Herbrand universe** is the set of finite ground terms constructible from
the language's constants and constructors, including its supported numeric
values, strings, and proper lists. Variables range over these terms. The
**Herbrand base** is the set of all ordinary predicate applications to ground
terms, such as `human(socrates)`. These applications are called ground atoms;
here, "atom" means a proposition, distinct from an atom used as a term.
A Herbrand interpretation specifies which ground atoms are true.

For positive clauses, the program's meaning MUST be the **least Herbrand
model**, relative to the specified builtins: the smallest set of ground atoms
containing the facts and closed under rule application. Clause variables are
universally quantified: whenever a ground instance of a rule's body holds,
its head holds. Thus the facts and clause in Section 2 make
`human(socrates)` and `mortal(socrates)` true. A query returns ground bindings
that make its goals true, subject to the input requirements of this subset.

Arithmetic builtins have their specified numeric interpretation. For example,
`1 + 2` remains a compound term in an ordinary argument, while `Value is 1 + 2`
binds `Value` to the integer `3`. `1 = 1.0` fails because the terms differ;
`1 =:= 1.0` succeeds by numeric comparison. Stratified negation extends the
positive semantics by testing absence only after the relevant producers
complete, as specified below. The universe can be infinite; these semantics
do not require enumerating it or guarantee that evaluation terminates.

Evaluation uses indexed forward inference and demand-driven tables. Consumers
suspend and resume as answers arrive; recursive calls do not consume one Rust
stack frame per call. Source facts are loaded first. Negative and aggregate
dependencies are strict; compatible producer rules MUST finish first. Atomic
argument constants that cannot match a producer head do not create a dependency.
Source facts have level zero; each rule's level is at least its positive
producers' levels and strictly above negative or aggregate producers' levels.
Rules with a negative or aggregate body have a minimum level of one.

Facts and answers have set semantics; the first successful justification is
retained. Decisions for builtins, absence, aggregation, and witnesses MUST stay
out of ordinary relation indexes. Default limits bound stored evidence to
1,000,000 steps and counted work to 10,000,000 operations. Finite model indexes,
matching, and demanded-call checks count toward the work limit. Limit exhaustion
MUST report an error rather than successful partial output.

## 6. Queries and Output

Queries process conjunctions left to right, project their named outer variables,
and remove duplicate bindings. Names beginning with `_` remain shared but are
omitted from display. Aggregate producer variables are local and do not escape.
Successful requests without displayed variables print `true.`; unsuccessful
queries print `false.`, which is not a certificate of absence.

Each request MUST print its `?- ... .` line before its result, with normalized
term formatting and blank lines between requests. Output follows source order:

- `?- Goal.` MUST print all answers to that ordinary query.
- `?- why.` MUST print a readable proof certificate for the most recent ordinary query.
- `?- check.` MUST independently verify that query's certificate and print C1–C9.
- `?- check(Goal).` MUST print `true.` if the goal has any solution, otherwise
  `false.`, without printing variable bindings or failing the run.

A goal check MUST NOT replace the preceding ordinary query for `why` or `check`.
Both bare requests MUST report an error if no ordinary query precedes them,
including across merged files. `?- why(Goal).` is shorthand for an ordinary
query followed by `?- why.`. Requests MUST NOT become inference evidence.
Only table directives are supported; `:- assertion(Goal).` MUST be rejected.
Without queries or requests, output lists newly derived ordinary facts,
excluding source facts and auxiliary evidence.

There MUST be one readable, checkable proof format, beginning `wheye-proof 1`.
The CLI supports only `-h` (help) and `-v` (version); source requests select
output in both the CLI and playground. There is no separate output selector.

## 7. Proof Certificates


### 7.1 Envelope and Ordering

A certificate MUST begin with the exact line `wheye-proof 1`. Subsequent blank lines and `%` comment lines
MAY appear. Comments are informative; verification uses the supplied source, not
commented rule text. Step IDs MUST be contiguous positive integers starting at 1, followed by
claims. Steps and boundary records MUST NOT appear after claims.

```text
wheye-proof 1
step 1 source 1 : human(socrates).
step 2 rule 1 [1] : mortal(socrates).
answer 1 [2]
```

### 7.2 Evidence Records

Source-fact, rule, and query IDs refer to separate lists in source order. Every recorded
atom MUST be ground. A `rule RULE [PREMISES]` step lists one earlier evidence step per
body goal, in body order; IDs may repeat. The checker matches both terms and evidence
kinds. A negative or built-in decision cannot masquerade as a positive relational
premise.

Supported step justifications are:

| Record after `step ID` | Evidence |
| --- | --- |
| `source FACT : ATOM.` | The cited ground input fact |
| `rule RULE [PREMISES] : ATOM.` | A complete source-rule application |
| `builtin : ATOM.` | A closed interpreted relation tuple, recomputed by the checker |
| `not-builtin : ATOM.` | A closed pure test which the checker requires to fail |
| `absent BOUNDARY : ATOM.` | Absence of the closed relational atom from a certified boundary |
| `aggregate OWNER POSITION BOUNDARY : ATOM.` | Recomputed source aggregate, with outer bindings and result |
| `fresh RULE POSITION : ATOM.` | A witness and its source firing context |

An aggregate owner is `r<RULE>` or `q<QUERY>`, and positions are 1-based body-goal
positions. Aggregate evidence uses synthetic predicates `$aggregate:OWNER:POSITION`;
witness evidence uses `$fresh:rRULE:POSITION`. Aggregate records have two
arguments: a proper list of `binding(Name, Value)`
entries sorted by variable name, followed by the result. The list records exactly
the outer variables already ground before the producer runs; it excludes local
producer variables and outputs bound only after collection. C1 verifies the
recorded scope against the preceding source goals. Fresh records instead carry
preceding variables in sorted name order followed by the typed witness. These
records are auxiliary evidence, not ordinary program facts.

### 7.3 Closed Boundaries

`boundary ID level LEVEL [STEPS]` lists a finite model of the completed prefix
through LEVEL. IDs MUST be contiguous from one; levels MUST be nonnegative and
unique. Source facts belong to level zero. A derived fact belongs to its source
rule's level. Negative decisions cite the maximum compatible producer level of
their ground call. Aggregate decisions cite the maximum producer level of their
source body's dependencies. Every boundary member MUST precede decisions using it.

A boundary MAY additionally contain `demand ID : GOAL.` records, immediately
following its boundary record. GOAL is an ordinary Prolog call pattern; repeated
variables retain their constraints. Calls differing only in variable spelling
share a table. Each call MUST name a demand-driven predicate in the prefix.

The checker MUST require every source fact in the prefix and closure under
every forward rule in the prefix. For every recorded demand, it MUST unify each
compatible source head with that call and require all resulting ground rule
conclusions to be present. For every rule-body prefix and every negative or
aggregate consumer, it MUST also require each needed demand-driven producer
call. Omitting a recursive call, omitting an applicable producer clause, or
omitting a derivable fact MUST fail C6. Closed calls with no applicable clause
are permitted and certify an empty answer set for that call.

These are finite checks against the supplied model and call graph. The checker
MUST NOT invoke the evaluator, activate a table, derive missing facts, or fill a
gap. Source/rule evidence establishes support; model and demand closure establish
completeness of the finite prefix required by the consumer. Infinite programs
need not have a finite complete boundary, and resource exhaustion is an error.
There are no unchecked completeness obligations.

### 7.4 Claims and Selection

An `answer QUERY [PREMISES]` claim supplies complete evidence for its source query. With
no queries, `derived STEP` instead claims a new rule conclusion. A queried program MUST
NOT use `derived` claims. Query answers are selections, never inference steps or premise
providers. Query-owned aggregate evidence MUST NOT satisfy a rule-owned aggregate goal.

For a source `why` or bare `check` request, the generator selects the preceding
ordinary query's answers, excluding goal-check queries. The library
`Run::certificate` selects all ordinary queries. The generator keeps their
transitive dependencies and complete
boundaries they require, then renumbers them. It marks dependencies iteratively and
scans retained IDs in order, so a deep proof chain does not require recursive traversal
or sorting. Boundaries can make proofs considerably larger than proofs of positive rules
alone: completeness requires all members of the relevant stratum prefix.

## 8. Verification

### 8.1 Proof Conditions

The checker implements the following C1–C9 contract:

| Condition | Requirement |
| --- | --- |
| **C1 · Resolution** | Each source step MUST equal its cited input fact. Each rule step MUST match its claimed ground head and every body goal with the correct evidence kind under one consistent substitution and MUST state exactly its instantiated head. Matching MUST bind only rule variables. |
| **C2 · Well-foundedness** | Rule premises and boundary members MUST precede the decisions that use them. A checker MUST reject cycles, self-support, and forward references. Stratum validation also forbids negative or aggregate dependency cycles. |
| **C3 · Justification** | Every record MUST have one supported justification and a ground conclusion. Relational conclusions, identical decisions, boundary levels, derived claims, and projected query answers MUST be unique. Unsupported metadata and malformed records are rejected by the reader with a C3-labelled error. |
| **C4 · Coverage** | Every referenced source fact, rule, query, owner, goal position, boundary, and cited step MUST resolve in the supplied program or certificate. Complete body and query coverage is checked by C1 and C9. |
| **C5 · Re-decision** | A checker MUST re-decide every recorded built-in tuple with closed arguments. It MUST recompute every aggregate from its source definition, grouping bindings, and certified boundary, including distinct tuple keys, types, and empty-set behavior. |
| **C6 · Boundary consistency** | Boundaries MUST contain only relational facts at or below their level, MUST include all corresponding source facts, and MUST be closed under forward rules and every demanded instance of demand-driven rules. Required producer calls MUST be closed transitively. Negative decisions MUST NOT be contradicted by the completed boundary. Negative and aggregate decisions MUST cite the exact dependency level. |
| **C7 · Relevance** | Every step and boundary MUST contribute to a claim through ordinary or required boundary dependencies. A `derived` claim MUST cite a rule conclusion absent from source facts. A query may select a supported input fact. |
| **C8 · Witness integrity** | Every fresh decision MUST name a fresh source goal and MUST carry exactly the typed witness determined by that source-rule firing. A witness from another firing MUST NOT be substituted, reused, or supplied as a source assertion. C1 checks the context when the decision is consumed. |
| **C9 · Query isolation** | Query answers MUST be selections, never inference steps. Each answer MUST match every source-query goal with the correct evidence kind and consistent bindings. Derived claims MUST NOT appear when queries are present. Query aggregate evidence MUST NOT become rule evidence. |

### 8.2 Reports and Applicability

Reports MUST list all nine conditions in order. C5 is applicable when a program uses
built-ins or aggregates; C6 when it uses negation or aggregates; C8 when the program creates witnesses or the supplied evidence contains a
witness value. Every witness occurrence must have a checked fresh source-rule
firing, including occurrences inside compounds or universal unit instances. A program without the corresponding feature reports **not applicable** with
zero checks and failures. The [voucher
example](https://github.com/eyereasoner/wheye/blob/main/examples/orders.pl) performs
nonzero successful checks under every condition.

Counts describe attempted local checks, not a count of established conclusions. C1
counts source/rule steps; C2 rule and boundary dependency lists; C3 steps, claims, and
boundaries; C4 individual references; C5 decisions; C6 boundary models and decisions; C7
steps, boundaries, and resolved derived claims; C8 fresh decisions and witness occurrences; C9 query
applications or derived-claim mode checks. Checks requiring unresolved references are
skipped, with the missing evidence reported under C4.

Semantic failures produce an **invalid** report with the condition, 1-based
step/claim/boundary location, and diagnostic. Independently decidable failures are
collected. A report is **checked** exactly when no failures remain. Invalid source
programs, unreadable certificates, resource exhaustion, and arithmetic errors during
boundary recomputation return errors. CLI and browser checking reject invalid reports;
CLI failures return status 1 and no successful stdout.

### 8.3 Checker API and Limits

Library `check` uses default limits. `check_with_limits` accepts an explicit `Limits`
value for evidence size and matching work. Both return `Result<Report, Error>`:
`Ok(report)` means checking finished, and callers MUST inspect `report.valid()` or use
`report.require_valid()` before accepting a certificate. Ordered condition reports
expose applicability and attempted/failed counts; failures expose their locations.

### 8.4 Trust Model

The checker MUST NOT call the evaluator or repair a missing model. It shares term
representation, matching primitives, and pure built-in/aggregate semantics with the
evaluator; it is not a separately implemented arithmetic or term system. Source
facts and rules remain assumptions. Acceptance establishes support for recorded claims,
including explicit closed-world tests within certified strata. It does not establish
answer completeness, source authenticity, or external-world truth. An empty certificate
passes with zero claims and establishes nothing further.


## 9. Explicit Boundaries

This subset has no cut, disjunction, procedural side effects, dynamic predicates,
meta-calls, predicate variables, improper lists, cyclic terms, N3, or Turtle
parser. Unary and binary arithmetic functions are interpreted only in numeric
contexts. Calls requiring unavailable inputs are errors. Tabling does not
promise termination for arbitrary arithmetic or term generation.

## 10. Security Considerations

Source facts and rules are assumptions. Certificate acceptance establishes recorded
claims relative to those assumptions; it does not authenticate inputs, establish
external-world truth, or guarantee answer completeness. An empty certificate
establishes no claims. Applications MUST inspect `Report::valid()` or use
`require_valid()` before accepting `Ok(report)`. Semantic failures can be
returned inside an otherwise successful checker result.

`check_with_limits` bounds evidence and finite-model work. Limits do not bound
whole-process memory or elapsed time. Host applications MAY impose process,
time, and memory limits or terminate the playground worker. Share links contain
readable program text; opening them does not automatically run it.
