---
file: plugins/wrappit/skills/wrappit-status/SKILL.md
file-hash: 3203fa4d0ec6284a4ec0b33f64a5e67c9aaabc18
note-hash: 4050397fdd8b291e
verified: pass Claude_Code 9a8379a1564c513a3a2360e8ffa8a721
---

# plugins/wrappit/skills/wrappit-status/SKILL.md

## What it is
A skill that shows the Wrappit status of the project and explains it in plain words.

## How to navigate it
Three steps: run `wrappit status`, explain it (missing notes and the fix for each, changed files whose notes settle at commit, the lines not dealt with and their age, ideas and research state), then suggest one next step.

## What it interacts with
The `wrappit` command, and the `wrappit` skill for the commands it names.

## Why it exists
So a person can see what needs notes without reading raw command output.

## Helpful notes
It only reads. It asks before running `fill`, `stamp`, `retire` or `host`.
