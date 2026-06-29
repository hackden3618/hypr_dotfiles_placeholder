#!/usr/bin/env bash
# ============================================================
# ATLAS Verification
# Static verification for the live desktop platform.
# ============================================================
set -euo pipefail

ATLAS_ROOT="${ATLAS_ROOT:-$HOME/.config/hypr}"
source "$ATLAS_ROOT/shared/logging/log.sh"

main() {
  atlas_log "checking shell syntax"
  mapfile -t shell_files < <(
    find \
      "$ATLAS_ROOT/automation" \
      "$ATLAS_ROOT/install" \
      "$ATLAS_ROOT/scripts" \
      "$ATLAS_ROOT/system" \
      "$ATLAS_ROOT/UserScripts" \
      -type f -name '*.sh' -print
    printf '%s\n' "$ATLAS_ROOT/initial-boot.sh"
  )

  for file in "${shell_files[@]}"; do
    bash -n "$file"
  done

  atlas_log "checking active Hyprland config"
  hyprland --verify-config --config "$ATLAS_ROOT/hyprland.conf"

  atlas_log "checking staged Lua Hyprland config"
  hyprland --verify-config --config "$ATLAS_ROOT/hyprland.lua"

  atlas_log "checking for stale swww commands"
  stale_output="$(mktemp)"
  if rg -n 'swww (img|query)|swww-daemon' \
    "$ATLAS_ROOT/automation" \
    "$ATLAS_ROOT/config" \
    "$ATLAS_ROOT/configs" \
    "$ATLAS_ROOT/hyprland.conf" \
    "$ATLAS_ROOT/hyprland.lua" \
    "$ATLAS_ROOT/initial-boot.sh" \
    "$ATLAS_ROOT/scripts" \
    "$ATLAS_ROOT/UserConfigs" \
    "$ATLAS_ROOT/UserScripts" \
    >"$stale_output"; then
    cat "$stale_output"
    rm -f "$stale_output"
    atlas_error "stale swww command references found"
    exit 1
  fi
  rm -f "$stale_output"

  atlas_log "verification complete"
}

main "$@"
