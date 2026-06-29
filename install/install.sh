#!/usr/bin/env bash
# ============================================================
# ATLAS Package Installer
# Usage: install/install.sh [--dry-run|--apply] PROFILE
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

mode="--dry-run"
profile="${1:-workstation}"

if [[ "${1:-}" == "--dry-run" || "${1:-}" == "--apply" ]]; then
  mode="$1"
  profile="${2:-workstation}"
fi

package_sets_for_profile() {
  case "$1" in
    minimal) printf '%s\n' core fonts utilities ;;
    laptop) printf '%s\n' core desktop fonts utilities ;;
    desktop) printf '%s\n' core desktop fonts multimedia utilities ;;
    development) printf '%s\n' core desktop fonts development utilities ;;
    workstation) printf '%s\n' core desktop fonts development multimedia security utilities ;;
    performance) printf '%s\n' core desktop fonts development multimedia utilities gaming ;;
    battery) printf '%s\n' core desktop fonts utilities ;;
    gaming) printf '%s\n' core desktop fonts multimedia utilities gaming ;;
    cybersecurity) printf '%s\n' core desktop fonts development security cybersecurity utilities ;;
    machine-learning) printf '%s\n' core desktop fonts development machine-learning utilities ;;
    *)
      atlas_error "unknown profile: $1"
      exit 2
      ;;
  esac
}

collect_packages() {
  local set file
  package_sets_for_profile "$profile" | while read -r set; do
    file="$ATLAS_ROOT/packages/$set.lst"
    [[ -f "$file" ]] || {
      atlas_error "missing package manifest: $file"
      exit 1
    }
    sed '/^\s*#/d;/^\s*$/d' "$file"
  done | sort -u
}

main() {
  mapfile -t packages < <(collect_packages)
  atlas_log "profile: $profile"
  atlas_log "packages: ${#packages[@]}"

  if [[ "$mode" == "--dry-run" ]]; then
    printf '%s\n' "${packages[@]}"
    atlas_log "dry run only; use --apply to install with pacman"
    return 0
  fi

  sudo pacman -S --needed "${packages[@]}"
}

main "$@"
