import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtemp, readFile, readdir, rm, stat } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { preparePages } from '../scripts/prepare-pages.mjs';

const root = new URL('../', import.meta.url);

let browser;
function browserEngine() {
  browser ??= (async () => {
    const engine = await import('../pkg/eyepl.js');
    engine.initSync({ module: await readFile(new URL('pkg/eyepl_bg.wasm', root)) });
    return engine;
  })();
  return browser;
}

async function exampleSource(name) {
  return readFile(new URL(`examples/${name}.pl`, root), 'utf8');
}

test('website stages rendered documentation and every playground dependency', async () => {
  const directory = await mkdtemp(join(tmpdir(), 'eyepl-pages-'));
  try {
    await preparePages(directory);
    for (const file of ['index.md', 'GUIDE/index.md', 'SPEC/index.md', 'playground.html', 'playground/index.html',
      'playground.css', 'playground.js', 'playground-worker.js', 'assets/eye.png', 'assets/docs.css',
      'pkg/eyepl.js', 'pkg/eyepl_bg.wasm', 'examples/index.json', 'examples/socrates.pl', 'examples/paths.pl', 'examples/family.pl',
      'examples/values.pl', 'examples/rdf.pl', 'examples/arithmetic.pl', 'examples/negation.pl',
      'examples/aggregation.pl', 'examples/witnesses.pl', 'examples/orders.pl', 'LICENSE.md', '_layouts/default.html']) {
      assert.ok((await stat(join(directory, file))).isFile(), file);
    }
    for (const file of await readdir(new URL('examples/', root))) {
      if (file.endsWith('.pl')) assert.ok((await stat(join(directory, 'examples', file))).isFile(), file);
    }
    for (const file of ['index.md', 'GUIDE/index.md', 'SPEC/index.md']) {
      const document = await readFile(join(directory, file), 'utf8');
      assert.match(document, /^---\nlayout: default\n/);
      assert.doesNotMatch(document, /^# /m, 'The title belongs in the shared header, once.');
      assert.doesNotMatch(document, /\]\((?!https?:)[^)]*\.md(?:#|\))/);
    }
    const readme = await readFile(join(directory, 'index.md'), 'utf8');
    assert.match(readme, /^title: "eyepl"$/m, 'The README is the site root.');
    assert.match(readme, /\]\(\/eyepl\/GUIDE\/\)/);
    assert.match(readme, /\]\(https:\/\/github\.com\/eyereasoner\/eyepl\/blob\/main\/LICENSE\.md\)/);
    const guide = await readFile(join(directory, 'GUIDE/index.md'), 'utf8');
    assert.match(guide, /^title: "eyepl guide"$/m);
    assert.match(guide, /^## Run your first program$/m);
    assert.match(guide, /^## Why eyepl\?$/m);
    for (const id of ['why-a-prolog-subset', 'why-extended-datalog']) {
      assert.ok(guide.includes(`id="${id}"`), 'Older guide links remain supported.');
    }
    assert.match(guide, /\]\(\/eyepl\/SPEC\/#132-proof-conditions\)/);
    assert.match(await readFile(join(directory, 'SPEC/index.md'), 'utf8'), /^title: "eyepl specification"$/m);
    const playground = await readFile(join(directory, 'playground/index.html'), 'utf8');
    assert.match(playground, /<base href="\.\.\/">/);
    assert.match(playground, /href="\/eyepl\/SPEC\/"/);
    assert.doesNotMatch(playground, /href="[^"]*\.md(?:#|")/);
    assert.deepEqual(await readFile(join(directory, 'pkg/eyepl_bg.wasm')), await readFile(new URL('pkg/eyepl_bg.wasm', root)));
    for (const directoryName of ['src', 'target', '.github']) {
      await assert.rejects(stat(join(directory, directoryName)), { code: 'ENOENT' });
    }
  } finally { await rm(directory, { recursive: true, force: true }); }
});

test('documentation and playground links honor root and nested Pages prefixes', async () => {
  for (const base of ['', '/preview/eyepl/']) {
    const directory = await mkdtemp(join(tmpdir(), 'eyepl-prefix-'));
    try {
      await preparePages(directory, base);
      const normalized = base.replace(/\/+$/, '');
      assert.equal(JSON.parse(await readFile(join(directory, '_config.yml'), 'utf8')).baseurl, normalized);
      for (const file of ['index.md', 'GUIDE/index.md', 'SPEC/index.md', 'playground.html']) {
        const text = await readFile(join(directory, file), 'utf8');
        assert.doesNotMatch(text, /(?:\]\(|href=")https:\/\/eyereasoner.github.io\/eyepl\//);
        assert.ok(!text.includes(`<${normalized}/>`), 'Relative URLs must not use Markdown autolink syntax.');
      }
      const spec = await readFile(join(directory, 'SPEC/index.md'), 'utf8');
      assert.ok(spec.includes(`[https://eyereasoner.github.io/eyepl/GUIDE/](${normalized}/GUIDE/)`),
        'The final guide reference must remain a link under every Pages prefix.');
      assert.ok((await readFile(join(directory, 'playground.html'), 'utf8')).includes(`href="${normalized}/SPEC/"`));
    } finally { await rm(directory, { recursive: true, force: true }); }
  }
});

test('specification section and bibliographic references resolve', async () => {
  const spec = await readFile(new URL('SPEC.md', root), 'utf8');
  const sections = new Set([...spec.matchAll(/^#{2,3} (\d+(?:\.\d+)*)(?:\. | )/gm)].map(match => match[1]));
  for (const match of spec.matchAll(/\bSections? (\d+(?:\.\d+)*)/g)) {
    if (spec.slice(match.index - 4, match.index) === 'ISO ') continue;
    assert.ok(sections.has(match[1]), `Unknown specification section ${match[1]}`);
  }
  const references = new Set([...spec.matchAll(/^\[([A-Z][A-Z0-9-]+)\]\n:/gm)].map(match => match[1]));
  for (const match of spec.matchAll(/\[([A-Z][A-Z0-9-]+)\]/g)) {
    assert.ok(references.has(match[1]), `Undefined bibliographic reference ${match[1]}`);
  }
});

// The certificate and report examples are compared natively in tests/proofs.rs.
test('specification result document example matches the checked voucher program', async () => {
  const { runProgram } = await browserEngine();
  const spec = await readFile(new URL('SPEC.md', root), 'utf8');
  const document = [...spec.matchAll(/^```prolog\n([\s\S]*?)^```/gm)]
    .map(match => match[1])
    .find(block => block.includes('% Check 1\n'));
  assert.ok(document, 'The specification needs its result document example.');
  assert.equal(runProgram(await exampleSource('orders')), document);
});

test('committed browser package matches Cargo and performs C1–C9 checking', async () => {
  const { runProgram, version } = await browserEngine();
  const cargo = await readFile(new URL('Cargo.toml', root), 'utf8');
  const expectedVersion = /^version\s*=\s*"([^"]+)"/m.exec(cargo)[1];
  assert.equal(version(), expectedVersion);
  const readme = await readFile(new URL('README.md', root), 'utf8');
  const guide = await readFile(new URL('GUIDE.md', root), 'utf8');
  const spec = await readFile(new URL('SPEC.md', root), 'utf8');
  const playground = await readFile(new URL('playground.html', root), 'utf8');
  assert.ok(readme.includes(`**Version ${expectedVersion}**`));
  assert.ok(guide.includes(`Version **${expectedVersion}**`));
  assert.ok(spec.includes(`Version **${expectedVersion}**`));
  assert.ok(playground.includes(`id="version">${expectedVersion}</strong>`));
  assert.doesNotMatch(playground, /eyepl · version|class="notes"/);
  const source = await exampleSource('socrates');
  const report = runProgram(source);
  assert.match(report, /^proof_check\(1, checked, \[\n {4}steps\(2\),\n {4}claims\(1\),$/m);
  for (let condition = 1; condition <= 9; condition++) assert.match(report, new RegExp(`\\bc${condition},`));
});


test('browser engine checks all nine conditions on the voucher example', async () => {
  const { runProgram } = await browserEngine();
  const output = runProgram(await exampleSource('orders'));
  assert.match(output, /^proof_step\(1, 1, /m);
  assert.match(output, /^proof_check\(1, checked, /m);
  assert.doesNotMatch(output, /not_applicable/);
  for (let condition = 1; condition <= 9; condition++) {
    assert.match(output, new RegExp(`^proof_condition\\(1, c${condition}, "[^"]+", checked\\([1-9][0-9]*, 0\\)\\)\\.$`, 'm'));
  }
});

// Deep scaling and the full airport graph are checked natively.
test('browser engine checks a small taxonomy within default limits', async () => {
  const { runProgram } = await browserEngine();
  const source = await exampleSource('deep-taxonomy-100');
  const output = runProgram(source + '\n?- check.\n');
  assert.match(output, /^is_a\(ind, a2\)\.$/m);
  assert.match(output, /^ {4}steps\(102\),\n {4}claims\(1\),$/m);
  assert.match(output, /^proof_condition\(1, c1, "resolution", checked\(102, 0\)\)\.$/m);
});

test('browser engine executes explicit true and false result requests', async () => {
  const { runProgram } = await browserEngine();
  assert.equal(
    runProgram('p(a). ?- check(p(a)). ?- check(p(b)).'),
    '% Goal check 1\ncheck_result(1, true).\n\n% Goal check 2\ncheck_result(2, false).\n',
  );
  const output = runProgram('p(a). ?- check(p(a)). ?- p(a). ?- why.');
  assert.match(output, /^proof_claim\(2, answer\(2, \[1\]\)\)\.$/m, 'Query IDs also count preceding goal checks.');
});

test('browser arithmetic and certificates follow ISO Corrigenda 1–3', async () => {
  const { runProgram } = await browserEngine();
  const output = runProgram(`
    ?- P is 2.0 ^ (-1), R is round(-2.5), S is sign(-2.5), B is 1 << 2 + 1.
    ?- check.
  `);
  assert.match(output, /binding\("P", 0\.5\),\n {4}binding\("R", -2\),\n {4}binding\("S", -1\.0\),\n {4}binding\("B", 5\)/);
  assert.match(output, /^proof_condition\(1, c5, "re-decision", checked\(4, 0\)\)\.$/m);
  for (const source of ['?- X is 2 ^ (-1).', '?- \\+ (0.5 is 2 ^ (-1)).']) {
    assert.throws(() => runProgram(source), error => /requires a real base/.test(String(error)));
  }
});

test('eyepl aggregates have query-independent scope and forward closure', async () => {
  const { runProgram } = await browserEngine();
  for (const declaration of ['', ':- table total/2.']) {
    const output = runProgram(`${declaration}
      p(a). p(b). q(a).
      total(X,N) :- aggregate_all(count,p(X),N), q(X).
      ?- total(a,N).
      ?- check.
    `);
    assert.match(output, /^total\(a, 2\)\.$/m);
    assert.match(output, /^proof_check\(1, checked, /m);
  }
  assert.equal(runProgram('p(a). p(b). total(N):-aggregate_all(count,p(X),N).'), 'total(2).\n');
  const source = 'p(1). p(2). total(G,N):-aggregate_all(count,p(N),N),G=G.';
  for (const [query, expected] of [['total(g,1)', 'no_answer(1).'], ['total(g,2)', 'total(g, 2).'], ['total(g,N)', 'total(g, 2).']]) {
    const output = runProgram(`${source} ?- ${query}. ?- check.`);
    assert.ok(output.includes(`\n${expected}\n`), output);
    assert.match(output, /^proof_check\(1, checked, /m);
  }
});

test('tabled fresh witnesses have checked source-prefix identities', async () => {
  const { runProgram } = await browserEngine();
  const output = runProgram(`
    :- table ticket/2.
    visitor(ada). visitor(bea).
    ticket(V,W) :- visitor(V), fresh(W).
    ?- ticket(ada,W), \\+ ticket(bea,W).
    ?- check.
  `);
  assert.match(output, /^witness\(w1, W\) :- fresh\(W\)\.$/m);
  assert.match(output, /binding\("W", W1\)\n\]\) :-\n {4}witness\(w1, W1\)\./);
  assert.match(output, /^proof_condition\(1, c8, "witness integrity", checked\([1-9][0-9]*, 0\)\)\.$/m);
});
