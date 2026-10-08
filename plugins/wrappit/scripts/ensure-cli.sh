#!/bin/sh
# SessionStart hook for the Wrappit plugin.
# 1. Finds the wrappit command (PATH, then ~/.local/bin).
# 2. If it is missing, installs it quietly (unless WRAPPIT_PLUGIN_NO_INSTALL=1).
# 3. Prints `wrappit brief --global`, which Claude Code adds to the session context.
# It never fails the session: always exits 0.

INSTALL_URL="https://wrappit.dev/install.sh"

find_wrappit() {
  if command -v wrappit >/dev/null 2>&1; then
    command -v wrappit
    return 0
  fi
  if [ -x "$HOME/.local/bin/wrappit" ]; then
    printf '%s\n' "$HOME/.local/bin/wrappit"
    return 0
  fi
  return 1
}

not_installed_help() {
  echo "Wrappit is not installed on this computer, so this project's file notes are not loaded."
  echo "To install it, run: curl -fsSL $INSTALL_URL | sh   (then: wrappit setup)"
}

WRAPPIT=$(find_wrappit) || WRAPPIT=""

if [ -z "$WRAPPIT" ]; then
  if [ "${WRAPPIT_PLUGIN_NO_INSTALL:-}" = "1" ]; then
    not_installed_help
    exit 0
  fi
  if ! command -v curl >/dev/null 2>&1; then
    not_installed_help
    exit 0
  fi
  tmp=$(mktemp -d 2>/dev/null) || { not_installed_help; exit 0; }
  if curl -fsSL --max-time 120 -o "$tmp/install.sh" "$INSTALL_URL" 2>/dev/null \
     && sh "$tmp/install.sh" >/dev/null 2>&1; then
    :
  fi
  rm -rf "$tmp"
  WRAPPIT=$(find_wrappit) || WRAPPIT=""
  if [ -z "$WRAPPIT" ]; then
    not_installed_help
    exit 0
  fi
  echo "Wrappit was installed just now ($WRAPPIT). Run \`wrappit setup\` once on this computer if it has not been run yet."
fi

if command -v timeout >/dev/null 2>&1; then
  timeout 20 "$WRAPPIT" brief --global 2>/dev/null || true
else
  "$WRAPPIT" brief --global 2>/dev/null || true
fi
exit 0
