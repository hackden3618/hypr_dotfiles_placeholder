#!/usr/bin/env bash
# For Hyprlock
#pidof hyprlock || hyprlock -q

# Ensure weather cache is up-to-date before locking (Waybar/lockscreen readers)
bash "$HOME/.config/hypr/automation/info/weather-wrap.sh" >/dev/null 2>&1

loginctl lock-session
