#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Dark Light Switcher
# ============================================================
# Description: Switches between Dark and Light mode themes, GTK, and wallpapers.
# Usage:       dark-light.sh
# Dependencies: awww, wallust, kvantummanager, gsettings, sed
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

wallpaper_base_path="$HOME/Pictures/wallpapers/Dynamic-Wallpapers"
dark_wallpapers="$wallpaper_base_path/Dark"
light_wallpapers="$wallpaper_base_path/Light"
swaync_style="$HOME/.config/swaync/style.css"
ags_style="$HOME/.config/ags/user/style.css"
wallust_rofi="$HOME/.config/wallust/templates/colors-rofi.rasi"
kitty_conf="$HOME/.config/kitty/kitty.conf"
wallust_config="$HOME/.config/wallust/wallust.toml"
pallete_dark="dark16"
pallete_light="light16"

# Kill processes that need restarting
for pid in waybar rofi swaync ags swaybg; do
    killall -SIGUSR1 "$pid" 2>/dev/null || true
done

# Initialize awww if needed
awww query >/dev/null 2>&1 || awww-daemon --format xrgb &
awww_cmd="awww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 60 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"

# Determine current theme mode
theme_state_file="$CACHE_DIR/.theme_mode"
if [[ "$(cat "$theme_state_file" 2>/dev/null || echo '')" == "Light" ]]; then
    next_mode="Dark"
    wallpaper_path="$dark_wallpapers"
else
    next_mode="Light"
    wallpaper_path="$light_wallpapers"
fi

echo "$next_mode" > "$theme_state_file"
notify "Switching to" "$next_mode mode" "$ICONS_DIR/bell.png"

# wallust config
if [ "$next_mode" = "Dark" ]; then
    sed -i 's/^palette = .*/palette = "'"$pallete_dark"'"/' "$wallust_config" 
else
    sed -i 's/^palette = .*/palette = "'"$pallete_light"'"/' "$wallust_config" 
fi

# Set Waybar style
set_waybar_style() {
    local theme="$1"
    local waybar_styles="$HOME/.config/waybar/style"
    local waybar_style_link="$HOME/.config/waybar/style.css"
    local style_prefix="\\[${theme}\\].*\\.css$"

    # find -L fails with pipefail if find exits early. Let's use mapfile
    mapfile -t style_files < <(find -L "$waybar_styles" -maxdepth 1 -type f -regex ".*$style_prefix" 2>/dev/null || true)
    if [[ ${#style_files[@]} -gt 0 ]]; then
        local style_file="${style_files[RANDOM % ${#style_files[@]}]}"
        ln -sf "$style_file" "$waybar_style_link"
    else
        echo "Style file not found for $theme theme."
    fi
}
set_waybar_style "$next_mode"

# swaync color change
if [ "$next_mode" = "Dark" ]; then
    sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.8);/' "${swaync_style}" || true
else
    sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.9);/' "${swaync_style}" || true
fi

# ags color change
if command -v ags >/dev/null 2>&1; then    
    if [ "$next_mode" = "Dark" ]; then
        sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.4);/' "${ags_style}" || true
        sed -i '/@define-color text-color/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.7);/' "${ags_style}" || true
        sed -i '/@define-color noti-bg-alt/s/#.*;/#111111;/' "${ags_style}" || true
    else
        sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.4);/' "${ags_style}" || true
        sed -i '/@define-color text-color/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.7);/' "${ags_style}" || true
        sed -i '/@define-color noti-bg-alt/s/#.*;/#F0F0F0;/' "${ags_style}" || true
    fi
fi

# kitty background color change
if [ "$next_mode" = "Dark" ]; then
    sed -i '/^foreground /s/^foreground .*/foreground #dddddd/' "${kitty_conf}" || true
    sed -i '/^background /s/^background .*/background #000000/' "${kitty_conf}" || true
    sed -i '/^cursor /s/^cursor .*/cursor #dddddd/' "${kitty_conf}" || true
else
    sed -i '/^foreground /s/^foreground .*/foreground #000000/' "${kitty_conf}" || true
    sed -i '/^background /s/^background .*/background #dddddd/' "${kitty_conf}" || true
    sed -i '/^cursor /s/^cursor .*/cursor #000000/' "${kitty_conf}" || true
fi

for pid_kitty in $(pidof kitty || true); do
    kill -SIGUSR1 "$pid_kitty" 2>/dev/null || true
done

# Set Dynamic Wallpaper
mapfile -t wp_files < <(find -L "${wallpaper_path}" -type f \( -iname "*.jpg" -o -iname "*.png" \) 2>/dev/null || true)
if [[ ${#wp_files[@]} -gt 0 ]]; then
    next_wallpaper="${wp_files[RANDOM % ${#wp_files[@]}]}"
    $awww_cmd "${next_wallpaper}" $effect
else
    next_wallpaper=""
fi

# Kvantum & QT
if [ "$next_mode" = "Dark" ]; then
    kvantum_theme="catppuccin-mocha-blue"
    qt5ct_color_scheme="$HOME/.config/qt5ct/colors/Catppuccin-Mocha.conf"
    qt6ct_color_scheme="$HOME/.config/qt6ct/colors/Catppuccin-Mocha.conf"
else
    kvantum_theme="catppuccin-latte-blue"
    qt5ct_color_scheme="$HOME/.config/qt5ct/colors/Catppuccin-Latte.conf"
    qt6ct_color_scheme="$HOME/.config/qt6ct/colors/Catppuccin-Latte.conf"
fi
sed -i "s|^color_scheme_path=.*$|color_scheme_path=$qt5ct_color_scheme|" "$HOME/.config/qt5ct/qt5ct.conf" || true
sed -i "s|^color_scheme_path=.*$|color_scheme_path=$qt6ct_color_scheme|" "$HOME/.config/qt6ct/qt6ct.conf" || true
if command -v kvantummanager >/dev/null 2>&1; then
    kvantummanager --set "$kvantum_theme" || true
fi

# rofi bg
if [ "$next_mode" = "Dark" ]; then
    sed -i '/^background:/s/.*/background: rgba(0,0,0,0.7);/' "$wallust_rofi" || true
else
    sed -i '/^background:/s/.*/background: rgba(255,255,255,0.9);/' "$wallust_rofi" || true
fi

# GTK theme
set_custom_gtk_theme() {
    local mode=$1
    local color_setting="org.gnome.desktop.interface color-scheme"
    
    if [ "$mode" == "Light" ]; then
        gsettings set $color_setting 'prefer-light' || true
    else
        gsettings set $color_setting 'prefer-dark' || true
    fi
}
set_custom_gtk_theme "$next_mode"

if [[ -n "$next_wallpaper" ]]; then
    "$ATLAS_ROOT/automation/theming/wallust-apply.sh" "$next_wallpaper" || true
fi

sleep 2
for pid1 in waybar rofi swaync ags swaybg; do
    killall "$pid1" 2>/dev/null || true
done

sleep 1
"$ATLAS_ROOT/automation/desktop/refresh.sh" || true

sleep 0.5
notify "Themes switched to" "$next_mode Mode" "$ICONS_DIR/bell.png"
exit 0
