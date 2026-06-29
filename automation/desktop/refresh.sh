#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Refresh
# ============================================================
# Description: Refreshes desktop components (waybar, rofi, swaync, quickshell).
# Usage:       refresh.sh [--no-waybar]
# Dependencies: pkill, waybar, swaync, qs
# Called by:   Hyprland keybinds, other automation scripts
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

no_waybar=false
if [[ "${1:-}" == "--no-waybar" ]]; then
    no_waybar=true
fi

# Kill already running processes
_ps=(waybar rofi swaync ags)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}" || true
    fi
done

# Added since wallust sometimes not applying
killall -SIGUSR2 waybar 2>/dev/null || true
sleep 0.1

# quit quickshell & relaunch quickshell
pkill qs 2>/dev/null || true
if command -v qs >/dev/null 2>&1; then
    qs >/dev/null 2>&1 &
fi

# some process to kill
for pid in $(pidof waybar rofi swaync ags swaybg || true); do
    kill -SIGUSR1 "$pid" 2>/dev/null || true
done
sleep 0.1

# Restart waybar
if [[ "$no_waybar" == false ]]; then
    sleep 0.1
    waybar >/dev/null 2>&1 &
fi

# Relaunch swaync
sleep 0.3
swaync >/dev/null 2>&1 &
# reload swaync
swaync-client --reload-config 2>/dev/null || true

# Relaunching rainbow borders if the script exists
sleep 1
if [[ -f "$ATLAS_ROOT/automation/theming/rainbow-borders.sh" ]]; then
    "$ATLAS_ROOT/automation/theming/rainbow-borders.sh" &
fi

exit 0
