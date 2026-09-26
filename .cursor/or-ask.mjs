#!/usr/bin/env node
/**
 * Interactive OpenRouter one-shot from the terminal.
 * Usage: node .cursor/or-ask.mjs "your prompt"
 *
 * Key sources (first wins):
 *   1. OPENROUTER_API_KEY env var
 *   2. .env in the project root (gitignored)
 */
import { createInterface } from "node:readline/promises";
import { stdin as input, stdout as output } from "node:process";
import { readFileSync, existsSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, "..");
const catalog = JSON.parse(
  readFileSync(join(__dirname, "openrouter-models.json"), "utf8"),
);

function loadDotEnv() {
  const path = join(root, ".env");
  if (!existsSync(path)) return;
  for (const line of readFileSync(path, "utf8").split(/\r?\n/)) {
    const m = line.match(/^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*(.*)$/);
    if (!m) continue;
    const [, k, raw] = m;
    if (process.env[k]) continue;
    process.env[k] = raw.replace(/^["']|["']$/g, "").trim();
  }
}

loadDotEnv();

const promptText = process.argv.slice(2).join(" ").trim();
const key = process.env.OPENROUTER_API_KEY;

if (!key || key.includes("your-key-here")) {
  console.error(
    "Missing OPENROUTER_API_KEY.\n" +
      "  1. Copy .env.example → .env\n" +
      "  2. Put your sk-or-... key in .env (never paste keys into chat)\n" +
      "  3. Or: export OPENROUTER_API_KEY=sk-or-...",
  );
  process.exit(1);
}
if (!promptText) {
  console.error('Usage: node .cursor/or-ask.mjs "your prompt"');
  process.exit(1);
}

const rl = createInterface({ input, output });
console.log("\nPick a model:\n");
for (const m of catalog.favorites) {
  console.log(`  ${m.id}. ${m.name}  [${m.tier}]  ${m.slug}`);
}
const answer = (await rl.question("\nNumber or slug: ")).trim();
rl.close();

const chosen =
  catalog.favorites.find((m) => String(m.id) === answer) ||
  catalog.favorites.find((m) => m.slug === answer);

if (!chosen) {
  console.error("Unknown choice.");
  process.exit(1);
}

console.log(`\n→ ${chosen.name} (${chosen.slug})\n`);

const res = await fetch("https://openrouter.ai/api/v1/chat/completions", {
  method: "POST",
  headers: {
    Authorization: `Bearer ${key}`,
    "Content-Type": "application/json",
    "HTTP-Referer":
      "https://github.com/ishuu19/Single-Line-Diagram-and-Energy-Mapping",
    "X-Title": "FYP OpenRouter picker",
  },
  body: JSON.stringify({
    model: chosen.slug,
    messages: [{ role: "user", content: promptText }],
  }),
});

const data = await res.json();
if (!res.ok) {
  console.error(JSON.stringify(data, null, 2));
  process.exit(1);
}
console.log(data.choices?.[0]?.message?.content ?? JSON.stringify(data, null, 2));
