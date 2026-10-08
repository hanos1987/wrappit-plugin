<!-- wrappit:start -->
## Wrappit: this repo explains itself

Every file has a short note in `.wrappit/files/<path>.md`. The project summary is `.wrappit/PROJECT.md`.

- Before you change a file, read its note: `wrappit show <file>`.
- After you create a file, run `wrappit new <file>` and fill in every section.
- After you change a file, update its note so it's still true, then run `wrappit stamp <file>`.
  If the change doesn't affect anything the note says: `wrappit stamp --unchanged <file>`.
- Renamed or deleted a file: `wrappit mv <old> <new>` or `wrappit prune`.
- Notes are short and plain: What it is, How to navigate it, What it interacts with,
  Why it exists, Helpful notes. A few sentences each, written for a person who has
  never seen the code.
- Commit with plain git: stage the files you changed and their notes by name
  (`git add <file> .wrappit/files/<file>.md`), then `git commit`. Never `git add -A` or `git add .`.
  The commit check runs by itself and blocks commits while notes are missing or out of date.

### What Wrappit can do (use it for them; they shouldn't need to know the commands)

- **New direction or risky idea** ("let's try another way", "what if we..."): first run
  `wrappit try <name> "what"`; unsaved work comes along. It worked: `wrappit keep`.
  It didn't ("go back", "scrap that"): `wrappit drop "why"` shelves it with its half-done work
  and returns to the main line; `wrappit try <name>` picks it up again. `wrappit directions` lists them.
- **One line of work:** work on the main line. Don't make git branches or extra folders (worktrees)
  unless the person asks to try something on the side, or a second AI session must work at the same
  time. For that, run `wrappit try <name> --folder` (never `git worktree` or `git branch` yourself):
  the idea gets its own folder beside the project, and `wrappit keep` or `wrappit drop` run there
  finish it and remove the folder, so nothing is left lying around.
- **Removing old or unused files:** never `rm` or `git rm` project files. Run
  `wrappit retire <file or folder> --reason "why"`, then save. The reason and note are kept, and
  `wrappit restore <file>` brings it back. `wrappit retired` lists them.
- **Cleaning up:** when asked, or when the project looks cluttered, run `wrappit tidy`, show the
  person the list in plain words, and retire only what they agree to.
- **Saving:** `wrappit save "message"` commits changed files with their notes (new files with
  `--add <file>`); it pushes only with `--push`.
- **Notes:** `wrappit status` shows what needs work, `wrappit fill` has an AI write missing notes,
  `wrappit verify` has an AI check notes are correct.
- **Online:** where each project is kept online is asked once, never guessed. If the brief says it isn't
  chosen, ask in plain words (the brief lists the choices; mention it's already on GitHub if it is), then
  run `wrappit host <choice>`. Send work there with `wrappit push` (not `git push`).
- **Unsaved work is safe:** once the computer is connected, Wrappit takes a save point of unsaved files
  every few minutes and backs it up (never secrets, ignored, downloaded/built or huge files). After a
  crash or on another computer: `wrappit recover` (`--list` to see them). Never commit
  `node_modules`, build output or big media: the commit check stops them; keep them in .gitignore.
- **Ideas for later** ("we should also...", "one day...", "add that to the list", or your own idea
  mid-task): don't drop the job at hand to chase it. Run `wrappit propose "the idea"` (your own
  idea: add `--agent`), say "parked as P<n>", and carry on. When the current job is done, mention
  the open ones (`wrappit propositions`) and ask which to pick up; then
  `wrappit proposition P<n> start` and `done`. Only the person declines one (`decline "why"`).
- **Research** (looking things up, comparing options, reading docs or sites): log each finding as you go,
  not at the end: `wrappit research add <topic> "finding" --source <link or file> --tag <group>`.
  Things still to find out: `research ask`; corrections: `research fix` or `research wrong`
  (the old one stays, struck through). Keep "Where it stands" current with `research summary`.
  Before relying on earlier research, read `wrappit research show <topic>`. A look-up that found
  nothing worth keeping: `wrappit research none "why"`.
- **Web pages** (a page the person wants to see or send to someone, like an artifact): build it as one HTML
  file, or a folder with an `index.html` and relative paths for its other files (images, css, scripts), then
  run `wrappit page publish <file or folder>`. It starts private. When they want to share it, run
  `wrappit page share <name> link` and give them the link it prints: anyone with it sees the page straight
  away, no sign-in, no notice. Publishing again under the same name updates the page and keeps its link.
  `wrappit page open <name>` gives a private page's link for the next hour, `wrappit page list` and
  `delete` do what they say; `page share <name> private` takes the link back. Needs the computer connected
  to the person's Wrappit account (the command says how if it isn't). A page can't use cookies or storage; it runs in a sandbox.
- **Where Wrappit keeps things** (know this; don't go exploring, and change them only through the commands):
  notes in `.wrappit/files/<path>.md`, the project summary in `.wrappit/PROJECT.md`, ideas for later in
  `.wrappit/PROPOSITIONS.md`, research in `.wrappit/research/<topic>.md`, retired files' reasons in
  `.wrappit/retired/`, settings in `.wrappit/config`; ideas on the side are git branches `try/<name>`
  (shelved: `dropped/<name>`). `wrappit help` lists every command.
- **Looking around:** the person can browse every project and note in the Wrappit app (`wrappit app`).
<!-- wrappit:end -->
