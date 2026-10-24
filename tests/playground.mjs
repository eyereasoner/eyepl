import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile, readdir } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import vm from 'node:vm';
import { createHash, webcrypto } from 'node:crypto';

const root = new URL('../', import.meta.url);
test('all examples are selectable and available to shared links', async () => {
  const html = await readFile(new URL('playground.html', root), 'utf8');
  const js = await readFile(new URL('playground.js', root), 'utf8');
  for (const file of await readdir(new URL('examples/', root))) {
    if (!file.endsWith('.pl')) continue;
    const name = file.slice(0, -3);
    assert.ok(js.includes(`'${name}'`), `${name} missing from share allowlist`);
    assert.ok(html.includes(`value="${name}"`));
    assert.match(await readFile(new URL(`examples/${name}.pl`, root), 'utf8'), /\?- /);
  }
});
test('worker runs the engine off the UI thread and reports failures', async () => {
  const source = await readFile(new URL('playground-worker.js', root), 'utf8');
  const messages = [];
  const context = vm.createContext({ self: { postMessage: message => messages.push(message) } });
  const script = new vm.Script(source.replace("import('./pkg/wheye.js')", 'Promise.resolve(mockEngine)'), { filename: fileURLToPath(new URL('playground-worker.js', root)) });
  context.mockEngine = { default: async () => {}, version: () => '0.1.0', runProgram: source => {
    if (source === 'bad') throw new Error('specific failure');
    return source;
  } };
  script.runInContext(context);
  await context.self.onmessage({ data: { kind: 'init' } });
  assert.equal(messages[0].version, '0.1.0');
  await context.self.onmessage({ data: { kind: 'run', id: 2, source: 'hello' } });
  assert.equal(messages[1].output, 'hello');
  await context.self.onmessage({ data: { kind: 'run', id: 3, source: 'bad' } });
  assert.equal(messages[2].kind, 'error');
  assert.match(messages[2].message, /specific failure/);
});

test('the source is the only input to execution and sharing', async () => {
  const html=await readFile(new URL('playground.html',root),'utf8');
  const js=await readFile(new URL('playground.js',root),'utf8');
  assert.doesNotMatch(html,/id="(?:mode|saved-proof)"/);
  assert.doesNotMatch(js,/get\('mode'\)|get\('proof'\)|set\('mode'\)|set\('proof'\)/);
});

test('the example index recognizes every current source and the previous Socrates source', async () => {
  const index = JSON.parse(await readFile(new URL('examples/index.json', root), 'utf8'));
  const names = new Set();
  for (const file of await readdir(new URL('examples/', root))) {
    if (!file.endsWith('.pl')) continue;
    const source = await readFile(new URL(`examples/${file}`, root), 'utf8');
    const hash = createHash('sha256').update(source.replace(/\r\n?/g, '\n')).digest('hex');
    assert.equal(index[hash], file.slice(0, -3), 'Run node scripts/index-examples.mjs after changing examples.');
    names.add(file.slice(0, -3));
  }
  for (const [hash, name] of Object.entries(index)) {
    assert.match(hash, /^[a-f0-9]{64}$/);
    assert.ok(names.has(name));
  }
  const legacy = await readFile(new URL('tests/fixtures/legacy-socrates.pl', root));
  assert.equal(index[createHash('sha256').update(legacy).digest('hex')], 'socrates');
});

