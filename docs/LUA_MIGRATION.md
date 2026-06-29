# Lua Migration

Hyprland 0.55.4 supports Lua configuration, but the API must be taken from the installed package, not copied from older examples.

## Verified API Shape

The local package ships:

- `/usr/share/hypr/hyprland.lua`
- `/usr/share/hypr/stubs/hl.meta.lua`

The verified API uses functions such as:

- `hl.config({...})`
- `hl.monitor({...})`
- `hl.env(...)`
- `hl.bind(...)`
- `hl.on("hyprland.start", function() ... end)`
- `hl.dsp.exec_cmd(...)`

`hl.source(...)` is not available in this build.

## Current State

`hyprland.lua` exists and verifies successfully with:

```bash
hyprland --verify-config --config ~/.config/hypr/hyprland.lua
```

It is not yet the active session entry point. The active entry point remains `hyprland.conf` until Lua has full parity with the existing window rules, startup behavior, monitor handling, and keybind surface.

Window/layer rule parity is represented by `config/desktop/rules/generated.lua`, generated from `UserConfigs/WindowRules.conf`.

Activation helpers:

```bash
~/.config/hypr/install/activate-lua.sh
~/.config/hypr/install/rollback-legacy.sh
```

## Cutover Criteria

- `install/verify.sh` passes.
- Window rules are ported or intentionally redesigned.
- Startup behavior is smoke-tested.
- Wallpaper, lock, notification, clipboard, launcher, screenshot, brightness, volume, and monitor workflows all work.
- A rollback path remains available through `hyprland.conf`.
