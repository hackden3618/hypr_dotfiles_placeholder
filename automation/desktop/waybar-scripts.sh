#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Waybar Scripts
# ============================================================
# Description: Wrapper for Waybar to launch terminal apps.
# Usage:       waybar-scripts.sh [--btop|--nvtop|--nmtui|--term|--files]
# Dependencies: USER.terminal and USER.files from variables.lua
# Called by:   Waybar custom modules
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# Extract terminal and file manager from variables.lua
var_file="$ATLAS_ROOT/config/platform/variables.lua"
term="kitty"
files="nautilus"

if [[ -f "$var_file" ]]; then
    # Simple regex extraction for USER table assignments
    parsed_term=$(grep -E '^\s*terminal\s*=\s*".*"' "$var_file" | cut -d'"' -f2 || true)
    parsed_files=$(grep -E '^\s*files\s*=\s*".*"' "$var_file" | cut -d'"' -f2 || true)
    [[ -n "$parsed_term" ]] && term="$parsed_term"
    [[ -n "$parsed_files" ]] && files="$parsed_files"
fi

case "${1:-}" in
    --btop)  $term --title btop sh -c 'btop' ;;
    --nvtop) $term --title nvtop sh -c 'nvtop' ;;
    --nmtui) $term nmtui ;;
    --term)  $term & ;;
    --files) $files & ;;
    *)
        echo "Usage: $0 [--btop | --nvtop | --nmtui | --term | --files]"
        exit 1
        ;;
esac
