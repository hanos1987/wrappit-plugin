# Wrappit plugin for Claude Code

Wrappit keeps a short plain-English note on every file of a git project, so any AI agent can pick up
where another left off. This plugin brings Wrappit into Claude Code: it loads Wrappit's guide for your
projects, sets up Wrappit when you say "let's wrappit", and connects the Wrappit service.

## Install

Install the Wrappit command on your computer (once):

```sh
curl -fsSL https://wrappit.dev/install.sh | sh
```

Add the plugin marketplace and install the plugin in Claude Code:

```sh
claude plugin marketplace add hanos1987/wrappit-plugin
```

then, inside Claude Code:

```
/plugin install wrappit@wrappit
```

## What it does

- **At the start of a session** (new or resumed), a SessionStart hook runs `scripts/ensure-cli.sh`.
  If the `wrappit` command is not installed, the hook installs it quietly (only if `curl` is present and
  the network works). Then it prints `wrappit brief --global`, and Claude Code adds that to the session.
  When Wrappit is already installed, this takes a few milliseconds.
- **Skills:**
  - `wrappit`: when to use Wrappit and which command to run (file notes, ideas, research, sides, retiring, pages).
  - `wrappit-setup`: "let's wrappit" sets up the current repo (`wrappit init`, `wrappit fill`, then asks where to keep it online).
  - `wrappit-status`: shows `wrappit status` and explains it.
- **Connector:** `.mcp.json` adds the Wrappit server (`https://mcp.wrappit.dev/mcp`) as an HTTP MCP server named `wrappit`.

## Turn off the automatic install

Set this in your environment to stop the hook from installing anything. The hook then only tells you how to install:

```sh
export WRAPPIT_PLUGIN_NO_INSTALL=1
```

## Claude Code on the web (cloud sessions)

Plugins don't load in Claude Code cloud sessions. For those, use a setup script in the environment that
installs Wrappit and sets it up for the sessions:

```sh
curl -fsSL https://wrappit.dev/install.sh | sh && wrappit setup --all
```

In the environment's network settings, allow `wrappit.dev` and `*.wrappit.dev`, so the install and the
Wrappit service can be reached.

## Layout

```
.claude-plugin/marketplace.json      marketplace "wrappit" listing the plugin
plugins/wrappit/
  .claude-plugin/plugin.json         plugin manifest
  hooks/hooks.json                   SessionStart hook
  scripts/ensure-cli.sh              installs (if needed) and loads wrappit brief
  skills/wrappit/                    the Wrappit guide skill
  skills/wrappit-setup/              "let's wrappit" setup
  skills/wrappit-status/             status explainer
  .mcp.json                          the Wrappit connector
```
