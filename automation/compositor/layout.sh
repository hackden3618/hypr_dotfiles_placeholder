#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Compositor / Layout
# ============================================================
# Description: Toggles between Master and Dwindle layouts.
# Usage:       layout.sh
# Dependencies: hyprctl, jq
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

LAYOUT=$(hyprctl -j getoption general:layout | jq -r '.str')

case "$LAYOUT" in
    "master")
        hyprctl keyword general:layout dwindle
        # Manage SUPER+O for togglesplit
        hyprctl keyword bind SUPER,O,togglesplit
        notify "Layout" "Dwindle Layout" "$ICONS_DIR/ja.png"
        ;;
    "dwindle")
        hyprctl keyword general:layout master
        # Drop togglesplit binding on SUPER+O when switching back to master
        hyprctl keyword unbind SUPER,O
        notify "Layout" "Master Layout" "$ICONS_DIR/ja.png"
        ;;
    *) ;;
esac
