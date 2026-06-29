#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Automation Common Library
# Source: source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"
# ============================================================
set -euo pipefail

readonly ATLAS_ROOT="$HOME/.config/hypr"
readonly AUTOMATION="$ATLAS_ROOT/automation"
readonly ICONS_DIR="$HOME/.config/swaync/icons"
readonly CACHE_DIR="$HOME/.cache/atlas"
readonly WALLPAPER_CURRENT="$ATLAS_ROOT/config/desktop/theming/.wallpaper_current"
readonly WALLPAPER_EFFECTS_DIR="$ATLAS_ROOT/config/desktop/theming"

# Logging
log()     { printf '[ATLAS] %s\n'       "$*" >&2; }
log_err() { printf '[ATLAS ERROR] %s\n' "$*" >&2; }

# Notification with deduplication key
notify() {
  local title="${1:?}" body="${2:-}" icon="${3:-dialog-information}" key="${4:-atlas}"
  notify-send -e -u low \
    -h "string:x-canonical-private-synchronous:${key}" \
    -i "$icon" "$title" "$body"
}

# Check if a command exists
require() {
  command -v "$1" >/dev/null 2>&1 || {
    log_err "Required command not found: $1"
    exit 127
  }
}

is_running() { pidof "$1" >/dev/null 2>&1; }

mkdir -p "$CACHE_DIR"
