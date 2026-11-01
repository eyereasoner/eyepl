# <img src="assets/eye.png" alt="" width="48" height="48" align="absmiddle"> eyepl specification

Version **0.3.10**

**Status of this document.** This document defines the eyepl language,
with the eyepl Rust reasoner as its reference implementation. It is the
normative contract for the language, evaluation, output, proof certificates,
and certificate checking. Sections 11.5–11.6 describe eyepl's CLI, library,
and browser interfaces. Statements marked *informative* explain or illustrate;
they add no requirements. eyepl's clause notation and shared numeric operations
follow the ISO Prolog reference areas identified in Section 1.5, including
Technical Corrigenda 1–3.

**Abstract.** eyepl is a relational rule language with
structural terms, proper lists, exact integers, finite binary64 reals,
stratified negation, `aggregate_all/3`, demand-driven tabling, and typed
`fresh/1` witnesses. A program's requests select its output: answers, proof
certificates, independent certificate checks, or goal checks. A certificate is a
line-oriented text document that a checker verifies against the source program
under nine conditions, C1–C9, without running the evaluator.

## Table of Contents

1. [Introduction](#1-introduction)
   1. [Scope](#11-scope)
   2. [Requirements Language](#12-requirements-language)
   3. [Terminology](#13-terminology)
   4. [Notation](#14-notation)
   5. [Conformance](#15-conformance)
2. [Program Structure](#2-program-structure)
   1. [Documents and Statements](#21-documents-and-statements)
   2. [Directives](#22-directives)
   3. [Multiple Inputs](#23-multiple-inputs)
3. [Lexical Syntax](#3-lexical-syntax)
   1. [Characters, Layout, and Comments](#31-characters-layout-and-comments)
   2. [Names and Variables](#32-names-and-variables)
   3. [Quoted Atoms and Strings](#33-quoted-atoms-and-strings)
   4. [Numbers](#34-numbers)
   5. [Symbols and the Statement Terminator](#35-symbols-and-the-statement-terminator)
   6. [Relationship to ISO Syntax](#36-relationship-to-iso-syntax)
4. [Terms](#4-terms)
   1. [Kinds of Terms](#41-kinds-of-terms)
   2. [Compounds and Lists](#42-compounds-and-lists)
   3. [Operator Syntax in Terms](#43-operator-syntax-in-terms)
   4. [Identity and Unification](#44-identity-and-unification)
   5. [Structural Limits](#45-structural-limits)
5. [Clauses, Goals, and Modes](#5-clauses-goals-and-modes)
   1. [Facts and Unit Clauses](#51-facts-and-unit-clauses)
   2. [Rules](#52-rules)
   3. [Goal Forms](#53-goal-forms)
   4. [Variable Scope](#54-variable-scope)
   5. [Binding Modes](#55-binding-modes)
   6. [Reserved Predicates](#56-reserved-predicates)
6. [Built-in Predicates](#6-built-in-predicates)
   1. [General Rules](#61-general-rules)
   2. [Control and Unification](#62-control-and-unification)
   3. [Arithmetic Evaluation and Comparison](#63-arithmetic-evaluation-and-comparison)
   4. [Lexicographic Comparison](#64-lexicographic-comparison)
   5. [Text Predicates](#65-text-predicates)
   6. [Term Construction and Decomposition](#66-term-construction-and-decomposition)
7. [Arithmetic](#7-arithmetic)
   1. [Numeric Types](#71-numeric-types)
   2. [Expressions](#72-expressions)
   3. [Operators](#73-operators)
   4. [Functions](#74-functions)
   5. [Constants](#75-constants)
   6. [Arithmetic Errors and Limits](#76-arithmetic-errors-and-limits)
8. [Negation, Aggregation, and Witnesses](#8-negation-aggregation-and-witnesses)
   1. [Stratified Negation](#81-stratified-negation)
   2. [Aggregation](#82-aggregation)
   3. [Fresh Witnesses](#83-fresh-witnesses)
9. [Semantics](#9-semantics)
   1. [Herbrand Interpretation](#91-herbrand-interpretation)
   2. [Stratified Least Model](#92-stratified-least-model)
   3. [Set Semantics](#93-set-semantics)
   4. [Termination](#94-termination)
10. [Evaluation](#10-evaluation)
    1. [Rule Classification](#101-rule-classification)
    2. [Strata and Levels](#102-strata-and-levels)
    3. [Forward Inference](#103-forward-inference)
    4. [Demand-Driven Tabling](#104-demand-driven-tabling)
    5. [Evidence Recording](#105-evidence-recording)
    6. [Resource Limits](#106-resource-limits)
11. [Requests and Output](#11-requests-and-output)
    1. [Request Forms](#111-request-forms)
    2. [The Result Document](#112-the-result-document)
    3. [Output Without Requests](#113-output-without-requests)
    4. [Term Formatting](#114-term-formatting)
    5. [Command-Line Interface](#115-command-line-interface)
    6. [Library and Browser Interfaces](#116-library-and-browser-interfaces)
12. [Proof Certificates](#12-proof-certificates)
    1. [Overview](#121-overview)
    2. [Certificate Grammar](#122-certificate-grammar)
    3. [Steps and Justifications](#123-steps-and-justifications)
    4. [Auxiliary Evidence Atoms](#124-auxiliary-evidence-atoms)
    5. [Boundaries and Demands](#125-boundaries-and-demands)
    6. [Claims](#126-claims)
    7. [Certificate Generation](#127-certificate-generation)
    8. [Example](#128-example)
13. [Verification](#13-verification)
    1. [Checking Procedure](#131-checking-procedure)
    2. [Proof Conditions](#132-proof-conditions)
    3. [Applicability](#133-applicability)
    4. [Check Counts](#134-check-counts)
    5. [Reports](#135-reports)
    6. [Checker Interface and Limits](#136-checker-interface-and-limits)
    7. [Trust Model](#137-trust-model)
14. [Explicit Exclusions](#14-explicit-exclusions)
15. [Security Considerations](#15-security-considerations)
16. [References](#16-references)

## 1. Introduction

### 1.1 Scope

*Informative.* The **eyepl** language takes a position between Datalog and
Prolog: set-valued relations and fixed-point reasoning together with
Prolog-style clause notation and structural terms. The following sections
define its behavior precisely; Section 1.5 describes compatibility and
conformance.

This specification defines:

- the source syntax of eyepl programs (Sections 2–5);
- the built-in predicates and arithmetic (Sections 6–7);
- negation, aggregation, and witnesses (Section 8);
- the declarative meaning of a program (Section 9) and how it is evaluated
  (Section 10);
- requests and their output (Section 11);
- the proof certificate format (Section 12) and its verification (Section 13).

The [guide](https://eyereasoner.github.io/eyepl/GUIDE/) describes CLI and browser
usage; it is informative.

### 1.2 Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in BCP 14 [RFC2119] [RFC8174]
when, and only when, they appear in all capitals, as shown here.

### 1.3 Terminology

Atom
: A constant name such as `socrates` or `'red-fox'`. In Section 9 only,
  *ground atom* means a ground predicate application (a proposition).

Term
: An atom, number, string, variable, compound, list, or witness (Section 4).

Ground
: Containing no variables.

Predicate indicator
: `Name/Arity`; predicates with the same name and different arity are distinct.

Ordinary predicate
: A predicate defined by source facts and rules, as opposed to a built-in
  (Section 6) or special form (Section 5.3).

Goal
: One element of a rule body, query, or goal check (Section 5.3).

Request
: A `?-` statement (Section 11.1).

Ordinary query
: A request `?- Goals.`, including the query part of `?- why(Goals).`.

Goal check
: A request `?- check(Goals).`.

Range-restricted rule
: A rule whose body binds every head variable under left-to-right mode analysis
  from no initial bindings (Section 5.5).

Mode-dependent rule
: A rule that is not range-restricted. It is evaluated with the bindings
  supplied by its calls (Section 10.4).

Mode-safe evaluation
: An evaluation in which each reached goal has the required bindings of
  Section 5.5. The runtime also accepts some partially bound structural
  operations outside these conservative modes, as specified in Section 6.

Demand-driven rule
: A rule evaluated only for calls that request it, through tables (Section 10.1).

Stratum level
: A nonnegative integer assigned to each rule (Section 10.2).

Decision
: Evidence that is not an ordinary relational fact: a built-in tuple, failed
  test, absence, aggregate result, or witness (Section 12.3).

Boundary
: A finite supplied model, closed under the forward rules and recorded
  demanded calls through a level (Section 12.5).

Certificate
: A `eyepl-proof 1` document (Section 12).

Checker
: The verifier of a certificate against a program (Section 13).

### 1.4 Notation

Grammar fragments use ABNF [RFC5234], including the case-sensitive `%s`
string notation of [RFC7405], with the core rules (`ALPHA`, `DIGIT`, `SP`, and
so on). `UPPER` is `%x41-5A`, `LOWER` is `%x61-7A`, and `ALNUM` is
`ALPHA / DIGIT`. Source keywords and certificate record names are
case-sensitive. Plain ABNF quoted strings retain RFC 5234's case-insensitive
meaning; punctuation is unaffected.

Lexical productions describe character sequences; Unicode characters are
encoded as UTF-8 in documents. The directive production in Section 2.2
describes a token sequence, with layout between tokens as defined in Section
3.1. Section 12.2 describes canonical certificate text and separately states
the reader's accepted variations. The fragments and accompanying prose
together define the syntax; they are not a standalone grammar for all terms.
Examples in `prolog` blocks are source programs; `text` blocks are output or
certificates.

### 1.5 Conformance

eyepl has set-valued relations and a stratified fixed point, structural terms,
proper lists, exact arithmetic, aggregates, mode-dependent tabled rules, and
typed witnesses. The `.pl` file extension and existing clause syntax are
retained. The eyepl reasoner implements the language directly through its
Rust evaluator and certificate checker.

Range-restricted rules do not require initial head bindings. This includes
aggregate rules: unless explicitly declared demand-driven, they run forward
even when no query calls them. A body's calls to mode-dependent rules still
need suitable inputs (Sections 5.5 and 9.2). In every range-restricted rule,
aggregate groups come only from preceding body goals. Binding a head variable
in a call MUST NOT capture a producer-local variable or turn an aggregate
result into an input. Explicit table declarations affect evaluation strategy,
not this grouping rule. Rules needing call inputs and universal unit clauses
remain mode-dependent extensions evaluated through demanded calls.

ISO Prolog is a compatibility reference for shared notation and operations,
not the definition of eyepl's evaluation semantics. The reference is
ISO/IEC 13211-1:1995 with Cor.1:2007, Cor.2:2012, and Cor.3:2017
[ISO13211-1]. Corrections in the corrigenda take precedence over the original
text. In particular, integer power follows the error condition corrected by
Corrigendum 3, ISO Section 9.3.10.3(e) (Section 7.3 below).

| Supported area | ISO clauses | eyepl contract |
| --- | --- | --- |
| Terms, variables, clauses, and lexical forms | 6.1–6.4, 7.4 | Sections 2–5 |
| Finite-term unification and non-unifiability | 8.2 | Sections 4.4 and 6.2 |
| Conjunction, `true/0`, and ground single-goal negation | 7.8, 8.15.1 | Sections 5.3, 6.2, and 8.1 |
| Term construction and decomposition with `=../2` | 8.5.3 | Section 6.6 |
| Arithmetic evaluation, comparison, and supported evaluable functors | 7.9, 8.6–8.7, 9 | Sections 6.3 and 7 |
| Atom concatenation with two bound arguments | 8.16.2 | Section 6.5 |
| Atom/character, atom/code, and number/character conversion | 8.16.4, 8.16.5, 8.16.7 | Section 6.5 |

The table identifies supported areas, with the input modes and boundaries
defined in this document. The [conformance corpus](https://github.com/eyereasoner/eyepl/tree/main/tests/conformance/)
checks selected shared cases and rejection of unsupported syntax and modes.
It does not establish coverage of every requirement in the cited clauses.

The eyepl contract includes:

- Set semantics and demand-driven tabling (Sections 9–10), with stratified
  negation, replace ISO's procedural search and repeated derivations.
- Unification always checks for cycles, lists must have proper or variable
  tails, and successful answers and evidence must be ground (Sections 4–5).
- The parser implements the lexical subset of Section 3 and a fixed operator
  table (Section 7.3). Unicode escapes are additional syntax (Section 3.6).
- Strings and witnesses are distinct term types; `[]` is distinct from the
  quoted atom `'[]'`. Lexicographic comparisons accept only two atoms or two
  strings and use UTF-16 code units (Sections 4.1–4.2 and 6.4).
- `table`, aggregates, witnesses, string predicates, and proof requests are
  additional facilities. `false/0`, infix `xor`, `gcd/2`, and the arithmetic
  constant `e` are extensions (Sections 6–8 and 11–13).
- Errors use eyepl diagnostics and API errors; ISO exception terms and
  `catch/3` are outside the language (Sections 11.5 and 14).

Full ISO processor compliance under clause 5.1, including its required
facilities and strictly conforming mode, is outside the implemented scope.
Conformance in the rest of this document refers to the eyepl contract:

A *conforming program* satisfies every source requirement in Sections 2–8.
A *conforming evaluator* parses, validates, evaluates, and renders conforming
programs as specified in Sections 9–11, and rejects nonconforming programs with
an error. A *conforming generator* produces certificates satisfying Section 12
that the checker accepts. A *conforming checker* implements Section 13.

## 2. Program Structure

### 2.1 Documents and Statements

A program document is UTF-8 text containing a sequence of statements. Each
statement ends with the terminator `.` (Section 3.5) and is one of:

| Statement | Form | Section |
| --- | --- | --- |
| Fact | `Head.` | 5.1 |
| Rule | `Head :- Body.` | 5.2 |
| Request | `?- Goals.`, `?- why.`, `?- why(Goals).`, `?- check.`, `?- check(Goals).` | 11.1 |
| Directive | `:- table Name/Arity, ... .` | 2.2 |

```prolog
human(socrates).
mortal(Person) :- human(Person).
?- mortal(Who).
?- why.
?- check.
?- check(mortal(socrates)).
```

The entire input MUST be parsed and validated before evaluation begins.
Facts and rules are available throughout the input: a request MAY use facts
and rules that appear after it. Source order assigns fact, rule, and query
numbers and therefore also affects witness identities (Section 8.3), evidence
selection, and output order. Request order determines output order
(Section 11.2). Requests select output; they MUST NOT become inference
evidence.

### 2.2 Directives

The only directive is `table`:

```abnf
table-directive = ":-" %s"table" indicator *( "," indicator ) "."
indicator       = atom-name "/" 1*DIGIT
```

`atom-name` is an unquoted or quoted atom (Section 3). The arity MUST NOT
exceed 64. A `table` declaration makes every rule of the declared predicate
demand-driven (Section 10.1), wherever the declaration appears; ground source
facts are still loaded unconditionally. Declaring a predicate without clauses
has no effect. Any other directive MUST be rejected
with an error.

*Informative:* declarations are unnecessary for clauses that already need call
inputs, but they prevent eager enumeration by rules that would otherwise be
evaluated forward, such as recursive list constructors.

### 2.3 Multiple Inputs

Several documents MAY form one program. Each document MUST be parsed and
validated on its own, and the documents are then merged in the given order:
facts, rules, queries, and requests are concatenated, and table declarations
are united. The merged program MUST be validated again before evaluation.
Source fact, rule, and query numbers (Section 12.3) count across the merged
sequence. Variable scopes never cross statements (Section 5.4).

## 3. Lexical Syntax

### 3.1 Characters, Layout, and Comments

Whitespace (Unicode `White_Space` [UNICODE]) separates tokens. A `%` outside a
quoted value starts a line comment that ends at the next line feed. `/*` outside a
quoted value starts a block comment that ends at the first following `*/`;
block comments do not nest, and an unterminated block comment MUST be an error.
Comment markers inside quoted values are literal content.

Where a diagnostic reports a source line, comments and multiline terms or
quoted values MUST NOT shift it.

### 3.2 Names and Variables

```abnf
atom-name     = LOWER *( ALNUM / "_" ) / quoted-atom
variable      = ( UPPER / "_" ) *( ALNUM / "_" )
```

Unquoted names and variables are ASCII only; other characters require quotes.
Names are case-sensitive. The variable `_` is anonymous: every occurrence is a
distinct fresh variable. Other names that begin with `_` are ordinary,
shared variables that are omitted from displayed answers (Section 11.2).

### 3.3 Quoted Atoms and Strings

```abnf
quoted-atom = "'" *( q-char / "''" / escape / DQUOTE ) "'"
string      = DQUOTE *( s-char / 2DQUOTE / escape / "'" ) DQUOTE
escape      = "\" ( %s"n" / %s"r" / %s"t" / %s"b" / %s"f" / "\" / "'" / DQUOTE )
            / %s"\u" 4HEXDIG
            / %s"\U" 8HEXDIG
```

`q-char` and `s-char` are any Unicode scalar values other than the delimiter
and `\`, including line feeds. Single quotes delimit atoms and double quotes delimit
strings; atoms and strings are distinct kinds of terms. Inside a quoted value,
a doubled delimiter denotes one delimiter character. The escapes denote line
feed, carriage return, tab, backspace, form feed, backslash, single quote, and
double quote, and `\uXXXX` / `\UXXXXXXXX` denote the Unicode scalar value with
that hexadecimal code. A `\u` high surrogate MUST be followed immediately by a
`\u` low surrogate, and the pair denotes one supplementary character. Any other
escape, an unpaired or invalid surrogate, or a code that is not a Unicode scalar
value MUST be an error. An unterminated quoted value MUST be an error.

A quoted atom whose content matches the unquoted form denotes the same atom:
`socrates` and `'socrates'` are identical.

### 3.4 Numbers

```abnf
number   = 1*DIGIT [ "." 1*DIGIT ] [ exponent ]
exponent = ( %s"e" / %s"E" ) [ "+" / "-" ] 1*DIGIT
```

A number with a fraction or exponent is a real. Otherwise it is an integer.
Both sides of the decimal point require digits: `1.` followed by layout ends a
statement, and `.5` is not a number. An `e` without exponent digits MUST be an
error. A sign is not part of the token; Section 4.3 defines how a leading sign
applies to a numeric literal. Section 7.1 defines the values.

### 3.5 Symbols and the Statement Terminator

Outside quoted values, the only punctuation and operator tokens are:

```text
( ) [ ] | , . ~
+ - * / ^ \ = < >
=\= =:= @=< @>= =.. :- ?- \+ \= =< >= @< @> // ** << >> \/ /\
```

The longest listed token matches first. Any other character, such as `;`, `!`,
`{`, or `:` alone, MUST be rejected with an error. The terminator `.` MUST be
followed by whitespace, `%`, `/*`, or the end of input.

The names `is`, `xor`, `div`, `rem`, and `mod` are atom tokens that act as
operators in operator position (Sections 4.3 and 5.3).

### 3.6 Relationship to ISO Syntax

These lexical forms and the operator table in Section 7.3 define the parser
contract. Test cases shared with ISO Prolog cover selected inputs; they do not
establish ISO lexical conformance. The `\uXXXX` and `\UXXXXXXXX` escapes are
extensions beyond ISO/IEC 13211-1:1995 and Corrigenda 1–3; the [WG17 syntax
comparison](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing#312)
records this distinction.

## 4. Terms

### 4.1 Kinds of Terms

| Kind | Examples | Notes |
| --- | --- | --- |
| Atom | `socrates`, `'Élodie'`, `'7'` | Section 3.2 |
| Integer | `0`, `-42`, `123456789012345678901234567890` | Exact, unbounded (Section 7.1) |
| Real | `2.5`, `1.0e-3` | Finite binary64 (Section 7.1) |
| String | `"text"` | Distinct from atoms |
| Variable | `X`, `_Total`, `_` | Section 3.2 |
| Compound | `point(2, 3)` | Section 4.2 |
| List | `[]`, `[a, b]`, `[H \| T]` | Section 4.2 |
| Witness | `~"identity"` | Certificates only (Section 8.3) |

Integers, reals, atoms, and strings are disjoint: `1`, `1.0`, `'1'`, and `"1"`
are four different terms. Implementations MUST NOT silently coerce one kind to
another.

### 4.2 Compounds and Lists

A compound has an atom functor and 1 to 64 arguments: `name(Arg, ...)`. There
is no zero-argument compound syntax; an arity-zero predicate or constant is a
bare atom. Compounds construct data; a compound never calls or evaluates
anything except where Sections 6–7 interpret it.

The empty list `[]` is a distinct constant, not the atom `'[]'`. A nonempty
list is the compound `'.'(Head, Tail)`, written `[Head | Tail]`; `[a, b]`
abbreviates `[a | [b | []]]`. Every list tail MUST be a list or a variable,
whether written with brackets or with `'.'/2`; improper lists such as
`[a | b]` MUST be rejected, at parse time for source terms and as an error when
a built-in would construct one.

### 4.3 Operator Syntax in Terms

The arithmetic operators of Section 7.3 MAY appear in any term, including fact
arguments, and build ordinary compounds: `p(1 + 2)` has the argument
`'+'(1, 2)`, which is evaluated only by `is/2` or a numeric comparison.

A prefix `-` applied directly to a numeric literal produces a number:
`-3` and `- 3` are the integer −3. Applied to other terms, prefix `-` builds
`'-'(T)`. Prefix `+` and `\` build the compounds `'+'(T)` and `'\'(T)`,
including for numeric operands: `+2.5` is a compound that evaluates to `2.5`
in an arithmetic context. Parentheses group terms. The comparison operators of Section 5.3
are not term operators; they appear only at goal level.

### 4.4 Identity and Unification

Ground terms are equal exactly when they have the same kind and structure:
the same atom name, string content, numeric value of the same type, or functor,
arity, and pairwise-equal arguments. Real zero is normalized, so `-0.0` and
`0.0` are the same term.

Unification is syntactic and MUST perform the occurs check: binding a variable
to a term that contains it fails. Cyclic terms MUST NOT be created.
Arithmetic, numeric type conversion, and Unicode normalization never occur
during unification.

### 4.5 Structural Limits

| Limit | Value | Applies to |
| --- | --- | --- |
| Source arguments | 64 | Compounds, source predicate applications, table arities |
| Goals | 64 | Each rule body, query, goal check, and aggregate body, after group flattening |
| Source nesting | 256 | Parser nesting of source terms |

Exceeding a source limit MUST be an error. Source nesting is not a semantic
limit on terms built during evaluation. Certificate term parsing uses an
explicit stack and MUST accept generated terms deeper than 256. Ordinary
compound terms retain the 64-argument limit; the outer argument count of a
`$fresh` evidence atom instead follows its source-rule context (Section 12.4)
and MAY exceed 64. Parsing remains subject to available resources.

## 5. Clauses, Goals, and Modes

### 5.1 Facts and Unit Clauses

A statement `Head.` whose head is ground is a *source fact*. A head that
contains variables, such as `append([], List, List).`, is a *unit clause*: a
rule with an empty body that is always demand-driven (Section 10.1). A call to a
unit clause MUST supply enough bindings for the instantiated head to be ground
(Section 9.3). Arithmetic syntax in a fact is not evaluated (Section 4.3).
Source facts MUST NOT contain witnesses.

### 5.2 Rules

A rule has the form `Head :- Goal1, ..., GoalN.` with 1 to 64 goals. The head
is an atom or compound naming an ordinary predicate (Section 5.6). Goals are
separated by `,` and MAY be grouped by parentheses; groups are flattened into
the enclosing conjunction. A parenthesized expression followed by a comparison
or arithmetic operator, as in `(A + B) > C`, is an expression, not a group.
Several clauses for one predicate provide alternative derivations. There is no
separate syntax for forward rules or aggregate rules.

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

### 5.3 Goal Forms

| Form | Meaning | Section |
| --- | --- | --- |
| `p(T1, ..., Tn)` or `p` | Call of an ordinary predicate | 9 |
| Built-in call, such as `string_length(S, N)` | Interpreted relation | 6 |
| `Left Op Right` | Built-in comparison or unification, with `Op` one of `is = \= < =< > >= =:= =\= @< @=< @> @>= =..` | 6 |
| `\+ Goal`, `\+ (Goal)` | Negation of one ordinary goal or built-in test | 8.1 |
| `aggregate_all(Template, Goal, Result)` | Aggregation over a goal or a parenthesized conjunction | 8.2 |
| `fresh(Witness)` | Typed witness creation | 8.3 |

An infix comparison has lower precedence than every arithmetic operator, is
non-associative, and occurs once per goal: `X is A + B * C` compares `X` with
the whole expression. `\+ X = Y` means `\+ (X = Y)`. Other syntax, such as
disjunction, if-then-else, cut, or a variable as a goal, MUST be rejected
(Section 14).

### 5.4 Variable Scope

A variable's outer scope is one clause or request, including a goal check.
Repeated occurrences of a named variable in that scope denote the same term.
Within an aggregate's producer and template, names without permitted outer
bindings are local to that aggregate (Section 8.2). Reusing such a name in the
head or a later goal does not export a producer binding. The aggregate's
`Result` belongs to the outer scope.

### 5.5 Binding Modes

Goals run from left to right. *Mode analysis* conservatively tracks which
variables are available before each goal when classifying rules:

| Goal | Required before the goal | Binds |
| --- | --- | --- |
| Ordinary call | nothing | all its variables |
| `true`, `false` | nothing | nothing |
| `X \= Y` | every variable | nothing |
| `X = Y`, `T =.. L`, `atom_chars(A, L)`, `atom_codes(A, L)`, `number_chars(N, L)`, `string_codes(S, L)` | either argument fully bound | all variables |
| `X is E` | `E` fully bound | all variables |
| `atom_concat(A, B, C)` | any two of `A`, `B`, and `C` | all variables |
| `string_concat(A, B, C)` | `A` and `B` | all variables |
| `string_length(S, N)` | `S` | all variables |
| Numeric and lexicographic comparisons, `contains_text/2` | every variable | nothing new |
| `\+ Goal` | every variable of `Goal` | nothing |
| `aggregate_all(T, G, R)` | `G` must bind every variable of `T` | variables of `R` |
| `fresh(W)` | `W` is a variable not yet bound | `W` |

Mode analysis classifies rules (Section 10.1). It is conservative for
structural operations: `=/2` and `=../2` also support some partially bound
inputs, and `\=/2` can fail on unbound operands (Section 6.2). Operations that
require ground inputs MUST raise an error when those inputs are unavailable.
A query or goal check is validated with all its variables treated as available,
so its mode requirements are enforced when its goals run. The placement of `fresh/1`
and the form of aggregate templates are checked when the program is loaded.

### 5.6 Reserved Predicates

Facts and rule heads MUST NOT define a built-in predicate of Section 6 or the
names `aggregate_all`, `fresh`, `why`, or `check` at any arity. Source goals,
facts, and heads MUST NOT name a predicate that begins with `$`; such names
belong to generated relations (Sections 8.3 and 12.4). Every other predicate
indicator is ordinary and has no implicit definition: a call to an ordinary
predicate without facts or rules has no solutions.

## 6. Built-in Predicates

### 6.1 General Rules

Built-ins MAY appear in rule bodies, queries, goal checks, and aggregate
bodies. They have no side effects and are deterministic. A failed test produces
no solution. A type error, unbound required input, invalid conversion, or
arithmetic error MUST raise an error rather than fail. After a built-in
succeeds, every resulting argument MUST be a valid term (Section 4); producing
an improper list or invalid number MUST raise an error.

The complete set of built-in predicates is:
`true/0`, `false/0`, `=/2`, `\=/2`, `is/2`, `</2`, `=</2`, `>/2`, `>=/2`,
`=:=/2`, `=\=/2`, `@</2`, `@=</2`, `@>/2`, `@>=/2`, `=../2`, `atom_chars/2`,
`atom_codes/2`, `atom_concat/3`, `number_chars/2`, `string_codes/2`,
`string_concat/3`, `string_length/2`, and `contains_text/2`.
`aggregate_all/3` and `fresh/1` are special forms (Section 8).

### 6.2 Control and Unification

| Predicate | Behavior |
| --- | --- |
| `true/0` | Succeeds without bindings. |
| `false/0` | Fails. (How a query without answers is recorded is defined in Section 11.2.) |
| `Left = Right` | Unifies the operands (Section 4.4). Either operand MAY contain variables. |
| `Left \= Right` | Succeeds when the operands do not unify with the current bindings; trial bindings are discarded. It does not constrain later bindings: `X \= a` fails while `X` is unbound. |

### 6.3 Arithmetic Evaluation and Comparison

| Predicate | Behavior |
| --- | --- |
| `Value is Expression` | Evaluates `Expression` (Section 7) and unifies the result with `Value`. A bound `Value` must have the same numeric type and value: `1 is 1.0` fails. |
| `A < B`, `A =< B`, `A > B`, `A >= B` | Evaluate both operands and compare numerically. |
| `A =:= B`, `A =\= B` | Numeric equality and inequality: `1 =:= 1.0` succeeds. |

Comparisons between an integer and a real MUST use the integer's exact value
(Section 7.1).

### 6.4 Lexicographic Comparison

`@<`, `@=<`, `@>`, and `@>=` compare two bound atoms or two bound strings by
their UTF-16 code unit sequences. They are not locale collation and not a
standard order of terms; any other operand types MUST raise an error.

### 6.5 Text Predicates

| Predicate | Behavior |
| --- | --- |
| `atom_chars(Atom, Chars)` | Relates an atom to its list of one-character atoms. |
| `atom_codes(Atom, Codes)` | Relates an atom to its list of Unicode scalar values. |
| `atom_concat(A, B, C)` | Relates atoms with `C` the concatenation of `A` and `B`. With `A` and `B` bound it concatenates them; with `C` and one of `A` or `B` bound it removes that prefix or suffix from `C`, failing when `C` lacks it. A bound argument that is not an atom MUST raise an error. ISO's mode that enumerates the splits of `C` alone is not supported. |
| `number_chars(Number, Chars)` | Relates a number to the one-character atoms that spell it. A bound list is read as one number token (Section 3), after optional leading layout and a minus sign; a list that spells no number fails, where ISO raises a syntax error, so a rule can pass over text that is not numeric. Otherwise the number is written as in Section 11.4. |
| `string_codes(String, Codes)` | Relates a string to its list of Unicode scalar values. |
| `string_concat(A, B, C)` | Concatenates bound strings `A` and `B` and unifies the result with `C`. |
| `string_length(S, N)` | Unifies `N` with the number of Unicode scalar values in bound string `S`. |
| `contains_text(Text, Part)` | Lowercases two bound strings with Unicode default lowercase mapping and succeeds when `Part` is a literal substring of `Text`. An empty `Part` succeeds. |

For `atom_codes/2` and `string_codes/2`:

- If the first argument is bound, it MUST be an atom (respectively a string);
  its code list is unified with the second argument, which MAY contain
  variables.
- If the first argument is a variable, the second MUST be a ground proper list
  of integers in 0–1114111 excluding the surrogates 55296–57343; the decoded
  text is unified with the first argument.
- Each character, including a supplementary character, occupies one code; empty
  text corresponds to `[]`.
- Invalid inputs, a wrongly typed first argument, or neither input supplied
  MUST raise an error. A valid conversion that does not unify fails.

No text predicate performs Unicode normalization, and none coerces atoms to
strings or the reverse.

Unicode whitespace properties and lowercase mappings come from the Rust
standard library used to build the evaluator and checker. Its Unicode data
version is identified by `char::UNICODE_VERSION`; it can change with the
toolchain. Rechecking a certificate whose decisions depend on such mappings
requires matching Unicode data. [UNICODE] supplies the versioned reference
for the currently tested data, rather than a link to a moving latest version.

### 6.6 Term Construction and Decomposition

`Term =.. Parts` relates a term to its parts without calling or evaluating it.

Decomposition, when `Term` is not a variable:

| `Term` | `Parts` |
| --- | --- |
| Compound `f(A1, ..., An)` | `[f, A1, ..., An]` |
| Nonempty list `[H \| T]` | `['.', H, T]` |
| Atom, number, string, or `[]` | `[Term]` |

Construction, when `Term` is a variable: `Parts` MUST be a nonempty proper
list. A singleton MUST contain a bound atom, number, string, or `[]`; a longer
list MUST begin with an atom, which becomes the functor of the remaining
elements. Arguments MAY contain variables that later goals bind. Constructing
`'.'/2` MUST obey the list-tail rule of Section 4.2. Missing inputs or invalid
parts MUST raise an error; incompatible results fail by unification.

## 7. Arithmetic

### 7.1 Numeric Types

Integers are exact and unbounded, limited only by available resources and by
Section 7.6. Reals are IEEE 754 binary64 values [IEEE754] that MUST be finite; `-0.0` is
normalized to `0.0`. Integer and real results remain distinct terms.

Addition, subtraction, and multiplication of two integers MUST be exact. When
an operation combines an integer with a real, the integer is converted to
binary64, and the conversion MUST be finite. Numeric comparisons and `min`/`max`
MUST compare an integer with a real exactly, without first rounding the integer.
Atoms, strings, lists, and other non-numeric terms MUST NOT be coerced to
numbers.

### 7.2 Expressions

An arithmetic expression is a number, a bound variable whose value is an
expression, one of the constants `pi` and `e`, or a compound naming an operator
or function below whose arguments are expressions. Expressions are evaluated
only by `is/2`, the numeric comparisons, and the `sum`, `min`, and `max`
aggregates (Section 8.2). Elsewhere they remain ordinary terms.

### 7.3 Operators

This table is exhaustive. Rows run from lower to higher precedence; operators
in one row share precedence. Parentheses override precedence.

| Binary operators | Associativity | Meaning |
| --- | --- | --- |
| `+`, `-`, `\/`, `/\`, `xor` | left | Addition, subtraction, integer bitwise OR, AND, XOR |
| `*`, `/`, `//`, `div`, `rem`, `mod`, `<<`, `>>` | left | Multiplication, real division, truncating quotient, flooring quotient, truncating remainder, flooring remainder, integer shifts |
| `**`, `^` | `**` none; `^` right | Real power; integer-preserving power |

The supported ISO operators follow the priorities and specifiers of
ISO Section 6.3.4.4, including Corrigendum 2's unary `+` and `div`. Infix `xor`
is an extension at the priority of `+`. Prefix `+`, `-`, and `\` (integer
bitwise complement), `**`, and `^` share ISO priority 200. Prefix operands
and the right operand of `^` MAY include another operator at that priority;
both operands of `**` and the left operand of `^` require a tighter term or
parentheses. Thus `-2^2` evaluates to `-4`, and `2 ^ 3 ** 2` means
`2 ^ (3 ** 2)`. Unparenthesized `2 ** 3 ** 2` and `2 ** 3 ^ 2` MUST be
rejected. A negative numeric literal is a term of priority 0.

Result types and rules:

- `+`, `-`, `*`: integer for two integers, otherwise real. Unary `+` and `-`
  preserve the operand's type.
- `/` and `**` always produce reals.
- `^` with two integers produces an exact integer for a nonnegative exponent
  (`0 ^ 0` is `1`). For a negative integer exponent, bases `1` and `-1` still
  produce integers; base `0` is a domain error, and every other integer base
  requires a real instead and MUST raise a type error, following Corrigendum
  3, ISO Section 9.3.10.3(e). Use `2.0 ^ (-1)` for the real result `0.5`.
  If either operand is real, `^` produces a real.
- A negative base in `**` requires an integer exponent. In `^`, a real
  exponent with an integer value is also permitted. A zero base with a
  negative exponent, or a nonzero power that underflows to zero, MUST raise an
  error.
- `//`, `div`, `rem`, `mod`, and the bit operators require integers and reject
  reals, even integral reals such as `3.0`. `//` truncates toward zero and
  `div` floors. `rem` takes the sign of the dividend and `mod` the sign of the
  divisor: with `-7` and `3` the four results are `-2`, `-3`, `-1`, and `2`.
- Bit operations use unbounded two's-complement semantics. Shift counts MUST be
  nonnegative, and `>>` preserves the sign.
- Division or remainder by zero, whether integer or real, MUST raise an error.

### 7.4 Functions

This table is exhaustive. Functions use ordinary call syntax inside
expressions, such as `sqrt(9)` and `min(A, B)`.

| Function | Result |
| --- | --- |
| `abs(X)` | Absolute value, same type as `X` |
| `sign(X)` | `-1`, `0`, or `1`, with the same numeric type as `X` |
| `min(X, Y)`, `max(X, Y)` | The smaller or larger operand, unchanged in type and value; the first operand on numeric equality |
| `sqrt(X)` | Real square root; `X` nonnegative |
| `exp(X)`, `log(X)` | Real exponential; real natural logarithm of positive `X` |
| `sin(X)`, `cos(X)`, `tan(X)` | Real trigonometric functions of radians |
| `asin(X)`, `acos(X)` | Real inverses for `X` in [−1, 1], with results in [−π/2, π/2] and [0, π] |
| `atan(X)` | Real inverse tangent in [−π/2, π/2] |
| `atan2(Y, X)` | Real angle of the point (`X`, `Y`) in [−π, π]; two zero arguments are a domain error |
| `float(X)` | Convert an integer to a real, or preserve a real |
| `floor(X)`, `ceiling(X)` | Integer rounded toward −∞ or +∞ |
| `round(X)` | Integer nearest to `X`, halfway cases toward +∞ |
| `truncate(X)` | Integer rounded toward zero |
| `float_integer_part(X)` | Real integral part, truncated toward zero |
| `float_fractional_part(X)` | Real `X` minus its truncated integral part |
| `gcd(X, Y)` | Nonnegative integer greatest common divisor; `gcd(0, 0)` is `0` |
| `xor(X, Y)` | Same as the infix `xor` operator |

`floor`, `ceiling`, `round`, `truncate`, `float_integer_part`, and
`float_fractional_part` require a real argument; an integer argument MUST raise
a type error under ISO Section 7.9.2 as corrected by Corrigenda 1–2. Use `float(X)` for
explicit conversion. For example, `round(-2.5)` is `-2` and `sign(-2.5)` is
`-1.0`.
Transcendental functions return binary64 approximations whose last bit MAY
differ between platforms. C5 compares the recorded result exactly, so a
certificate containing these results can require the same arithmetic
implementation to pass checking on another platform.

### 7.5 Constants

Inside an evaluated expression, `pi` is `3.141592653589793` and `e` is
`2.718281828459045` (binary64). Elsewhere they are ordinary atoms.

### 7.6 Arithmetic Errors and Limits

The following MUST raise an error, naming the problem:

- an unbound variable in an evaluated expression;
- a non-numeric operand, or a real where an integer is required;
- an unsupported operator or function, reported with its name and arity;
- division or remainder by zero;
- a domain error, such as `sqrt(-1)` or `log(0)`, or any other non-finite real
  result, including overflow;
- an integer too large to convert to a finite binary64 value;
- a nonnegative exponent above 1,000,000 in the two-integer `^` operation, or a
  shift count above 1,000,000. This exponent cap does not apply to real power;
  real conversion, domain, and overflow checks still apply there.

## 8. Negation, Aggregation, and Witnesses

### 8.1 Stratified Negation

`\+ Goal` succeeds when `Goal` has no solution once the producers of `Goal`
have completed. `Goal` is one ordinary call or one built-in test; it MUST be
ground when reached, and negation MUST NOT introduce bindings. Negated
conjunctions, nested negation, and negated aggregates or witnesses MUST be
rejected; define a helper predicate instead.

Programs MUST be stratified: no dependency cycle may pass through a negated
goal or an aggregate goal (Section 10.2). A cycle through negation or
aggregation MUST be rejected when the program is loaded.

Absence means only that the completed program has no evidence for the goal. It
is not a claim about the world.

### 8.2 Aggregation

```prolog
?- aggregate_all(count, mortal(Person), Count).
?- aggregate_all(sum(Value), score(Person, Value), Total).
?- aggregate_all(min(Value), score(Person, Value), Minimum).
?- aggregate_all(max(Value), score(Person, Value), Maximum).
?- aggregate_all(list(result(Person, Value)), score(Person, Value), Results).
```

`aggregate_all(Template, Producer, Result)` MAY appear in rule bodies,
queries, goal checks, and other aggregate bodies. `Template` is `count`,
`sum(V)`, `min(V)`, `max(V)`, or `list(T)`. `Producer` is one goal or a
parenthesized conjunction. It MAY contain negation and nested aggregates, but
not `fresh/1`.

Scope:

- Variables bound before the aggregate are *outer bindings*. They constrain the
  producer and form the aggregate's group.
- Other producer variables are local and MUST NOT escape into the caller.
- Every variable of `Template` MUST have an outer binding or be bound by
  `Producer`.
- `Result` is unified with the computed value after collection. A bound or
  partially bound `Result` constrains the answer, but it MUST NOT bind producer
  variables or filter the producer before collection.
- Variables produced by a rule's aggregate results MUST NOT become group
  inputs merely because its caller binds the head. A preceding body goal MAY
  establish such a variable as a genuine outer binding. This also applies to
  mode-dependent rules and to nested aggregates.
- In a range-restricted rule, a call's head bindings MUST NOT introduce outer
  bindings at an aggregate. Only preceding goals establish its group, including
  when the predicate is explicitly tabled. For example,
  `total(X,N) :- aggregate_all(count,p(X),N), q(X).` counts all `p` tuples
  before selecting `X` through `q`; calling `total(a,N)` does not change the
  count. A rule requiring call inputs MAY use those inputs as outer bindings.

Computation:

1. All producers of the aggregate's goals MUST complete first (Section 10.2).
2. The solutions are the *distinct tuples* of all producer variables.
   Repeated facts and alternative proof paths add nothing. Equal template
   values from distinct tuples count separately.
3. `count` yields the integer number of tuples.
4. `sum`, `min`, and `max` evaluate the template value of each tuple
   arithmetically (Section 7). An empty sum yields the integer `0`. Integer sums
   are exact, and mixing in a real follows Section 7.1. `min` and `max`
   compare numerically, and on an empty set the aggregate fails.
5. `list(T)` collects one ground instance of `T` per tuple, without
   evaluation. An empty set yields `[]`. Element order is unspecified.

A producer that lacks required bindings MUST raise an error.

*Informative:* unlike `findall/3`, `list` does not collect nonground answers
or repeated derivations.

### 8.3 Fresh Witnesses

```prolog
ticket(Person, Witness) :- registered(Person), fresh(Witness).
```

`fresh(W)` MUST be the final goal of a range-restricted rule, and `W` MUST be a
variable not bound by earlier goals. It MUST NOT occur in queries, goal checks,
or aggregate bodies. It binds `W` to a *witness*, an opaque typed value
distinct from atoms, strings, and numbers.

Witness introduction is *lean*. The head's variables other than `W` form the
rule's *frontier*. When the preceding goals bind the frontier, the rule
concludes its head only when no fact of a completed lower stratum already
matches the head with any value in place of `W`, and it creates one witness
per frontier assignment. Premise substitutions that differ only outside the
frontier therefore share one witness, and no fresh value is created where a
known one already fits. This is the restricted introduction of
[Stratified Negation in RDF Rules](https://arxiv.org/abs/2607.28778), with
the precedence approximated by eyepl's strata.

The parser states this with ordinary rules. Rule `H :- B, fresh(W).` with
frontier `F` (its variables in increasing name order) becomes the following,
where `K` numbers the document's witness rules from 1:

```prolog
H :- '$lean:K'(F), fresh(W).
'$satisfied:K'(F) :- H.
'$lean:K'(F) :- B, \+ '$satisfied:K'(F).
```

The first rule keeps the source rule's number, and the two helpers follow the
document's other rules, so the helpers appear in certificates and their
decisions are checked like any other: the satisfaction test is an ordinary
absence (C6). Its producers are the rules compatible with `H` other than the
rule reading `'$lean:K'`. That rule's conclusions are later evidence, not
inputs to the test: they create no dependency edge to `'$satisfied:K'`
(Section 10.2), and the test matches only facts of its own or lower strata,
in evaluation and in boundary closure (Section 12.5). Every other producer of
`H` MUST therefore lie in a lower stratum; a program in which another producer
depends on the witness rule's conclusions has a cycle through the negation
and is rejected. A rule whose `fresh/1` goal is misplaced or whose frontier
the preceding goals do not bind is not rewritten, so loading reports it.

A witness's identity is determined by the rule number, the goal position, and
the substitution of the variables bound by the preceding goals, which after
the rewriting are exactly the frontier. If the same firing repeats, the
identity is reused. Different firings never share an identity. Other rules MAY
carry witnesses as ordinary values. Source programs MUST NOT contain witness
constants.

The firing substitution contains the fully resolved values of preceding body
variables, including nested structural bindings. Call-variable aliases and
head bindings not established by those goals MUST NOT enter the identity.
This applies to forward and explicitly tabled rules alike. C8 and boundary
closure MUST recompute witnesses from the same source-prefix context.

*Informative:* with `teacher(c, t). participant(c, p).`, the rules
`examiner(C, T) :- teacher(C, T), \+ student(T).` and
`examiner(C, E) :- participant(C, P), fresh(E).` give course `c` no fresh
examiner, because `examiner(c, t)` is derived in a lower stratum. See
[`examples/examiners.pl`](https://github.com/eyereasoner/eyepl/blob/main/examples/examiners.pl).

Witnesses are written `~"identity"` in certificates. Result documents give
each witness a short label instead (Section 11.4) and record its identity with
`proof_witness`. The identity
spelling is implementation-defined. A conforming checker recomputes it rather
than interpreting it (Section 13.2, C8). *Informative:* this implementation
spells it `r<RULE>:g<POSITION>:<substitution>`.

## 9. Semantics

### 9.1 Herbrand Interpretation

Ordinary predicates have Herbrand semantics [HERBRAND]. Built-ins have the
fixed interpretations of Sections 6–7. Ground terms denote themselves: distinct
ground terms (Section 4.4) are distinct values. Asserting a relation between two
terms does not make them identical.

The *Herbrand universe* is the set of finite ground terms built from the
language's atoms, supported numeric values, strings, `[]`, compounds, and
witnesses generated by rule firings. It includes values produced by arithmetic
and term or text construction, even when they do not occur literally in the
source: `p(X) :- X is 1 + 2.` can derive `p(3)`. The *Herbrand base* is
the set of ordinary predicate applications to such terms, called ground atoms.
A Herbrand interpretation is a subset of the base.

### 9.2 Stratified Least Model

Outer clause variables are universally quantified. Aggregate-local variables
belong to the producer's scope (Section 8.2), not to the enclosing clause's
ground substitution. In the range-restricted, mode-safe fragment, if a ground
instance of a rule body holds, its head holds. Without negation or aggregation,
the meaning is the least Herbrand model: the smallest set of ground atoms that
contains the source facts and is closed under the rules, with built-ins and
witness generation interpreted as specified.

With negation and aggregation, the strata of Section 10.2 are interpreted in
increasing order. Each stratum's least model is computed with the completed
models of lower strata fixed. A negated goal holds when its instance is absent
from those completed models. An aggregate is computed over them.

For that fragment, an ordinary query's answers are the distinct projections of
the ground substitutions that make all its goals true in this model, subject
to the mode requirements of Section 5.5 and successful completion.

Mode-dependent rules and universal unit clauses are operational extensions.
Their evaluation is defined by the calls and bindings of Section 10.4; the
evaluator does not enumerate all of their ground instances. In particular,
`\=/2` tests current bindings, so insufficient bindings can make a call fail
without an error. With `q(b). p(X) :- X \= a, q(X).`, a run asking only
`p(X)` returns no answers, while a separate run asking `p(b)` succeeds. A
forward rule that calls a mode-dependent rule can inherit this restriction.
The unrestricted least-model reading alone therefore does not specify the
answers of every accepted eyepl program.

*Informative:* given `human(socrates).` and `mortal(P) :- human(P).`, the model
contains `human(socrates)` and `mortal(socrates)`. `1 + 2` is a compound in an
ordinary argument, while `X is 1 + 2` binds `X` to `3`.

### 9.3 Set Semantics

Facts and answers are sets. Each distinct ground tuple MUST be stored at most
once, however many derivations it has. Every materialized rule conclusion and
every displayed answer MUST be ground. A rule or query whose evaluation would
leave a head or answer variable unbound MUST raise an error.

### 9.4 Termination

Positive recursion reaches its fixed point when the generated facts, normalized
calls, and work are finite, every call supplies its required inputs, and the
resource limits permit completion. For completed positive evaluations, clause
order MUST NOT change the answer set for mode-safe programs without fresh
witnesses. Reordering witness-generating rules changes their source numbers
and can therefore change witness spellings. No semantic depth limit is defined.

A finite least model alone does not guarantee termination. For example,
`:- table p/1. p(X) :- p(f(X)). ?- p(a).` has an empty least model but demands
`p(a)`, `p(f(a))`, and ever deeper calls. Arithmetic and term construction can
also generate infinitely many facts. Tabling MUST NOT be described as
guaranteeing termination for arbitrary programs. Section 10.6 bounds counted
work instead.

## 10. Evaluation

This section specifies the evaluation strategy that determines the evidence
recorded in certificates.

eyepl combines **forward chaining** (bottom-up evaluation of forward rules)
with **tabled backward chaining** (call-driven evaluation of demand-driven
rules). Both strategies share ordinary facts and follow the same strata.
Backward calls share answers through tables and resume waiting consumers as
answers arrive. Sections 10.1–10.4 define their classification and scheduling.

### 10.1 Rule Classification

A rule is *demand-driven* if any of the following holds:

- it is not range-restricted (Section 1.3);
- its predicate is declared in a `table` directive;
- it has an empty body (a unit clause).

Otherwise it is *forward*. Facts are loaded first. Forward rules are evaluated
bottom-up. Demand-driven rules are evaluated only for the calls that request
them, and every such call is tabled.

An aggregate alone does not make a rule demand-driven. A range-restricted
aggregate rule participates in forward closure, including in programs without
requests. The checker applies the same classification to boundary obligations.

### 10.2 Strata and Levels

*Compatibility.* A goal is compatible with a rule head of the same predicate
indicator unless, at some argument position, both have different atomic
constants (atoms, numbers, strings, or `[]`). Compound arguments do not rule
out compatibility. This analysis MAY be conservative.

*Dependency graph.* There is an edge from rule *P* to rule *C* for each goal of
*C* compatible with *P*'s head. The edge is *strict* when the goal is negated or
is inside an aggregate producer, including nested ones, and *positive*
otherwise. Built-in goals create no edges, and a witness rule creates no edge
to its own satisfaction test (Section 8.3). A strongly connected component that
contains a strict edge MUST be rejected (Section 8.1).

*Levels.* Source facts have level 0. A rule's level is the least value such
that:

- it is at least the level of every positive producer;
- it is strictly greater than the level of every strict producer;
- it is at least 1 when the rule's own body has a negated ordinary goal or an
  aggregate goal. A negated built-in is a pure decision and needs no boundary.

Rules in one component share a level. The *level of a goal* is the highest level
of the rules compatible with it, or 0 when there are none.

The decision level of a negated goal is the level of its ground instance. The
decision level of an aggregate goal is the highest level of the goals in its
producer, including nested producers. A negated or aggregate decision MUST be
made only against a boundary model closed through its decision level as
defined in Section 12.5, including every transitively required demanded call.

### 10.3 Forward Inference

When no rule is demand-driven, evaluation processes levels in increasing
order. At each level:

1. Rules whose bodies contain no ordinary call are joined once.
2. Every stored fact triggers the rules at that level whose ordinary goals it
   can match, until no new fact appears. Indexes on predicate, argument
   position, and value select candidate facts and triggers.
3. If a negated or aggregate decision needs this level, the model through this
   level is recorded as a boundary.

Queries are evaluated after the last level.

### 10.4 Demand-Driven Tabling

When some rule is demand-driven, evaluation uses an agenda of tasks ordered by
level. Within a level, tasks run first in, first out. Forward rules are
activated first, and queries run in source order after the rules have
completed. A query is ranked above every rule level.

- *Calls.* When an ordinary call reaches a predicate that has demand-driven
  rules, the call is normalized by renaming its variables in order of
  occurrence. Calls that differ only in variable spelling therefore share one
  table, and repeated-variable constraints are preserved. The first occurrence
  activates every rule whose head unifies with the call. A conclusion that does
  not match its call is not added to that call's table.
- *Consumers.* A consumer that waits for answers subscribes to its call and
  resumes as each matching fact arrives. Recursion therefore does not use one
  native stack frame per call, and recursive consumers do not need an unbounded
  chain of nested calls.
- *Negation and aggregation.* A negated goal first demands its producer call. It
  is then decided at its consumer's level, after all lower-level tasks have
  completed. Before computing an aggregate, the evaluator demands every
  producer call reachable from the aggregate body over the current model, and
  it repeats this until no new call appears.
- *Boundaries.* After evaluation, a boundary is recorded for each decision level
  that was used. It contains the demanded calls whose call level does not
  exceed that level, sorted by their text.

Tables and calls are local to one run.

### 10.5 Evidence Recording

Each stored fact keeps its first successful justification. Built-in,
not-builtin, absence, aggregate, and witness decisions are stored as separate
evidence records. They MUST NOT enter the ordinary relation indexes and MUST
NOT be visible to ordinary goals. For each projected query answer, the
evidence of its first solution is kept. Evidence is finally ordered so that each
record follows everything it depends on (Section 12.3).

### 10.6 Resource Limits

| Limit | Default | Counts |
| --- | --- | --- |
| `max_facts` | 1,000,000 | Stored evidence records (facts and decisions) |
| `max_matches` | 10,000,000 | Counted operations: candidate matches, built-in calls, tasks, index entries, demanded calls, and finite-model matching |

Exceeding a limit MUST raise an error that states the result is incomplete. It
MUST NOT produce successful partial output. Limits bound counted work, not
elapsed time, stack depth, or process memory. The browser playground MUST allow
cancellation by terminating its computation worker.

## 11. Requests and Output

### 11.1 Request Forms

| Request | Effect |
| --- | --- |
| `?- Goals.` | Ordinary query: record all distinct answers. |
| `?- why.` | Record the proof of the most recent preceding ordinary query. |
| `?- why(Goals).` | Exactly `?- Goals.` followed by `?- why.` |
| `?- check.` | Generate the certificate of the most recent preceding ordinary query, check it (Section 13), and record the report. |
| `?- check(Goals).` | Goal check: record whether `Goals` has a solution. |

A goal check does not count as the preceding ordinary query for `why` or
`check`. A bare `why` or `check` with no preceding ordinary query, counting
across merged inputs, MUST raise an error.

### 11.2 The Result Document

The output is one eyepl document, identical across the command line, the
playground, and the library (`execute` and `Run::output`). Requests are
rendered in source order as groups of records. Each group starts with a
`% Heading N` comment line, and groups are separated by one blank line. `N` is
the one-based number of the query in source order; queries and goal checks
share this numbering, while `why` and `check` take the number of the query they
explain. `examples/output/` holds this document for every bundled example.

| Heading | Records |
| --- | --- |
| `% Answer N` | The answer facts, `answer(N, Bindings)`, or `no_answer(N)` |
| `% Reason N` | `proof_witness`, `proof_step`, `proof_boundary`, `proof_boundary_steps`, `proof_boundary_call`, and `proof_claim` |
| `% Check N` | `proof_check` followed by nine `proof_condition` records |
| `% Goal check N` | `check_result(N, true)` or `check_result(N, false)` |

- *Answers.* When every goal of a query is an ordinary relation call, each
  distinct instantiated goal of each answer is written as a fact. Otherwise,
  including queries with anonymous variables, each answer is written as
  `answer(N, [binding("Name", Value), ...])` with the projected variables in
  order of first occurrence, excluding names that begin with `_` and variables
  local to aggregates. A query with no answers writes `no_answer(N)`, which
  records query failure, not an asserted negative fact or a certificate of
  absence. Answer order follows evaluation and is not otherwise specified.
- *Reasons.* The certificate of Section 12, as data:

  | Record | Meaning |
  | --- | --- |
  | `proof_witness(N, Label, Identity)` | A short witness label and its typed certificate identity |
  | `proof_step(N, Step, Conclusion, Justification)` | A source fact, rule application, or decision |
  | `proof_boundary(N, Boundary, Level)` | A closed boundary at a stratum level |
  | `proof_boundary_steps(N, Boundary, First, Last)` | A run of consecutive member steps |
  | `proof_boundary_call(N, Boundary, Call)` | A demanded call of the boundary |
  | `proof_claim(N, Claim)` | `answer(Query, Premises)` or `derived(Step)` |

  Justifications are `source(Fact)`, `rule(Rule, Premises)`, `builtin`,
  `not_builtin`, `absent(Boundary)`, `aggregate(Owner, Position, Boundary)`
  with owner `rule(R)` or `query(Q)`, and `fresh(Rule, Position)`. In proof
  records, call variables are written `variable("Name")` and witnesses
  `witness(Label)`, so the records stay ground data. Boundary members are
  separate records, so a large boundary needs no deeply nested list.
- *Checks.* `proof_check(N, checked, Summary)` records the counts of Section
  13.4 and that source facts and rules are assumed and answer completeness is
  not checked. Each `proof_condition(N, Condition, Name, Result)` gives
  `checked(Attempts, Failures)` or `not_applicable(Reason)`. An invalid report
  is an error for the whole run (Section 11.5).
- *Goal checks.* Variable bindings are not recorded, and `false` does not fail
  the run.

*Informative.* For `examples/orders.pl`, which asks for vouchers, their proof,
and its check:

```prolog
% Witnesses
witness(w1, W) :- fresh(W).

% Answer 1
voucher(ada, W1, 15) :-
    witness(w1, W1).

% Reason 1
proof_witness(1, w1, "r3:g2:{\"Customer\": Symbol(\"ada\"), \"Total\": Integer(15)}").
proof_step(1, 1, customer(ada), source(1)).
proof_step(1, 2, customer(bea), source(2)).
proof_step(1, 3, line(ada, book, 12), source(3)).
proof_step(1, 4, line(ada, pen, 3), source(4)).
proof_step(1, 5, line(bea, map, 7), source(5)).
proof_step(1, 6, blocked(bea), source(6)).
proof_step(
    1,
    7,
    '$aggregate:r1:2'([binding('Customer', ada)], 15),
    aggregate(rule(1), 2, 1)
).
proof_step(1, 8, subtotal(ada, 15), rule(1, [1, 7])).
proof_step(1, 9, blocked(ada), absent(1)).
proof_step(1, 10, '>='(15, 10), builtin).
proof_step(1, 11, eligible(ada, 15), rule(2, [8, 9, 10])).
proof_step(1, 12, '$satisfied:1'(ada, 15), absent(1)).
proof_step(1, 13, '$lean:1'(ada, 15), rule(5, [11, 12])).
proof_step(1, 14, '$fresh:r3:2'(ada, 15, witness(w1)), fresh(3, 2)).
proof_step(1, 15, voucher(ada, witness(w1), 15), rule(3, [13, 14])).
proof_boundary(1, 1, 0).
proof_boundary_steps(1, 1, 1, 6).
proof_claim(1, answer(1, [15])).

% Check 1
proof_check(1, checked, [
    steps(15),
    claims(1),
    source_facts(6),
    rule_applications(4),
    assumed([source_facts, source_rules]),
    answer_completeness(not_checked)
]).
proof_condition(1, c1, "resolution", checked(10, 0)).
proof_condition(1, c2, "well-foundedness", checked(7, 0)).
proof_condition(1, c3, "justification", checked(17, 0)).
proof_condition(1, c4, "coverage", checked(34, 0)).
proof_condition(1, c5, "re-decision", checked(2, 0)).
proof_condition(1, c6, "boundary consistency", checked(4, 0)).
proof_condition(1, c7, "relevance", checked(16, 0)).
proof_condition(1, c8, "witness integrity", checked(3, 0)).
proof_condition(1, c9, "query isolation", checked(1, 0)).
```

Reloading the document gives a program whose facts are the recorded answers
and records. Reloading does not by itself establish their truth or verify a
proof; the proof records describe a certificate that is checked against its
source program.

### 11.3 Output Without Requests

A program without requests writes each derived ordinary fact that is not a
source fact, one per line, in evidence order, without a heading. Decisions,
auxiliary evidence, and generated relations are not written. A program with
ordinary queries but no requests writes the answers of every query.

### 11.4 Term Formatting

| Value | Rendering |
| --- | --- |
| Atom | Bare if it matches `[a-z][A-Za-z0-9_]*`, otherwise single-quoted |
| String | Double-quoted |
| Integer | Decimal, with `-` for negatives |
| Real | Shortest round-trip decimal, always with a fraction or exponent, such as `2.5`, `15.0`, `1e-7` |
| Compound | `name(A1, A2)` in canonical functional notation, such as `'+'(1, 2)` |
| List | `[a, b]` |

Inside quotes, line feed, carriage return, tab, backslash, and the delimiter are
escaped as `\n`, `\r`, `\t`, `\\`, and `\'` or `\"`. A record that fits in 88
columns is written on one line. A longer one puts one argument per line with
four-space indentation; a one-argument term keeps its argument beside it, and
a list of plain values fills each line. Answer bindings and check summaries
put one list entry per line.

The document MUST parse as eyepl. A witness has no source notation, so the
document starts with `% Witnesses` and one `witness(wK, W) :- fresh(W).` rule
per witness label, and each answer that contains witnesses is written as a rule
calling `witness/2`, such as `voucher(ada, W1, 15) :- witness(w1, W1).`
Reloading introduces new witness identities while preserving equality among
them inside the document. Output that cannot be written as parseable eyepl
MUST fail explicitly.

### 11.5 Command-Line Interface

```text
eyepl FILE...
eyepl -
eyepl -h | -v
```

The CLI accepts `-h` (help) and `-v` (version). `-` reads standard input, at
most once. `--` makes every later argument a file. Any other argument that
begins with `-` MUST be rejected. Without arguments, the CLI prints the help.
Several files form one program (Section 2.3). Requests in the source select the
output; there is no output-selection option.

On success, the CLI writes the complete output to standard output and exits
with status 0. On any error, including a parse error (prefixed with the file
name), a resource limit, or an invalid `check` report, it writes one
`eyepl: message` diagnostic to standard error, writes nothing to standard
output, and exits with status 1.

### 11.6 Library and Browser Interfaces

The Rust library exposes `parse`, `reason`, `Run::output`, `Run::certificate`,
`Run::proof`, `Certificate::parse`, `check`, and `check_with_limits`.
`Run::proof` writes the standalone certificate of Section 12, and a report's
text form is shown in Section 13.5. `Run::certificate`
selects the answers of every ordinary query that is requested (Section 12.7).
The WebAssembly module exposes `runProgram(source)`, which produces the same
output as the CLI for one document, and `version()`. The playground runs it in
a cancellable worker.

## 12. Proof Certificates

### 12.1 Overview

There is one certificate format, `eyepl-proof 1`. It is readable and
checkable. A certificate has three parts:

1. *Steps*: numbered evidence records, each concluding one ground atom.
2. *Boundaries*: finite closed models with their demanded calls.
3. *Claims*: query answers or derived facts that the certificate asserts.

A certificate is interpreted relative to the source program that the checker
receives. Rule text in comments is informative only.

### 12.2 Certificate Grammar

```abnf
certificate   = header *( EOL line ) [ EOL ]
header        = %s"eyepl-proof 1"
line          = *WSP [ record / comment ] *WSP
comment       = "%" *line-char  ; any character except CR and LF
record        = step / boundary / demand / claim

step          = %s"step" SP id SP justification SP ":" SP fact
justification = %s"source" SP id
              / %s"rule" SP id SP id-list
              / %s"builtin"
              / %s"not-builtin"
              / %s"absent" SP id
              / %s"aggregate" SP owner SP id SP id
              / %s"fresh" SP id SP id
boundary      = %s"boundary" SP id SP %s"level" SP level SP id-list
demand        = %s"demand" SP id SP ":" SP goal
claim         = %s"answer" SP id SP id-list / %s"derived" SP id

owner         = ( %s"r" / %s"q" ) id
id-list       = "[" [ id *( "," id ) ] "]"
id            = %x31-39 *DIGIT       ; positive integer
level         = 1*DIGIT
EOL           = LF / CRLF
```

`fact` is one ground term in source syntax (Section 3) followed by the
terminator `.`. It names an ordinary or auxiliary predicate (Section 12.4) and
MAY contain witnesses. `goal` is one predicate application followed by `.`; it
MAY contain variables. Readers MUST also:

- require the first line to be exactly `eyepl-proof 1`;
- ignore blank lines and lines whose first non-blank character is `%`;
- trim record lines, require the literal prefixes `step ` and `demand ` for
  those records, and split either at its first exact ` : ` delimiter;
- accept runs of whitespace between the other metadata fields; ID lists remain
  single fields with comma-separated IDs and no intervening whitespace;
- require step IDs to be 1, 2, 3, ... in order, and boundary IDs likewise;
- require that each `demand` names a boundary that has already appeared;
- reject steps, boundaries, and demands after the first claim;
- reject any other record, metadata, or malformed term with an error labelled
  C3 (Section 13.1).

Generators MUST emit exactly the canonical form shown, in this order: all
steps, then each boundary immediately followed by its demands, then all claims.

### 12.3 Steps and Justifications

Source facts, rules, and queries are referenced by their 1-based positions in
the merged program (Section 2.3), counted separately. Query IDs count both
ordinary queries and goal checks in source order; `why(Goals)` contributes an
ordinary query, while bare `why` and bare `check` contribute no query. For
example, after `?- check(p(a)). ?- p(a).`, the ordinary query has ID 2.
The generator excludes goal-check answers (Section 12.7), so its `answer` IDs
can have gaps. Goal positions are 1-based body positions. Every step's atom
MUST be ground.

| Justification | Kind | Evidence |
| --- | --- | --- |
| `source F` | ordinary | Source fact `F`, which MUST equal the atom |
| `rule R [P1,...,Pn]` | ordinary | One application of rule `R`, with one earlier premise step per body goal, in body order. IDs MAY repeat. |
| `builtin` | decision | A ground built-in tuple that holds, re-decided by the checker |
| `not-builtin` | decision | A ground built-in test that fails, for a negated built-in |
| `absent B` | decision | The ground ordinary atom does not occur in boundary `B` |
| `aggregate O N B` | decision | The result of the aggregate at goal `N` of owner `O`, computed over boundary `B` |
| `fresh R N` | decision | The witness created by the `fresh/1` goal at position `N` of rule `R` |

The evidence kind of each premise MUST match its body goal. An ordinary call
requires an ordinary step. A built-in requires `builtin`, and a negated built-in
requires `not-builtin`. A negated call requires `absent`. An aggregate requires
`aggregate` with the same owner and position. `fresh/1` requires `fresh` with
the same rule and position. No decision can stand in for an ordinary relational
premise, and an ordinary step cannot stand in for a decision.

Ordering: a rule step's premises and a decision's boundary members MUST have
smaller step IDs than the step that uses them.

### 12.4 Auxiliary Evidence Atoms

Aggregate and witness decisions conclude synthetic atoms whose predicate names
cannot be written as unquoted atoms. They are auxiliary evidence, never
ordinary program facts.

*Aggregate atom.* `'$aggregate:O:N'(Bindings, Result)`, where `O` is `r<RULE>`
or `q<QUERY>` and `N` is the goal position. `Bindings` is a proper list of
`binding('Name', Value)` terms, one for each outer variable already ground
before the aggregate: variables of the preceding goals and, only for rules
requiring call inputs, head variables bound by the call. A range-restricted
rule MUST NOT record a group supplied only by its call. The list is sorted by
variable name in strictly increasing order. Local producer variables and
variables bound only by `Result` are excluded. `Result` is the computed value.

*Witness atom.* `'$fresh:rR:N'(V1, ..., Vk, Witness)`, where `V1`...`Vk` are the
values of the variables bound by the preceding goals, in increasing name order,
and `Witness` is the created witness.

### 12.5 Boundaries and Demands

`boundary B level L [S1,...,Sn]` asserts that steps `S1`...`Sn` form a model
closed under forward rules and the recorded demanded calls through level `L`.
It does not assert enumeration of undemanded instances of mode-dependent
rules or universal unit clauses. Boundary levels MUST be
unique. Members MUST be ordinary steps whose level is at most `L`: a source
step has level 0 and a rule step has its rule's level (Section 10.2).

A decision MUST cite the boundary whose level equals its decision level. For an
absence, that is the level of the ground atom. For an aggregate, it is the
decision level of the aggregate goal.

`demand B : Goal.` records one call to demand-driven rules that the boundary's
model answers completely. Calls are compared after the variable renaming of
Section 10.4. Each call MUST name a predicate that has demand-driven rules, and
its *call level*, the goal level computed without witness rules (Section 8.3),
MUST be at most `L`. A call to which no clause applies is
permitted and certifies an empty answer set for that call.

A boundary is *closed* when all of the following hold (verified as C6,
Section 13.2):

1. it contains every source fact;
2. for every forward rule at or below `L`, every solution of the body over the
   boundary's model, with any witness recomputed, gives a head instance in the
   model. A satisfaction test (Section 8.3) is matched only against the members
   of its own or lower levels;
3. for every demand-driven rule at or below `L` and every recorded call whose
   head unifies with it, every solution of the body over the model, starting
   from that unification, gives a head instance in the model;
4. every call needed along those bodies is recorded. Calls are needed at each
   ordinary, negated, or aggregate goal after each solution of the preceding
   goals, including goals inside aggregate producers;
5. every absence and aggregate decision that cites the boundary has its own
   needed calls recorded.

Omitting a derivable fact, an applicable clause's conclusion, or a recursive
call therefore makes the certificate invalid. These checks are finite matching
against the supplied model and calls. Checking never evaluates the program or
fills a gap (Section 13.7). A program with an infinite model need not have a
finite closed boundary.

### 12.6 Claims

`answer Q [P1,...,Pn]` claims one answer to source query `Q`. Its premises
supply complete evidence for every goal of the query, in order, under one
consistent substitution, with the kinds required by Section 12.3. The claimed
answer is the projection of that substitution. Answers are selections. They are
never steps and cannot be cited as premises. Evidence for a query aggregate
(`q` owner) cannot satisfy a rule aggregate (`r` owner), and the reverse also
holds.

`derived S` claims a new rule conclusion. It is used only when the program has
neither ordinary queries nor goal checks. Step `S` MUST be a rule step whose
atom is not a source fact. A program with either kind of query MUST NOT use
`derived` claims.

### 12.7 Certificate Generation

The generator selects claims as follows:

| Context | Claims |
| --- | --- |
| `?- why.` or `?- check.` | All answers of the most recent preceding ordinary query |
| `Run::certificate` | All answers of every requested ordinary query; goal checks are excluded |
| No ordinary queries or goal checks | `derived` for every rule step |

It keeps the transitive dependencies of the claims (premises, cited boundaries,
and their members) and renumbers steps and boundaries densely while preserving
order. Marking dependencies is iterative, and retained IDs are scanned in
order, so deep proof chains need neither recursion nor sorting. Boundaries can
make a certificate much larger than its positive derivations, because
completeness requires every member of the relevant stratum prefix.

Subject to available resources, serializing a generated certificate and reading
it with `Certificate::parse` MUST preserve the same steps, boundaries, demands,
and claims. The reader accepts generated term depths and witness-context
arities beyond the source parser limits (Section 4.5). Reading a certificate
does not establish its validity; the checker still verifies the supplied
structure and every witness's exact source-rule context.

### 12.8 Example

*Informative.* For `examples/orders.pl`, `Run::proof` writes:

```text
eyepl-proof 1
% Rule 1: subtotal(Customer, Total) :- customer(Customer), aggregate_all(sum(Price), (line(Customer, Item, Price)), Total).
% Rule 2: eligible(Customer, Total) :- subtotal(Customer, Total), \+ (blocked(Customer)), Total >= 10.
% Rule 3: voucher(Customer, Voucher, Total) :- '$lean:1'(Customer, Total), fresh(Voucher).
% Rule 5: '$lean:1'(Customer, Total) :- eligible(Customer, Total), \+ ('$satisfied:1'(Customer, Total)).
step 1 source 1 : customer(ada).
step 2 source 2 : customer(bea).
step 3 source 3 : line(ada, book, 12).
step 4 source 4 : line(ada, pen, 3).
step 5 source 5 : line(bea, map, 7).
step 6 source 6 : blocked(bea).
step 7 aggregate r1 2 1 : '$aggregate:r1:2'([binding('Customer', ada)], 15).
step 8 rule 1 [1,7] : subtotal(ada, 15).
step 9 absent 1 : blocked(ada).
step 10 builtin : '>='(15, 10).
step 11 rule 2 [8,9,10] : eligible(ada, 15).
step 12 absent 1 : '$satisfied:1'(ada, 15).
step 13 rule 5 [11,12] : '$lean:1'(ada, 15).
step 14 fresh 3 2 : '$fresh:r3:2'(ada, 15, ~"r3:g2:{\"Customer\": Symbol(\"ada\"), \"Total\": Integer(15)}").
step 15 rule 3 [13,14] : voucher(ada, ~"r3:g2:{\"Customer\": Symbol(\"ada\"), \"Total\": Integer(15)}", 15).
boundary 1 level 0 [1,2,3,4,5,6]
answer 1 [15]
```

A program with demand-driven rules adds demand records after a boundary, for
example `demand 1 : between(0, 8, _EyeplCall0).`

## 13. Verification

### 13.1 Checking Procedure

The checker receives a validated program and a parsed certificate. It:

1. checks each step in order (C1–C5, C8);
2. checks every witness occurrence (C8);
3. checks every claim (C3, C4, C7, C9);
4. checks every boundary for closure (C6);
5. checks relevance (C7).

The outcome is an error, a valid report, or an invalid report:

- *Errors* (`Err`): an invalid program; an unreadable certificate, reported as
  `Invalid proof [C3 justification]: ...`; exceeding a limit; or a missing-input,
  type, conversion, or arithmetic error during finite-model matching or
  aggregate re-decision.
- *Invalid report* (`Ok`): one or more semantic failures. All failures that can
  be decided independently are collected. Checks that depend on an unresolved
  reference are skipped, and the missing reference is reported under C4.
- *Valid report* (`Ok`): no failures.

### 13.2 Proof Conditions

| Condition | Requirement |
| --- | --- |
| **C1 · Resolution** | A source step MUST equal its cited fact. For a rule step, one substitution of only rule variables MUST match the claimed head and every body goal against its premise, with the correct evidence kind (Section 12.3). Applying it to the head MUST give exactly the step's atom. Built-ins are replayed along the premises, a negated goal MUST be ground and equal to its `absent` atom, an aggregate's recorded bindings MUST agree with the preceding bindings, and aggregate group inputs MUST come from preceding goals or permitted call inputs, and producer-local variables MUST NOT be captured by a range-restricted head. |
| **C2 · Well-foundedness** | Rule premises and cited boundary members MUST precede the step that uses them. Cycles, self-support, and forward references MUST be rejected. Loading rejects dependency cycles through negation or aggregation (Section 8.1). |
| **C3 · Justification** | Every step MUST have one supported justification and a ground, valid atom. Ordinary conclusions, identical decisions, boundary levels, `derived` targets, and projected answers per query MUST be unique. An `aggregate` step MUST name an aggregate goal. Malformed records are rejected by the reader with a C3-labelled error. |
| **C4 · Coverage** | Every referenced source fact, rule, query, owner, goal position, boundary, and step MUST exist in the program or certificate. Complete coverage of bodies and queries is checked by C1 and C9. |
| **C5 · Re-decision** | Every `builtin` atom MUST be re-decided with its ground arguments and reproduced exactly, and every `not-builtin` atom MUST be re-decided as failing without error. Every aggregate MUST be recomputed from its source goal, recorded bindings, and cited boundary, including distinct-tuple grouping, value types, and empty-set behavior, and it MUST equal the recorded result. |
| **C6 · Boundary consistency** | Boundaries MUST satisfy Section 12.5: unique members, only ordinary facts at or below their level, all source facts, closure under forward rules and under every recorded demand, transitive closure of needed calls, and valid demand records. An absence MUST NOT occur in its boundary. Absence and aggregate decisions MUST cite the boundary at their exact decision level. |
| **C7 · Relevance** | Every step and every boundary MUST be reachable from a claim through premises, cited boundaries, and boundary members. A `derived` claim MUST cite a rule step whose atom is not a source fact. A query answer MAY select a source fact directly. |
| **C8 · Witness integrity** | A `fresh R N` step MUST name a `fresh/1` goal. Its atom MUST carry the preceding variable values and exactly the witness recomputed from rule `R`, position `N`, and those values. A witness identity MUST NOT be produced by two different firings. Every witness occurring anywhere in a step atom or demand call, including inside compounds, MUST have a checked `fresh` step. C1 checks the witness context where a rule consumes it. |
| **C9 · Query isolation** | Each `answer` MUST match every goal of its query with complete, correctly typed evidence under one consistent substitution. Answers MUST be selections, not inference steps. `derived` claims MUST NOT appear when the program has queries. Query aggregate evidence MUST NOT serve as rule evidence. |

### 13.3 Applicability

Reports list all nine conditions in order. A condition whose feature is absent
is reported as **not applicable**, with zero checks and failures:

| Condition | Applicable when |
| --- | --- |
| C5 | A rule or query uses a built-in, negated built-in, or aggregate |
| C6 | A rule or query uses ordinary-predicate negation or an aggregate; negated built-ins alone do not need boundaries |
| C8 | A rule uses `fresh/1`, or the certificate contains a witness value |
| Others | Always |

The [voucher example](https://github.com/eyereasoner/eyepl/blob/main/examples/orders.pl)
MUST perform at least one successful check under every condition.

### 13.4 Check Counts

A count is the number of local checks attempted, including failed ones. It is
not a count of established conclusions.

| Condition | Counts |
| --- | --- |
| C1 | Source and rule steps whose references resolve |
| C2 | Rule premise lists and cited boundaries |
| C3 | Steps, claims, and boundaries |
| C4 | Individual references |
| C5 | Built-in, not-builtin, and aggregate decisions |
| C6 | Boundaries, absences, and aggregates |
| C7 | Steps, boundaries, and resolved `derived` claims |
| C8 | `fresh` steps and witness occurrences |
| C9 | Resolved answer claims and `derived`-claim mode checks |

### 13.5 Reports

For the certificate in Section 12.8, the report's text form is:

```text
checked: 15 steps, 1 claim
6 source facts; 4 rule applications
Conditions:
  C1 resolution: 10 checked, 0 failed
  C2 well-foundedness: 7 checked, 0 failed
  C3 justification: 17 checked, 0 failed
  C4 coverage: 34 checked, 0 failed
  C5 re-decision: 2 checked, 0 failed
  C6 boundary consistency: 4 checked, 0 failed
  C7 relevance: 16 checked, 0 failed
  C8 witness integrity: 3 checked, 0 failed
  C9 query isolation: 1 checked, 0 failed
Source facts and rules are assumed. Answer completeness is not checked.
```

The first word is `checked` when there are no failures, and otherwise
`invalid`. An invalid report adds a `Failures:` section with one line per
failure: `[C<n> <name>] <location>: <diagnostic>`. The location is
`step N`, `claim N`, or `boundary N`, and is 1-based.

### 13.6 Checker Interface and Limits

`check(program, certificate)` uses the default limits, and
`check_with_limits(program, certificate, limits)` uses explicit limits. Both
return `Result<Report, Error>`. `Ok(report)` means only that checking finished:
callers MUST inspect `report.valid()` or call `report.require_valid()`, which
turns an invalid report into an error, before accepting a certificate. Reports
expose per-condition applicability and attempted and failed counts, and each
failure exposes its condition, location, and diagnostic.

The limits of Section 10.6 apply. The evidence size, steps plus demand records,
MUST NOT exceed `max_facts`. Finite-model indexing, matching, and needed-call
checks count toward `max_matches`. Exceeding either MUST be an error. The CLI
and browser treat an invalid report as an error (Section 11.5).

### 13.7 Trust Model

The checker MUST NOT call the evaluator, activate a table, derive missing
facts, or repair a boundary. It shares the term representation, matching
primitives, and pure built-in and aggregate semantics with the evaluator. It is
not an independently implemented arithmetic or term system.

Source facts and rules are assumptions. Acceptance establishes that every
recorded claim is supported by them, including closed-world tests within
certified strata. Acceptance does not establish answer completeness (that no
other answers exist), source authenticity, or truth in the external world. An
empty certificate is accepted with zero claims and establishes nothing.

## 14. Explicit Exclusions

The following syntax and term forms MUST be rejected:

- control syntax for cut (`!`), disjunction (`;`), and if-then-else;
- predicate variables and variables as goals;
- directives other than `table`;
- improper lists and cyclic terms;
- operator declarations, curly terms, `0'c` character codes, and non-decimal or
  digit-grouped numbers.

The language has no built-in implementation of dynamic predicates such as
`assert`/`retract`, meta-calls such as `call/N`, all-solutions predicates such as
`findall/3`, `bagof/3`, and `setof/3`, or procedural I/O, streams, exceptions,
flags, modules, and DCGs. Unreserved names remain ordinary predicates
(Section 5.6): `?- call(true).` has no solutions unless the program defines a
matching `call/1` clause. Such a clause does not implement ISO meta-calling.
`fail/0` is likewise an ordinary predicate without an implicit definition.
Use `aggregate_all/3` for the collection operations of Section 8.2.

General term ordering, locale collation, answer-order guarantees, duplicate
derivations, and N3 or Turtle input are outside the language.

Calls that lack required inputs are errors, not enumerations (Section 5.5).
Arithmetic is interpreted only in evaluated contexts (Section 7.2).

## 15. Security Considerations

*Assumptions.* Source facts and rules are trusted assumptions. Accepting a
certificate establishes recorded claims relative to them. It does not
authenticate inputs, establish external truth, or guarantee answer
completeness (Section 13.7). Applications MUST NOT treat `Ok(report)` as
acceptance without checking `Report::valid()` or using `require_valid()`.
Semantic failures are returned inside an otherwise successful result.

*Resource exhaustion.* Programs can describe infinite models (Section 9.4).
The limits of Section 10.6 bound counted work and evidence size. They do not
bound elapsed time, process memory, or native stack depth. Terms built during
evaluation are not depth-limited. Hosts that run untrusted programs or
certificates SHOULD add process, time, and memory limits, or run them in an
isolated worker that can be terminated, as the playground does. Large results
and certificates SHOULD be written to files rather than terminals.

*Certificates as input.* A checker treats certificates as untrusted input. It
validates every reference and kind before use and never evaluates the program
to fill gaps. A forged certificate can therefore fail checking but cannot cause
new facts to be derived.

*Witness identities.* A witness spelling reveals the substitution of its
firing. Programs SHOULD NOT create witnesses over values that must stay
confidential when answers or certificates are shared.

*Share links.* Playground share links contain readable program text. Opening a
link does not run the program automatically.

## 16. References

### 16.1 Normative References

[RFC2119]
: Bradner, S., "Key words for use in RFCs to Indicate Requirement Levels",
  BCP 14, RFC 2119, March 1997, <https://www.rfc-editor.org/rfc/rfc2119>.

[RFC5234]
: Crocker, D., Ed., and P. Overell, "Augmented BNF for Syntax Specifications:
  ABNF", STD 68, RFC 5234, January 2008,
  <https://www.rfc-editor.org/rfc/rfc5234>.

[RFC8174]
: Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words",
  BCP 14, RFC 8174, May 2017, <https://www.rfc-editor.org/rfc/rfc8174>.

[RFC7405]
: Kyzivat, P., "Case-Sensitive String Support in ABNF", RFC 7405,
  December 2014, <https://www.rfc-editor.org/rfc/rfc7405>.

[IEEE754]
: IEEE, "IEEE Standard for Floating-Point Arithmetic", IEEE Std 754-2019.

[UNICODE]
: The Unicode Consortium, "The Unicode Standard, Version 17.0.0", 2025,
  <https://www.unicode.org/versions/Unicode17.0.0/>. The implementation's
  Unicode data dependency is specified in Section 6.5.

[ISO13211-1]
: ISO/IEC 13211-1:1995, "Information technology — Programming languages —
  Prolog — Part 1: General core", with Technical Corrigendum 1:2007,
  Technical Corrigendum 2:2012, and Technical Corrigendum 3:2017.

### 16.2 Informative References

[HERBRAND]
: Genesereth, M., and E. Kao, "The Herbrand Manifesto — Thinking Inside the
  Box", RuleML 2015, LNCS 9202, pp. 3–12,
  <https://doi.org/10.1007/978-3-319-21542-6_1>.

[WG17]
: Neumerkel, U., "Conformity Testing I: Syntax",
  <https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing>.

[GUIDE]
: "eyepl guide", <https://eyereasoner.github.io/eyepl/GUIDE/>.
