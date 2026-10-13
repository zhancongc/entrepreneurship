#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sync_skill() {
  local source="$1"
  local target="$2"
  local excludes=()
  if [ "$#" -gt 2 ]; then
    excludes=("${@:3}")
  fi
  mkdir -p "$target"
  local rsync_args=(-a --delete)
  # bash 3.2 + set -u: 空数组展开会误报 unbound variable，临时关闭仅此处
  set +u
  for ex in "${excludes[@]}"; do
    rsync_args+=(--exclude="$ex")
  done
  set -u
  rsync "${rsync_args[@]}" "$source/" "$target/"
  printf 'synced %s -> %s\n' "$source" "$target"
}

sync_skill "$ROOT/core/entrepreneurship-operating-system" "$HOME/Github/DanmoTrade/.agents/skills/entrepreneurship-operating-system"
sync_skill "$ROOT/core/lean-solo-startup" "$HOME/.claude/skills/lean-solo-startup"
sync_skill "$ROOT/workflow/prd-generator" "$HOME/.agents/skills/prd-generator" references scripts
sync_skill "$ROOT/workflow/prd-generator" "$HOME/.claude/skills/prd-generator" references scripts
sync_skill "$ROOT/workflow/market-demand-validation" "$HOME/.agents/skills/market-demand-validation"
sync_skill "$ROOT/workflow/market-demand-validation" "$HOME/.claude/skills/market-demand-validation"
