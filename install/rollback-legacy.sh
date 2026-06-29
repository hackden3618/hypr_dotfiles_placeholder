#!/usr/bin/env bash
# ============================================================
# ATLAS Legacy Rollback
# Verifies the legacy Hyprlang entry point.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  hyprland --verify-config --config "$ATLAS_ROOT/hyprland.conf"
  atlas_log "legacy Hyprlang config is available as rollback"
}

main "$@"
