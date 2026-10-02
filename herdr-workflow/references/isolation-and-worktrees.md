# Isolation and worktrees

## Hard isolation gate

Before starting any worker, inventory the actual effective inputs: harness user/project/local configuration, MCP and integration definitions, credential stores, environment variables, inherited process context, and project-level agent instructions. Verify what the worker will load after all configuration precedence and project discovery are applied. Use an independently clean/approved worker config where supported, then re-check the effective result. Keep coordinator-only credentials and tool definitions out of worker configuration, environment, generated specs, and shared repository files.

Known harness considerations (verify against installed version):

- **Codex:** `CODEX_HOME` can select a user config root, but project `.codex` config is a separate layer. A new home directory by itself does not prove all project config or inherited secrets are excluded.
- **OpenCode:** `OPENCODE_CONFIG` and `OPENCODE_CONFIG_DIR` select additional/custom configuration, while project config is also discovered and can override global/custom settings. A separate user config file does not prove project MCPs were excluded.
- **Claude Code:** `CLAUDE_CONFIG_DIR` selects the user configuration/storage directory. Project settings and `.mcp.json` may still apply; verify loaded scopes and inherited environment.

These mechanisms are not blanket isolation guarantees. Do not offer a generic launcher as safe without proving the effective runtime. If that proof is unavailable, block launch and escalate.

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
