// Stable libtest has no individual timing output. Build once, then time each case.
import { spawn, spawnSync } from 'node:child_process';
import { createInterface } from 'node:readline';
import { performance } from 'node:perf_hooks';

const useColor = process.env.NO_COLOR === undefined && (
  process.env.WHEYE_TEST_COLOR === '1' || process.stdout.isTTY ||
  (process.env.FORCE_COLOR !== undefined && process.env.FORCE_COLOR !== '0')
);
const color = (code, text) => useColor ? `\x1b[${code}m${text}\x1b[0m` : text;
const verdict = passed => color(passed ? '32' : '31', passed ? 'PASS' : 'FAIL');

const built = spawnSync('cargo', ['test', '--release', '--locked', '--no-run', '--message-format=json'],
  { encoding: 'utf8', stdio: ['ignore', 'pipe', 'inherit'], maxBuffer: 64 * 1024 * 1024 });
const executables = new Map();
for (const line of (built.stdout || '').split('\n').filter(Boolean)) {
  const event = JSON.parse(line);
  if (event.reason === 'compiler-message') process.stderr.write(event.message.rendered || '');
  if (event.reason === 'compiler-artifact' && event.profile.test && event.executable) {
    executables.set(event.executable, event.target.name);
  }
}
if (built.error) console.error(built.error.message);
if (built.status !== 0) process.exit(built.status || 1);
if (!executables.size) {
  console.error('Cargo did not produce any native test executables.');
  process.exit(1);
}
let passed = 0;
let failed = 0;
for (const [executable, suite] of [...executables].sort((a, b) => a[1].localeCompare(b[1]))) {
  const listed = spawnSync(executable, ['--list'], { encoding: 'utf8' });
  if (listed.status !== 0) {
    process.stderr.write(listed.stderr || listed.stdout);
    failed++;
    continue;
  }
  const names = [...listed.stdout.matchAll(/^(.+): test$/gm)].map(match => match[1]);
  if (!names.length) continue;
  console.log(`\n${color('1;36', `# ${suite}: ${names.length} native regression tests`)}`);
  for (const name of names) {
    console.log(`  ${suite}::${name}`);
    const started = performance.now();
    const child = spawn(executable, ['--exact', name, '--nocapture', '--format', 'terse'], { stdio: ['ignore', 'pipe', 'pipe'] });
    const lines = createInterface({ input: child.stdout });
    lines.on('line', line => {
      if (line && !/^(running \d+ tests?$|test result:|\.$|test .* \.\.\. (ok|FAILED)$)/.test(line)) {
        const example = line.replace(/^(Example [^:]+: )(PASS|FAIL)/, (_, prefix, status) => prefix + verdict(status === 'PASS'));
        console.log(`    ${example}`);
      }
    });
    child.stderr.pipe(process.stderr, { end: false });
    const status = await new Promise(resolve => {
      child.on('error', error => { console.error(error.message); resolve(1); });
      child.on('close', code => resolve(code ?? 1));
    });
    if (status === 0) passed++; else failed++;
    console.log(`  ${verdict(status === 0)} · ${color('2', `${((performance.now() - started) / 1000).toFixed(3)} s`)}`);
  }
}
console.log(`\n${color(failed ? '1;31' : '1;32', `Native tests: ${passed} passed, ${failed} failed.`)}`);
process.exitCode = failed ? 1 : 0;
