import { cp, mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const root = path.resolve(fileURLToPath(new URL('..', import.meta.url)));
const output = path.resolve(root, '.pages-build');
if (output !== path.join(root, '.pages-build')) {
  throw new Error('Unexpected Pages output path');
}

await rm(output, { recursive: true, force: true });
await cp(path.join(root, 'docs'), output, { recursive: true });
await mkdir(path.join(output, 'Chiang'), { recursive: true });
await cp(
  path.join(root, 'Chiang', 'SpeechLLM'),
  path.join(output, 'Chiang', 'SpeechLLM'),
  { recursive: true },
);

const report = path.join(output, 'Chiang', 'SpeechLLM', 'index.html');
let html = await readFile(report, 'utf8');
for (const [before, after] of [
  ['href="../../docs/styles.css"', 'href="../../styles.css"'],
  ['href="../../docs/index.html"', 'href="../../index.html"'],
]) {
  if (!html.includes(before)) throw new Error(`Missing report link: ${before}`);
  html = html.replace(before, after);
}
await writeFile(report, html);

const home = path.join(output, 'index.html');
html = await readFile(home, 'utf8');
const oldLink = 'href="../Chiang/SpeechLLM/index.html"';
if (!html.includes(oldLink)) throw new Error(`Missing home link: ${oldLink}`);
await writeFile(home, html.replace(oldLink, 'href="Chiang/SpeechLLM/index.html"'));
