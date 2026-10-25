# Working on wheye

Wheye is a small Rust relational reasoner with a native CLI and a WebAssembly
playground. Describe implemented behavior and distinguish it from design goals.
Keep diagnostics specific and user-facing text direct.

## Repository map

- All Rust files live directly in `src/`: `model.rs` holds values and clauses; `arithmetic.rs` handles pure numeric evaluation;
  `parser.rs` parses `.pl`; `engine.rs` evaluates; `proof.rs` generates and
  checks certificates. `language.rs` validates modes and strata; `semantics.rs`
  supplies pure built-ins, aggregates, and finite-model matching. `output.rs` renders
  requests; `lib.rs` exposes the API, `main.rs` the CLI, and `wasm.rs` the browser bridge.
- `examples/*.pl`: runnable programs with clear header comments describing
  the situation, result, and language feature. Do not mention project provenance.
  Start with a short title, a `%` separator, and an introduction for a wide audience.
  Label request groups `% Answer`, `% Reason`, or `% Check`, with a blank line
  before each heading; use only the sections the program actually requests.
  After editing them, run `node scripts/index-examples.mjs` to update fingerprints
  used for short share links and restoring older bundled examples.
  `examples/output/*.txt` are exact golden transcripts for every program;
  update intentional output changes with `WHEYE_UPDATE_GOLDENS=1 cargo test
  --release --locked --test examples -- --nocapture` and review their diffs.
- `tests/`: language, CLI, proof, worker, Pages, browser, and release checks.
- `benches/taxonomy.rs`: standalone taxonomy timing benchmark.
- `playground.html`, `playground.css`, `playground.js`, `playground-worker.js`:
  browser UI and cancellable worker. `pkg/` is the committed WebAssembly build.
- `README.md`: brief project entry point. `GUIDE.md`: the full guide at the Pages
  site root. `SPEC.md`: language and proof contract.
- `scripts/`: checks, browser build, Pages staging, version label syncing, and
  reproducible taxonomy generation and scaling measurements.
  `release`: release entry point. `.github/workflows/`: CI and Pages deployment.

## Language and proofs

Read `SPEC.md` before changing language or proof behavior. Wheye implements a
Prolog subset with structural terms, lists, exact integers, finite real arithmetic,
stratified negation, aggregate_all/3, demand-driven tabling, source-selected goal checks, proof certificates,
and final-rule fresh/1 witnesses. Keep pure decisions out of ordinary indexes.
Unification must perform an occurs check. Do not silently coerce numeric or text
term types. Queries and goal checks select output and never become inference evidence.

Preserve the C1–C9 contract. C5 re-decides built-ins and aggregates. C6 verifies
complete closed prefixes and transitive demanded-call graphs, including omitted derivable facts; a scan of
only the displayed proof facts is insufficient. C8 verifies typed witnesses tied
to one rule firing. Keep auxiliary decisions out of ordinary relation indexes.
All nine checks must execute on `examples/orders.pl`. Feature-free programs may
report the corresponding conditions not applicable.

The checker must not call the evaluator or fill gaps in a supplied boundary.
Source facts and rules are assumed; acceptance establishes recorded claims, not
answer completeness or external-world truth. `Ok(report)` can contain semantic
failures: library callers must inspect `Report::valid()` or use `require_valid()`.
`check_with_limits` bounds evidence size and finite-model matching work.

Keep the core small and direct; optimize with measurements. New semantic features
need an explicit design and matching changes to the checker and specification.

Every meaningful behavior change needs a focused regression. Every proof-checking
change needs a forged certificate the checker rejects. Preserve the exhaustive
small-graph oracle test. Keep implementation, specification, and examples consistent.

## Verification

```sh
cargo build --release --locked
./target/release/wheye examples/socrates.pl
./target/release/wheye examples/orders.pl
./scripts/test-all
cargo clippy --target wasm32-unknown-unknown --lib --locked -- -D warnings
./scripts/build-playground
git diff --check
```

Use focused tests while working, then run `./scripts/test-all` for code changes.
It checks formatting, Rust tests, native clippy, API docs, the browser worker,
Pages, and release tooling. Node.js 22 or later is required. Browser changes also
need a real browser check at desktop and phone widths; `tests/browser.mjs`
automates it through Chrome's debugging interface (see the guide).
Keep browser and Wasm smoke tests small (taxonomy depth 100 or less). Run the
100,000-level taxonomy and full airport graph only in native tests; do not run
them in Chrome or retain their Wasm heaps across browser tests.
For layout changes, use `tests/browser.mjs --layout-only` with the usual URL
arguments. It uses a small synthetic sample and disables reasoning workers.

Rebuild `pkg/` after Rust changes, and run Wasm clippy. The build requires
`wasm-pack` and the `wasm32-unknown-unknown` Rust target. Documentation-only changes
need a review and `git diff --check`; run Pages tests when changing website links
or staging. Avoid new dependencies or machinery without a concrete need.

Keep the packaged deep taxonomies through depth 100,000 working within default
limits. `node scripts/generate-taxonomy.mjs --check` verifies the generated
examples. `./scripts/bench-taxonomy` measures each pipeline phase with three-run
medians; run it on a quiet machine without concurrent builds. Regression tests
bound counted work and proof size, never wall-clock time. Large certificates and
results should be redirected to files rather than printed in full.

## Website

`scripts/prepare-pages.mjs` stages the guide, specification, playground, and assets
in `_pages/`. The Pages workflow renders Jekyll into `_site/` and deploys it on
pushes to `main`. Both output directories are ignored.

Keep documentation links pointed at rendered Pages URLs; code and example links
can point at GitHub. Preserve the configured base path (normally `/wheye/`),
`/playground/`, and `playground.html`. Run `node tests/pages.mjs` and verify the
rendered site in a browser after website changes. Version tests require the
committed Wasm, README, guide, specification, and playground to match
`Cargo.toml`.

## Versions and releases

Follow the user's instructions for committing, pushing, and releasing. Commit to
`main`. Review the complete working tree before committing or releasing.
`Cargo.toml` is the version source; use the release script instead of bumping it
by hand:

```sh
./release                         # defaults to patch
./release patch "Release message"
./release minor
./release major
```

The optional message defaults to `Release v<version>`. The script switches to
`main`, pulls with `--ff-only`, bumps with `cargo set-version` (cargo-edit), syncs
version labels, rebuilds `pkg/`, runs checks, stages every change, commits, creates
an annotated tag, pushes branch and tag atomically, and creates a GitHub release
with `gh`. It needs authenticated Git and GitHub CLI access. No release workflow
is needed; a push to `main` runs CI and deploys Pages.

If a release fails, inspect which steps completed and finish that version; do not
blindly bump again. The guide documents publication recovery. Release tests use
temporary local repositories and a fake GitHub service, with no publication.
