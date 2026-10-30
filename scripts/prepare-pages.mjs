import { cp, mkdir, readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));
const publicSite = 'https://eyereasoner.github.io/eyepl/';

export async function preparePages(destination, basePath = '/eyepl') {
  if (!/^(?:\/[A-Za-z0-9._-]+)*\/*$/.test(basePath)) {
    throw new Error('Pages base path must be empty or a slash-prefixed URL path.');
  }
  basePath = basePath.replace(/\/+$/, '');
  // Markdown autolinks need explicit link syntax when their target becomes a
  // relative URL: </eyepl/> is not an autolink.
  const localLinks = text => text.replace(
    /<https:\/\/eyereasoner\.github\.io\/eyepl\/([^>\s]*)>|https:\/\/eyereasoner\.github\.io\/eyepl\//g,
    (match, suffix) => suffix === undefined
      ? `${basePath}/`
      : `[${match.slice(1, -1)}](${basePath}/${suffix})`,
  );
  // Repository-relative Markdown links, such as the README's license link,
  // open on GitHub; Pages would serve those files raw.
  const repositoryLinks = text => text.replace(
    /\]\(((?!https?:|#|\/)[^)\s]+\.md(?:#[^)\s]*)?)\)/g,
    (_, path) => `](https://github.com/eyereasoner/eyepl/blob/main/${path})`,
  );
  const write = (file, text) => writeFile(resolve(destination, file), text);
  const document = text => {
    const heading = /^# (.+)\n+/.exec(text);
    if (!heading) throw new Error('Documentation must start with one page title.');
    // Render the source title once, beside the logo in the shared layout; the
    // logo in the Markdown heading is for readers of the repository.
    const title = heading[1].replace(/<img\b[^>]*>\s*/g, '');
    return `---\nlayout: default\ntitle: ${JSON.stringify(title)}\n---\n\n${text.slice(heading[0].length)}`;
  };
  await mkdir(destination, { recursive: true });
  for (const file of ['assets', 'examples', 'pkg', 'LICENSE.md', 'playground.css', 'playground.js', 'playground-worker.js']) {
    await cp(resolve(root, file), resolve(destination, file), { recursive: true });
  }
  for (const directory of ['GUIDE', 'SPEC', 'playground', '_layouts']) {
    await mkdir(resolve(destination, directory), { recursive: true });
  }

  const playground = localLinks(await readFile(resolve(root, 'playground.html'), 'utf8'));
  await write('playground.html', playground);
  // Preserve the same module, worker, and example URLs under the directory route.
  await write('playground/index.html', playground.replace('<head>', '<head>\n  <base href="../">'));
  // The README is the site root, as on the other eyereasoner sites.
  for (const [source, page] of [['README.md', 'index.md'], ['GUIDE.md', 'GUIDE/index.md'], ['SPEC.md', 'SPEC/index.md']]) {
    await write(page, document(repositoryLinks(localLinks(await readFile(resolve(root, source), 'utf8')))));
  }
  await cp(resolve(root, 'scripts/pages-layout.html'), resolve(destination, '_layouts/default.html'));
  await write('_config.yml', JSON.stringify({
    title: 'eyepl', baseurl: basePath, markdown: 'kramdown',
    kramdown: { input: 'GFM', auto_ids: true },
  }, null, 2) + '\n');
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) {
  await preparePages(resolve(root, '_pages'), process.env.PAGES_BASE_PATH ?? '/eyepl');
  console.log('Website prepared in _pages. Render with Jekyll to produce _site.');
}
