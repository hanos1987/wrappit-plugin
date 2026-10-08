---
file: plugins/wrappit/skills/wrappit/SKILL.md
file-hash: 0b2bacbd8ed3f8898fcee223872dff2bcf51fd27
note-hash: 2eac33be3983c569
verified: pass Claude_Code 34a0ebb36be94bb08a545307cad2b12e
---

# plugins/wrappit/skills/wrappit/SKILL.md

## What it is
The main Wrappit skill. It tells Claude when to use Wrappit and which command to run: file notes, the 'let's wrappit' setup, ideas for later, research, side tries, retiring files, web pages, and collaboration.

## How to navigate it
The YAML front matter holds the description that decides when Claude loads it. The body is grouped by job, from 'start of every session' to 'commands'.

## What it interacts with
The `wrappit` command (the commands it names), the `.wrappit/` folder in a project, and the other two skills, `wrappit-setup` and `wrappit-status`.

## Why it exists
Because the person should not need to know Wrappit's commands. The skill condenses the guide that the Wrappit command gives every agent.

## Helpful notes
It is a condensed copy of featureGuide in /opt/wrappit/agents.go and userRules in /opt/wrappit/setup.go. When those change, update this skill. Never let it suggest `git add -A`.
