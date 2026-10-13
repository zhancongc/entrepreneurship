#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sync_skill() {
  local source="$1"
  local target="$2"
  mkdir -p "$target"
  rsync -a --delete "$source/" "$target/"
  printf 'synced %s -> %s\n' "$source" "$target"
}

sync_skill "$ROOT/core/entrepreneurship-operating-system" "$HOME/Github/DanmoTrade/.agents/skills/entrepreneurship-operating-system"
sync_skill "$ROOT/core/lean-solo-startup" "$HOME/.claude/skills/lean-solo-startup"
sync_skill "$ROOT/workflow/prd-generator" "$HOME/.agents/skills/prd-generator"
sync_skill "$ROOT/workflow/prd-generator" "$HOME/.claude/skills/prd-generator"
