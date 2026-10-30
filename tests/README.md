# Tests

Run commands from the repository root. The main verification command is:

```sh
./scripts/test-all
```

It checks Rust formatting, native tests and example goldens, API documentation
examples, native clippy, API documentation generation, generated taxonomies,
the playground, Pages staging and the committed Wasm package, release tooling,
and the test runner itself. It requires Rust with `rustfmt` and `clippy`,
Node.js 22 or later, and Git.

The runner describes each check, prints individual native-test and example
timings, continues after failures, and returns a nonzero exit status if any
check fails. Use `NO_COLOR=1` for plain output or `FORCE_COLOR=1` to retain
colors in captured logs. Native tests use release builds and the locked
dependencies; large graph and taxonomy cases are included.

To run the same checks and write their measured results to `REPORT.md`:

```sh
node scripts/test-report.mjs
```

The report is one table with each suite's total, OK/FAIL counts, elapsed time,
and one grand total. Conformance queries/error cases and example files count
individually, replacing their wrapper tests. The grand total elapsed time is
the sum of the test-suite times, excluding builds and other non-test checks.
The release script runs this command after the version bump and Wasm rebuild,
then includes the refreshed report in the release commit and tag.
Reports are also written after failures; missing result data is marked incomplete.
Real-browser checks and the separate Wasm rebuild/clippy commands are outside
this report.

## Native integration suites

Cargo discovers the `.rs` files in this directory automatically.

