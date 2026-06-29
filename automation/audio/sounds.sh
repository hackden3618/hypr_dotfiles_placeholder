#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Audio / Sounds
# ============================================================
# Description: Plays system sounds for notifications and events.
# Usage:       sounds.sh [--screenshot|--volume|--error]
# Dependencies: pw-play (or paplay)
# Called by:   volume.sh, screenshot scripts
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

theme="freedesktop" # Set the theme for the system sounds.
mute=false          # Set to true to mute the system sounds globally.

# Mute individual sounds here.
mute_screenshots=false
mute_volume=false
mute_error=false

if [[ "$mute" = true ]]; then
    exit 0
fi

soundoption=""
case "${1:-}" in
    --screenshot)
        [[ "$mute_screenshots" = true ]] && exit 0
        soundoption="screen-capture.*"
        ;;
    --volume)
        [[ "$mute_volume" = true ]] && exit 0
        soundoption="audio-volume-change.*"
        ;;
    --error)
        [[ "$mute_error" = true ]] && exit 0
        soundoption="dialog-error.*"
        ;;
    *)
        echo "Available sounds: --screenshot, --volume, --error"
        exit 0
        ;;
esac

# Set the directory defaults for system sounds.
if [ -d "/run/current-system/sw/share/sounds" ]; then
    systemDIR="/run/current-system/sw/share/sounds" # NixOS fallback
else
    systemDIR="/usr/share/sounds"
fi
userDIR="$HOME/.local/share/sounds"
defaultTheme="freedesktop"

# Prefer the user's theme, but use the system's if it doesn't exist.
sDIR="$systemDIR/$defaultTheme"
if [ -d "$userDIR/$theme" ]; then
    sDIR="$userDIR/$theme"
elif [ -d "$systemDIR/$theme" ]; then
    sDIR="$systemDIR/$theme"
fi

# Get the theme that it inherits (avoid failing if index.theme doesn't exist).
iTheme=$(grep -i "inherits" "$sDIR/index.theme" 2>/dev/null | cut -d "=" -f 2 || echo "")
iDIR="$sDIR/../$iTheme"

# Find the sound file and play it.
sound_file=$(find -L "$sDIR/stereo" -name "$soundoption" -print -quit 2>/dev/null || true)
if [[ ! -f "$sound_file" ]]; then
    sound_file=$(find -L "$iDIR/stereo" -name "$soundoption" -print -quit 2>/dev/null || true)
    if [[ ! -f "$sound_file" ]]; then
        sound_file=$(find -L "$userDIR/$defaultTheme/stereo" -name "$soundoption" -print -quit 2>/dev/null || true)
        if [[ ! -f "$sound_file" ]]; then
            sound_file=$(find -L "$systemDIR/$defaultTheme/stereo" -name "$soundoption" -print -quit 2>/dev/null || true)
            if [[ ! -f "$sound_file" ]]; then
                log_err "Sound file not found for: $soundoption"
                exit 1
            fi
        fi
    fi
fi

# pipewire priority, fallback pulseaudio
pw-play "$sound_file" || paplay "$sound_file"
