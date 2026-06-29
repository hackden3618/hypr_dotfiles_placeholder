#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Compositor / Animations
# ============================================================
# Description: Applies animation profiles by switching the active profile in init.lua.
# Usage:       animations.sh
# Dependencies: rofi
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# Check if rofi is already running
if pidof rofi > /dev/null; then
    pkill rofi
fi

animations_dir="$ATLAS_ROOT/config/desktop/compositor/animations"
init_file="$animations_dir/init.lua"
rofi_theme="$HOME/.config/rofi/config-Animations.rasi"
msg='Select an animation profile:'

# List animation profiles (ignoring init.lua)
# If directory doesn't exist yet, this will fail gracefully due to true
animations_list=$(find -L "$animations_dir" -maxdepth 1 -type f -name "*.lua" ! -name "init.lua" 2>/dev/null | sed 's/.*\///' | sed 's/\.lua$//' | sort -V || true)

if [[ -z "$animations_list" ]]; then
    notify "Animations" "No profiles found in $animations_dir"
    exit 0
fi

# Rofi Menu
chosen_profile=$(echo "$animations_list" | rofi -i -dmenu -config "$rofi_theme" -mesg "$msg")

if [[ -n "$chosen_profile" ]]; then
    # We edit init.lua to require the new profile
    if [[ -f "$init_file" ]]; then
        sed -i 's/^local active_profile = ".*"/local active_profile = "'"$chosen_profile"'"/' "$init_file"
        notify "Animation Profile Loaded" "$chosen_profile" "$ICONS_DIR/ja.png"
    else
        notify "Animations Error" "init.lua not found"
    fi
fi

sleep 1
# Optionally, reload Hyprland to apply
hyprctl reload
