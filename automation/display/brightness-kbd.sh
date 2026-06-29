#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Display / Keyboard Brightness
# ============================================================
# Description: Keyboard backlight controls using brightnessctl.
# Usage:       brightness-kbd.sh [--get|--inc|--dec]
# Dependencies: brightnessctl, notify-send
# Called by:   Hyprland keybinds (media.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# Get keyboard brightness
get_kbd_backlight() {
    brightnessctl -d '*::kbd_backlight' -m | cut -d, -f4
}

# Get icons
get_icon() {
    local current
    current=$(get_kbd_backlight | sed 's/%//')
    if [ "$current" -le "20" ]; then
        echo "$ICONS_DIR/brightness-20.png"
    elif [ "$current" -le "40" ]; then
        echo "$ICONS_DIR/brightness-40.png"
    elif [ "$current" -le "60" ]; then
        echo "$ICONS_DIR/brightness-60.png"
    elif [ "$current" -le "80" ]; then
        echo "$ICONS_DIR/brightness-80.png"
    else
        echo "$ICONS_DIR/brightness-100.png"
    fi
}

# Notify
notify_user() {
    local current icon
    current=$(get_kbd_backlight | sed 's/%//')
    icon=$(get_icon)
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:"$current" -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$icon" "Keyboard" "Brightness:${current}%"
}

# Change brightness
change_kbd_backlight() {
    brightnessctl -d '*::kbd_backlight' set "$1" && notify_user
}

# Execute accordingly
case "${1:-}" in
    --get) get_kbd_backlight ;;
    --inc) change_kbd_backlight "+30%" ;;
    --dec) change_kbd_backlight "30%-" ;;
    *) get_kbd_backlight ;;
esac