async function playground({ source, hash = '', stateUrl, request, token = '', promptToken = '', output, error = false } = {}) {
  const elements = new Map();
  const timers = new Map();
  let nextTimer = 0;
  let saved = source === undefined ? null : JSON.stringify({ source });
  const location = new URL(`https://example.test/wheye/playground/${hash}`);
  if (stateUrl) location.searchParams.set('stateurl', stateUrl);
  const session = new Map(token ? [['wheye.playground.github.gistToken.v1', token]] : []);
  const element = id => {
    if (!elements.has(id)) elements.set(id, {
      value: '', textContent: '', hidden: true, listeners: {},
      classList: { toggle() {} }, focus() {}, select() {},
      addEventListener(event, listener) { this.listeners[event] = listener; },
    });
    return elements.get(id);
  };
  const context = vm.createContext({
    URL, URLSearchParams, TextEncoder, AbortController, performance, crypto: webcrypto, location,
    prompt: () => promptToken,
    sessionStorage: { getItem: key => session.get(key), setItem: (key, value) => session.set(key, value), removeItem: key => session.delete(key) },
    document: { getElementById: element },
    window: { addEventListener() {} },
    history: { replaceState(_state, _unused, url) { location.href = String(url); } },
    localStorage: { getItem: () => saved, setItem: (_key, value) => { saved = value; } },
    navigator: { clipboard: { writeText: async () => {} } },
    setTimeout: callback => { timers.set(++nextTimer, callback); return nextTimer; },
    clearTimeout: id => timers.delete(id),
    Worker: class {
      constructor() { if (output === undefined) throw new Error('Restoring a program must not run it.'); }
      postMessage(data) { this.onmessage({ data: data.kind === 'init' ? {kind:'ready',version:'0.1.16'} : {kind:error?'error':'result', id:data.id, output, message:output} }); }
      terminate() {}
    },
    fetch: async (url, options) => {
      if (request && new URL(url).protocol !== 'file:') return request(url, options);
      const source = await readFile(url, 'utf8');
      return { ok: true, text: async () => source, json: async () => JSON.parse(source) };
    },
  });
  const script = (await readFile(new URL('playground.js', root), 'utf8'))
    .replaceAll('import.meta.url', JSON.stringify(new URL('playground.js', root).href));
  await new vm.Script(`(async () => { ${script} })()`).runInContext(context);
  return {
    element, location, session,
    async run() { await element('run').listeners.click(); },
    async gist() { await element('create-gist-share').listeners.click(); return element('share-url').value; },
    async share() {
      await element('share').listeners.click();
      return new URL(element('share-url').value);
    },
    autosave() {
      for (const callback of timers.values()) callback();
      timers.clear();
      return saved === null ? null : JSON.parse(saved).source;
    },
  };
}

test('fresh and restored unedited examples share short links', async () => {
  const fresh = await playground();
  assert.equal((await fresh.share()).hash, '#example=socrates');
  const source = fresh.element('source').value;
  const restored = await playground({ source });
  assert.equal(restored.element('example').value, 'socrates');
  assert.equal((await restored.share()).hash, '#example=socrates');
  const code = await playground({ hash: `#${new URLSearchParams({ code: source })}` });
  assert.equal(code.location.hash, '#example=socrates');
  assert.equal((await code.share()).hash, '#example=socrates');
});

test('old bundled examples restore current syntax from autosave and full source links', async () => {
  const legacy = await readFile(new URL('tests/fixtures/legacy-socrates.pl', root), 'utf8');
  const current = await readFile(new URL('examples/socrates.pl', root), 'utf8');
  for (const options of [{ source: legacy }, { hash: `#${new URLSearchParams({ code: legacy })}` }]) {
    const page = await playground(options);
    assert.equal(page.element('source').value, current);
    assert.equal(page.autosave(), options.source ? current : null);
    assert.equal((await page.share()).hash, '#example=socrates');
    assert.match(page.element('output').textContent, /first answer/);
    if (options.hash) assert.equal(page.location.hash, '#example=socrates');
  }
});

test('opening a shared example preserves an unrelated saved draft', async () => {
  const draft = "human('Élodie'). ?- human(Who).";
  const legacy = await readFile(new URL('tests/fixtures/legacy-socrates.pl', root), 'utf8');
  const page = await playground({ source: draft, hash: `#${new URLSearchParams({ code: legacy })}` });
  assert.equal(page.element('example').value, 'socrates');
  assert.equal(page.autosave(), draft);
});

