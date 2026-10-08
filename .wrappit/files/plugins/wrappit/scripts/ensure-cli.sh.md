---
file: plugins/wrappit/scripts/ensure-cli.sh
file-hash: 1180f2b63181944aa3d59fe9758d4bdc06e603b1
note-hash: 373a126466adb0f0
verified: pass Claude_Code 4503b1b520a224b7a7dd849b5387ac91
---

# plugins/wrappit/scripts/ensure-cli.sh

## What it is
A POSIX shell script that runs at session start. It makes sure the `wrappit` command is installed and then prints `wrappit brief --global`.

## How to navigate it
`find_wrappit` looks on PATH and then in ~/.local/bin. If missing, the install step downloads the installer from wrappit.dev into a temporary folder and runs it quietly. `not_installed_help` prints the install command. The last lines run the brief with a 20-second timeout.

## What it interacts with
`wrappit` on the computer, the installer at https://wrappit.dev/install.sh (only when curl is present and the network works), and the SessionStart hook in `plugins/wrappit/hooks/hooks.json`.

## Why it exists
So the person never has to install Wrappit by hand, and Claude knows about Wrappit from the first message of a session.

## Helpful notes
It always exits 0 so it can never fail a session. Set `WRAPPIT_PLUGIN_NO_INSTALL=1` to stop the automatic install. When Wrappit is already installed it only runs the brief, which keeps it fast. The installer's own setup step (`wrappit setup`) is not run here.
