// Optional real-browser check. Start the local HTTP server and Chrome with
// --remote-debugging-port=9226, then run this script with Node.js 22 or later.
import assert from 'node:assert/strict';
import { mkdir, readFile, writeFile } from 'node:fs/promises';

const layoutOnly = process.argv.includes('--layout-only');
const args = process.argv.slice(2).filter(arg => arg !== '--layout-only');
const base = args[0] || 'http://127.0.0.1:8766/playground.html';
const debug = args[1] || 'http://127.0.0.1:9226';
const screenshots = args[2];
const pagesRoot = args[3];
const expectedVersion = /^version\s*=\s*"([^"]+)"/m.exec(await readFile(new URL('../Cargo.toml', import.meta.url), 'utf8'))[1];
// Result documents record a check as proof_check and proof_condition facts.
const summary = (steps, claims) => new RegExp(`^proof_check\\(\\d+, checked, \\[\\n {4}steps\\(${steps}\\),\\n {4}claims\\(${claims}\\),$`, 'm');
const condition = id => new RegExp(`^proof_condition\\(\\d+, c${id}, "[^"]+", checked\\([1-9][0-9]*, 0\\)\\)\\.$`, 'm');
const tabs = await (await fetch(`${debug}/json`)).json();
const tab = tabs.find(tab => tab.type === 'page');
assert.ok(tab, 'Chrome needs an open page');
const socket = new WebSocket(tab.webSocketDebuggerUrl);
await new Promise((resolve, reject) => { socket.onopen = resolve; socket.onerror = reject; });
let nextId = 0;
const pending = new Map();
socket.onclose = () => {
  for (const entry of pending.values()) { clearTimeout(entry.timeout); entry.reject(new Error('Chrome disconnected.')); }
  pending.clear();
};
const exceptions = [];
socket.onmessage = ({ data }) => {
  const message = JSON.parse(data);
  if (message.id) {
    const entry = pending.get(message.id);
    if (!entry) return;
    const { resolve, reject, timeout } = entry;
    clearTimeout(timeout);
    pending.delete(message.id);
    if (message.error) reject(new Error(JSON.stringify(message.error)));
    else resolve(message.result);
  } else if (message.method === 'Runtime.exceptionThrown') exceptions.push(message.params);
};
function command(method, params = {}) {
  const id = ++nextId;
  return new Promise((resolve, reject) => {
    const timeout = setTimeout(() => { pending.delete(id); reject(new Error(`Chrome timed out: ${method}`)); }, 20000);
    pending.set(id, { resolve, reject, timeout });
    socket.send(JSON.stringify({ id, method, params }));
  });
}
async function evaluate(expression) {
  const response = await command('Runtime.evaluate', { expression, awaitPromise: true, returnByValue: true });
  assert.ok(!response.exceptionDetails, JSON.stringify(response.exceptionDetails));
  return response.result.value;
}
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
async function wait(expression, label) {
  for (let i = 0; i < 1200; i++) { if (await evaluate(expression)) return; await delay(50); }
  throw new Error(`Timed out: ${label}`);
}
async function navigate(url, canonicalExample) {
  await command('Page.navigate', { url });
  const expected = new URL(url);
  if (canonicalExample) expected.hash = new URLSearchParams({ example: canonicalExample });
  await wait(`location.href === ${JSON.stringify(expected.href)} && document.readyState === "complete" && !!document.getElementById("run") && !document.getElementById("run").disabled && !document.getElementById("source").disabled`, 'page ready');
  const params = new URLSearchParams(new URL(url).hash.slice(1));
  if (canonicalExample || params.has('example')) {
    await wait(`document.getElementById("example").value === ${JSON.stringify(canonicalExample || params.get('example'))} && !document.getElementById("source").disabled`, 'shared example loaded');
  } else if (params.has('code')) {
    await wait(`document.getElementById("source").value === ${JSON.stringify(params.get('code'))}`, 'shared source restored');
  }
  await delay(80);
}
async function set(id, value, event = 'input') {
  await evaluate(`document.getElementById(${JSON.stringify(id)}).value = ${JSON.stringify(value)}; document.getElementById(${JSON.stringify(id)}).dispatchEvent(new Event(${JSON.stringify(event)}, { bubbles: true }));`);
}
async function run() {
  await evaluate('document.getElementById("run").click()');
  await wait('!document.getElementById("run").disabled', 'run completion');
  assert.match(await evaluate('document.getElementById("status").textContent'), /^(Done · exit 0|Failed · exit 1) · \d+\.\d{2} s/);
  return evaluate('document.getElementById("output").textContent');
}
async function share(button = 'share') {
  await evaluate(`document.getElementById("share-url").value = ""; document.getElementById(${JSON.stringify(button)}).click()`);
  await wait('document.getElementById("share-url").value !== ""', 'share link ready');
  return evaluate('document.getElementById("share-url").value');
}
async function screenshot(name) {
  if (!screenshots) return;
  await mkdir(screenshots, { recursive: true });
  const metrics = await command('Page.getLayoutMetrics');
  const { width, height } = metrics.cssContentSize;
  // Keep long documentation and example screenshots within a useful image size.
  const image = await command('Page.captureScreenshot', { format: 'png', captureBeyondViewport: true, clip: { x: 0, y: 0, width, height: Math.min(height, 1600), scale: 1 } });
  await writeFile(`${screenshots}/${name}.png`, Buffer.from(image.data, 'base64'));
}

