#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Waybar Styles
# ============================================================
# Description: Selects and applies Waybar CSS styles via Rofi.
# Usage:       waybar-styles.sh
# Dependencies: rofi
# Called by:   Waybar, Hyprland keybinds
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

IFS=$'\n\t'

waybar_styles="$HOME/.config/waybar/style"
waybar_style="$HOME/.config/waybar/style.css"
rofi_config="$HOME/.config/rofi/config-waybar-style.rasi"
msg=' 🎌 NOTE: Some waybar STYLES NOT fully compatible with some LAYOUTS'

# Kill Rofi if already running
if pgrep -x "rofi" >/dev/null; then
    pkill rofi || true
fi

# Apply selected style
apply_style() {
    ln -sf "$waybar_styles/$1.css" "$waybar_style"
    "$ATLAS_ROOT/automation/desktop/refresh.sh" &
}

# resolve current symlink and strip .css
current_target=$(readlink -f "$waybar_style" || echo "")
current_name=$(basename "$current_target" .css || echo "")

# gather all style names (without .css) into an array
mapfile -t options < <(
    find -L "$waybar_styles" -maxdepth 1 -type f -name '*.css' \
        -exec basename {} .css \; \
        | sort || true
)

if [[ ${#options[@]} -eq 0 ]]; then
    notify "Waybar Styles" "No styles found in $waybar_styles"
    exit 0
fi

# mark the active style and record its index
default_row=0
MARKER="👉"
for i in "${!options[@]}"; do
    if [[ "${options[i]}" == "$current_name" ]]; then
        options[i]="$MARKER ${options[i]}"
        default_row=$i
        break
    fi
done

# launch rofi with the annotated list and pre‑selected row
choice=$(printf '%s\n' "${options[@]}" \
    | rofi -i -dmenu \
           -config "$rofi_config" \
           -mesg "$msg" \
           -selected-row "$default_row" || true
)

[[ -z "$choice" ]] && exit 0

# remove annotation and apply
choice=${choice#"$MARKER "}
apply_style "$choice"
