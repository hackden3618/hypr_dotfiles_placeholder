#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Compositor / Overview
# ============================================================
# Description: Toggles the overview (tries Quickshell, falls back to AGS).
# Usage:       overview.sh
# Dependencies: quickshell, ags, hyprctl
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# 1) Try Quickshell via Hyprland global dispatch
if pgrep -x quickshell >/dev/null 2>&1; then
    if hyprctl dispatch global quickshell:overviewToggle >/dev/null 2>&1; then
        exit 0
    fi
fi

# If QS isn't running, but the CLI exists, try starting it and retry once
if command -v qs >/dev/null 2>&1; then
    qs >/dev/null 2>&1 &
    sleep 0.6
    if hyprctl dispatch global quickshell:overviewToggle >/dev/null 2>&1; then
        exit 0
    fi
fi

# 2) Fall back to AGS template
if command -v ags >/dev/null 2>&1; then
    pkill rofi || true
    if ags -t 'overview' >/dev/null 2>&1; then
        exit 0
    fi
    # If it failed, try starting AGS daemon then call the template
    ags >/dev/null 2>&1 &
    sleep 0.6
    if ags -t 'overview' >/dev/null 2>&1; then
        exit 0
    fi
fi

# If we get here, neither worked
notify "Overview" "Neither Quickshell nor AGS is available"
exit 1
