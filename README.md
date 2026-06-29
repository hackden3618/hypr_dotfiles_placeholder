# ATLAS Hyprland Workstation

This repository is the live configuration for a Hyprland desktop. Treat it as production infrastructure: changes should preserve login, lock, wallpaper, keybind, display, and recovery behavior.

## Current Mode

- Active compositor entry point: `hyprland.conf`
- Active configuration format: Hyprlang `.conf`
- Target configuration format: Hyprland Lua modules
- Active script roots: `scripts/` and `UserScripts/`
- Staged platform script root: `automation/`
- Wallpaper daemon: `awww`
- Monitor authority: `nwg-displays`

The Lua migration is intentionally staged. Do not switch to `hyprland.lua` until the module tree in `config/` is populated and reload-tested from inside the running Hyprland session.

## Maps

- Master plan: `implementation_plan.md`
- Architecture: `docs/ARCHITECTURE.md`
- Automation: `docs/AUTOMATION.md`
- Roadmap: `docs/ROADMAP.md`
- Current migration status: `docs/STATUS.md`

## Safety Rules

- Keep `hyprland.conf` bootable until Lua has full parity.
- Keep `scripts/` and `UserScripts/` until every active keybind/startup entry has an automation equivalent.
- Keep `monitors.conf` as the active generated monitor file while `nwg-displays` writes Hyprlang.
- Avoid restoring HyprMod override files into the active source path; HyprMod may be used as an optional GUI only.
