# Worktrees

## Worktree boundary

Original checkouts are inspection-only. Create feature worktrees from them using Herdr's documented worktree workflow and let Herdr return the resulting location/IDs. Set worker cwd to the returned worktree path. Before any edit/build/test, confirm the process cwd is that worktree and belongs to the intended repo. If verification fails, stop; do not proceed in the original checkout.

One implementation pane per repo/worktree pair. Multiple worktrees for one feature stay under its feature container. Keep session handles so worker can resume for coordinator feedback and verification. Never clean up automatically.

## Herdr commands

Use installed-version help and the bundled skill before operational commands:

```sh
herdr --help
herdr --skill
herdr workspace --help
herdr tab --help
herdr worktree --help
herdr pane --help
herdr agent --help
```

Herdr `--skill` output states that creation commands may mutate state and that IDs must come from live responses. Consult it for exact operations; do not guess flags or probe mutating subcommands without arguments. This package intentionally does not prescribe a universal worker-launch command because safely passing approved per-harness isolation depends on effective local/project config.
