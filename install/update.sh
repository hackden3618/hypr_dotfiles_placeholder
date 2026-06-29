#!/usr/bin/env bash
# ============================================================
# ATLAS Update
# Update Arch packages and then run platform verification.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  atlas_log "updating packages"
  sudo pacman -Syu
  "$ATLAS_ROOT/install/verify.sh"
}

main "$@"
