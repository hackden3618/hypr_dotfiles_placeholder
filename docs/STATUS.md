# ATLAS Migration Status

Date: 2026-06-29

## Runtime Facts

- Hyprland package: 0.55.4-1
- Hyprland binary: `/usr/bin/hyprland`
- Wallpaper package: `awww 0.12.1-1`
- `awww` and `awww-daemon` are installed.
- `swww` and `swww-daemon` are not installed.
- `hyprctl` could not reach the compositor socket from the Codex shell, so live reload validation must be run from a user shell inside the Hyprland session.
- A live unsandboxed `hyprctl configerrors` check was run and reported no errors.

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
- `hyprland.lua` now exists as a verified staged Lua entry point.
- `config/desktop/rules/generated.lua` contains a Lua parity port of the active generated window/layer rules from `UserConfigs/WindowRules.conf`.
- Lua keybind modules cover the main legacy desktop, media, laptop, screenshot, launcher, wallpaper, Waybar, session, workspace, layout, and compositor control workflows.

## Completed Foundation

- Removed or staged removal of tracked backup/deprecated files.
- Disabled the retired HyprMod override source in `hyprland.conf`.
- Converted active wallpaper commands from `swww` to `awww`.
- Added `scripts/WallustApply.sh` as the maintained wallpaper color helper.
- Kept `scripts/WallustSwww.sh` as a compatibility wrapper for any external callers.
- Disabled the stale `RainbowBorders.sh` startup entry because the script is not present.
- Added a verified Lua module tree using the installed Hyprland 0.55 Lua API.
- Added `install/activate-lua.sh` and `install/rollback-legacy.sh`.
- Added platform packages, profiles, shared constants, diagnostics, and installation tooling.
- Added the full ATLAS automation directory structure and populated missing categories.

## Do Not Flip Yet

Do not switch the login/session default to Lua until the explicit test command below has been run from a separate TTY or nested-safe session and the smoke tests pass:

```bash
Hyprland --config ~/.config/hypr/hyprland.lua
```

Keep `hyprland.conf` as rollback until that live test has passed.