async function checkPageScrolling() {
  const original = await evaluate('({source:document.getElementById("source").value,output:document.getElementById("output").textContent,example:document.getElementById("example").value})');
  const source = Array.from({length:200}, (_, i) => `% Input line ${i}`).join('\n');
  const output = Array.from({length:240}, (_, i) => `Output line ${i}`).join('\n');
  await set('source', source);
  await evaluate(`document.getElementById("output").textContent = ${JSON.stringify(output)}`);
  await delay(50);
  for (const id of ['source', 'output']) {
    assert.ok(await evaluate(`(() => {
      const pane = document.getElementById(${JSON.stringify(id)});
      return pane.scrollHeight <= pane.clientHeight + 2;
    })()`), `${id} must display its complete contents`);
    assert.ok(await evaluate(`(() => {
      const pane = document.getElementById(${JSON.stringify(id)});
      pane.scrollTop = 80;
      return pane.scrollTop <= 2;
    })()`), `${id} must not scroll independently`);
    await evaluate(`(() => {
      const pane = document.getElementById(${JSON.stringify(id)});
      window.scrollTo(0, window.scrollY + pane.getBoundingClientRect().bottom - innerHeight + 30);
    })()`);
    assert.ok(await evaluate(`window.scrollY > 0 && document.getElementById(${JSON.stringify(id)}).getBoundingClientRect().bottom <= innerHeight`), `the page scrollbar must reach the end of ${id}`);
  }
  await set('source', original.source);
  await evaluate(`document.getElementById("example").value = ${JSON.stringify(original.example)}; document.getElementById("output").textContent = ${JSON.stringify(original.output)}; window.scrollTo(0, 0)`);
}

