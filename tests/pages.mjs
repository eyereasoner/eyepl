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
    const engine = await import('../pkg/wheye.js');
    engine.initSync({ module: await readFile(new URL('pkg/wheye_bg.wasm', root)) });
    return engine;
  })();
  return browser;
}

async function exampleSource(name) {
  return readFile(new URL(`examples/${name}.pl`, root), 'utf8');
}

test('website stages rendered documentation and every playground dependency', async () => {
  const directory = await mkdtemp(join(tmpdir(), 'wheye-pages-'));
  try {
    await preparePages(directory);
    for (const file of ['index.md', 'SPEC/index.md', 'playground.html', 'playground/index.html',
      'playground.css', 'playground.js', 'playground-worker.js', 'assets/eye.png', 'assets/docs.css',
      'pkg/wheye.js', 'pkg/wheye_bg.wasm', 'examples/index.json', 'examples/socrates.pl', 'examples/paths.pl', 'examples/family.pl',
      'examples/values.pl', 'examples/rdf.pl', 'examples/arithmetic.pl', 'examples/negation.pl',
      'examples/aggregation.pl', 'examples/witnesses.pl', 'examples/orders.pl', 'LICENSE.md', '_layouts/default.html']) {
      assert.ok((await stat(join(directory, file))).isFile(), file);
    }
    for (const file of await readdir(new URL('examples/', root))) {
      if (file.endsWith('.pl')) assert.ok((await stat(join(directory, 'examples', file))).isFile(), file);
    }
    for (const file of ['index.md', 'SPEC/index.md']) {
      const document = await readFile(join(directory, file), 'utf8');
      assert.match(document, /^---\nlayout: default\n/);
      assert.doesNotMatch(document, /^# /m, 'The title belongs in the shared header, once.');
      assert.doesNotMatch(document, /\]\([^)]*\.md(?:#|\))/);
    }
    const guide = await readFile(join(directory, 'index.md'), 'utf8');
    assert.match(guide, /^title: "Wheye guide"$/m);
    assert.match(guide, /^## Run your first program$/m);
    assert.match(guide, /\]\(\/wheye\/SPEC\/#8-verification\)/);
    assert.match(await readFile(join(directory, 'SPEC/index.md'), 'utf8'), /^title: "Wheye specification"$/m);
    const playground = await readFile(join(directory, 'playground/index.html'), 'utf8');
    assert.match(playground, /<base href="\.\.\/">/);
    assert.match(playground, /href="\/wheye\/SPEC\/"/);
    assert.doesNotMatch(playground, /href="[^"]*\.md(?:#|")/);
    assert.deepEqual(await readFile(join(directory, 'pkg/wheye_bg.wasm')), await readFile(new URL('pkg/wheye_bg.wasm', root)));
    for (const directoryName of ['src', 'target', '.github']) {
      await assert.rejects(stat(join(directory, directoryName)), { code: 'ENOENT' });
    }
  } finally { await rm(directory, { recursive: true, force: true }); }
});

test('documentation and playground links honor root and nested Pages prefixes', async () => {
  for (const base of ['', '/preview/wheye/']) {
    const directory = await mkdtemp(join(tmpdir(), 'wheye-prefix-'));
    try {
      await preparePages(directory, base);
      const normalized = base.replace(/\/+$/, '');
      assert.equal(JSON.parse(await readFile(join(directory, '_config.yml'), 'utf8')).baseurl, normalized);
      for (const file of ['index.md', 'SPEC/index.md', 'playground.html']) {
        const text = await readFile(join(directory, file), 'utf8');
        assert.doesNotMatch(text, /https:\/\/eyereasoner.github.io\/wheye\//);
      }
      assert.ok((await readFile(join(directory, 'playground.html'), 'utf8')).includes(`href="${normalized}/SPEC/"`));
    } finally { await rm(directory, { recursive: true, force: true }); }
  }
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
  assert.ok(playground.includes(`id="version">v${expectedVersion}</span>`));
  assert.doesNotMatch(playground, /wheye · version|class="notes"/);
  const source = await exampleSource('socrates');
  const report = runProgram(source);
  assert.match(report, /^checked: 2 steps, 1 claim/m);
  for (let condition = 1; condition <= 9; condition++) assert.match(report, new RegExp(`C${condition} `));
});


test('browser engine checks all nine conditions on the voucher example', async () => {
  const { runProgram } = await browserEngine();
  const output = runProgram(await exampleSource('orders'));
  assert.match(output, /^wheye-proof 1/m);
  assert.match(output, /^checked:/m);
  assert.doesNotMatch(output, /not applicable/);
  for (let condition = 1; condition <= 9; condition++) {
    assert.match(output, new RegExp(`C${condition} [^\\n]+: [1-9][0-9]* checked, 0 failed`));
  }
});

// Deep scaling and the full airport graph are checked natively.
test('browser engine checks a small taxonomy within default limits', async () => {
  const { runProgram } = await browserEngine();
  const source = await exampleSource('deep-taxonomy-100');
  const output = runProgram(source + '\n?- check.\n');
  assert.match(output, /Who = ind/);
  assert.match(output, /^checked: 102 steps, 1 claim/m);
  assert.match(output, /C1 resolution: 102 checked, 0 failed/);
});

test('browser engine executes explicit true and false result requests', async () => {
  const { runProgram } = await browserEngine();
  assert.equal(
    runProgram('p(a). ?- check(p(a)). ?- check(p(b)).'),
    '?- check(p(a)).\ntrue.\n\n?- check(p(b)).\nfalse.\n',
  );
});
