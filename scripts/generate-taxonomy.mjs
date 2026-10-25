// Regenerate the readable classification-chain programs and their side labels.
import { readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

export const depths = [10, 100, 1000, 10000, 100000];
export function taxonomy(depth) {
  if (!depths.includes(depth)) throw new Error('Choose a packaged taxonomy depth.');
  if (depth !== 100000) {
    const lines = [`% Following a classification chain ${depth.toLocaleString('en-US')} levels deep
%
% Follow ${depth.toLocaleString('en-US')} classification steps from n0 through n${depth}. The individual
% ind starts with label n0 and acquires the next n label plus two side
% labels, i and j, at each step. The final n label implies a2.
%
% The query asks which individual has label a2, and the proof traces
% the supporting chain. Longer versions produce larger proofs.

is_a(ind, n0).

is_a(Entity, a2) :-
    is_a(Entity, n${depth}).
`];
    for (let level = 1; level <= depth; level++) {
      for (const prefix of ['n', 'i', 'j']) lines.push(`is_a(Entity, ${prefix}${level}) :-\n    is_a(Entity, n${level - 1}).\n`);
    }
    lines.push(`
% Answer
?- is_a(Who, a2).

% Reason
?- why.

% Check
?- check((is_a(ind, a2))).
?- check((is_a(ind, n${depth}))).
?- check((is_a(ind, i${depth}))).
?- check((is_a(ind, j${depth}))).
?- check((\\+ (is_a(ind, n${depth + 1})))).
`);
    return lines.join('');
  }
  const label = (prefix, level) => `${prefix}${String(level).padStart(6, '0')}`;
  const lines = [`% Following a classification chain ${depth.toLocaleString('en-US')} levels deep
%
% One individual starts in class n000000. Each level adds its next class
% and two side labels. Reaching ${label('n', depth)} produces a final true answer.
% This example exercises deep forward reasoning and a checkable proof chain.

% Starting classification
isa(ind, n000000).

% Completion
test(true) :- isa(ind, a2).
isa(X, a2) :- isa(X, ${label('n', depth)}).

% Classification levels
`];
  for (let level = 1; level <= depth; level++) {
    for (const prefix of ['n', 'i', 'j']) {
      lines.push(`isa(X, ${label(prefix, level)}) :- isa(X, ${label('n', level - 1)}).\n`);
    }
  }
  lines.push('\n% Answer\n?- test(Result).\n');
  return lines.join('');
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) {
  const check = process.argv[2] === '--check';
  if (process.argv.length > (check ? 3 : 2)) throw new Error('Usage: node scripts/generate-taxonomy.mjs [--check]');
  for (const depth of depths) {
    const file = fileURLToPath(new URL(`../examples/deep-taxonomy-${depth}.pl`, import.meta.url));
    const source = taxonomy(depth);
    if (check) {
      if (await readFile(file, 'utf8') !== source) throw new Error(`Regenerate ${file}.`);
    } else await writeFile(file, source);
    console.log(`${check ? 'Checked' : 'Wrote'} examples/deep-taxonomy-${depth}.pl`);
  }
}
