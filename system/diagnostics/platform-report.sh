#!/usr/bin/env bash
# ============================================================
# ATLAS Platform Report
# Prints workstation facts useful for debugging.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

section() {
  printf '\n== %s ==\n' "$1"
}

section "ATLAS"
printf 'root: %s\n' "$ATLAS_ROOT"
git -C "$ATLAS_ROOT" status --short || true

section "Hyprland"
hyprland --version || true
hyprland --verify-config --config "$ATLAS_ROOT/hyprland.conf" || true

section "Wallpaper"
command -v awww || true
command -v awww-daemon || true
pacman -Q awww 2>/dev/null || true

section "Wayland Services"
for cmd in waybar swaync hyprlock hypridle wireplumber; do
  printf '%-32s ' "$cmd"
  command -v "$cmd" >/dev/null 2>&1 && printf 'ok\n' || printf 'missing\n'
done
printf '%-32s ' "xdg-desktop-portal-hyprland"
if pacman -Q xdg-desktop-portal-hyprland >/dev/null 2>&1 || [[ -e /usr/share/xdg-desktop-portal/hyprland-portals.conf ]]; then
  printf 'ok\n'
else
  printf 'missing\n'
fi

section "Packages"
pacman -Q hyprland hypridle hyprlock waybar swaync rofi-wayland cliphist wl-clipboard 2>/dev/null || true
