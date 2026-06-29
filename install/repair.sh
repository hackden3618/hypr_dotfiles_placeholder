#!/usr/bin/env bash
# ============================================================
# ATLAS Repair
# Non-destructive repair actions for local runtime directories.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  atlas_log "restoring executable bits on platform scripts"
  find "$ATLAS_ROOT/automation" "$ATLAS_ROOT/install" "$ATLAS_ROOT/system" -type f -name '*.sh' -exec chmod 755 {} +
  chmod 755 "$ATLAS_ROOT"/scripts/*.sh "$ATLAS_ROOT"/UserScripts/*.sh "$ATLAS_ROOT"/initial-boot.sh
  atlas_log "repair complete"
}

main "$@"
