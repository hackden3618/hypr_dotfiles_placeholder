# Workflow

ATLAS work should follow a production change loop.

1. Review the current implementation.
2. Check local package capabilities and current docs.
3. Design the capability boundary.
4. Implement in the smallest safe slice.
5. Run `install/verify.sh`.
6. Document the change.
7. Keep a rollback path.

## Daily Commands

```bash
~/.config/hypr/install/verify.sh
~/.config/hypr/system/diagnostics/platform-report.sh
~/.config/hypr/install/install.sh --dry-run workstation
```

## Lua Cutover Workflow

1. Keep `hyprland.conf` active.
2. Build and verify `hyprland.lua`.
3. Port one capability at a time.
4. Smoke-test inside the running Hyprland session.
5. Only switch session entry after parity is real.

Test command:

```bash
Hyprland --config ~/.config/hypr/hyprland.lua
```
