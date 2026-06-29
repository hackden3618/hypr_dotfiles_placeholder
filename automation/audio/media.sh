#!/usr/bin/env bash
# ============================================================
# ATLAS Platform — Audio / Media
# ============================================================
# Description: Media playback control.
# Usage:       media.sh [--nxt|--prv|--pause|--stop]
# Dependencies: notify-send, playerctl
# Called by:   Hyprland keybinds (media.lua)
# ============================================================
set -euo pipefail

# shellcheck source=../lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/../lib/common.sh"

music_icon="$ICONS_DIR/music.png"

# Display notification with song information
show_music_notification() {
  local status
  status=$(playerctl status 2>/dev/null || true)
  if [[ "$status" == "Playing" ]]; then
    local song_title song_artist
    song_title=$(playerctl metadata title 2>/dev/null || echo "Unknown Title")
    song_artist=$(playerctl metadata artist 2>/dev/null || echo "Unknown Artist")
    notify-send -e -u low -i "$music_icon" "Now Playing:" "$song_title by $song_artist"
  elif [[ "$status" == "Paused" ]]; then
    notify-send -e -u low -i "$music_icon" " Playback:" " Paused"
  fi
}

# Play the next track
play_next() {
  playerctl next || true
  show_music_notification
}

# Play the previous track
play_previous() {
  playerctl previous || true
  show_music_notification
}

# Toggle play/pause
toggle_play_pause() {
  playerctl play-pause || true
  sleep 0.1
  show_music_notification
}

# Stop playback
stop_playback() {
  playerctl stop || true
  notify-send -e -u low -i "$music_icon" " Playback:" " Stopped"
}

# Get media control action from command line argument
case "${1:-}" in
  --nxt) play_next ;;
  --prv) play_previous ;;
  --pause) toggle_play_pause ;;
  --stop) stop_playback ;;
  *)
    echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
    exit 1
    ;;
esac
