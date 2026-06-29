#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Desktop / Quick Settings
# ============================================================
# Description: Rofi menu for quick access to settings and tools.
# Usage:       quick-settings.sh
# Dependencies: rofi, kitty
# Called by:   Hyprland keybinds (desktop.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

rofi_theme="$HOME/.config/rofi/config-edit.rasi"
msg=' ⁉️ Choose what to do ⁉️'

# Extract terminal and editor from variables.lua
var_file="$ATLAS_ROOT/config/platform/variables.lua"
term="kitty"
edit="nvim"

if [[ -f "$var_file" ]]; then
    parsed_term=$(grep -E '^\s*terminal\s*=\s*".*"' "$var_file" | cut -d'"' -f2 || true)
    parsed_edit=$(grep -E '^\s*editor\s*=\s*".*"' "$var_file" | cut -d'"' -f2 || true)
    [[ -n "$parsed_term" ]] && term="$parsed_term"
    [[ -n "$parsed_edit" ]] && edit="$parsed_edit"
fi

# Function to display the menu options without numbers
menu() {
    cat <<EOF
Edit Platform Variables
Edit Environment Variables
Edit Window Rules (Tags)
Edit Window Rules (Floating)
Edit Window Rules (Opacity)
Edit Window Rules (Workspaces)
Edit Core Keybinds
Edit Desktop Keybinds
Edit Media Keybinds
Edit User Keybinds
Edit Core Startup
Edit Desktop Startup
Edit User Startup
Edit Compositor General
Edit Compositor Decorations
Edit Compositor Misc
Choose Kitty Terminal Theme
Configure Monitors (nwg-displays)
Configure Workspace Rules (nwg-displays)
GTK Settings (nwg-look)
QT Apps Settings (qt6ct)
QT Apps Settings (qt5ct)
Choose Hyprland Animations
Choose Monitor Profiles
Choose Rofi Themes
Search for Keybinds
Toggle Game Mode
Switch Dark-Light Theme
EOF
}

# Main function to handle menu selection
main() {
    local choice
    choice=$(menu | rofi -i -dmenu -config "$rofi_theme" -mesg "$msg" || true)
    
    local file=""
    
    # Map choices to corresponding files
    case "$choice" in
        "Edit Platform Variables") file="$ATLAS_ROOT/config/platform/variables.lua" ;;
        "Edit Environment Variables") file="$ATLAS_ROOT/config/platform/environment.lua" ;;
        "Edit Window Rules (Tags)") file="$ATLAS_ROOT/config/desktop/rules/tags.lua" ;;
        "Edit Window Rules (Floating)") file="$ATLAS_ROOT/config/desktop/rules/floating.lua" ;;
        "Edit Window Rules (Opacity)") file="$ATLAS_ROOT/config/desktop/rules/opacity.lua" ;;
        "Edit Window Rules (Workspaces)") file="$ATLAS_ROOT/config/desktop/rules/workspace.lua" ;;
        "Edit Core Keybinds") file="$ATLAS_ROOT/config/input/keybinds/core.lua" ;;
        "Edit Desktop Keybinds") file="$ATLAS_ROOT/config/input/keybinds/desktop.lua" ;;
        "Edit Media Keybinds") file="$ATLAS_ROOT/config/input/keybinds/media.lua" ;;
        "Edit User Keybinds") file="$ATLAS_ROOT/config/input/keybinds/user.lua" ;;
        "Edit Core Startup") file="$ATLAS_ROOT/config/startup/core.lua" ;;
        "Edit Desktop Startup") file="$ATLAS_ROOT/config/startup/desktop.lua" ;;
        "Edit User Startup") file="$ATLAS_ROOT/config/startup/user.lua" ;;
        "Edit Compositor General") file="$ATLAS_ROOT/config/desktop/compositor/general.lua" ;;
        "Edit Compositor Decorations") file="$ATLAS_ROOT/config/desktop/compositor/decorations.lua" ;;
        "Edit Compositor Misc") file="$ATLAS_ROOT/config/desktop/compositor/misc.lua" ;;
        "Choose Kitty Terminal Theme") "$ATLAS_ROOT/automation/theming/kitty-themes.sh" ;;
        "Configure Monitors (nwg-displays)") 
            if ! command -v nwg-displays &>/dev/null; then
                notify "E-R-R-O-R" "Install nwg-displays first" "$ICONS_DIR/error.png"
                exit 1
            fi
            nwg-displays ;;
        "Configure Workspace Rules (nwg-displays)") 
            if ! command -v nwg-displays &>/dev/null; then
                notify "E-R-R-O-R" "Install nwg-displays first" "$ICONS_DIR/error.png"
                exit 1
            fi
            nwg-displays ;;
        "GTK Settings (nwg-look)") 
            if ! command -v nwg-look &>/dev/null; then
                notify "E-R-R-O-R" "Install nwg-look first" "$ICONS_DIR/error.png"
                exit 1
            fi
            nwg-look ;;
        "QT Apps Settings (qt6ct)") 
            if ! command -v qt6ct &>/dev/null; then
                notify "E-R-R-O-R" "Install qt6ct first" "$ICONS_DIR/error.png"
                exit 1
            fi
            qt6ct ;;
        "QT Apps Settings (qt5ct)") 
            if ! command -v qt5ct &>/dev/null; then
                notify "E-R-R-O-R" "Install qt5ct first" "$ICONS_DIR/error.png"
                exit 1
            fi
            qt5ct ;;
        "Choose Hyprland Animations") "$ATLAS_ROOT/automation/compositor/animations.sh" ;;
        "Choose Monitor Profiles") "$ATLAS_ROOT/automation/display/monitor-profiles.sh" ;;
        "Choose Rofi Themes") "$ATLAS_ROOT/automation/launchers/rofi-themes.sh" ;;
        "Search for Keybinds") "$ATLAS_ROOT/automation/info/keybinds.sh" ;;
        "Toggle Game Mode") "$ATLAS_ROOT/automation/compositor/game-mode.sh" ;;
        "Switch Dark-Light Theme") "$ATLAS_ROOT/automation/desktop/dark-light.sh" ;;
        *) return ;;  # Do nothing for invalid choices
    esac

    # Open the selected file in the terminal with the text editor
    if [ -n "$file" ]; then
        if [[ ! -f "$file" ]]; then
            touch "$file"
        fi
        $term -e $edit "$file"
    fi
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi || true
fi

main
