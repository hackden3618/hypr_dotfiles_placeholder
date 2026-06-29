#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Waybar Layouts
# ============================================================
# Description: Selects and applies Waybar configuration layouts via Rofi.
# Usage:       waybar-layout.sh
# Dependencies: rofi
# Called by:   Waybar, Hyprland keybinds
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

IFS=$'\n\t'

waybar_layouts="$HOME/.config/waybar/configs"
waybar_config="$HOME/.config/waybar/config"
rofi_config="$HOME/.config/rofi/config-waybar-layout.rasi"
msg=' 🎌 NOTE: Some waybar LAYOUT NOT fully compatible with some STYLES'

# Kill Rofi if already running
if pgrep -x "rofi" >/dev/null; then
    pkill rofi || true
fi

# Apply selected configuration
apply_config() {
    ln -sf "$waybar_layouts/$1" "$waybar_config"
    "$ATLAS_ROOT/automation/desktop/refresh.sh" &
}

# Resolve current symlink target and basename
current_target=$(readlink -f "$waybar_config" || echo "")
current_name=$(basename "$current_target" || echo "")

# Build sorted list of available layouts
mapfile -t options < <(
    find -L "$waybar_layouts" -maxdepth 1 -type f -printf '%f\n' | sort || true
)

if [[ ${#options[@]} -eq 0 ]]; then
    notify "Waybar Layouts" "No layouts found in $waybar_layouts"
    exit 0
fi

# Mark and locate the active layout
default_row=0
MARKER="👉"
for i in "${!options[@]}"; do
    if [[ "${options[i]}" == "$current_name" ]]; then
        options[i]="$MARKER ${options[i]}"
        default_row=$i
        break
    fi
done

# Launch rofi with the annotated list, pre‑selecting the active row
choice=$(printf '%s\n' "${options[@]}" \
    | rofi -i -dmenu \
           -config "$rofi_config" \
           -mesg "$msg" \
           -selected-row "$default_row" || true
)

[[ -z "$choice" ]] && exit 0

# Strip marker before applying
choice=${choice#"$MARKER "}

case "$choice" in
    "no panel")
        pgrep -x "waybar" && pkill waybar || true
        ;;
    *)
        apply_config "$choice"
        ;;
esac
