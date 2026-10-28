# <img src="assets/eye.png" alt="" width="48" height="48" align="middle"> wheye

**Version 0.3.1**

Wheye is a Rust reasoner for **Midlog**, a relational rule language between
Datalog and Prolog: set semantics and fixed-point reasoning with Prolog-style
clauses, structural terms, lists, arithmetic, stratified negation, aggregates,
fresh witnesses, and proofs that are checked independently.

- **[Playground](https://eyereasoner.github.io/wheye/playground/)**: run Midlog
  programs in your browser.
- **[Guide](https://eyereasoner.github.io/wheye/)**: install, run, use the
  library, and develop Wheye.
- **[Specification](https://eyereasoner.github.io/wheye/SPEC/)**: the language,
  evaluation, and C1–C9 proof contract.
- **[Examples](https://github.com/eyereasoner/wheye/tree/main/examples/)**:
  runnable programs with their outputs.

```prolog
human(socrates).
mortal(Person) :- human(Person).

?- mortal(Who).
?- why.
?- check.
```

```sh
cargo run --release --locked -- examples/socrates.pl
```

MIT licensed; see [LICENSE.md](LICENSE.md).
