const $ = id => document.getElementById(id);
const examples = new Set(['abstract-interpretation', 'access-control-policy', 'ackermann', 'age', 'aggregation', 'agri-drought-relief', 'animals', 'arithmetic', 'battery-dispatch', 'bayes-diagnosis', 'beam-deflection', 'binomial-vandermonde', 'braking-distance', 'buck-converter-design', 'canary-release', 'catalan-convolution', 'collatz', 'competitive-enzyme-kinetics', 'complex', 'continued-fraction-sqrt2', 'control-system', 'critical-path-schedule', 'dairy-energy-balance', 'data-quality-audit', 'declarative-fault-localization', 'deep-taxonomy-10', 'deep-taxonomy-100', 'deep-taxonomy-1000', 'deep-taxonomy-10000', 'deep-taxonomy-100000', 'delfour', 'deontic-logic', 'dijkstra', 'dog-license', 'drone-corridor-planner', 'easter', 'electrical-rc-filter', 'examiners', 'explainable-ev-depot-configuration', 'expression-eval', 'family', 'family-cousins', 'fft8-numeric', 'fibonacci', 'field-nitrogen-balance', 'flute-puzzle', 'french-cities', 'friends', 'fundamental-theorem-arithmetic', 'gcd-bezout-identity', 'goldbach', 'good-cobbler', 'gps', 'grammar', 'gray-code-counter', 'hamiltonian-path', 'hamming-code', 'hanoi', 'heat-loss', 'heron-theorem', 'ideal-gas-law', 'integer-partitions', 'interval-relations', 'intuitionistic-logic-kripke', 'inventory', 'job-shop-scheduling', 'kaprekar-6174', 'knapsack-optimization', 'lagrange-cosets', 'law-of-cosines', 'least-squares-regression', 'linear-logic-resources', 'list-collection', 'lists', 'manufacturing-quality-control', 'matrix-multiplication', 'modal-logic-kripke', 'modular-exponentiation', 'monkey-bananas', 'negation', 'network-sla', 'newton-raphson', 'nilakantha-pi', 'nixon-diamond', 'observability-log-correlation', 'orbital-transfer-design', 'orders', 'owl-property-chain', 'padovan', 'paraconsistent-animals', 'path-discovery', 'paths', 'peano', 'peasant', 'pell-equation', 'pendulum-period', 'permissions', 'pointer-analysis', 'policy-risk', 'polynomial', 'quadratic-formula', 'queens', 'radioactive-decay', 'rdf', 'research-portal', 'sbom-vulnerability-response', 'schema-inference', 'service-outage-recovery', 'shoelace-polygon-area', 'shortest-path', 'sieve', 'socrates', 'spacecraft-battery-diagnosis', 'state-transitions', 'statistics-summary', 'stirling-bell-numbers', 'symbolic-derivative', 'term-structure', 'text-processing', 'totient-summatory', 'turing', 'type-inference', 'unification', 'values', 'vector-similarity', 'weighted-interval-scheduling', 'wind-turbine', 'witnesses', 'wolf-goat-cabbage']);
const storageKey = 'wheye.playground.v1';
const gistTokenKey = 'wheye.playground.github.gistToken.v1';
const gistFile = 'wheye-playground-state.json';
const contentSizedInput = globalThis.CSS?.supports('field-sizing', 'content') ?? false;
let worker = null;
let ready = null;
let sequence = 0;
let busy = false;
let exampleSource = null;
let saveTimer;
let cancelReady = null;
let runningState = null;
let exampleIndex = null;
let sharing = false;
let runStarted = 0;

async function identifyExample(source) {
  if (!globalThis.crypto?.subtle) return null;
  try {
    exampleIndex ??= fetch(new URL('./examples/index.json', import.meta.url), { cache: 'no-cache' })
      .then(response => {
        if (!response.ok) throw new Error('Cannot load the example index.');
        return response.json();
      });
    const [index, digest] = await Promise.all([
      exampleIndex,
      crypto.subtle.digest('SHA-256', new TextEncoder().encode(source.replace(/\r\n?/g, '\n'))),
    ]);
    const hash = [...new Uint8Array(digest)].map(byte => byte.toString(16).padStart(2, '0')).join('');
    const name = index[hash];
    return examples.has(name) ? name : null;
  } catch {
    exampleIndex = null;
    return null;
  }
}

async function restoreSource(source) {
  const name = await identifyExample(source);
  if (name) await loadExample(name);
  else {
    exampleSource = null;
    restore({ source });
  }
  return name;
}