async function checkLayout() {
  for (const fallback of [false, true]) {
    const injected = await command('Page.addScriptToEvaluateOnNewDocument', {source:`
      window.Worker = class { constructor() { throw new Error('Reasoning is disabled during layout checks.'); } };
      const supports = CSS.supports.bind(CSS);
      if (${fallback}) CSS.supports = (...args) => args[0] === 'field-sizing' ? false : supports(...args);
    `});
    for (const width of [1280, 390]) {
      await command('Page.navigate', {url:'about:blank'});
      await wait('location.href === "about:blank" && document.readyState === "complete"', 'fresh layout page');
      await command('Emulation.setDeviceMetricsOverride', {width,height:844,deviceScaleFactor:1,mobile:width===390});
      await navigate(`${base}#example=socrates`);
      const expectedSource = await readFile(new URL('../examples/socrates.pl', import.meta.url), 'utf8');
      await wait(`document.getElementById("source").value === ${JSON.stringify(expectedSource)}`, 'layout example ready');
      await checkPageScrolling();
      if (fallback) assert.match(await evaluate('document.getElementById("source").style.height'), /^\d+px$/, 'the fallback must size the editor');
      assert.ok(await evaluate('document.documentElement.scrollWidth <= innerWidth'), 'page must not overflow horizontally');
      await screenshot(`layout-${width}-${fallback ? 'fallback' : 'native'}`);
    }
    await command('Page.removeScriptToEvaluateOnNewDocument', {identifier:injected.identifier});
  }
  assert.deepEqual(exceptions, []);
  console.log('Page scrolling passed at desktop and phone widths, with native sizing and the fallback; only a 200-line input and 240-line output were used, without running the reasoner.');
}

