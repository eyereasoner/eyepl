import { readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));

export async function syncVersion(directory = root) {
  const cargo = await readFile(resolve(directory, 'Cargo.toml'), 'utf8');
  const version = /^version\s*=\s*"([^"\n]+)"/m.exec(cargo)?.[1];
  if (!version) throw new Error('Cargo.toml has no package version.');
  const documents = [];
  for (const [file, patterns] of [
    ['README.md', [/(\*\*Version )[^*\n]+(\*\*)/g]],
    ['GUIDE.md', [/(Version \*\*)[^*\n]+(\*\*)/g]],
    ['SPEC.md', [/(Version \*\*)[^*\n]+(\*\*)/g]],
    ['playground.html', [/(id="version">v)[^<\n]+(<\/span>)/g]],
  ]) {
    let text = await readFile(resolve(directory, file), 'utf8');
    for (const pattern of patterns) {
      let count = 0;
      text = text.replace(pattern, (_, prefix, suffix) => { count++; return `${prefix}${version}${suffix}`; });
      if (count !== 1) throw new Error(`Expected one version marker in ${file}; found ${count}.`);
    }
    documents.push([file, text]);
  }
  // Check every marker before writing any document.
  for (const [file, text] of documents) await writeFile(resolve(directory, file), text);
  return version;
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) {
  try { console.log(await syncVersion()); }
  catch (error) { console.error(error.message); process.exitCode = 1; }
}
