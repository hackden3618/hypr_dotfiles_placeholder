# Directory Structure

ATLAS is organized by responsibility rather than application.

## Runtime Configuration

- `hyprland.conf`: active Hyprland entry point
- `hyprland.lua`: staged Lua entry point
- `config/`: staged Lua module tree
- `configs/`: current shared Hyprlang configuration
- `UserConfigs/`: current user Hyprlang overrides

## Platform Layers

- `desktop/`: graphical capabilities and future adapters
- `development/`: engineering environment capabilities
- `automation/`: executable capability scripts
- `system/`: diagnostics, maintenance, power, backup, update, network
- `shared/`: constants, paths, environment, logging, adapters
- `security/`: SSH, GPG, secrets, hardening, recovery
- `profiles/`: operating modes as data
- `packages/`: package manifests by capability
- `install/`: bootstrap, verify, update, backup, restore, repair
- `docs/`: operator and maintainer documentation

## Rule

When adding something new, choose the capability first and the application second. For example, a status bar change belongs under the desktop status bar capability; Waybar is only the current implementation.
