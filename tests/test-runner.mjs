import test from 'node:test';
import assert from 'node:assert/strict';
import { copyFile, mkdir, mkdtemp, readFile, rm, writeFile } from 'node:fs/promises';
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

async function fixture(t) {
  const directory = await mkdtemp(join(tmpdir(), 'wheye-runner-'));
  t.after(() => rm(directory, { recursive: true, force: true }));
  const bin = join(directory, 'bin');
  await mkdir(bin);
  return { directory, bin, env: { ...process.env, NO_COLOR: '1', PATH: `${bin}:${process.env.PATH}` } };
}

async function checksFixture(t) {
  const setup = await fixture(t);
  const { directory, bin, env } = setup;
  await mkdir(join(directory, 'scripts'));
  await copyFile(new URL('../scripts/test-all', import.meta.url), join(directory, 'scripts/test-all'));
  const log = join(directory, 'calls');
  env.WHEYE_RUNNER_LOG = log;
  for (const command of ['cargo', 'node']) {
    await writeFile(join(bin, command), `#!/usr/bin/env bash\nprintf '${command} %s\\n' "$*" >> "$WHEYE_RUNNER_LOG"\n${command === 'cargo' ? 'if [[ $1 == fmt ]]; then exit 7; fi' : ''}\n`, { mode: 0o755 });
  }
  return { ...setup, log };
}

test('test-all reports failure, continues later checks, and prints overall timing', async t => {
  const { directory, env, log } = await checksFixture(t);
  const result = spawnSync('bash', ['scripts/test-all'], { cwd: directory, env, encoding: 'utf8' });
  assert.equal(result.status, 1, result.stderr);
  assert.match(result.stdout, /FAIL Formatting · exit 7 · \d+\.\d{2} s/);
  assert.match(result.stdout, /PASS Test runner · \d+\.\d{2} s/);
  assert.match(result.stdout, /Checks: 9 passed, 1 failed · \d+\.\d{2} s total/);
  const calls = (await readFile(log, 'utf8')).trim().split('\n');
  assert.equal(calls.length, 10);
  assert.equal(calls.at(-1), 'node tests/test-runner.mjs');
});

test('check colors can be forced, stay out of piped logs, and respect NO_COLOR', async t => {
  const { directory, env } = await checksFixture(t);
  delete env.NO_COLOR;
  delete env.FORCE_COLOR;
  const run = () => spawnSync('bash', ['scripts/test-all'], { cwd: directory, env, encoding: 'utf8' });
  const plain = run();
  assert.equal(plain.status, 1, plain.stderr);
  assert.ok(!plain.stdout.includes('\x1b['));

  env.FORCE_COLOR = '1';
  const colored = run();
  assert.equal(colored.status, 1, colored.stderr);
  assert.ok(colored.stdout.includes('\x1b[1;36m=== Formatting ===\x1b[0m'));
  assert.ok(colored.stdout.includes('\x1b[32mPASS\x1b[0m'));
  assert.ok(colored.stdout.includes('\x1b[31mFAIL\x1b[0m'));

  env.NO_COLOR = '';
  const disabled = run();
  assert.equal(disabled.status, 1, disabled.stderr);
  assert.ok(!disabled.stdout.includes('\x1b['));
});

test('native test timing reports failed cases and still executes later cases', async t => {
  const { directory, bin, env } = await fixture(t);
  const executable = join(bin, 'regressions');
  await writeFile(executable, '#!/usr/bin/env bash\nif [[ $1 == --list ]]; then printf "fails: test\\npasses: test\\n"; exit 0; fi\nif [[ $2 == fails ]]; then printf "regression failed\\n" >&2; exit 2; fi\n', { mode: 0o755 });
  const event = JSON.stringify({ reason: 'compiler-artifact', profile: { test: true }, executable, target: { name: 'probe' } });
  await writeFile(join(bin, 'cargo'), `#!/usr/bin/env bash\ncat <<'JSON'\n${event}\nJSON\n`, { mode: 0o755 });
  const result = spawnSync(process.execPath, [new URL('../scripts/test-rust.mjs', import.meta.url).pathname],
    { cwd: directory, env, encoding: 'utf8' });
  assert.equal(result.status, 1);
  assert.ok(result.stdout.includes('probe::fails'), result.stderr);
  assert.match(result.stdout, /probe::fails[\s\S]*FAIL · \d+\.\d{3} s[\s\S]*probe::passes[\s\S]*PASS · \d+\.\d{3} s/);
  assert.match(result.stdout, /Native tests: 1 passed, 1 failed/);
  assert.match(result.stderr, /regression failed/);

  delete env.NO_COLOR;
  env.FORCE_COLOR = '1';
  const colored = spawnSync(process.execPath, [new URL('../scripts/test-rust.mjs', import.meta.url).pathname],
    { cwd: directory, env, encoding: 'utf8' });
  assert.equal(colored.status, 1, colored.stderr);
  assert.ok(colored.stdout.includes('\x1b[32mPASS\x1b[0m'));
  assert.ok(colored.stdout.includes('\x1b[31mFAIL\x1b[0m'));
});

test('native build failures retain the compiler diagnostic and exit code', async t => {
  const { directory, bin, env } = await fixture(t);
  const event = JSON.stringify({reason:'compiler-message', message:{rendered:'specific compiler diagnostic\n'}});
  await writeFile(join(bin, 'cargo'), `#!/usr/bin/env bash\ncat <<'JSON'\n${event}\nJSON\nexit 9\n`, {mode:0o755});
  const result = spawnSync(process.execPath, [new URL('../scripts/test-rust.mjs', import.meta.url).pathname],
    {cwd:directory, env, encoding:'utf8'});
  assert.equal(result.status,9);
  assert.match(result.stderr,/specific compiler diagnostic/);
});
