# ATLAS Automation

The `automation/` tree is the target home for all executable desktop automation.

## Directory Map

- `automation/audio`: volume, media, sound feedback
- `automation/display`: brightness, keyboard brightness, night light, monitor profiles
- `automation/compositor`: animations, blur, layout, game mode, overview
- `automation/desktop`: waybar, refresh, quick settings, dark/light mode
- `automation/launchers`: rofi launchers, calculator, emoji, clipboard
- `automation/session`: lock, logout, power, portal, polkit, drop terminal
- `automation/system`: airplane mode, touchpad, keyboard layout, update, process kill
- `automation/theming`: wallpapers, wallust, kitty, zsh theme
- `automation/info`: key hints, keybind search, battery, weather, uptime
- `automation/sddm`: display manager wallpaper support
- `automation/boot`: first-boot setup
- `automation/lib`: shared shell helpers

## Current Compatibility Rule

The active desktop still calls `scripts/` and `UserScripts/`. The automation tree is populated for migration, but it should be normalized and tested before it becomes the active command root.

## Normalization Checklist

- Source `automation/lib/common.sh` from each script that is edited for ATLAS.
- Replace hardcoded old paths with `ATLAS_ROOT` and `AUTOMATION`.
- Replace legacy script names in copied automation files with responsibility-based names.
- Keep `awww` as the wallpaper daemon.
- Run `bash -n` over all scripts after every batch.
