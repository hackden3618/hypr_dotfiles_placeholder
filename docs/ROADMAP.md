# ATLAS Roadmap

## Phase 1: Stabilize Legacy Boot Path

- Keep `hyprland.conf` active.
- Finish stale command cleanup.
- Remove dead startup entries.
- Validate shell syntax.
- Run `hyprctl reload` from inside the running Hyprland session.

## Phase 2: Normalize Automation

- Refactor copied scripts in `automation/` to source `automation/lib/common.sh`.
- Update command paths to the new directory layout.
- Smoke-test wallpaper, lock, refresh, volume, brightness, rofi, and game mode.
- Only then update active keybinds and startup paths.

## Phase 3: Lua Platform Modules

- Add `config/platform/variables.lua`.
- Add environment and input modules.
- Port compositor settings.
- Port startup entries.
- Port keybinds.
- Port window rules last because they have the largest surface area.

## Phase 4: Lua Cutover

- Create `hyprland.lua`.
- Keep `hyprland.conf` as rollback.
- Reload from a Hyprland session.
- Fix config errors before logout or reboot.

## Phase 5: Remove Legacy

- Delete or archive `configs/`, `UserConfigs/`, `scripts/`, and `UserScripts/` only after the Lua and automation paths have full parity.
