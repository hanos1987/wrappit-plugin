---
file: README.md
file-hash: 0b7eafc9f7e07d65ec83c2f02c67071f15e89121
note-hash: 688d936b513fcba3
verified: pass Claude_Code eab5e7faecec9adf1a824f85e4c04c6f
---

# README.md

## What it is
The install and usage guide for the Wrappit plugin for Claude Code. It explains the two install commands, what happens when a session starts, how to turn off the automatic install, and how to set up Claude Code on the web.

## How to navigate it
Start with the install section at the top. The 'What it does' section lists the hook, the three skills and the connector. The 'Layout' section at the end shows the file tree of the repo.

## What it interacts with
The marketplace file `.claude-plugin/marketplace.json`, the plugin under `plugins/wrappit/`, and the Wrappit install script at wrappit.dev. It describes the environment variable `WRAPPIT_PLUGIN_NO_INSTALL`.

## Why it exists
So a person can add Wrappit to Claude Code from the README alone, and knows what the plugin will do on their computer before they install it.

## Helpful notes
Cloud sessions do not load plugins. For those, the environment needs a setup script and network access to wrappit.dev and *.wrappit.dev. Keep the README in step with `scripts/ensure-cli.sh` if the install URL or the opt-out variable changes.
