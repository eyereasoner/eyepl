# Wheye guide

Version **0.1.21**. Run a Prolog subset in the native CLI or browser, get
answers, and inspect their independently checkable proofs. The
[specification](https://eyereasoner.github.io/wheye/SPEC/) defines the language
and the [C1–C9 contract](https://eyereasoner.github.io/wheye/SPEC/#8-verification).

## Why a Prolog subset?

A restricted language can be a useful language in its own right. Datalog is a
well-established example: restricting logic programs gives recursive queries
a precise declarative meaning and makes specialized evaluation possible.
Wheye follows that principle, choosing a Prolog subset for recursive reasoning
with independently checkable evidence.

The implemented choices work together:

- **Set semantics:** a fact or answer tuple contributes once, regardless of how
  many derivations reach it. For terminating positive programs whose calls
  supply the required inputs, clause order does not change the answer set.
- **Tabled recursion:** repeated calls share work, and recursive consumers
  resume as answers arrive. Finite positive recursion can reach a fixed point
  without relying on Prolog's depth-first search order.
- **Stratified negation and aggregation:** producers complete before their
  absence or collected results are used. Their certificates include the closed
  boundaries needed to check those decisions.
- **Explicit proof obligations:** the checker verifies recorded rule
  applications, re-decides pure built-ins, and checks the supplied boundaries
  without invoking the evaluator or filling gaps in the evidence.

This scope keeps the relationship between a program, its answers, and its
evidence small enough to specify and inspect. Features such as cut, mutable
predicates, and procedural I/O would need additional semantics and evidence
rules before they could fit that contract. A full Prolog system can support
proofs too; wheye's current C1–C9 contract covers the language specified here.

Wheye extends beyond classical function-free Datalog with structural terms,
lists, arithmetic, and fresh witnesses. Term construction and arithmetic can
create infinite computations, so the subset does not guarantee termination.
Certificate acceptance establishes the recorded claims relative to the source
assumptions; it does not establish answer completeness or external-world truth.

## Run your first program

With Rust and Cargo installed:

```sh
cargo build --release --locked
./target/release/wheye examples/socrates.pl
cargo install --path . --locked
```

A minimal program selects Socrates as an answer:

```prolog
human(socrates).
mortal(Person) :- human(Person).
?- mortal(Who).
?- why.
?- check.
?- check(mortal(socrates)).
```

Each request prints its `?- ... .` line, followed by its result. An ordinary
query prints answers; `why` prints its proof certificate; bare `check` verifies
that certificate under C1–C9. `check(Goal)` prints `true.` or `false.` without
changing which ordinary query `why` and `check` refer to. Goal checks never
add facts. A false goal check is a result, not a run error.

The playground uses the same source requests. Opening a shared program does
not run it automatically; press **Run**.

Unedited examples use short share links such as
[Socrates](https://eyereasoner.github.io/wheye/playground/#example=socrates).
The playground recognizes saved copies of bundled examples, including older
versions, and loads their current source. Custom edits retain their exact text
in saved state and full source share links.

**Create Gist share** uploads the program to an unlisted GitHub Gist and copies
a share link. Enter a GitHub token with [Gist write permission](https://docs.github.com/en/rest/gists/gists#create-a-gist)
when prompted; it stays in the current tab's session. Anyone with the link can
read the Gist. Opening a Gist share restores the source without running it.
The top status shows `Done · exit 0 · … s` or `Failed · exit 1 · … s`.
The input and output display their complete contents. Use the page's vertical
scrollbar to move through both panes; neither pane scrolls independently.

## Explore the examples

All programs are directly in [examples/](https://github.com/eyereasoner/wheye/tree/main/examples/)
and selectable in the [playground](https://eyereasoner.github.io/wheye/playground/).
The collection includes lists, structural unification, recursive arithmetic,
Fibonacci at 10,000, graph algorithms, finite optimization, text processing,
scientific calculations, and classification chains. Source header comments
explain each example's assumptions and expected results. Golden transcripts in
`examples/output/` contain the current output of every program. The example
suite compares them exactly and independently checks the certificates under C1–C9.

| Example | What it shows |
| --- | --- |
| [Socrates](https://github.com/eyereasoner/wheye/blob/main/examples/socrates.pl) | Queries, certificates, goal checks |
| [Lists](https://github.com/eyereasoner/wheye/blob/main/examples/lists.pl) | Tabled list processing |
| [Aggregation](https://github.com/eyereasoner/wheye/blob/main/examples/aggregation.pl) | Counts, sums, minima, maxima |
| [List collection](https://github.com/eyereasoner/wheye/blob/main/examples/list-collection.pl) | Lists with repeated projected items |
| [Inventory](https://github.com/eyereasoner/wheye/blob/main/examples/inventory.pl) | Arithmetic followed by aggregation |
| [Airport paths](https://github.com/eyereasoner/wheye/blob/main/examples/path-discovery.pl) | Three routes across the full supplied airport graph |
| [Customer vouchers](https://github.com/eyereasoner/wheye/blob/main/examples/orders.pl) | All nine proof conditions, including witnesses |
| [Bézout identity](https://github.com/eyereasoner/wheye/blob/main/examples/gcd-bezout-identity.pl) | Exact coefficients from the extended Euclidean algorithm |
| [Command grammar](https://github.com/eyereasoner/wheye/blob/main/examples/grammar.pl) | List parsing with structured results and unconsumed input |
| [Drought relief](https://github.com/eyereasoner/wheye/blob/main/examples/agri-drought-relief.pl) | Explicit eligibility, recorded statuses, and fresh payment identities |
| [River crossing](https://github.com/eyereasoner/wheye/blob/main/examples/wolf-goat-cabbage.pl) | Safe state transitions and minimum-cost plans |
| [Catalan numbers](https://github.com/eyereasoner/wheye/blob/main/examples/catalan-convolution.pl) | Tabled convolution with an explicit recursive sum |
| [Pointer analysis](https://github.com/eyereasoner/wheye/blob/main/examples/pointer-analysis.pl) | A finite fixed point for possible memory targets |
| [Consumable resources](https://github.com/eyereasoner/wheye/blob/main/examples/linear-logic-resources.pl) | Resource lists prevent spending one token twice |
| [Constructive logic](https://github.com/eyereasoner/wheye/blob/main/examples/intuitionistic-logic-kripke.pl) | Formula terms evaluated in a finite information-growth model |

The airport example has 7,698 airports and 37,274 directed flight links. It
finds three routes from Ostend to Prague with at most two intermediate stops.
Change `route_request/3` to ask for other endpoints or limits. The third answer
field is the requested limit; route text lists the actual airports. Repeated
airports are excluded, and an airport can have a zero-leg route to itself.
The example includes goal checks for its supplied answers.

The packaged classification examples cover depths 10, 100, 1,000, 10,000, and
100,000. The first four include `why` requests and goal checks; the largest selects
`test(true)` and is kept small enough to inspect or check without printing its
entire closure. Use files for large proofs:

```sh
printf '?- why.\n?- check.\n' > /tmp/taxonomy-requests.pl
./target/release/wheye examples/deep-taxonomy-100000.pl /tmp/taxonomy-requests.pl > /tmp/taxonomy.txt
```

Tests bound counted dispatch/matching work and proof size, including a
100,000-level chain. `node scripts/generate-taxonomy.mjs --check` verifies the
generated examples. `./scripts/bench-taxonomy` measures pipeline phases; run
it on a quiet machine without concurrent builds. Time and memory depend on
the program, machine, and allocator.

## Terms and arithmetic

Terms include distinct atoms, strings, exact integers, finite binary64 reals,
compound terms, and proper lists. `1` and `1.0` are different terms, while
`1 =:= 1.0` compares them numerically. Arithmetic expressions remain data until
`is/2`, a numeric comparison, or a numeric aggregate evaluates them.

```prolog
line(book, 12, 2).
total(Item, Amount) :- line(Item, Price, Quantity), Amount is Price * Quantity.
?- total(Item, Amount), Amount >= 20.
?- Result is 2^100.
?- point(X, [a|Rest]) = point(2, [a,b]).
```

Unification uses an occurs check. Each `_` is fresh; other names beginning
with `_` remain shared but are omitted from displayed bindings. Arithmetic
inputs must already be bound by preceding goals or a call. Invalid inputs,
division by zero, and non-finite results are errors. Integer arithmetic does
not wrap. See the [complete builtin tables](https://eyereasoner.github.io/wheye/SPEC/#41-built-ins-and-arithmetic).

## Collect completed answers

```prolog
purchase(tools, hammer, 5).
purchase(tools, saw, 5).
purchase(tools, saw, 5).
budget(Department, Count, Total) :-
    department(Department),
    aggregate_all(count, purchase(Department, Item, Price), Count),
    aggregate_all(sum(Price), purchase(Department, Item, Price), Total).
department(tools).
?- budget(Department, Count, Total).
```

The result is two items and a total of 10. Distinct producer tuples contribute
once; equal prices from different items contribute separately. Repeating the
same fact or proof path adds no contribution. `aggregate_all(list(Term), Goal,
Items)` retains equal projected elements from distinct producer tuples. Its
producer can be a parenthesized conjunction. Producer variables are local;
only the result binds outside, and earlier bindings constrain the producer.
Empty count and sum return zero; empty list collection returns `[]`; empty
minimum and maximum fail.

## Negation, tabling, and witnesses

```prolog
eligible(Person) :- registered(Person), \+ blocked(Person).
:- table fibonacci/2.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Value) :-
    N > 1, A is N-1, B is N-2,
    fibonacci(A, X), fibonacci(B, Y), Value is X+Y.
?- fibonacci(100, Value).
```

Negation requires a ground ordinary call and waits for its compatible
producers to complete. Negative and aggregate cycles are rejected. Clauses
that need caller inputs use demand-driven tables; a `table` declaration makes
all clauses of that predicate demand-driven. Variant calls share work and
recursive consumers resume as answers arrive. Tabling does not guarantee
termination for arbitrary programs. Limits and the playground's Stop button
bound a run.

`fresh(Witness)` is an additional explicit predicate with ordinary Prolog call
syntax. It can only end a forward rule and must bind a new output variable.
It creates an opaque typed witness for that source-rule firing. Source facts
cannot supply witness identities. The certificate checker verifies C8 for
the voucher example:

```sh
./target/release/wheye examples/orders.pl
```

## Keep and independently check evidence

Add `?- why.` after a query to print its certificate, and `?- check.` to
verify that certificate. The orders example includes both:

```sh
./target/release/wheye examples/orders.pl > /tmp/orders.txt
```

There is one proof format, starting with `wheye-proof 1`. It lists supporting
source facts, rule applications, pure decisions, required closed boundaries
and demanded-call patterns, and claims for the preceding ordinary query.
`% Rule` comments show the source rules used; verification uses the supplied
source program. To save a standalone certificate, retain the section starting
at `wheye-proof 1` up to the next request. The Rust API accepts saved evidence
with `Certificate::parse` and `check`; goal-check requests do not become claims.
The checker validates the supplied evidence; it does not call the evaluator,
activate tables, or repair missing facts. C5 recomputes builtins and aggregates.
C6 requires complete finite models and transitively complete demanded calls;
omitting a derivable counterexample cannot establish absence or a smaller
aggregate. C8 checks witnesses, and C9 keeps queries and goal checks out of
inference evidence.

Every report lists C1–C9. Conditions for unused features are not applicable.
The voucher example performs nonzero successful checks under all nine.
Source facts and rules remain assumptions. A valid certificate establishes support
for recorded claims; it does not authenticate facts, establish external-world
truth, or prove that every answer was selected. An empty certificate establishes
no positive claim.

## Use the command line

```sh
wheye FILE...
wheye -
wheye rules.pl data.pl
wheye -h
wheye -v
```

Only `-h` (help) and `-v` (version) are options. `-` reads source from stdin;
multiple files form one program in the supplied order. Source requests select
the output, with each request echoed before its result. Use `?- why.` for
proofs and `?- check.` for verification. `?- check(Goal).` prints a boolean
result. Only `:- table Name/Arity.` directives are supported.

Success returns status 0. Parse errors, incomplete runs, missing preceding
queries for `why` or bare `check`, and invalid proof reports return status 1
with no successful partial stdout. Source fact, rule, and query IDs are
separate ordered lists; keep source file order when checking saved evidence.

## Embed the engine

```rust
use wheye::{check, parse, reason, Limits};
fn main() -> Result<(), wheye::Error> {
    let program = parse("human(socrates). mortal(X):-human(X). ?- mortal(Who).")?;
    let run = reason(&program, Limits::default())?;
    print!("{}", run.output(&program)?);
    let report = check(&program, &run.certificate(&program))?;
    report.require_valid()?;
    Ok(())
}
```

`Run` exposes stored evidence, query answers, counted work, and closed
boundaries. `Certificate::parse` reads saved evidence. `execute` offers the
same string interface as the browser: `execute(source, Limits::default())`. Both `check` and `check_with_limits`
return `Ok(report)` when semantic checking finishes, even for an invalid proof.
Inspect **`report.valid()`** or call **`report.require_valid()?`** before accepting
it. `report.conditions` lists the nine conditions; `report.failures` gives
specific diagnostics. `report.condition(wheye::Condition::C9)` selects one.
Malformed input and resource exhaustion return errors.

## Implementation

`parse` builds the source model. `reason` validates its modes and dependencies,
then evaluates forward rules and demand-driven tables. `Run::output` follows
the source requests.

The checker validates evidence steps, witness origins, claims, closed boundaries,
and relevance. It consumes the supplied certificate and returns condition counts
and failures; it never invokes `reason` or fills a missing boundary.

| File | Responsibility |
| --- | --- |
| `src/model.rs` | Structural values, facts, clauses, and source requests |
| `src/parser.rs` | The `.pl` program syntax |
| `src/language.rs` | Safety, built-in modes, strata, and recursion restrictions |
| `src/semantics.rs` | Unification, built-ins, aggregates, and finite-model matching |
| `src/arithmetic.rs` | Exact integer operations and finite real arithmetic |
| `src/engine.rs` | Indexed forward inference, demand-driven tables, and execution limits |
| `src/output.rs` | Answers, certificates, and reports in source request order |
| `src/proof.rs` | Certificate selection and serialization; independent C1–C9 verification |
| `src/main.rs` | Native command line and file I/O |
| `src/wasm.rs` | Browser bindings |
| `playground*.js` | UI and cancellable worker |
| `scripts/prepare-pages.mjs`, `scripts/pages-layout.html` | Pages staging and documentation layout |
| `.github/workflows/pages.yml` | Website build and deployment |
| `release`, `scripts/sync-version.mjs` | Version bump, browser rebuild, checks, and publication |

## Develop and verify

Rust, Cargo, Node.js 22 or later, `wasm-pack`, and the
`wasm32-unknown-unknown` Rust target are required for the complete checks.

```sh
./scripts/test-all
cargo clippy --target wasm32-unknown-unknown --lib --locked -- -D warnings
./scripts/build-playground
git diff --check
```

`scripts/test-all` describes each check, times every native test and bundled
example, and prints overall timing at the end. Terminal output uses cyan headings,
green passes, and red failures; redirected logs stay plain. Set `NO_COLOR=1` to
disable colors or `FORCE_COLOR=1` to retain them in captured output. The script
continues after failures and returns a nonzero status if any check fails.
Every example must have exactly one
golden in `examples/output/`; the suite also checks its saved certificate and
its expected goal checks. Graph oracles, forged-certificate regressions, worker,
Pages, Gist sharing, and release recovery tests remain covered. Browser and
Wasm smoke tests use small examples; the 100,000-level taxonomy and full airport
graph run natively to avoid exhausting browser memory.

After an intentional output change, regenerate and review the goldens:

```sh
WHEYE_UPDATE_GOLDENS=1 cargo test --release --locked --test examples -- --nocapture
```

```sh
python3 -m http.server 8766 --bind 127.0.0.1
google-chrome --headless --remote-debugging-port=9226 --user-data-dir=/tmp/wheye-browser about:blank
node tests/browser.mjs
```

For layout-only checks, add `--layout-only`. This uses a 200-line input and
240-line output at desktop and phone widths, with reasoning disabled.

The browser engine runs in a worker. Programs remain local unless shared in a
URL. The committed `pkg/` must be rebuilt after Rust changes. Use the same
source version for CLI, documentation, playground, and Wasm.

## Make a release

From a reviewed checkout on `main`:

```sh
./release                         # patch: 0.1.0 → 0.1.1
./release minor                   # minor: 0.1.0 → 0.2.0
./release major                   # major: 0.1.0 → 1.0.0
./release patch "Improve proof diagnostics"
```

The first argument defaults to `patch`. The optional second argument becomes the commit message, annotated tag message, and GitHub release notes; it defaults to `Release v<version>`.

Install [cargo-edit](https://github.com/killercup/cargo-edit), [wasm-pack](https://github.com/drager/wasm-pack), and the [GitHub CLI](https://cli.github.com/), along with Rust, the `wasm32-unknown-unknown` target, and Node.js 22 or later. Sign in once with `gh auth login`. The script needs permission to push `main` and tags and create releases in the `origin` repository.

The script switches to `main`, pulls with `--ff-only`, bumps `Cargo.toml` with `cargo set-version`, and synchronizes the README, guide, specification, and playground version labels. It rebuilds WebAssembly, runs `./scripts/test-all` and Wasm clippy, then commits **all working-tree changes**, creates an annotated `v<version>` tag, pushes the branch and tag together, and creates the GitHub release. Review `git status` and `git diff` first. The push also starts CI and the Pages deployment.

A failed build or check stops before committing or publishing, leaving the local version changes available for inspection. Resolve the failure and finish that version rather than bumping again. If a commit and tag were created but publication stopped, retry only the unfinished steps, substituting the actual tag:

```sh
git push --atomic origin main v0.1.1
git tag --list v0.1.1 --format='%(contents)' |
  gh release create v0.1.1 --title=v0.1.1 --notes-file -
```

Skip the push if it already succeeded, and create the GitHub release only if it is still missing. The release contains GitHub's source archives. A separate tag workflow is not needed.

## Publish the website

The **Deploy GitHub Pages** workflow builds the site on pushes to `main` and can also be started manually. Set the repository's Pages source to **GitHub Actions**. The workflow checks the website and committed WebAssembly package, renders the guide and specification with Jekyll, and deploys the resulting static artifact.

Open the published [guide](https://eyereasoner.github.io/wheye/), [specification](https://eyereasoner.github.io/wheye/SPEC/), or [playground](https://eyereasoner.github.io/wheye/playground/). Documentation links in this repository point to those rendered pages. The `playground.html` route remains available too.

`GUIDE.md` supplies the guide at the site root; `SPEC.md` supplies the specification.
`node scripts/prepare-pages.mjs` prepares `_pages/` for the Jekyll build; `_site/` holds the rendered artifact. Both directories are ignored by Git. The Pages action supplies `PAGES_BASE_PATH`, so local links and assets work beneath `/wheye/` or a different configured prefix. The site uses the committed `pkg/`; changing the package version requires rebuilding it before publishing. The deployment check rejects a browser package whose exported version differs from `Cargo.toml`.



MIT licensed.
