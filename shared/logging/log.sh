#!/usr/bin/env bash
set -euo pipefail

atlas_log() {
  printf '[ATLAS] %s\n' "$*" >&2
}

atlas_warn() {
  printf '[ATLAS WARN] %s\n' "$*" >&2
}

atlas_error() {
  printf '[ATLAS ERROR] %s\n' "$*" >&2
}
