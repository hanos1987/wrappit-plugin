---
file: .claude-plugin/marketplace.json
file-hash: 0c064fc14736b05869b5f45e1c5c9d08b46eb8f6
note-hash: 0562746bb43ac035
verified: pass Claude_Code 6e7d6f0728ccfc57fc303e07b74c348d
---

# marketplace.json

## What it is
The marketplace listing for this repo. It names the marketplace 'wrappit', gives the owner, and lists one plugin, 'wrappit', that lives in this repo.

## How to navigate it
There is one entry under `plugins`. Its `source` is `./plugins/wrappit`, the folder of the plugin. `version` here must match the plugin's own `plugin.json`.

## What it interacts with
Read by Claude Code when a user runs `claude plugin marketplace add` on this repo's URL. It points to `plugins/wrappit/.claude-plugin/plugin.json`.

## Why it exists
Claude Code needs a marketplace file at the repo root before it can install the plugin with `/plugin install wrappit@wrappit`.

## Helpful notes
Keep the names `wrappit` (marketplace) and `wrappit` (plugin) in step with the install command in the README. Bump the version in both files when the plugin changes.
