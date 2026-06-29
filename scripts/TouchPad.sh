#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For disabling touchpad.
# Edit the Touchpad_Device on ~/.config/hypr/hyprconf/UserConfigs/Laptops.conf according to your system
# use hyprctl devices to get your system touchpad device name
# source https://github.com/hyprwm/Hyprland/discussions/4283?sort=new#discussioncomment-8648109

notif="$HOME/.config/swaync/images/ja.png"
touchpad_device="$(
    awk -F= '/^[[:space:]]*\$Touchpad_Device[[:space:]]*=/ {
        value=$2
        sub(/[[:space:]]*#.*/, "", value)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
        print value
        exit
    }' "$HOME/.config/hypr/hyprconf/UserConfigs/Laptops.conf"
)"

set_touchpad_state() {
    local state="$1"

    if [ -n "$touchpad_device" ]; then
        hyprctl keyword "device[$touchpad_device]:enabled" "$state" -r 2>/dev/null && return
        hyprctl keyword "device:$touchpad_device:enabled" "$state" -r 2>/dev/null && return
    fi

    hyprctl keyword 'input:touchpad:enabled' "$state" -r
}

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    printf "true" >"$STATUS_FILE"
    notify-send -u low -i $notif  " Enabling" " touchpad"
    set_touchpad_state "true"
}

disable_touchpad() {
    printf "false" >"$STATUS_FILE"
    notify-send -u low -i $notif " Disabling" " touchpad"
    set_touchpad_state "false"
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_touchpad
  fi
fi
