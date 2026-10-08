---
file: plugins/wrappit/skills/wrappit-status/SKILL.md
file-hash: fe22204dc97383548d12d4f6ef7f81346860b9d1
note-hash: 44e86c9665f036d1
verified: pass Claude_Code e7e69c2ebb4707eaf13577cd724cfcce
---

# plugins/wrappit/skills/wrappit-status/SKILL.md

## What it is
A skill that shows the Wrappit status of the project and explains it in plain words.

## How to navigate it
Three steps: run `wrappit status`, explain it (missing notes, the fix for each, ideas and research state), then suggest one next step.

## What it interacts with
The `wrappit` command, and the `wrappit` skill for the commands it names.

## Why it exists
So a person can see what needs notes without reading raw command output.

## Helpful notes
It only reads. It asks before running `fill`, `stamp`, `retire` or `host`.
