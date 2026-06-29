# Installation

The installation platform is profile-driven and intentionally conservative.

## Bootstrap

```bash
~/.config/hypr/install/bootstrap.sh
```

Bootstrap prepares local ATLAS state directories and verifies basic commands. It does not install packages.

## Dry Run Packages

```bash
~/.config/hypr/install/install.sh --dry-run workstation
```

This prints the package set for a profile without changing the machine.

## Apply Packages

```bash
~/.config/hypr/install/install.sh --apply workstation
```

This installs packages through `pacman -S --needed`.

## Verify

```bash
~/.config/hypr/install/verify.sh
```

Verification checks shell syntax, the active Hyprland config, the staged Lua config, and stale wallpaper daemon commands.

## Repair

```bash
~/.config/hypr/install/repair.sh
```

Repair restores executable permissions for platform scripts.

## Backup

```bash
~/.config/hypr/install/backup.sh
```

Backup creates a timestamped archive under `backups/`.
