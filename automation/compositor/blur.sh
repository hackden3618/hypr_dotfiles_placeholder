#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Compositor / Blur
# ============================================================
# Description: Changes blur amount on the fly.
# Usage:       blur.sh
# Dependencies: hyprctl
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "2" ]; then
    hyprctl keyword decoration:blur:size 2
    hyprctl keyword decoration:blur:passes 1
    notify "Blur" "Less Blur" "$ICONS_DIR/note.png"
else
    hyprctl keyword decoration:blur:size 5
    hyprctl keyword decoration:blur:passes 2
    notify "Blur" "Normal Blur" "$ICONS_DIR/ja.png"
fi
