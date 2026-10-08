# Project summary

## Purpose
<!-- What this project does and who it's for, in two or three sentences. -->
This is the Claude Code plugin and marketplace for Wrappit. Wrappit keeps a short plain-English note on
every file of a git project, so any AI agent can pick up where another left off. This repo lets a person
add Wrappit to Claude Code with two commands, so Claude knows how to use Wrappit in their projects.

## Key features
<!-- The main things it can do, as a short list. -->
- A marketplace named "wrappit" with one plugin, also named "wrappit".
- A session-start hook that installs the `wrappit` command if it is missing (quietly, unless turned off),
  then loads `wrappit brief --global` into Claude's context.
- A `wrappit` skill that tells Claude when and how to use Wrappit: file notes, ideas, research, side tries,
  retiring files, web pages, and saving.
- A `wrappit-setup` skill for "let's wrappit" (set up the current repo, then ask where to keep it online).
- A `wrappit-status` skill that explains `wrappit status` in plain words.
- An MCP connector entry for the Wrappit service at mcp.wrappit.dev.

## Tech stack
<!-- Languages, frameworks, services. -->
- POSIX shell for the session hook (`scripts/ensure-cli.sh`).
- JSON for the marketplace, plugin manifest, hooks and MCP config.
- Markdown skills (`SKILL.md` with YAML front matter).
- Depends on the Wrappit command-line tool (written in Go, in /opt/wrappit), installed from wrappit.dev.

## How to run
<!-- The exact commands to set it up and start it. -->
There is nothing to build. To try it locally:
- Check the JSON: `python3 -m json.tool .claude-plugin/marketplace.json` (and the other `.json` files).
- Check the hook: `sh plugins/wrappit/scripts/ensure-cli.sh` (prints the Wrappit brief when `wrappit` is installed).
- Check the plugin from Claude Code: `claude plugin validate .` in this folder.
- To use it: `claude plugin marketplace add <path or URL of this repo>`, then `/plugin install wrappit@wrappit`.

## Development workflow
<!-- How changes are made, tested and released. -->
Edit the files in `plugins/wrappit/`, keep the JSON valid, and run the checks above. Bump `version` in both
`plugins/wrappit/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` when the plugin changes.
Keep the skills in step with the Wrappit command's own guide (`featureGuide` in /opt/wrappit/agents.go and
`userRules` in /opt/wrappit/setup.go). The marketplace is published at https://git.wrappit.dev/benji/wrappit-plugin.git (the URL users add).

## Architecture overview
<!-- How the main pieces fit together, and which files to read first. -->
Read `README.md` first, then `.claude-plugin/marketplace.json` (the marketplace listing), then
`plugins/wrappit/.claude-plugin/plugin.json`. The session hook is `plugins/wrappit/hooks/hooks.json`,
which runs `plugins/wrappit/scripts/ensure-cli.sh`. The skills are in `plugins/wrappit/skills/`; the
connector is `plugins/wrappit/.mcp.json`. The Wrappit command itself lives outside this repo.
