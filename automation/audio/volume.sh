#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Audio / Volume
# ============================================================
# Description: Volume controls for audio and microphone.
# Usage:       volume.sh [--get|--inc|--dec|--toggle|--toggle-mic|--get-icon|--get-mic-icon|--mic-inc|--mic-dec]
# Dependencies: notify-send, pamixer
# Called by:   Hyprland keybinds (media.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

# Get Volume
get_volume() {
    local volume
    volume=$(pamixer --get-volume)
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume %"
    fi
}

# Get icons
get_icon() {
    local current
    current=$(get_volume)
    if [[ "$current" == "Muted" ]]; then
        echo "$ICONS_DIR/volume-mute.png"
    elif [[ "${current%\%}" -le 30 ]]; then
        echo "$ICONS_DIR/volume-low.png"
    elif [[ "${current%\%}" -le 60 ]]; then
        echo "$ICONS_DIR/volume-mid.png"
    else
        echo "$ICONS_DIR/volume-high.png"
    fi
}

# Notify
notify_user() {
    if [[ "$(get_volume)" == "Muted" ]]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$(get_icon)" " Volume:" " Muted"
    else
        notify-send -e -h int:value:"$(get_volume | sed 's/%//')" -h string:x-canonical-private-synchronous:volume_notif -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$(get_icon)" " Volume Level:" " $(get_volume)" &&
        "$ATLAS_ROOT/automation/audio/sounds.sh" --volume
    fi
}

# Increase Volume
inc_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -i 5 --allow-boost --set-limit 150 && notify_user
    fi
}

# Decrease Volume
dec_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -d 5 && notify_user
    fi
}

# Toggle Mute
toggle_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
        pamixer -m && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$ICONS_DIR/volume-mute.png" " Mute"
    elif [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$(get_icon)" " Volume:" " Switched ON"
    fi
}

# Toggle Mic
toggle_mic() {
    if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
        pamixer --default-source -m && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$ICONS_DIR/microphone-mute.png" " Microphone:" " Switched OFF"
    elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        pamixer -u --default-source u && notify-send -e -u low -h boolean:SWAYNC_BYPASS_DND:true -i "$ICONS_DIR/microphone.png" " Microphone:" " Switched ON"
    fi
}

# Get Mic Icon
get_mic_icon() {
    local current
    current=$(pamixer --default-source --get-volume)
    if [[ "$current" -eq "0" ]]; then
        echo "$ICONS_DIR/microphone-mute.png"
    else
        echo "$ICONS_DIR/microphone.png"
    fi
}

# Get Microphone Volume
get_mic_volume() {
    local volume
    volume=$(pamixer --default-source --get-volume)
    if [[ "$volume" -eq "0" ]]; then
        echo "Muted"
    else
        echo "$volume %"
    fi
}

# Notify for Microphone
notify_mic_user() {
    local volume icon
    volume=$(get_mic_volume)
    icon=$(get_mic_icon)
    notify-send -e -h int:value:"${volume%\%*}" -h "string:x-canonical-private-synchronous:volume_notif" -h boolean:SWAYNC_BYPASS_DND:true -u low -i "$icon"  " Mic Level:" " $volume"
}

# Increase MIC Volume
inc_mic_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_mic
    else
        pamixer --default-source -i 5 && notify_mic_user
    fi
}

# Decrease MIC Volume
dec_mic_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_mic
    else
        pamixer --default-source -d 5 && notify_mic_user
    fi
}

# Execute accordingly
case "${1:-}" in
    --get) get_volume ;;
    --inc) inc_volume ;;
    --dec) dec_volume ;;
    --toggle) toggle_mute ;;
    --toggle-mic) toggle_mic ;;
    --get-icon) get_icon ;;
    --get-mic-icon) get_mic_icon ;;
    --mic-inc) inc_mic_volume ;;
    --mic-dec) dec_mic_volume ;;
    *) get_volume ;;
esac
