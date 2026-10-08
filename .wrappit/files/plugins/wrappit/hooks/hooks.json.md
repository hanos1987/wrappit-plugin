---
file: plugins/wrappit/hooks/hooks.json
file-hash: 6722ecd2f52fc1e1288f6923b9e73accd9700155
note-hash: 0c76d0cc25b18922
verified: pass Claude_Code 6e0ebd62ad554371fab69cf9fbc4b8ff
---

# plugins/wrappit/hooks/hooks.json

## What it is
The hook settings of the plugin. It runs one command when a Claude Code session starts or resumes.

## How to navigate it
The `SessionStart` entry has a matcher `startup|resume` and runs `scripts/ensure-cli.sh` from the plugin folder, through `${CLAUDE_PLUGIN_ROOT}`.

## What it interacts with
Runs `scripts/ensure-cli.sh`. Whatever that script prints is added to Claude's context for the session.

## Why it exists
So the `wrappit` command is installed, and the project brief is loaded, at the start of each session without the person doing anything.

## Helpful notes
The top-level key must be `hooks`. The script must be executable and must always exit 0, or it could block a session.
