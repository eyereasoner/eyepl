// Run the existing checks and summarize their measured results in REPORT.md.
import { spawn } from 'node:child_process';
import { readFile, writeFile } from 'node:fs/promises';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { resolve } from 'node:path';

const root = fileURLToPath(new URL('../', import.meta.url));
const nodeChecks = new Set(['Playground', 'Pages and Wasm', 'Release tooling', 'Test runner']);
const total = rows => rows.reduce((sum, row) => ({
  ok: sum.ok + row.ok, fail: sum.fail + row.fail,
  skipped: sum.skipped + row.skipped, seconds: sum.seconds + row.seconds,
}), { ok: 0, fail: 0, skipped: 0, seconds: 0 });

export function parseResults(output) {
  const checks = [];
  const suites = [];
  const details = [];
  const problems = [];
  let section;
  let native;
  let node;
  let nativeSummary;
  for (const line of output.replace(/\x1b\[[0-9;]*m/g, '').split(/\r?\n/)) {
    let match;
    if ((match = /^=== (.+) ===$/.exec(line))) {
      section = match[1];
      native = undefined;
      node = undefined;
      if (nodeChecks.has(section)) {
        node = { name: section, ok: 0, fail: 0, skipped: 0, seconds: 0, counts: {} };
        suites.push(node);
      }
    } else if ((match = /^(PASS|FAIL) (.+) · (?:exit \d+ · )?([\d.]+) s$/.exec(line))) {
      checks.push({ name: match[2], ok: match[1] === 'PASS' ? 1 : 0,
        fail: match[1] === 'FAIL' ? 1 : 0, skipped: 0, seconds: Number(match[3]) });
      if (node) node.seconds = Number(match[3]);
    } else if (section === 'Native tests and goldens') {
      if ((match = /^# (.+): (\d+) native regression tests$/.exec(line))) {
        native = { name: `Native: ${match[1]}`, ok: 0, fail: 0, skipped: 0,
          seconds: 0, expected: Number(match[2]) };
        suites.push(native);
      } else if (native && (match = /^  (PASS|FAIL) · ([\d.]+) s$/.exec(line))) {
        native[match[1] === 'PASS' ? 'ok' : 'fail']++;
        native.seconds += Number(match[2]);
      } else if ((match = /^Native tests: (\d+) passed, (\d+) failed\.$/.exec(line))) {
        nativeSummary = [Number(match[1]), Number(match[2])];
      } else if ((match = /^    Example .+: (PASS|FAIL) · ([\d.]+) s · golden \+ C1–C9$/.exec(line))) {
        let examples = details.find(row => row.name === 'Example files');
        if (!examples) details.push(examples = { name: 'Example files', ok: 0, fail: 0, skipped: 0, seconds: 0 });
        examples[match[1] === 'PASS' ? 'ok' : 'fail']++;
        examples.seconds += Number(match[2]);
      } else if ((match = /^    (iso|errors|unsupported): \d+ fixtures, (\d+) passing cases, (\d+) failures$/.exec(line))) {
        // A failure here is a fixture failure; the harness stops at its first
        // bad query, so failed-query counts cannot be inferred from this line.
        details.push({ name: `Conformance: ${match[1]}`, ok: Number(match[2]),
          failedFixtures: Number(match[3]) });
      }
    } else if (section === 'API examples' && (match = /^test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;.* finished in ([\d.]+)s$/.exec(line))) {
      suites.push({ name: 'API examples', ok: Number(match[1]), fail: Number(match[2]),
        skipped: Number(match[3]), seconds: Number(match[4]) });
    } else if (node && (match = /^(?:ℹ |# )(tests|pass|fail|cancelled|skipped|todo) (\d+)$/.exec(line))) {
      node.counts[match[1]] = Number(match[2]);
    }
  }
  const nativeTotal = total(suites.filter(row => row.expected !== undefined));
  if (!nativeSummary || nativeSummary[0] !== nativeTotal.ok || nativeSummary[1] !== nativeTotal.fail) {
    problems.push('Native test summary is missing or does not match the individual results.');
  }
  for (const row of suites) {
    if (row.expected !== undefined && row.ok + row.fail !== row.expected) {
      problems.push(`${row.name}: not every discovered test produced a result.`);
    }
    if (row.counts) {
      const c = row.counts;
      row.ok = c.pass ?? 0;
      row.fail = (c.fail ?? 0) + (c.cancelled ?? 0);
      row.skipped = (c.skipped ?? 0) + (c.todo ?? 0);
      if (c.tests === undefined || c.pass === undefined || c.fail === undefined
          || row.ok + row.fail + row.skipped !== c.tests) {
        problems.push(`${row.name}: test counts are missing or inconsistent.`);
      }
    }
  }
  if (!suites.some(row => row.name === 'API examples')) problems.push('API example results are missing.');
  for (const name of nodeChecks) {
    if (!suites.some(row => row.name === name)) problems.push(`${name}: results are missing.`);
  }
  for (const [name, nested] of [
    ['Native: conformance', details.filter(detail => detail.failedFixtures !== undefined)],
    ['Native: examples', details.filter(detail => detail.name === 'Example files')],
  ]) {
    const parent = suites.find(suite => suite.name === name);
    if (parent && (!nested.length || (name === 'Native: conformance' && nested.length !== parent.expected))) {
      problems.push(`${name}: fixture detail is incomplete.`);
    }
  }
  if (checks.length !== 10) problems.push(`Expected 10 pipeline check results, received ${checks.length}.`);
  return { checks, suites, details, problems };
}

export function formatReport(results, { version, generated, status }) {
  const { checks, suites, details, problems } = results;
  const labels = {
    cli: 'CLI', conformance: 'Conformance', examples: 'Examples',
    extended_proofs: 'Extended proofs', extensions: 'Built-ins and aggregates',
    path_discovery: 'Route discovery', prolog: 'Prolog semantics',
    proof_conditions: 'Proof conditions', proofs: 'Basic proofs',
    reasoning: 'Core reasoning', taxonomy: 'Taxonomy',
  };
  let complete = problems.length === 0;
  const rows = suites.map(suite => {
    const row = { ...suite };
    if (suite.name.startsWith('Native: ')) {
      const name = suite.name.slice('Native: '.length);
      row.name = labels[name] ?? name;
      if (name === 'conformance' || name === 'examples') {
        const nested = details.filter(detail => name === 'conformance'
          ? detail.failedFixtures !== undefined : detail.name === 'Example files');
        row.ok = nested.reduce((sum, detail) => sum + detail.ok, 0);
        row.fail = nested.reduce((sum, detail) => sum + (detail.fail ?? 0), 0);
        row.skipped = 0;
        if (!nested.length || (name === 'conformance' && nested.length !== suite.expected)
            || nested.some(detail => detail.failedFixtures)
            || (suite.fail && !nested.some(detail => detail.fail))) {
          row.fail = 'unknown';
          complete = false;
        }
      }
    }
    return row;
  });
  const ok = rows.reduce((sum, row) => sum + row.ok, 0);
  const fail = rows.reduce((sum, row) => sum + (typeof row.fail === 'number' ? row.fail : 0), 0);
  const skipped = rows.reduce((sum, row) => sum + row.skipped, 0);
  const measured = rows.reduce((sum, row) => sum + row.seconds, 0);
  const successful = status === 0 && !checks.some(check => check.fail) && fail === 0 && complete;
  const count = row => typeof row.fail === 'number' ? row.ok + row.fail + row.skipped : 'unknown';
  const lines = [
    '# Test report', '',
    `Wheye **${version}** · ${generated} · **${successful ? 'OK' : 'FAIL'}**`, '',
    '| Suite | Total | OK | FAIL | Elapsed (s) |',
    '| --- | ---: | ---: | ---: | ---: |',
    ...rows.map(row => `| ${row.name.replaceAll('|', '\\|')} | ${count(row)} | ${row.ok} | ${row.fail} | ${row.seconds.toFixed(3)} |`),
    `| **Grand total** | **${complete ? ok + fail + skipped : 'unknown'}** | **${ok}** | **${complete ? fail : 'unknown'}** | **${measured.toFixed(3)}** |`, '',
  ];
  if (skipped) lines.push(`${skipped} skipped tests are included in Total.`, '');
  const failedChecks = checks.filter(check => check.fail).map(check => check.name);
  if (failedChecks.length) lines.push(`Failed checks: ${failedChecks.join(', ')}.`, '');
  if (!complete) lines.push('Incomplete counts: some test results are missing or conformance queries were not executed.', '');
  if (problems.length) lines.push(...problems.map(problem => `- ${problem}`), '');
  return lines.join('\n');
}

async function main() {
  const child = spawn('bash', ['scripts/test-all'], { cwd: root, stdio: ['ignore', 'pipe', 'pipe'] });
  const chunks = [];
  child.stdout.on('data', chunk => { chunks.push(chunk); process.stdout.write(chunk); });
  child.stderr.on('data', chunk => process.stderr.write(chunk));
  const status = await new Promise(resolveStatus => {
    child.on('error', error => { console.error(error.message); resolveStatus(1); });
    child.on('close', code => resolveStatus(code ?? 1));
  });
  const results = parseResults(Buffer.concat(chunks).toString('utf8'));
  const cargo = await readFile(new URL('../Cargo.toml', import.meta.url), 'utf8');
  const version = /^version\s*=\s*"([^"]+)"/m.exec(cargo)[1];
  await writeFile(new URL('../REPORT.md', import.meta.url), formatReport(results, {
    version, generated: new Date().toISOString(), status,
  }));
  console.log('\nWrote REPORT.md.');
  process.exitCode = status || (results.problems.length || results.suites.some(row => row.fail)
    || results.checks.some(row => row.fail) ? 1 : 0);
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) await main();
