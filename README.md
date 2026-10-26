# <img src="assets/eye.png" alt="" width="48" height="48" align="middle"> wheye

Wheye is a Rust reasoner for **Midlog**, a relational rule language with independently checked proof certificates.

Midlog's name reflects its position between Datalog and Prolog. It combines
set semantics and fixed-point reasoning with Prolog-style clause notation,
structural terms, lists, arithmetic, stratified negation, aggregates, and fresh
witnesses. Its specification defines the language and proof contract; Wheye
implements them in Rust. See [why Midlog](https://eyereasoner.github.io/wheye/#why-midlog).

Reasoning combines **forward chaining** for range-restricted rules with
**tabled backward chaining** for demand-driven rules. Both share derived facts;
negation and aggregation use completed lower strata. See the
[reasoning strategy](https://eyereasoner.github.io/wheye/#reasoning-strategy).

The existing `.pl` clause syntax is retained. Shared syntax and arithmetic use
ISO/IEC 13211-1:1995 with Corrigenda 1–3 as a compatibility reference.
The [specification](https://eyereasoner.github.io/wheye/SPEC/#15-conformance)
defines Midlog and its proof contract.

**Version 0.3.0**

```prolog
human(socrates).
mortal(Person) :- human(Person).

?- mortal(Who).
?- why.
?- check.
?- check(mortal(socrates)).
```

The source selects the output:

| Request | Result |
| --- | --- |
| `?- Goal.` | Answer bindings, `true.`, or `false.` |
| `?- why.` | Proof certificate for the preceding query |
| `?- check.` | Independent verification under C1–C9 |
| `?- check(Goal).` | `true.` or `false.` |

Run the example:

```sh
cargo run --release --locked -- examples/socrates.pl
```

- Try programs in your browser: [Playground](https://eyereasoner.github.io/wheye/playground/).
- Learn how to use wheye: [Guide](https://eyereasoner.github.io/wheye/).
- Read the language and proof contract: [Specification](https://eyereasoner.github.io/wheye/SPEC/).
- Explore runnable programs: [Examples](https://github.com/eyereasoner/wheye/tree/main/examples/).
- Inspect the [compatibility corpus](https://github.com/eyereasoner/wheye/tree/main/tests/conformance/) for shared ISO syntax, operations, and input restrictions.