| Suite | Coverage |
| --- | --- |
| [reasoning.rs](reasoning.rs) | Core inference, variable scope, joins, recursion, set semantics, limits, value round trips, deep proof traversal, and exhaustive small-graph reachability against an independent oracle. |
| [eyepl.rs](eyepl.rs) | Forward aggregate closure, query-independent aggregate scope, call modes, tabled witness identities, and forged certificates violating the eyepl contract. |
| [prolog.rs](prolog.rs) | Structural terms, aliases, occurs checks, lists, text and numeric semantics, table completion, aggregate scope, and related forged-certificate regressions. |
| [extensions.rs](extensions.rs) | Built-ins, stratified negation, aggregates, fresh witnesses, checker limits, and an independent graph oracle for negation and aggregation. Reported as “Built-ins and aggregates”; additional facilities are specified in [Specification §6](https://eyereasoner.github.io/eyepl/SPEC/#6-built-in-predicates) and [§8](https://eyereasoner.github.io/eyepl/SPEC/#8-negation-aggregation-and-witnesses). |
| [conformance.rs](conformance.rs) | File-based tests of shared ISO syntax and operations, specific error diagnostics, and rejected syntax or input modes. See the [compatibility corpus](conformance/) for its scope and formats. |
| [cli.rs](cli.rs) | Command-line options, stdin and file input, source-selected output, echoed queries, proof context across files, and failures without partial output. |
| [examples.rs](examples.rs) | Every bundled program's exact output, successful goal checks, certificate round trip, and independent C1–C9 verification. |
| [proofs.rs](proofs.rs) | Rejection of malformed or forged basic certificates, and the distinction between valid recorded claims and complete answers. |
| [proof_conditions.rs](proof_conditions.rs) | C1–C9 reports and failure locations, condition applicability, independent failures, and exhaustive small forged certificates. |
| [extended_proofs.rs](extended_proofs.rs) | Forged built-in, aggregate, negative-boundary, and witness evidence, including incomplete closed models and misuse of query evidence. |
| [path_discovery.rs](path_discovery.rs) | Bounded routes checked against an independent route search, using both exhaustive small graphs and the full airport dataset. |
| [taxonomy.rs](taxonomy.rs) | Classification chains through depth 100,000, indexed dispatch, rule-order independence, proof size, counted work, and rejection of forged deep conclusions. |

Run a suite or one test while working:

```sh
cargo test --release --locked --test conformance -- --nocapture
cargo test --release --locked --test prolog occurs_check_rejects_direct_indirect_and_list_cycles -- --exact
```

`node scripts/test-rust.mjs` runs all native suites with individual timings.
It builds the test executables once, discovers their cases, and executes each
case separately. Rustdoc examples in `src/lib.rs` run separately with
`cargo test --release --locked --doc`.

## Playground, website, and tooling suites

These Node suites are included in `scripts/test-all` and can also run directly,
for example `node tests/playground.mjs`.

| Suite | Coverage |
| --- | --- |
| [playground.mjs](playground.mjs) | Example selection and fingerprints, worker messages, saved-source restoration, sharing, mocked Gist requests, autosave, and run status. Uses a simulated UI and worker. |
| [pages.mjs](pages.mjs) | Pages staging, root and nested base paths, packaged assets, synchronized versions, and small Wasm execution and proof-checking smoke tests in Node. |
| [release.mjs](release.mjs) | Version syncing, commits, annotated tags, atomic pushes, and publication failure recovery. Uses temporary local Git repositories and fake build/GitHub commands; it does not publish a real release. |
| [test-runner.mjs](test-runner.mjs) | Failure propagation, continuation after failed checks, timings, colors, compiler diagnostics, and report totals, using temporary fake commands and recorded output. |

## Real-browser checks

[browser.mjs](browser.mjs) is separate from `scripts/test-all`. It uses Chrome's
debugging interface to exercise the real playground, including execution,
proof checking, restoration, sharing, cancellation, and desktop/phone layouts.
Start a server and Chrome in separate terminals, then run the script:

```sh
python3 -m http.server 8766 --bind 127.0.0.1
google-chrome --headless --remote-debugging-port=9226 --user-data-dir=/tmp/eyepl-browser about:blank
node tests/browser.mjs
```

The optional positional arguments are the playground URL, Chrome debugging
URL, screenshot directory, and rendered Pages root URL, in that order. The
last argument enables checks of the rendered guide, specification, and
compatibility playground route. The default URLs are
`http://127.0.0.1:8766/playground.html` and `http://127.0.0.1:9226`.

For layout changes, use `node tests/browser.mjs --layout-only` with the same
URL arguments. It uses small synthetic input/output and disables reasoning
workers. Keep browser and Wasm taxonomy smoke tests at depth 100 or less;
the depth-100,000 taxonomies and full airport graph belong in native tests.

## Test data and maintenance

[fixtures/minimal.pl](fixtures/minimal.pl) is the small shared Socrates program
used by the CLI, reasoning, and proof-condition suites.
[fixtures/legacy-socrates.pl](fixtures/legacy-socrates.pl) preserves a historical
bundled source, including obsolete syntax. Its exact bytes are used to verify
fingerprints and restoration of saved programs in the playground and browser
tests. Keep that historical source unchanged.

The [conformance corpus](conformance/) pairs `.pl` sources with `.answers` or
`.error` expectations. Those expectations are maintained independently of
evaluator output. General engine regressions also live in the Rust suites;
passing the conformance corpus does not establish full ISO Prolog conformance.

Bundled examples live in `examples/`, with one exact transcript per program
in `examples/output/`. After an intentional example/output change:

```sh
node scripts/index-examples.mjs
EYEPL_UPDATE_GOLDENS=1 cargo test --release --locked --test examples -- --nocapture
```

Review the resulting diffs. Add a focused regression for meaningful behavior
changes and a rejected forged certificate for proof-checker changes. Preserve
the exhaustive small-graph oracle tests. Bound performance regressions by
counted work and proof size rather than wall-clock time.

After Rust changes, also run Wasm clippy and rebuild the committed package:

```sh
cargo clippy --target wasm32-unknown-unknown --lib --locked -- -D warnings
./scripts/build-playground
git diff --check
```

The rebuild requires `wasm-pack` and the `wasm32-unknown-unknown` Rust target.
The main test runner checks the existing package; it does not rebuild it or
launch Chrome. See the [development guide](https://eyereasoner.github.io/eyepl/GUIDE/#develop-and-verify)
for the wider verification workflow.
