# Security

Security improvements must preserve daily usability while reducing avoidable risk.

## Scope

- SSH configuration and key hygiene
- GPG and signing workflows
- Secrets management
- Package verification
- Recovery procedures
- Desktop permission boundaries
- Firewall and network inspection tools

## Current Decisions

- Hyprland permission enforcement is not enabled yet. It should be evaluated after Lua cutover because permission changes require a restart and can break screenshots, portals, or plugins.
- Restore is intentionally manual. Blind extraction into a live desktop config is too risky.
- Package installation remains explicit through `pacman`.

## Future Work

- Add SSH baseline documentation.
- Add GPG signing workflow.
- Add secrets adapter using `pass`, `age`, or `sops`.
- Add recovery checklist for broken compositor sessions.
