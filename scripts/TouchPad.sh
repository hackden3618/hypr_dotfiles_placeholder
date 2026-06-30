#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For disabling touchpad.
# Edit the Touchpad_Device on ~/.config/hypr/hyprconf/UserConfigs/Laptops.conf according to your system
# use hyprctl devices to get your system touchpad device name
# source https://github.com/hyprwm/Hyprland/discussions/4283?sort=new#discussioncomment-8648109

notif="$HOME/.config/swaync/images/ja.png"
configured_touchpad_device="$(
    awk -F= '/^[[:space:]]*\$Touchpad_Device[[:space:]]*=/ {
        value=$2
        sub(/[[:space:]]*#.*/, "", value)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", value)
        print value
        exit
    }' "$HOME/.config/hypr/hyprconf/UserConfigs/Laptops.conf"
)"

touchpad_devices() {
    if command -v jq >/dev/null 2>&1; then
        hyprctl devices -j 2>/dev/null |
            jq -r '.mice[]?.name // empty' |
            awk 'tolower($0) ~ /(touchpad|trackpad|elan|asue|synaptics)/ { print }'
    else
        hyprctl devices 2>/dev/null |
            awk '
                /Touchpad at/ { in_touchpad = 1; next }
                in_touchpad && /^[^[:space:]].*:$/ { in_touchpad = 0 }
                in_touchpad && /^[[:space:]]*name:/ {
                    sub(/^[[:space:]]*name:[[:space:]]*/, "")
                    print
                }
            '
    fi
}

set_touchpad_state() {
    local state="$1"
    local ok=1
    local device

    if hyprctl keyword 'input:touchpad:enabled' "$state" -r 2>/dev/null; then
        ok=0
    fi

    for device in "$configured_touchpad_device" $(touchpad_devices); do
        [ -n "$device" ] || continue
        hyprctl keyword "device[$device]:enabled" "$state" -r 2>/dev/null && ok=0
        hyprctl keyword "device:$device:enabled" "$state" -r 2>/dev/null && ok=0
    done

    return "$ok"
}

runtime_dir="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
export STATUS_FILE="$runtime_dir/touchpad.status"

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
  disable_touchpad
else
  if [ "$(cat "$STATUS_FILE")" = "true" ]; then
    disable_touchpad
  elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
    enable_touchpad
  fi
fi
