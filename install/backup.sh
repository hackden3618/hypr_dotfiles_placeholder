#!/usr/bin/env bash
# ============================================================
# ATLAS Backup
# Creates a timestamped archive of this repository.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  local stamp target
  stamp="$(date +%Y%m%d-%H%M%S)"
  target="$ATLAS_ROOT/backups/atlas-hypr-$stamp.tar.zst"
  mkdir -p "$ATLAS_ROOT/backups"
  atlas_log "creating backup: $target"
  tar --exclude='.git' --exclude='backups' -I zstd -cf "$target" -C "$ATLAS_ROOT" .
  atlas_log "backup complete"
}

main "$@"
