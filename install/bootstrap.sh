#!/usr/bin/env bash
# ============================================================
# ATLAS Bootstrap
# Prepare the local repository workspace without installing packages.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  atlas_log "creating local state directories"
  mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/atlas"
  mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/atlas/logs"

  atlas_log "checking required local commands"
  for cmd in bash find install pacman hyprland; do
    command -v "$cmd" >/dev/null 2>&1 || {
      atlas_error "missing command: $cmd"
      exit 127
    }
  done

  atlas_log "bootstrap complete"
}

main "$@"
