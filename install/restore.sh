#!/usr/bin/env bash
# ============================================================
# ATLAS Restore
# Shows restore instructions. Extraction is intentionally manual.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

archive="${1:-}"

if [[ -z "$archive" ]]; then
  atlas_error "usage: install/restore.sh /path/to/atlas-backup.tar.zst"
  exit 2
fi

atlas_log "restore is intentionally manual for safety"
atlas_log "inspect archive: tar -I zstd -tf '$archive' | less"
atlas_log "restore to temp: mkdir -p /tmp/atlas-restore && tar -I zstd -xf '$archive' -C /tmp/atlas-restore"
