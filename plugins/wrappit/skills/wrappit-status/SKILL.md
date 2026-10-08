---
name: wrappit-status
description: Show the Wrappit status of the current project (which file notes are missing or out of date, open ideas, research, shelved directions) and explain it in plain words. Use when the person asks for Wrappit status, what needs notes, or how the project's Wrappit state looks.
---

# Wrappit status

1. Run `wrappit status` in the project folder. If the folder is not a Wrappit repo, say so and offer
   `wrappit init` (or the "let's wrappit" setup) once, then stop.
2. Explain the output in plain words, not as a list of raw lines:
   - How many file notes are missing or out of date, and which files they are (a few names is enough).
   - For each one, the fix: write the note, then `wrappit stamp <file>`. Or `wrappit fill` for many.
   - Any ideas being tried or shelved (`wrappit directions`), and open ideas for later (`wrappit propositions`), if the status mentions them.
3. End with the one next step you suggest, and ask before running anything that changes files
   (`fill`, `stamp`, `retire`, `host`).
