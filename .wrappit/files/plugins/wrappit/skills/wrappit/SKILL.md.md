---
file: plugins/wrappit/skills/wrappit/SKILL.md
file-hash: a2d24f7782d1e950a04dbad21d93e32c4eed0fdb
note-hash: f280e846b8e3c436
verified: pass Claude_Code 5d17c9737dafde67ef05c2a7f655adb8
---

# plugins/wrappit/skills/wrappit/SKILL.md

## What it is
The main Wrappit skill. It tells Claude when to use Wrappit and which command to run: file notes, the 'let's wrappit' setup, ideas for later, research, lines on the side (try, work, keep, shelve, line done, line abandon), retiring files, web pages, and collaboration.

## How to navigate it
The YAML front matter holds the description that decides when Claude loads it. The body is grouped by job, from 'start of every session' to 'commands'.

## What it interacts with
The `wrappit` command (the commands it names), the `.wrappit/` folder in a project, and the other two skills, `wrappit-setup` and `wrappit-status`.

## Why it exists
Because the person should not need to know Wrappit's commands. The skill condenses the guide that the Wrappit command gives every agent.

## Helpful notes
It is a condensed copy of featureGuide in /opt/wrappit/agents.go and userRules in /opt/wrappit/setup.go. When those change, update this skill. Never let it suggest `git add -A`. Since Wrappit 1.3 beta 35 it says notes are settled at commit (`wrappit notes`, then `wrappit notes accept`) and that a line stays on the reminders until it's kept, shelved or abandoned.