function status(message, error = false) {
  $('status').textContent = message;
  $('output').classList.toggle('error', error);
}
function working(value) {
  busy = value;
  $('run').disabled = value;
  $('stop').disabled = !value;
  shareButtons();
}
function shareButtons() {
  $('share').disabled = $('create-gist-share').disabled = busy || sharing;
}
function shareStatus(message, error = false) {
  $('share-status').hidden = false;
  $('share-status').textContent = message;
  $('share-status').classList.toggle('error', error);
}
function finished(ok) {
  const elapsed = ((performance.now() - runStarted) / 1000).toFixed(2);
  const edited = JSON.stringify(snapshot()) === runningState ? '' : ' · Source edited; run again to use your changes.';
  status(`${ok ? 'Done' : 'Failed'} · exit ${ok ? 0 : 1} · ${elapsed} s${edited}`, !ok);
}
function snapshot() {
  return { source: $('source').value };
}
function save() {
  clearTimeout(saveTimer);
  saveTimer = setTimeout(() => {
    try { localStorage.setItem(storageKey, JSON.stringify(snapshot())); } catch { /* Storage can be unavailable. */ }
  }, 200);
}
const keywords = new Set(['aggregate_all', 'fresh', 'table', 'why', 'check', 'is', 'mod', 'div', 'rem', 'xor', 'true', 'false']);
const builtins = new Set(['count', 'sum', 'min', 'max', 'list', 'string_concat', 'string_length', 'contains_text', 'atom_codes', 'string_codes', 'abs', 'sign', 'sqrt', 'sin', 'cos', 'tan', 'asin', 'acos', 'atan', 'atan2', 'exp', 'log', 'log2', 'float', 'integer', 'truncate', 'round', 'ceiling', 'floor', 'gcd', 'msb', 'pi']);
const tokens = /(%[^\n]*|\/\*[\s\S]*?(?:\*\/|$))|("(?:[^"\\]|\\.|"")*"?)|('(?:[^'\\]|\\.|'')*'?)|([A-Z_][A-Za-z0-9_]*)|(\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)|([a-z][A-Za-z0-9_]*)|(:-|\?-|\\\+)|([()[\]|,.~]|[=<>@+\-*\/\\^]+)/g;
const escapeHtml = text => text.replace(/[&<>]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;' })[c]);
// Coloring copies the text into spans; very large programs and results stay plain.
const colorLimit = 200000;
/** Midlog source and results share one lexical coloring, following the tokenizer's token kinds. */
function highlight(text) {
  let html = '';
  let at = 0;
  for (const match of text.matchAll(tokens)) {
    html += escapeHtml(text.slice(at, match.index));
    const [token, comment, string, quoted, variable, number, word, keyword] = match;
    const call = text[match.index + token.length] === '(';
    let kind = 'punct';
    if (comment) kind = 'comment';
    else if (string) kind = 'string';
    else if (quoted) kind = call ? 'pred' : 'symbol';
    else if (variable) kind = 'var';
    else if (number) kind = 'number';
    else if (word) kind = keywords.has(word) ? 'keyword' : builtins.has(word) ? 'builtin' : call ? 'pred' : 'symbol';
    else if (keyword) kind = 'keyword';
    html += `<span class="t-${kind}">${escapeHtml(token)}</span>`;
    at = match.index + token.length;
  }
  return html + escapeHtml(text.slice(at));
}
// Check reports are prose, so their lines keep the plain text color.
const reportLine = /^(?:checked:|invalid:|\d+ source facts?;|Conditions:|Failures:|  C\d |  \[C\d|Source facts and rules are assumed)/;
function showResult(text) {
  if (text.length > colorLimit) { $('output').textContent = text; return; }
  $('output').innerHTML = text.split('\n').map(line => reportLine.test(line) ? escapeHtml(line) : highlight(line)).join('\n');
}
function paintSource() {
  const text = $('source').value;
  const plain = text.length > colorLimit;
  $('editor').classList.toggle('plain', plain);
  // A trailing space keeps a final empty line as tall as the textarea's.
  $('source-highlight').innerHTML = plain ? '' : `${highlight(text)} `;
}
function restore(state) {
  if (typeof state?.source !== 'string') return false;
  $('source').value = state.source;
  $('example').value = '';
  paintSource();
  sizeSource();
  return true;
}
function sizeSource() {
  if (contentSizedInput) return;
  const source = $('source');
  source.style.height = 'auto';
  source.style.height = `${source.scrollHeight}px`;
}
function clearShare() {
  $('share-box').hidden = true;
  $('share-status').hidden = true;
}
function ensureWorker() {
  if (ready) return ready;
  worker = new Worker(new URL('./playground-worker.js', import.meta.url), { type: 'module' });
  const current = worker;
  ready = new Promise((resolve, reject) => {
    cancelReady = reject;
    current.onmessage = ({ data }) => {
      if (current !== worker) return;
      if (data.kind === 'ready') {
        $('version').textContent = `v${data.version}`;
        cancelReady = null;
        resolve(current);
      } else if (data.kind === 'fatal') {
        reject(new Error(`Cannot load the browser engine: ${data.message}. See the local setup in the guide.`));
        current.terminate(); worker = null; ready = null;
      } else if (data.id === sequence) {
        working(false);
        if (data.kind === 'result') {
          if (data.output) showResult(data.output);
          else $('output').textContent = 'No new facts were derived.';
          finished(true);
        } else {
          $('output').textContent = data.message;
          finished(false);
        }
      }
    };
    current.onerror = event => {
      if (current !== worker) return;
      const error = new Error(event.message || 'The reasoning worker could not start. Serve this page over HTTP.');
      reject(error);
      current.terminate(); worker = null; ready = null;
      if (busy) { working(false); $('output').textContent = error.message; finished(false); }
    };
    current.postMessage({ kind: 'init' });
  });
  return ready;
}
function stop() {
  sequence++;
  cancelReady?.(new Error('Stopped.')); cancelReady = null;
  worker?.terminate(); worker = null; ready = null;
  working(false);
  status('Stopped.');
  $('output').textContent = 'Run stopped. Edit the program or press Run to start again.';
}

$('run').addEventListener('click', async () => {
  const id = ++sequence;
  const state = snapshot();
  runningState = JSON.stringify(state);
  runStarted = performance.now();
  working(true); status('Running…');
  $('output').textContent = 'Following the rules…';
  try {
    const current = await ensureWorker();
    if (id === sequence) current.postMessage({ kind: 'run', id, ...state });
  } catch (error) {
    if (id !== sequence) return;
    working(false); $('output').textContent = error.message; finished(false);
  }
});
$('stop').addEventListener('click', stop);
$('source').addEventListener('input', () => { $('example').value = ''; paintSource(); sizeSource(); clearShare(); save(); });
if (!contentSizedInput) window.addEventListener('resize', sizeSource);
$('source').addEventListener('keydown', event => {
  if ((event.ctrlKey || event.metaKey) && event.key === 'Enter') { event.preventDefault(); if (!busy) $('run').click(); }
});
async function loadExample(name) {
  if (!examples.has(name)) return;
  if (busy) stop();
  clearShare();
  $('source').disabled = true; $('example').disabled = true; $('run').disabled = true;
  try {
    const response = await fetch(new URL(`./examples/${name}.pl`, import.meta.url), { cache: 'no-cache' });
    if (!response.ok) throw new Error(`Cannot load example ${name}: HTTP ${response.status}.`);
    const source = await response.text();
    restore({ source });
    exampleSource = { name, source };
    $('example').value = name;
    status('Example loaded. Press Run.');
  } finally {
    $('source').disabled = false; $('example').disabled = false; $('run').disabled = busy;
  }
}
$('example').addEventListener('change', async () => {
  try { await loadExample($('example').value); save(); } catch (error) { status(error.message, true); }
});
$('copy').addEventListener('click', async () => {
  try { await navigator.clipboard.writeText($('output').textContent); status('Result copied.'); }
  catch { status('Select the result text to copy it.'); }
});
function shareBaseUrl() {
  const url = new URL(location.href);
  url.search = '';
  url.hash = '';
  return url;
}
function gistSourceUrl(raw) {
  const url = new URL(raw);
  if (url.protocol !== 'https:' || url.hostname !== 'gist.githubusercontent.com' || url.username || url.password || url.port) {
    throw new Error('Use a raw GitHub Gist URL for shared state.');
  }
  return url;
}
async function gistRequest(url, options = {}) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 20000);
  try {
    return await fetch(url, { credentials: 'omit', cache: 'no-store', referrerPolicy: 'no-referrer', ...options, signal: controller.signal })
      .then(async response => ({ response, payload: await response.json() }));
  } catch (error) {
    if (error.name === 'AbortError') throw new Error('GitHub Gist request timed out.');
    throw error;
  } finally { clearTimeout(timeout); }
}
async function createGistUrl(state, token) {
  const { response, payload } = await gistRequest('https://api.github.com/gists', {
    method: 'POST',
    headers: { Accept: 'application/vnd.github+json', 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
    body: JSON.stringify({ description: 'Wheye playground shared program', public: false,
      files: { [gistFile]: { content: JSON.stringify(state, null, 2) + '\n' } } }),
  });
  if (!response.ok) {
    if (response.status === 401 || response.status === 403) {
      try { sessionStorage.removeItem(gistTokenKey); } catch { /* Storage can be unavailable. */ }
    }
    throw new Error(`GitHub Gist HTTP ${response.status}: ${payload?.message || 'Could not create the Gist.'}`);
  }
  const raw = payload?.files?.[gistFile]?.raw_url;
  if (typeof raw !== 'string') throw new Error('GitHub did not return the Gist state URL.');
  const url = shareBaseUrl();
  url.searchParams.set('stateurl', gistSourceUrl(raw).href);
  return url.href;
}
async function readGistState(raw) {
  const { response, payload } = await gistRequest(gistSourceUrl(raw));
  if (!response.ok) throw new Error(`Cannot load shared Gist: HTTP ${response.status}.`);
  if (typeof payload?.source !== 'string') throw new Error('The shared Gist needs a program source.');
  return payload.source;
}
async function sourceShareUrl(state) {
  const url = shareBaseUrl();
  const params = new URLSearchParams();
  const name = exampleSource && state.source === exampleSource.source
    ? exampleSource.name : await identifyExample(state.source);
  if (name) {
    params.set('example', name);
  } else {
    params.set('code', state.source);
  }
  url.hash = params.toString();
  return url.href;
}
async function share(useGist) {
  if (busy || sharing) return;
  const state = snapshot();
  let token = '';
  if (useGist) {
    try { token = sessionStorage.getItem(gistTokenKey) || ''; } catch { /* Storage can be unavailable. */ }
    if (!token) token = prompt('Enter a GitHub token with gist permission to upload your program to an unlisted Gist. Anyone with its link can read it. The token stays in this tab for this session only.', '') || '';
    token = token.trim().replace(/^(?:Bearer|token)\s+/i, '').replace(/^['"]|['"]$/g, '').trim();
    if (!token) { shareStatus('Gist sharing cancelled.'); return; }
    try { sessionStorage.setItem(gistTokenKey, token); } catch { /* Storage can be unavailable. */ }
  }
  sharing = true; shareButtons();
  $('share-box').hidden = true;
  shareStatus(useGist ? 'Creating an unlisted GitHub Gist…' : 'Creating share link…');
  try {
    const url = useGist ? await createGistUrl(state, token) : await sourceShareUrl(state);
    $('share-url').value = url;
    $('share-box').hidden = false;
    try { await navigator.clipboard.writeText(url); shareStatus(useGist ? 'Gist share link copied.' : 'Share link copied.'); }
    catch { $('share-url').focus(); $('share-url').select(); shareStatus('Copy the share link above.'); }
  } catch (error) { shareStatus(`Could not share: ${error.message}`, true); }
  finally { sharing = false; shareButtons(); }
}
$('share').addEventListener('click', () => share(false));
$('create-gist-share').addEventListener('click', () => share(true));
$('close-share').addEventListener('click', () => { $('share-box').hidden = true; });

async function initialise() {
  if (busy) stop();
  clearTimeout(saveTimer);
  clearShare();
  $('source').disabled = true; $('example').disabled = true; $('run').disabled = true;
  $('output').textContent = 'Your first answer is one click away.\n\nPress Run to follow your facts and rules.';
  try {
    const params = new URLSearchParams(location.hash.slice(1));
    const stateUrl = new URL(location.href).searchParams.get('stateurl');
    if (params.has('code')) {
      const name = await restoreSource(params.get('code'));
      if (name) {
        const url = new URL(location.href);
        url.hash = new URLSearchParams({ example: name }).toString();
        history.replaceState(null, '', url);
      }
    }
    else if (stateUrl) await restoreSource(await readGistState(stateUrl));
    else if (params.has('example')) {
      if (!examples.has(params.get('example'))) throw new Error('Unknown shared example. Choose an example above.');
      await loadExample(params.get('example'));
    } else {
      let saved;
      try { saved = JSON.parse(localStorage.getItem(storageKey)); } catch { /* No usable autosave. */ }
      if (typeof saved?.source === 'string') {
        const name = await restoreSource(saved.source);
        if (name && saved.source !== $('source').value) save();
      } else await loadExample('socrates');
    }
    status('Ready when you are.');
    // Loading shared state never executes it automatically.
  } catch (error) { status(error.message, true); }
  finally {
    $('source').disabled = false; $('example').disabled = false; $('run').disabled = busy;
  }
}
window.addEventListener('hashchange', () => { void initialise(); });
paintSource();
await initialise();
