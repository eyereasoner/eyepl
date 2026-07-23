#!/usr/bin/env node
import { main } from '../src/cli.js';

await main(process.argv.slice(2)).catch((error) => {
  if (error?.code === 65) {
    if (error.stdout) process.stdout.write(error.stdout);
    process.exitCode = 65;
    return;
  }
  console.error(`eyepl: ${error && error.message ? error.message : String(error)}`);
  process.exitCode = 1;
});
