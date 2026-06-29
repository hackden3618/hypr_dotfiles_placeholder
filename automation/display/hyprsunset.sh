#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Display / Hyprsunset
# ============================================================
# Description: Hyprsunset toggle and Waybar status helper.
# Usage:       hyprsunset.sh [toggle|status|init]
# Dependencies: hyprsunset, notify-send
# Called by:   Waybar, Hyprland keybinds
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

STATE_FILE="$CACHE_DIR/.hyprsunset_state"
TARGET_TEMP="${HYPRSUNSET_TEMP:-3500}"
ICON_MODE="${HYPRSUNSET_ICON_MODE:-sunset}"

ensure_state() {
    [[ -f "$STATE_FILE" ]] || echo "off" > "$STATE_FILE"
}

# Render icons using pango markup to allow colorization
icon_off() {
    printf "☀"
}

icon_on() {
    case "$ICON_MODE" in
        sunset) printf "🌇" ;;
        blue) printf "☀" ;;
        *) printf "☀" ;;
    esac
}

cmd_toggle() {
    ensure_state
    local state
    state="$(cat "$STATE_FILE" || echo off)"

    # Always stop any running hyprsunset first
    if pgrep -x hyprsunset >/dev/null 2>&1; then
        pkill -x hyprsunset || true
        sleep 0.2
    fi

    if [[ "$state" == "on" ]]; then
        # Turning OFF
        if command -v hyprsunset >/dev/null 2>&1; then
            nohup hyprsunset -i >/dev/null 2>&1 &
            sleep 0.3 && pkill -x hyprsunset || true
        fi
        echo off > "$STATE_FILE"
        notify "Hyprsunset" "Disabled"
    else
        # Turning ON
        if command -v hyprsunset >/dev/null 2>&1; then
            nohup hyprsunset -t "$TARGET_TEMP" >/dev/null 2>&1 &
        fi
        echo on > "$STATE_FILE"
        notify "Hyprsunset" "Enabled @ ${TARGET_TEMP}K"
    fi
}

cmd_status() {
    ensure_state
    local onoff
    if pgrep -x hyprsunset >/dev/null 2>&1; then
        onoff="on"
    else
        onoff="$(cat "$STATE_FILE" || echo off)"
    fi

    local txt cls tip
    if [[ "$onoff" == "on" ]]; then
        txt="<span size='18pt'>$(icon_on)</span>"
        cls="on"
        tip="Night light on @ ${TARGET_TEMP}K"
    else
        txt="<span size='16pt'>$(icon_off)</span>"
        cls="off"
        tip="Night light off"
    fi
    printf '{"text":"%s","class":"%s","tooltip":"%s"}\n' "$txt" "$cls" "$tip"
}

cmd_init() {
    ensure_state
    local state
    state="$(cat "$STATE_FILE" || echo off)"

    if [[ "$state" == "on" ]]; then
        if command -v hyprsunset >/dev/null 2>&1; then
            nohup hyprsunset -t "$TARGET_TEMP" >/dev/null 2>&1 &
        fi
    fi
}

case "${1:-}" in
    toggle) cmd_toggle ;;
    status) cmd_status ;;
    init) cmd_init ;;
    *) 
        echo "usage: $0 [toggle|status|init]" >&2
        exit 2 
        ;;
esac
