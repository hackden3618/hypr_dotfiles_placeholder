# Adapters

Adapters are the boundary between a platform capability and a concrete application.

Examples:

- The desktop owns the status bar capability.
- `waybar` is the current status bar adapter.
- A future `quickshell` implementation should satisfy the same capability without rewriting unrelated systems.

Keep application-specific details behind adapters whenever a subsystem grows beyond one script.
