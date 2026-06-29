#!/bin/bash
choice=$(yad --list --title="Power" --text="Leaving already Dennis?" \
  --column="Action" "Shut Down" "Reboot" "Suspend" \
  --no-headers --button="OK:0" --button="Cancel:1")

case "$choice" in
  "Shut Down") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Suspend") systemctl suspend ;;
esac
