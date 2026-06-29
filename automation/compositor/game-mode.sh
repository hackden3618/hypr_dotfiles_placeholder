#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Compositor / Game Mode
# ============================================================
# Description: Turns off all animations and decorations for gaming.
# Usage:       game-mode.sh
# Dependencies: hyprctl
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    
    hyprctl keyword "windowrule opacity 1 override 1 override 1 override, ^(.*)$"
    awww kill || true
    notify "Gamemode" "enabled" "$ICONS_DIR/ja.png"
    sleep 0.1
    exit 0
else
    awww-daemon --format xrgb && awww img "$HOME/.config/rofi/.current_wallpaper" &
    sleep 0.1
    "$ATLAS_ROOT/automation/theming/wallust-apply.sh" || true
    sleep 0.5
    hyprctl reload
    "$ATLAS_ROOT/automation/desktop/refresh.sh" || true
    notify "Gamemode" "disabled" "$ICONS_DIR/ja.png"
    exit 0
fi
