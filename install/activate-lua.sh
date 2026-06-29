#!/usr/bin/env bash
# ============================================================
# ATLAS Lua Activation Guide
# Verifies Lua parity and prints the explicit launch command.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  "$ATLAS_ROOT/install/verify.sh"
  atlas_log "Lua config is verified."
  atlas_log "To test without changing login defaults, start Hyprland with:"
  printf 'Hyprland --config %q\n' "$ATLAS_ROOT/hyprland.lua"
  atlas_log "Keep hyprland.conf as rollback until live smoke tests pass."
}

main "$@"
