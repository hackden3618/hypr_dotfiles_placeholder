# Troubleshooting

## Static Verification

```bash
~/.config/hypr/install/verify.sh
```

## Active Hyprland Config

```bash
hyprland --verify-config --config ~/.config/hypr/hyprland.conf
```

## Staged Lua Config

```bash
hyprland --verify-config --config ~/.config/hypr/hyprland.lua
```

## Running Session Config Errors

From inside Hyprland:

```bash
hyprctl configerrors
```

## Wallpaper

This machine uses `awww`, not `swww`.

```bash
command -v awww
command -v awww-daemon
awww query
```

## Recovery

If Lua cutover ever breaks login, return the session entry point to `hyprland.conf`. The legacy config is intentionally preserved until Lua parity is complete.