test('custom edits remain exact source snapshots, including obsolete syntax', async () => {
  const legacy = await readFile(new URL('tests/fixtures/legacy-socrates.pl', root), 'utf8');
  const source = legacy + '\n% My own changes: Élodie\n';
  const page = await playground({ hash: `#${new URLSearchParams({ code: source })}` });
  assert.equal(page.element('source').value, source);
  assert.equal(page.element('example').value, '');
  assert.equal(page.autosave(), null);
  page.element('source').listeners.input();
  assert.equal(page.autosave(), source);
  assert.equal(new URLSearchParams((await page.share()).hash.slice(1)).get('code'), source);
  const restored = await playground({ source });
  assert.equal(restored.element('source').value, source);
  assert.equal(new URLSearchParams((await restored.share()).hash.slice(1)).get('code'), source);
});

const rawGist = 'https://gist.githubusercontent.com/example/123/raw/abc/wheye-playground-state.json';
test('Gist sharing uploads only the source, keeps its token in the session, and restores without running', async () => {
  const source = "human('Élodie'). ?- human(Who).";
  let uploaded;
  const page = await playground({ source, promptToken: ' Bearer test-token ', request: async (url, options) => {
    assert.equal(String(url), 'https://api.github.com/gists');
    assert.equal(options.method, 'POST');
    assert.equal(options.credentials, 'omit');
    assert.equal(options.headers.Authorization, 'Bearer test-token');
    uploaded = JSON.parse(options.body);
    return {ok:true, json:async()=>({files:{'wheye-playground-state.json':{raw_url:rawGist}}})};
  } });
  const shared = new URL(await page.gist());
  assert.equal(uploaded.public, false);
  assert.deepEqual(JSON.parse(uploaded.files['wheye-playground-state.json'].content), {source});
  assert.equal(shared.searchParams.get('stateurl'), rawGist);
  assert.ok(!shared.href.includes('test-token'));
  assert.equal(page.session.get('wheye.playground.github.gistToken.v1'), 'test-token');
  const restored = await playground({ stateUrl: rawGist, request: async (url, options) => {
    assert.equal(String(url), rawGist);
    assert.equal(options.headers, undefined, 'Reading a Gist must not send a token.');
    return {ok:true, json:async()=>({source})};
  } });
  assert.equal(restored.element('source').value, source);
  assert.match(restored.element('output').textContent, /first answer/);
  const normal = await restored.share();
  assert.equal(normal.search, '');
  assert.equal(new URLSearchParams(normal.hash.slice(1)).get('code'), source);
});

test('Gist cancellation and authentication failures allow retry without retaining bad tokens', async () => {
  const cancelled = await playground();
  await cancelled.gist();
  assert.equal(cancelled.element('share-status').textContent, 'Gist sharing cancelled.');
  const denied = await playground({token:'expired',request:async()=>({ok:false,status:401,json:async()=>({message:'Bad credentials'})})});
  await denied.gist();
  assert.equal(denied.session.size, 0);
  assert.match(denied.element('share-status').textContent, /HTTP 401: Bad credentials/);
  assert.equal(denied.element('create-gist-share').disabled, false);
  await denied.gist();
  assert.equal(denied.element('share-status').textContent, 'Gist sharing cancelled.');
});

test('Gist state rejects unrelated hosts and missing source without executing content', async () => {
  const unrelated = await playground({stateUrl:'https://example.test/state.json'});
  assert.match(unrelated.element('status').textContent,/raw GitHub Gist URL/);
  const malformed = await playground({stateUrl:rawGist,request:async()=>({ok:true,json:async()=>({})})});
  assert.match(malformed.element('status').textContent,/needs a program source/);
  assert.equal(malformed.element('run').disabled,false);
});

test('run status shows success or failure with exit code and elapsed seconds, and sharing preserves it', async () => {
  const page = await playground({output:'Who = socrates.\n'});
  await page.run();
  const done = page.element('status').textContent;
  assert.match(done,/^Done · exit 0 · \d+\.\d{2} s$/);
  await page.share();
  assert.equal(page.element('status').textContent,done);
  const failed = await playground({output:'Specific parse error',error:true});
  await failed.run();
  assert.match(failed.element('status').textContent,/^Failed · exit 1 · \d+\.\d{2} s$/);
  assert.equal(failed.element('output').textContent,'Specific parse error');
});
