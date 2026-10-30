let ready;
async function engine() {
  ready ??= import('./pkg/eyepl.js').then(async module => {
    await module.default();
    return module;
  });
  return ready;
}

self.onmessage = async ({ data }) => {
  try {
    const module = await engine();
    if (data.kind === 'init') {
      self.postMessage({ kind: 'ready', version: module.version() });
      return;
    }
    const output = module.runProgram(data.source);
    self.postMessage({ kind: 'result', id: data.id, output });
  } catch (error) {
    self.postMessage({ kind: data.kind === 'init' ? 'fatal' : 'error', id: data.id, message: String(error) });
  }
};
