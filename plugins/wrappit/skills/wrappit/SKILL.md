---
name: wrappit
description: Use when the person mentions Wrappit, notes on files, "let's wrappit" or "wrap it", a repo with a .wrappit folder, AGENTS.md/CLAUDE.md file notes, ideas for later, research notes, trying an idea on the side, retiring old files, or publishing a page with wrappit. Explains how to keep Wrappit's file notes current and which wrappit command to use.
---

# Wrappit

Wrappit keeps a short plain-English note on every file of a git project (in `.wrappit/files/<path>.md`),
plus a project summary (`.wrappit/PROJECT.md`), so any AI agent can pick up where another left off.
The person should not need to know the commands. Use them for them.

## Start of every session in a folder

- Run `wrappit brief` inside a Wrappit repo (or `wrappit brief --global` anywhere). It prints the current
  state and what to do next. Follow it, and don't go exploring the `.wrappit` folder by hand.
- If a folder is a git repo with no `.wrappit` folder, offer Wrappit once, in one sentence. Only set it
  up after a yes (`wrappit init`). If they say no, run `wrappit skip` so no agent asks again there.

## Every file has a note

- Before you change a file, read its note: `wrappit show <file>`.
- After you create a file: `wrappit new <file>`, then fill in every section of `.wrappit/files/<file>.md`
  (What it is, How to navigate it, What it interacts with, Why it exists, Helpful notes). A few plain
  sentences each, written for someone who has never seen the code.
- After you change a file, update its note so it stays true, then `wrappit stamp <file>`.
  If the change doesn't affect what the note says: `wrappit stamp --unchanged <file>`.
- Renamed or moved a file: `wrappit mv <old> <new>`. Deleted one: `wrappit prune` clears its note.
- `wrappit status` shows what needs work. `wrappit fill` has an AI write missing notes (for more than
  25 files it asks first; run `wrappit fill --yes` once the person agrees). `wrappit verify` checks notes.
- Commit with plain git and add files **by name**: `git add <file> .wrappit/files/<file>.md`, then
  `git commit`. Never `git add -A` or `git add .`. The commit check blocks commits while notes are
  missing or out of date. Use `wrappit save "message"` to commit changed files with their notes.

## "Let's wrappit" (set this project up now)

1. In a folder that isn't a git repo yet, `git init` first.
2. `wrappit init`.
3. `wrappit fill` so every file gets a note.
4. Ask where to keep the project online. Never guess. Choices come from `wrappit brief`
   (their Wrappit account, GitHub, both, or only this computer). Then `wrappit host <choice>`.
   Don't push before that.
5. Tell them to open the Wrappit app (`wrappit app`) to see every project and note.

For a brand-new project, run `wrappit create <name>` instead. It makes the folder in the projects
folder, sets up git and Wrappit, and says what to do next. Don't make the folder or run `git init` yourself.

## Ideas, research and sides

- **Ideas for later** ("we should also...", "one day...", or your own idea mid-task): don't drop the
  job at hand. Run `wrappit propose "the idea"` (your own idea: add `--agent`), say "parked as P<n>",
  and carry on. When the current job is done, list them with `wrappit propositions` and ask which to
  pick up. Then `wrappit proposition P<n> start`, and `done` when finished. Only the person declines one:
  `wrappit proposition P<n> decline "why"`.
- **Research** (looking things up, comparing options, reading docs): log each finding as you go:
  `wrappit research add <topic> "finding" --source <link> --tag <group>`. Read earlier research first
  with `wrappit research show <topic>`. Keep the summary current with `wrappit research summary`.
  Still to find out: `research ask`. Corrections: `research fix` or `research wrong`. Nothing worth keeping:
  `wrappit research none "why"`.
- **One line of work:** stay on the main line. No git branches or worktrees unless the person asks to try
  something on the side.
- **New direction or risky idea** ("let's try another way", "what if we..."): `wrappit try <name> "what"`
  (unsaved work comes along). It worked: `wrappit keep`. It didn't ("go back", "scrap that"):
  `wrappit drop "why"`. Pick it up again later with `wrappit try <name>`. `wrappit directions` lists them.
- **A second AI session must work at the same time:** `wrappit try <name> --folder`. Never run
  `git worktree` or `git branch` yourself.

## Removing and cleaning up

- Never `rm` or `git rm` project files. Run `wrappit retire <file or folder> --reason "why"`, then save.
  `wrappit restore <file>` brings it back. `wrappit retired` lists them.
- When asked, or when the project looks cluttered, run `wrappit tidy`. Show the list in plain words and
  retire only what the person agrees to.

## Web pages

For a page the person wants to see or send (like an artifact): build one HTML file, or a folder with an
`index.html` and relative paths, then `wrappit page publish <file or folder>`. It starts private. To share
it, `wrappit page share <name> link` and give them the link: anyone with it sees the page, no sign-in.
Publishing again under the same name updates it and keeps the link. `wrappit page open <name>` gives a
private page's link for an hour, `wrappit page list` and `wrappit page delete` do what they say, and
`wrappit page share <name> private` takes the link back. Pages can't use cookies or storage.

## Working together

Only when the person asks, and only for a project that is already kept online:
- `wrappit people` shows who can use the project online and how.
- `wrappit invite <name> [--can look|edit]` lets someone on Wrappit use it (default: edit);
  `wrappit uninvite <name>` takes them off.
- `wrappit clone <handle/name> [folder]` copies a project someone shared with them.
- Teams: `wrappit team create|list|show|add|remove|delete`.

## Unsaved work and backups

Once the computer is connected to a Wrappit account, unsaved files get a save point every few minutes.
After a crash or on another computer, run `wrappit recover` (`--list` to see them). Never commit
`node_modules`, build output or big media. Keep them in `.gitignore`.

## Commands

`wrappit help` lists every command. Don't run `wrappit login`, `push`, `backup` or `host` unless the person
asks to connect or publish the project.
