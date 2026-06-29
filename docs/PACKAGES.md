# Packages

Package manifests live in `packages/` and are grouped by capability.

## Manifests

- `core.lst`: base system and Wayland service foundation
- `desktop.lst`: Hyprland desktop capabilities
- `development.lst`: engineering tools
- `fonts.lst`: text rendering and UI fonts
- `security.lst`: secrets, SSH, inspection, and hardening tools
- `multimedia.lst`: media and audio utilities
- `utilities.lst`: general workstation utilities
- `machine-learning.lst`: AI and ML development
- `cybersecurity.lst`: lab and assessment tools
- `gaming.lst`: gaming and low-latency tools

## Policy

Do not install packages from random scripts. Add packages to manifests, then consume them through `install/install.sh`.

## Trade-Offs

Arch packages move quickly. Manifests improve reproducibility but do not freeze versions. If strict reproducibility becomes necessary, add a lockfile or snapshot strategy later.
