# ATLAS Architecture

ATLAS is a staged redesign of a JaKooLit-derived Hyprland desktop into a personal workstation platform.

## Layers

1. `hyprland.conf`
   The active boot path. It sources vendor defaults, user overrides, window rules, monitor output, and plugins.

2. `configs/` and `UserConfigs/`
   The current Hyprlang configuration layer. This remains authoritative until Lua parity is complete.

3. `automation/`
   The target script platform. It is organized by responsibility rather than upstream origin: audio, display, compositor, desktop, launchers, session, system, theming, info, sddm, and boot.

4. `config/`
   The target Lua module tree. It is currently a skeleton and should be filled in layer by layer.

5. `docs/`
   Operator documentation for maintaining the desktop without rediscovering migration context.

## Design Principles

- Preserve a bootable desktop at every step.
- Prefer small parity-preserving migrations over heroic rewrites.
- Keep monitor generation under `nwg-displays`.
- Keep generated theme files separate from hand-written platform files.
- Use `automation/lib/common.sh` for shared script constants and helper functions in newly normalized scripts.

## Future Entry Point

The eventual Lua entry point should only bootstrap first-run automation and require `config.init`. Configuration logic belongs in modules, not the entry point.
