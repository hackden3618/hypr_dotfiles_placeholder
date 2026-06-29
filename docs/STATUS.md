# ATLAS Migration Status

Date: 2026-06-29

## Runtime Facts

- Hyprland package: 0.55.4-1
- Hyprland binary: `/usr/bin/hyprland`
- Wallpaper package: `awww 0.12.1-1`
- `awww` and `awww-daemon` are installed.
- `swww` and `swww-daemon` are not installed.
- `hyprctl` could not reach the compositor socket from the Codex shell, so live reload validation must be run from a user shell inside the Hyprland session.

## Active Today

- `hyprland.conf` remains the active compositor config.
- `configs/` and `UserConfigs/` remain sourced by `hyprland.conf`.
- `scripts/` and `UserScripts/` remain active for keybinds and startup.
- `monitors.conf` remains active for `nwg-displays` output.

## Staged Today

- `automation/` now contains a complete categorized copy of the script surface.
- `config/` contains the target Lua directory skeleton but no live modules yet.
- `docs/` now documents the migration path.
- `hyprland.lua` has not been created as the active entry point.

## Completed Foundation

- Removed or staged removal of tracked backup/deprecated files.
- Disabled the retired HyprMod override source in `hyprland.conf`.
- Converted active wallpaper commands from `swww` to `awww`.
- Added `scripts/WallustApply.sh` as the maintained wallpaper color helper.
- Kept `scripts/WallustSwww.sh` as a compatibility wrapper for any external callers.
- Disabled the stale `RainbowBorders.sh` startup entry because the script is not present.
- Added the full ATLAS automation directory structure and populated missing categories.

## Do Not Flip Yet

Do not point active keybinds at `automation/` wholesale until the copied scripts have been normalized and smoke-tested. Do not switch to Lua until the `config/` modules exist and mirror the current behavior.
