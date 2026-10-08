---
file: plugins/wrappit/skills/wrappit-setup/SKILL.md
file-hash: 84f02ebf9dda69f60451d0ac9b1fe4e76aba89ba
note-hash: 54dbff028b9260d4
verified: pass Claude_Code a0c7758129f3e991664cb1630f2c8902
---

# plugins/wrappit/skills/wrappit-setup/SKILL.md

## What it is
The 'let's wrappit' skill. It sets up the current git repo for Wrappit.

## How to navigate it
Six numbered steps: git init if needed, `wrappit init`, `wrappit fill` (asks first above 25 files), check status, ask where to keep the project online, then tell the person to open the app.

## What it interacts with
The `wrappit` command, the project's git repo and `.wrappit/PROJECT.md`, and the online hosting choice that `wrappit host` records.

## Why it exists
So 'let's wrappit' does the whole setup in one go, and the project is never put online without the person choosing where.

## Helpful notes
It never guesses the online choice and never runs `wrappit push`. It is the only place that runs `git init`, and only in a folder that is not yet a repo.