async function checkPlayground() {
  await command('Page.navigate', { url: 'about:blank' });
  await wait('location.href === "about:blank" && document.readyState === "complete"', 'fresh page');
  await command('Emulation.setDeviceMetricsOverride', { width: 1280, height: 1000, deviceScaleFactor: 1, mobile: false });
  await navigate(`${base}#example=socrates`);
  const currentSocrates = await readFile(new URL('../examples/socrates.pl', import.meta.url), 'utf8');
  const legacySocrates = await readFile(new URL('fixtures/legacy-socrates.pl', import.meta.url), 'utf8');
  await evaluate(`localStorage.setItem('eyepl.playground.v1', JSON.stringify({source: ${JSON.stringify(legacySocrates)}}))`);
  await navigate(base);
  await wait(`document.getElementById("source").value === ${JSON.stringify(currentSocrates)}`, 'old autosave refreshed');
  assert.equal(new URL(await share()).hash, '#example=socrates');
  assert.match(await run(), /^mortal\(socrates\)\.$/m);
  for (const source of [legacySocrates, currentSocrates]) {
    await navigate(`${base}#${new URLSearchParams({ code: source })}`, 'socrates');
    assert.equal(await evaluate('document.getElementById("source").value'), currentSocrates);
    assert.equal(new URL(await share()).hash, '#example=socrates');
    assert.match(await evaluate('document.getElementById("output").textContent'), /first answer/);
    assert.match(await run(), summary(2, 1));
  }
  const draft = "human('Élodie'). ?- human(Who).";
  await evaluate(`localStorage.setItem('eyepl.playground.v1', JSON.stringify({source: ${JSON.stringify(draft)}}))`);
  await navigate(`${base}#${new URLSearchParams({ code: legacySocrates })}`, 'socrates');
  await delay(250);
  assert.equal(await evaluate('JSON.parse(localStorage.getItem("eyepl.playground.v1")).source'), draft);
  const editedLegacy = legacySocrates + '\n% My own changes\n';
  await navigate(`${base}#${new URLSearchParams({ code: editedLegacy })}`);
  assert.equal(await evaluate('document.getElementById("source").value'), editedLegacy);
  assert.equal(new URLSearchParams(new URL(await share()).hash.slice(1)).get('code'), editedLegacy);
  assert.match(await run(), /Only table directives are supported/);
  await navigate(`${base}#example=socrates`);
  assert.match(await evaluate('document.getElementById("output").textContent'), /first answer/);
  assert.equal(await evaluate('document.querySelector("#mode, #saved-proof")'), null);
  assert.deepEqual(await evaluate('[...document.querySelectorAll(".actions button")].map(button => button.textContent)'), ['Run', 'Stop', 'Share link', 'Create Gist share']);
  assert.deepEqual(await evaluate('[...document.querySelectorAll(".actions button")].map(button => getComputedStyle(button).backgroundColor)'), ['rgb(72, 230, 84)', 'rgb(255, 71, 47)', 'rgb(34, 189, 231)', 'rgb(252, 250, 68)']);
  assert.ok(await evaluate('!!document.querySelector(".toolbar #status") && !document.querySelector(".notes") && !document.querySelector("footer").textContent.includes("version")'));
  assert.equal(await evaluate('document.getElementById("version").textContent'), expectedVersion);
  const socrates = await run();
  assert.match(socrates, /^% Answer 1\nmortal\(socrates\)\.$/m);
  assert.match(socrates, /^% Reason 1\nproof_step\(1, 1, human\(socrates\), source\(1\)\)\.$/m);
  assert.match(socrates, summary(2, 1));
  assert.equal(socrates.match(/^proof_condition\(/gm).length, 9);
  for (let id = 1; id <= 9; id++) assert.match(socrates, new RegExp(`\\bc${id},`));
  const widths = await evaluate('[...document.querySelectorAll(".editors > .panel")].map(e => e.getBoundingClientRect().width)');
  assert.ok(Math.abs(widths[0] - widths[1]) < 1);
  assert.ok(await evaluate('document.documentElement.scrollWidth <= innerWidth'));
  await checkPageScrolling();
  await screenshot('desktop');

  await set('source', 'p(a). ?- p(X). ?- check(p(b)). ?- why. ?- check.');
  const explicit = await run();
  assert.match(explicit, /^% Answer 1\np\(a\)\.\n\n% Goal check 2\ncheck_result\(2, false\)\./);
  assert.match(explicit, summary(1, 1));
  await set('source', '?- check(true). ?- check(false).');
  assert.equal(await run(), '% Goal check 1\ncheck_result(1, true).\n\n% Goal check 2\ncheck_result(2, false).\n');
  await set('source', 'human(X). ?- human(X).');
  assert.match(await run(), /ground answer/);
  assert.ok(await evaluate('document.getElementById("output").classList.contains("error")'));

  async function example(name) {
    await set('example', name, 'change');
    await wait(`!document.getElementById("source").disabled && document.getElementById("example").value === ${JSON.stringify(name)}`, `${name} loaded`);
    return evaluate('document.getElementById("source").value');
  }
  for (const name of ['arithmetic', 'negation', 'aggregation', 'witnesses', 'orders']) {
    const source = await example(name);
    await set('source', source + '\n?- check.');
    const result = await run();
    assert.match(result, /^proof_check\(/m, name);
    if (name === 'orders') {
      assert.doesNotMatch(result, /not_applicable/);
      for (let i = 1; i <= 9; i++) assert.match(result, condition(i));
    }
  }

  const deep = await example('deep-taxonomy-100');
  assert.match(await run(), /^is_a\(ind, a2\)\.$/m);
  await set('source', deep + '\n?- check.');
  assert.match(await run(), summary(102, 1));
  await set('source', deep);
  assert.ok(await evaluate('document.getElementById("source").scrollHeight <= document.getElementById("source").clientHeight + 2'), 'the full small taxonomy must fit in the page');
  assert.equal(new URL(await share()).hash, '#example=deep-taxonomy-100');

  await example('paths');
  for (const name of ['ben', 'cara']) assert.match(await run(), new RegExp(`^reaches\\(${name}, ada\\)\\.$`, 'm'));
  assert.equal(new URL(await share()).hash, '#example=paths');

  const unicode = "human('Élodie'). mortal(P) :- human(P). ?- mortal(Who). ?- why. ?- check.";
  await set('source', unicode);
  const shared = await share();
  const params = new URLSearchParams(new URL(shared).hash.slice(1));
  assert.equal(params.get('code'), unicode);
  assert.deepEqual([...params.keys()], ['code']);
  await navigate(shared);
  assert.equal(await evaluate('document.getElementById("source").value'), unicode);
  assert.match(await evaluate('document.getElementById("output").textContent'), /first answer/);
  assert.match(await run(), /Élodie/);

  // Simulate GitHub so the real UI uploads and restores a Gist without publication.
  const rawGist = 'https://gist.githubusercontent.com/example/123/raw/abc/eyepl-playground-state.json';
  const gistMock = `(() => {
    const original = window.fetch.bind(window);
    window.fetch = async (url, options) => {
      if (String(url) === 'https://api.github.com/gists') {
        window.gistUpload = JSON.parse(options.body);
        return new Response(JSON.stringify({files:{'eyepl-playground-state.json':{raw_url:${JSON.stringify(rawGist)}}}}), {status:201});
      }
      if (String(url) === ${JSON.stringify(rawGist)}) return new Response(JSON.stringify({source:${JSON.stringify(unicode)}}), {status:200});
      return original(url, options);
    };
  })()`;
  const injected = await command('Page.addScriptToEvaluateOnNewDocument', {source:gistMock});
  await evaluate(gistMock);
  await evaluate("sessionStorage.setItem('eyepl.playground.github.gistToken.v1', 'fake-browser-test-token')");
  const runStatus = await evaluate('document.getElementById("status").textContent');
  const gistShared = await share('create-gist-share');
  assert.equal(new URL(gistShared).searchParams.get('stateurl'), rawGist);
  const uploaded = await evaluate('window.gistUpload');
  assert.equal(uploaded.public, false);
  assert.equal(JSON.parse(uploaded.files['eyepl-playground-state.json'].content).source, unicode);
  assert.equal(await evaluate('document.getElementById("status").textContent'), runStatus);
  await navigate(gistShared);
  await wait(`document.getElementById("source").value === ${JSON.stringify(unicode)}`, 'Gist restored');
  assert.match(await evaluate('document.getElementById("output").textContent'), /first answer/);
  assert.match(await run(), /Élodie/);
  assert.equal(new URL(await share()).search, '');
  await command('Page.removeScriptToEvaluateOnNewDocument', {identifier:injected.identifier});
  await evaluate("sessionStorage.removeItem('eyepl.playground.github.gistToken.v1')");

  await navigate(`${base}#example=socrates`);
  await evaluate('document.getElementById("run").click(); document.getElementById("stop").click()');
  assert.equal(await evaluate('document.getElementById("status").textContent'), 'Stopped.');
  assert.match(await run(), /socrates/);
  const chain = Array.from({ length: 250 }, (_, i) => `edge(n${i},n${i + 1}).`).join('\n')
    + '\npath(X,Y) :- edge(X,Y). path(X,Z) :- path(X,Y), edge(Y,Z). ?- path(n0,Y).';
  await set('source', chain);
  await evaluate('document.getElementById("run").click()');
  await delay(20);
  await evaluate('document.getElementById("stop").click()');
  assert.equal(await evaluate('document.getElementById("status").textContent'), 'Stopped.');
  await set('source', unicode);
  assert.match(await run(), /Élodie/);
  await delay(250);
  await navigate(base);
  assert.equal(await evaluate('document.getElementById("source").value'), unicode);
  assert.match(await evaluate('document.getElementById("output").textContent'), /first answer/);

  await command('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
  await navigate(`${base}#example=socrates`);
  assert.match(await run(), summary(2, 1));
  assert.ok(await evaluate('document.documentElement.scrollWidth <= innerWidth'), 'phone layout overflows');
  await checkPageScrolling();
  assert.ok(await evaluate('document.querySelector(".output-panel").getBoundingClientRect().top > document.querySelector(".editors .panel").getBoundingClientRect().top'), 'phone panels should stack');
  await screenshot('mobile');
  for (const name of ['orders', 'deep-taxonomy-100']) {
    const source = await example(name);
    await set('source', source + '\n?- check.');
    const result = await run();
    assert.match(result, /^proof_check\(/m);
    if (name === 'orders') assert.doesNotMatch(result, /not_applicable/);
    if (name === 'deep-taxonomy-100') assert.match(result, summary(102, 1));
    assert.ok(await evaluate('document.documentElement.scrollWidth <= innerWidth'), 'mobile layout overflows');
    await screenshot(`mobile-${name}`);
  }

  if (pagesRoot) {
    // Check the compatibility route as well as the directory route used above.
    await navigate(new URL('playground.html#example=socrates', pagesRoot).href);
    assert.match(await run(), summary(2, 1));
    for (const [name, width, mobile] of [['desktop', 1280, false], ['mobile', 390, true]]) {
      await command('Emulation.setDeviceMetricsOverride', { width, height: 1000, deviceScaleFactor: 1, mobile });
      for (const route of ['', 'GUIDE/', 'SPEC/']) {
        const url = new URL(route, pagesRoot).href;
        await command('Page.navigate', { url });
        await wait(`location.href === ${JSON.stringify(url)} && document.readyState === "complete" && !!document.querySelector(".documentation h1")`, 'rendered documentation');
        assert.equal(await evaluate('document.querySelectorAll(".documentation h1").length'), 1, 'Documentation needs one page title');
        assert.ok(await evaluate('document.documentElement.scrollWidth <= innerWidth'), `${name} documentation overflows`);
        assert.ok(await evaluate('[...document.images].every(image => image.complete && image.naturalWidth > 0)'));
        assert.deepEqual(await evaluate(`(() => {
          const ids = [...document.querySelectorAll('[id]')].map(element => element.id);
          return ids.filter((id, index) => ids.indexOf(id) !== index);
        })()`), [], 'Documentation IDs must be unique');
        const links = await evaluate('[...document.querySelectorAll("a[href]")].map(a => a.href)');
        assert.ok(links.every(link => new URL(link).origin !== new URL(pagesRoot).origin || !/\.md(?:#|$)/.test(link)),
          'documentation links should open rendered pages');
        for (const link of new Set(links)) {
          const target = new URL(link);
          if (target.origin !== new URL(pagesRoot).origin) continue;
          assert.ok(target.pathname.startsWith(new URL(pagesRoot).pathname), 'link escaped the Pages base path');
          assert.ok(await evaluate(`fetch(${JSON.stringify(link)}).then(response => response.ok)`), `broken link: ${link}`);
          if (target.hash && !/\/playground(?:\/|\.html)$/.test(target.pathname)) {
            assert.ok(await evaluate(`fetch(${JSON.stringify(link)}).then(response => response.text()).then(html => {
              const page = new DOMParser().parseFromString(html, 'text/html');
              const fragment = decodeURIComponent(${JSON.stringify(target.hash.slice(1))});
              return !!page.getElementById(fragment) || [...page.querySelectorAll('a[name]')].some(a => a.name === fragment);
            })`), `broken fragment: ${link}`);
          }
        }
        if (route === 'SPEC/') {
          assert.ok(await evaluate('!!document.getElementById("132-proof-conditions")'), 'proof contract anchor missing');
          assert.ok(await evaluate(`(() => {
            const label = [...document.querySelectorAll('dt')].find(dt => dt.textContent === '[GUIDE]');
            return label?.nextElementSibling?.querySelector('a')?.href === ${JSON.stringify(new URL('GUIDE/', pagesRoot).href)};
          })()`), 'The final guide reference must render as a working link');
        }
        await screenshot(`${{ '': 'readme', 'GUIDE/': 'guide', 'SPEC/': 'specification' }[route]}-${name}`);
      }
    }
  }
  assert.deepEqual(exceptions, []);
  console.log('Browser checks passed: source-selected answers, proofs and C1–C9 checks as result documents, small taxonomy, desktop/mobile layouts, rendered docs, short example links, restored old examples, Gist sharing, one page scrollbar, custom snapshots, Unicode, autosave, cancellation and restart.');
}

try {
  await command('Page.enable');
  await command('Runtime.enable');
  if (layoutOnly) await checkLayout();
  else await checkPlayground();
} finally { socket.close(); }
