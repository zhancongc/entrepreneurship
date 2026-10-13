# Entrepreneurship Skills

A small, versioned collection of skills for startup discovery, MVP validation,
solo-product execution, and product requirements work.

The repository is the **single source of truth**. The copies under the local
agent skill directories are generated working copies and should not be edited
directly.

## Included Skills

### Core

- `core/entrepreneurship-operating-system/`: startup stage gates, hypothesis
  design, customer discovery, MVP validation, metrics, and go/no-go decisions.
- `core/lean-solo-startup/`: lightweight execution for solo founders,
  two-week MVPs, paid validation, and sustainable small products.

### Workflow

- `workflow/prd-generator/`: product research, competitive analysis, and PRD
  generation.
- `workflow/market-demand-validation/`: evidence-based customer discovery,
  demand scoring, behavior experiments, paid validation, and go/no-go decisions.

## Sync To Local Agent Directories

After editing a skill in this repository, run:

```bash
./sync.sh
```

The script synchronizes repository content to the directories used by the
local agents:

| Repository path | Working copy |
| --- | --- |
| `core/entrepreneurship-operating-system` | `~/Github/DanmoTrade/.agents/skills/entrepreneurship-operating-system` |
| `core/lean-solo-startup` | `~/.claude/skills/lean-solo-startup` |
| `workflow/prd-generator` | `~/.agents/skills/prd-generator` and `~/.claude/skills/prd-generator` |
| `workflow/market-demand-validation` | `~/.agents/skills/market-demand-validation` and `~/.claude/skills/market-demand-validation` |

`sync.sh` uses `rsync --delete`, so run it only when the repository is the
intended source of truth. It intentionally leaves the original directories in
place so the local agent integrations continue to work.

## Update Workflow

1. Edit the canonical files in this repository.
2. Run `./sync.sh`.
3. Review `git diff` and run any relevant checks.
4. Commit and push the repository changes.
