---
file: plugins/wrappit/.claude-plugin/plugin.json
file-hash: ad1c2b5296f22c455c48c5ec7a11d98cca478429
note-hash: b20d9923cb3574e1
verified: pass Claude_Code 8c74192a38abc6936abbebc227e73d6f
---

# plugin.json

## What it is
The manifest of the Wrappit plugin: its name, description, version, author, homepage and keywords.

## How to navigate it
It is a single JSON object. The folders beside it (`skills/`, `hooks/`, `scripts/`, `.mcp.json`) are found by Claude Code by their standard names, not listed here.

## What it interacts with
Read by Claude Code when the plugin is installed. Its `version` should match the entry for this plugin in `.claude-plugin/marketplace.json`.

## Why it exists
Claude Code requires this manifest in the plugin folder. The name `wrappit` is what users type in `/plugin install wrappit@wrappit`.

## Helpful notes
The name must be kebab-case. Bump the version here whenever the plugin changes.
