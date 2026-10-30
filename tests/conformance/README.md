# eyepl compatibility

This corpus checks the syntax and operations that eyepl
shares with ISO/IEC 13211-1:1995 and Technical Corrigenda 1:2007, 2:2012, and
3:2017, together with eyepl's input restrictions. The corrigenda take
precedence over the original standard text in these compatibility cases.
Passing it does not establish full ISO Prolog conformance.
The implemented language contract remains the
[specification](https://eyereasoner.github.io/eyepl/SPEC/).

Like EyeProlog's file-based conformance corpus, each source fixture has a
reviewable expected result. These tests run locally without another Prolog
installation, network access, or a checkout of EyeProlog. They do not run
EyeProlog's full ISO review or its live Neumerkel gate.

Run the corpus with:

```sh
cargo test --release --locked --test conformance -- --nocapture
```

`./scripts/test-all` includes it through Cargo's integration-test discovery.
The runner prints measured fixture and case counts for each group, reports all
fixture failures, and exits unsuccessfully if any expectation fails. It rejects
empty groups, missing expectations, orphaned expectations, and unexpected files.

## Shared ISO behavior

`iso/` checks the following shared behavior. Clause numbers identify the
relevant standard areas, not a claim of complete coverage of those clauses.

| Area | Executable fixtures | Scope |
| --- | --- | --- |
| Syntax and variables (6.4, 7.4) | `lexical`, `variables` | Quoted atoms, supported escapes, comments, decimal numbers, anonymous variables, sharing, clause scope |
| Unification (8.2) | `unification`, `lists` | Finite structural terms, numeric type distinction, non-unifiability, proper and partial list notation, `'.'/2` |
| Clauses and control (7.8) | `clauses`, `control` | Finite ground answer sets, conjunction, `true/0`, ground single-goal negation, recursive append |
| Term comparison (8.4) | `atom_order` | ASCII atom ordering only |
| Term construction (8.5) | `univ` | `=../2` construction and decomposition, atomic and compound terms, proper lists, later-bound arguments |
| Arithmetic evaluation and comparison (7.9, 8.6-8.7, 9) | `arithmetic`, `quotients`, `functions`, `powers`, `rounding`, `operator_priorities` | ISO operator priorities and grouping, result types, all six comparisons, signed quotients/remainders, explicit `float/1` conversion, halfway rounding toward positive infinity, powers through Corrigendum 3, transcendental functions, extrema |
| Integer model and bit operations (9) | `integer_model`, `bits` | Selected unbounded integer model, exact large results, signed bit operations and shifts |
| Atomic conversion (8.16) | `atom_codes` | Both directions, empty atoms, output matching and mismatches on ASCII codes |

`errors/` exercises arithmetic instantiation, operand types, division and
remainder by zero, function domains, overflow, unsupported evaluable functors,
atom-code input requirements, invalid `=../2` construction, and an unclosed
quote. Arithmetic cases include Corrigendum 3's negative integer-power type
error, the zero and negative-base power domains, power underflow, float-only
rounding inputs, the undefined `atan2(0,0)`, and invalid operator groupings.
It requires the exact diagnostic and the phase (`parse` or `reason`).
These test the error conditions with eyepl's messages; they do not claim
ISO `error(Formal, Context)` exception terms or `catch/3` support.

## Language restrictions

`unsupported/` requires rejection of improper lists (including canonical
construction and runtime unification), unbound answers and successful unbound
decision evidence, non-ground negation, negative dependency cycles, general
term ordering, disjunction, cut, and operator directives. A passing rejection
is evidence of a language boundary, never evidence of ISO compatibility for that
feature.

The corpus does not cover the full ISO lexical grammar, general term ordering
and identity, type-test predicates, meta-calls, procedural search order,
all-solutions predicates, mutable databases, streams, term I/O, exception
handling, flags, modules, or DCGs. Those facilities are not implemented as ISO
built-ins. Unsupported predicate names can still name ordinary user relations;
an empty answer for such a name does not demonstrate built-in support.
Engine behavior outside the shared ISO cases is covered by the ordinary
regressions in `tests/prolog.rs`, including set semantics, table completion,
the occurs check, and eyepl's numeric and text model. In particular, exact
mixed numeric comparisons and distinct strings are documented implementation
behavior. Rounding input types,
`sign/1` result types, and integer-power error conditions are checked against
the standard with Corrigenda 1–3. Forged certificates with the previous
arithmetic results are rejected by C5 in `tests/prolog.rs`.
Aggregates, witnesses, and proof forgery checks also remain in the other
integration suites.

## Fixture format and evidence

Each answer fixture pairs `name.pl` with `name.answers`. Each ordinary query
has exactly one expected line: `false`, `true`, or its variable bindings in
query-variable order. Multiple answers are sorted by their rendered binding
text and joined with `; `. Sorting ignores enumeration order but retains
multiplicity, so unexpected duplicates fail. Values retain eyepl's typed term
spelling. For example:

```text
X = a; X = b
Q = -2, R = -1
```

Expected answers are maintained independently; the runner has no mode to
overwrite them from evaluator output. Floating-point identities use tolerances
in the source rather than depending on the last bit of transcendental results.

Every answer fixture also serializes and parses its certificate, checks that
the evidence survives unchanged, and independently verifies it with C1–C9 via
`require_valid()`. Inapplicable conditions may be reported as such. Checking
certificates establishes recorded claims; the explicit expected-answer oracle
tests successes and failures, including omitted or extra answers.

Each error fixture pairs `name.pl` with `name.error`, containing the exact
`parse: ...` or `reason: ...` diagnostic and a final newline. Use one error
condition per source so an earlier error cannot mask a later test.

## Sources and provenance

The cases are small, locally authored tests of the supported operations. The
organization follows EyeProlog's `test/conformance/` corpus; no third-party
test harness or licensed corpus is vendored here. ISO clause references use
Part 1 and Corrigenda 1–3 as the reference areas, rather than later draft
proposals.

The public [WG17 documents](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/)
and [Neumerkel syntax comparison](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing)
provide further context. `iso/lexical.pl` identifies syntax rows 35–37 as
cross-references for its quoted comment-marker checks. It checks the resulting
term values directly, without claiming to execute the original `read/1` /
`writeq/1` protocol or reproduce its full inventory.
