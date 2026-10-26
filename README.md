# <img src="assets/eye.png" alt="" width="48" height="48" align="middle"> wheye

A Prolog subset in Rust with tabled recursion and independently checked proof certificates.

The subset is intentional: like Datalog, wheye specializes a rule language for
declarative reasoning. Its scope keeps execution and the evidence required by
the checker explicit. See [why a Prolog subset](https://eyereasoner.github.io/wheye/#why-a-prolog-subset).

**Version 0.1.22**

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
- Inspect the [conformance corpus](https://github.com/eyereasoner/wheye/tree/main/tests/conformance/) for the tested ISO Prolog subset and explicit differences.
