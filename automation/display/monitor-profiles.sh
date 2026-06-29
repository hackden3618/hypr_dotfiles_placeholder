#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Display / Monitor Profiles
# ============================================================
# Description: Applies pre-configured monitor profiles.
# Usage:       monitor-profiles.sh
# Dependencies: rofi, nwg-displays (for profile generation)
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# Check if rofi is already running
if pidof rofi > /dev/null; then
    pkill rofi
fi

monitor_dir="$ATLAS_ROOT/config/desktop/monitors"
target="$ATLAS_ROOT/config/desktop/monitors/monitors.conf"
rofi_theme="$HOME/.config/rofi/config-Monitors.rasi"
msg='❗NOTE:❗ This will overwrite monitors.conf'

# list of Monitor Profiles, sorted alphabetically with numbers first
# excludes monitors.conf and workspaces.lua
mon_profiles_list=$(find -L "$monitor_dir" -maxdepth 1 -type f -name "*.conf" ! -name "monitors.conf" | sed 's/.*\///' | sed 's/\.conf$//' | sort -V || true)

if [[ -z "$mon_profiles_list" ]]; then
    notify "Monitor Profiles" "No alternative profiles found in $monitor_dir"
    exit 0
fi

# Rofi Menu
chosen_file=$(echo "$mon_profiles_list" | rofi -i -dmenu -config "$rofi_theme" -mesg "$msg")

if [[ -n "$chosen_file" ]]; then
    full_path="$monitor_dir/$chosen_file.conf"
    cp "$full_path" "$target"
    
    notify "Monitor Profile Loaded" "$chosen_file" "$ICONS_DIR/ja.png"
fi

sleep 1
"$ATLAS_ROOT/automation/desktop/refresh.sh" --no-waybar &
