# <img src="assets/eye.png" alt="" width="48" height="48" align="absmiddle"> eyepl

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.23806469-blue.svg)](https://doi.org/10.5281/zenodo.23806469)
[![crates.io](https://img.shields.io/crates/v/eyepl.svg)](https://crates.io/crates/eyepl)

**Version 0.3.9**

**eyepl** is a relational rule language and Rust reasoner between
Datalog and Prolog: set semantics and fixed-point reasoning with Prolog-style
clauses, structural terms, lists, arithmetic, stratified negation, aggregates,
fresh witnesses, and proofs that are checked independently.

- **[Playground](https://eyereasoner.github.io/eyepl/playground/)**: run eyepl
  programs in your browser.
- **[Guide](https://eyereasoner.github.io/eyepl/GUIDE/)**: install, run, use the
  library, and develop eyepl.
- **[Specification](https://eyereasoner.github.io/eyepl/SPEC/)**: the language,
  evaluation, and C1–C9 proof contract.
- **[Examples](https://github.com/eyereasoner/eyepl/tree/main/examples/)**:
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
