import test from 'node:test';
import assert from 'node:assert/strict';
import { copyFile, mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { syncVersion } from '../scripts/sync-version.mjs';

const root = new URL('../', import.meta.url);
const documents = {
  'Cargo.toml': '[package]\nname = "eyepl"\nversion = "0.1.0"\n',
  'README.md': '**Version 0.1.0**\n',
  'GUIDE.md': 'Version **0.1.0**.\n',
  'SPEC.md': 'Version **0.1.0**.\n',
  'playground.html': '<strong id="version">0.1.0</strong>\n',
};

// Real local Git repositories exercise commits, annotated tags, and atomic pushes.
// Only Cargo/build checks and the external GitHub service are replaced.
async function fixture(t) {
  const directory = await mkdtemp(join(tmpdir(), 'eyepl-release-'));
  t.after(() => rm(directory, { recursive: true, force: true }));
  const work = join(directory, 'work');
  const remote = join(directory, 'remote.git');
  const bin = join(directory, 'bin');
  await mkdir(bin);
  const run = (command, args, options = {}) => spawnSync(command, args, {
    cwd: work, encoding: 'utf8', ...options,
  });
  const git = (...args) => {
    const result = run('git', args);
    assert.equal(result.status, 0, result.stderr);
    return result.stdout.trim();
  };
  assert.equal(run('git', ['init', '--bare', '--initial-branch=main', remote], { cwd: directory }).status, 0);
  assert.equal(run('git', ['clone', remote, work], { cwd: directory }).status, 0);
  git('config', 'user.name', 'Release Test');
  git('config', 'user.email', 'release@example.invalid');
  await mkdir(join(work, 'scripts'));
  for (const [file, text] of Object.entries(documents)) await writeFile(join(work, file), text);
  await writeFile(join(work, 'REPORT.md'), 'Stale report for 0.1.0\n');
  await copyFile(new URL('release', root), join(work, 'release'));
  await copyFile(new URL('scripts/sync-version.mjs', root), join(work, 'scripts/sync-version.mjs'));
  const driver = join(directory, 'driver.mjs');
  const log = join(directory, 'calls.jsonl');
  await writeFile(driver, `
import { appendFileSync, readFileSync, writeFileSync, mkdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
const [kind, ...args] = process.argv.slice(2);
appendFileSync(process.env.EYEPL_TEST_LOG, JSON.stringify({ kind, args }) + '\\n');
if (process.env.EYEPL_TEST_FAIL === kind ||
    process.env.EYEPL_TEST_FAIL === kind + ':' + args[0]) process.exit(1);
if (kind === 'cargo' && args[0] === 'set-version' && args[1] === '--bump') {
  const cargo = readFileSync('Cargo.toml', 'utf8');
  const [major, minor, patch] = /version = "(\\d+)\\.(\\d+)\\.(\\d+)"/.exec(cargo).slice(1).map(Number);
  const next = { patch: [major, minor, patch + 1], minor: [major, minor + 1, 0], major: [major + 1, 0, 0] }[args[2]].join('.');
  writeFileSync('Cargo.toml', cargo.replace(/version = "[^"]+"/, 'version = "' + next + '"'));
}
if (kind === 'build') {
  const version = /version = "([^"]+)"/.exec(readFileSync('Cargo.toml', 'utf8'))[1];
  for (const file of ['README.md', 'GUIDE.md', 'SPEC.md', 'playground.html']) {
    if (!readFileSync(file, 'utf8').includes(version)) throw Error('Unsynchronized ' + file);
  }
  mkdirSync('pkg', { recursive: true });
  writeFileSync('pkg/build-version.txt', version);
}
if (kind === 'report') {
  execFileSync(process.execPath, [process.env.EYEPL_TEST_DRIVER, 'checks'], { stdio: 'inherit' });
  const version = /version = "([^"]+)"/.exec(readFileSync('Cargo.toml', 'utf8'))[1];
  writeFileSync('REPORT.md', '# Test report\\n\\nFresh report for ' + version + '\\n');
}
if (kind === 'gh' && args[0] === 'release') {
  // The remote tag must already exist before GitHub Release creation.
  execFileSync('git', ['ls-remote', '--exit-code', 'origin', 'refs/tags/' + args[2]]);
}
`);
  for (const command of ['cargo', 'gh', 'wasm-pack']) {
    await writeFile(join(bin, command), `#!/usr/bin/env bash\nexec node "$EYEPL_TEST_DRIVER" ${command} "$@"\n`, { mode: 0o755 });
  }
  for (const [script, kind] of [['build-playground', 'build'], ['test-all', 'checks']]) {
    await writeFile(join(work, 'scripts', script), `#!/usr/bin/env bash\nexec node "$EYEPL_TEST_DRIVER" ${kind} "$@"\n`, { mode: 0o755 });
  }
  await writeFile(join(work, 'scripts/test-report.mjs'), `
import { spawnSync } from 'node:child_process';
const result = spawnSync(process.execPath, [process.env.EYEPL_TEST_DRIVER, 'report'], { stdio: 'inherit' });
process.exit(result.status ?? 1);
`);
  git('add', '-A');
  git('commit', '-m', 'Initial version');
  git('push', 'origin', 'main');
  const initial = git('rev-parse', 'HEAD');
  const env = { ...process.env, PATH: `${bin}:${process.env.PATH}`, EYEPL_TEST_DRIVER: driver, EYEPL_TEST_LOG: log };
  return {
    work, remote, initial, git,
    release: (args = [], extra = {}) => run('bash', ['./release', ...args], { env: { ...env, ...extra } }),
    calls: async () => (await readFile(log, 'utf8').catch(() => '')).trim().split('\n').filter(Boolean).map(JSON.parse),
  };
}

for (const [args, version] of [[[], '0.1.1'], [['patch'], '0.1.1'], [['minor'], '0.2.0'], [['major'], '1.0.0']]) {
  test(`release ${args[0] ?? '(default)'} synchronizes, verifies, and publishes one version`, async t => {
    const f = await fixture(t);
    await writeFile(join(f.work, 'feature.pl'), 'fact(added).\n');
    const result = f.release(args);
    assert.equal(result.status, 0, result.stderr);
    const tag = `v${version}`;
    assert.equal(f.git('status', '--porcelain'), '');
    assert.equal(f.git('cat-file', '-t', tag), 'tag');
    assert.equal(f.git('log', '-1', '--format=%s'), `Release ${tag}`);
    assert.equal(f.git('--git-dir', f.remote, 'rev-parse', 'main'), f.git('rev-parse', 'HEAD'));
    assert.equal(f.git('--git-dir', f.remote, 'rev-parse', tag), f.git('rev-parse', tag));
    assert.equal(f.git('show', `${tag}:feature.pl`), 'fact(added).');
    for (const file of ['README.md', 'GUIDE.md', 'SPEC.md', 'playground.html', 'pkg/build-version.txt', 'REPORT.md']) {
      assert.ok((await readFile(join(f.work, file), 'utf8')).includes(version), file);
    }
    assert.equal(f.git('show', `${tag}:REPORT.md`), `# Test report\n\nFresh report for ${version}`);
    const calls = await f.calls();
    assert.equal(calls.filter(c => c.kind === 'report').length, 1);
    assert.equal(calls.filter(c => c.kind === 'checks').length, 1);
    assert.ok(calls.findIndex(c => c.kind === 'build') < calls.findIndex(c => c.kind === 'report'));
    assert.ok(calls.findIndex(c => c.kind === 'report') < calls.findIndex(c => c.kind === 'cargo' && c.args[0] === 'clippy'));
    assert.deepEqual(calls.find(c => c.kind === 'cargo' && c.args[0] === 'clippy').args,
      ['clippy', '--target', 'wasm32-unknown-unknown', '--lib', '--locked', '--', '-D', 'warnings']);
    assert.deepEqual(calls.at(-1), { kind: 'gh', args: ['release', 'create', tag, `--title=${tag}`, `--notes=Release ${tag}`] });
  });
}

test('release preserves multiline messages and literal shell characters', async t => {
  const f = await fixture(t);
  const message = 'Improve checking\n\nKeep $(touch injected) and `touch injected-too` literal.';
  assert.equal(f.release(['patch', message]).status, 0);
  assert.equal(f.git('log', '-1', '--format=%B'), message);
  assert.equal(f.git('tag', '--list', 'v0.1.1', '--format=%(contents)'), message);
  assert.ok((await f.calls()).at(-1).args.includes(`--notes=${message}`));
  assert.equal(f.git('status', '--porcelain'), '');
});

test('help and invalid arguments leave the repository untouched', async t => {
  const f = await fixture(t);
  assert.equal(f.release(['--help']).status, 0);
  for (const args of [['other'], ['patch', 'message', 'extra'], ['patch', ' \t\n']]) {
    assert.notEqual(f.release(args).status, 0);
  }
  assert.deepEqual(await f.calls(), []);
  assert.equal(f.git('rev-parse', 'HEAD'), f.initial);
  assert.equal(f.git('status', '--porcelain'), '');
});

for (const failure of ['gh:auth', 'build', 'report', 'checks', 'cargo:clippy']) {
  test(`${failure} failure prevents commit, tag, and publication`, async t => {
    const f = await fixture(t);
    assert.notEqual(f.release([], { EYEPL_TEST_FAIL: failure }).status, 0);
    assert.equal(f.git('rev-parse', 'HEAD'), f.initial);
    assert.equal(f.git('tag'), '');
    assert.equal(f.git('--git-dir', f.remote, 'rev-parse', 'main'), f.initial);
    assert.ok(!(await f.calls()).some(c => c.kind === 'gh' && c.args[0] === 'release'));
    if (failure === 'report' || failure === 'checks') {
      assert.equal(await readFile(join(f.work, 'REPORT.md'), 'utf8'), 'Stale report for 0.1.0\n');
    }
    if (failure === 'gh:auth') assert.equal(f.git('status', '--porcelain'), '');
  });
}

test('a rejected push cannot create a GitHub release', async t => {
  const f = await fixture(t);
  await writeFile(join(f.remote, 'hooks/pre-receive'), '#!/bin/sh\nexit 1\n', { mode: 0o755 });
  assert.notEqual(f.release().status, 0);
  assert.equal(f.git('--git-dir', f.remote, 'rev-parse', 'main'), f.initial);
  assert.equal(f.git('--git-dir', f.remote, 'tag'), '');
  assert.ok(!(await f.calls()).some(c => c.kind === 'gh' && c.args[0] === 'release'));
});

test('GitHub failure reports recovery after the branch and tag are pushed', async t => {
  const f = await fixture(t);
  const result = f.release([], { EYEPL_TEST_FAIL: 'gh:release' });
  assert.notEqual(result.status, 0);
  assert.match(result.stderr, /Retry that step; do not bump again/);
  assert.equal(f.git('--git-dir', f.remote, 'tag'), 'v0.1.1');
});

test('version syncing validates every marker before changing any document', async t => {
  const directory = await mkdtemp(join(tmpdir(), 'eyepl-version-'));
  t.after(() => rm(directory, { recursive: true, force: true }));
  for (const [file, text] of Object.entries(documents)) await writeFile(join(directory, file), text);
  await writeFile(join(directory, 'Cargo.toml'), documents['Cargo.toml'].replace('0.1.0', '2.3.4'));
  const versioned = ['README.md', 'GUIDE.md', 'SPEC.md', 'playground.html'];
  for (const file of versioned) {
    for (const marker of ['', documents[file] + documents[file]]) {
      await writeFile(join(directory, file), marker);
      await assert.rejects(syncVersion(directory), error => error.message.startsWith(`Expected one version marker in ${file};`));
      for (const other of versioned.filter(other => other !== file)) {
        assert.equal(await readFile(join(directory, other), 'utf8'), documents[other]);
      }
      await writeFile(join(directory, file), documents[file]);
    }
  }
  assert.equal(await syncVersion(directory), '2.3.4');
  assert.equal(await syncVersion(directory), '2.3.4');
  for (const file of Object.keys(documents)) assert.ok((await readFile(join(directory, file), 'utf8')).includes('2.3.4'));
});
