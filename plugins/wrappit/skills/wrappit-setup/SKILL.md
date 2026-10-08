---
name: wrappit-setup
description: Set up the current git repo for Wrappit when the person says "let's wrappit", "wrappit this", "wrap it", or asks to set up Wrappit here. Runs wrappit init, fills in every file's note, then asks where to keep the project online.
---

# Set up Wrappit in this repo

Use this when the person says "let's wrappit", "wrappit this", or "wrap it". It sets up the folder you are in now.

1. Check the folder. If it is not a git repo yet, run `git init` first (this is the only time you run `git init`).
   If it is already a Wrappit repo (a `.wrappit` folder exists), skip to step 3.
2. Run `wrappit init` in the project folder.
3. Run `wrappit status` to count the files that need notes. If there are more than 25, stop and ask the
   person whether to continue. Then run `wrappit fill --yes`. Otherwise run `wrappit fill`.
   Each file gets a short plain-English note. Fill in `.wrappit/PROJECT.md` too if it is still empty.
4. Run `wrappit status` again and fix anything it still lists.
5. Ask where to keep the project online, in one plain sentence. Choices come from `wrappit brief`: their
   Wrappit account (private), GitHub, both, or only this computer. If the project is already on GitHub, say so.
   Never guess, and never put the project online without an answer. Then run `wrappit host <choice>`
   (`wrappit`, `github`, `both` or `none`).
6. Tell them: open the Wrappit app with `wrappit app`, or run `wrappit view` to see the map of the repo.
   Commit the new notes with plain git, adding files by name, never `git add -A`.

Use `wrappit` on PATH. If it is missing, tell the person to install it with
`curl -fsSL https://wrappit.dev/install.sh | sh`, and stop.
