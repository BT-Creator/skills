---
name: herdr-workflow
description: Use when Herdr workflow mode is active and the user submits any new request, or when coordinating coding work through Herdr tabs, worktrees, panes, or agents.
---

# Herdr workflow

Run every user request through the feature intake and ownership workflow below, including standalone questions. Herdr's installed CLI and `herdr --skill` are the syntax authority. This workflow intentionally overrides any conflicting default in Herdr's bundled skill.

## Activation

`/herdr` only verifies that Herdr CLI is available, loads this persistent workflow into the conversation, and waits. It does not create or focus tabs, worktrees, panes, or agents. After activation, process the next user message as a new request. For Codex, `$herdr-workflow` is the supported skill activation entry point; it is not a slash command.

## Intake and ownership

1. Route every new user request—including a question or explanation request—to a newly named feature tab/window. Never reuse or redirect into an existing feature's tab. Do not start supervising another feature's workers while handling this request.
2. Keep the coordinator in the project workspace root for the full feature lifecycle. The coordinator owns all communication with the user and retains its private integrations.
3. Identify affected repositories by read-only inspection of the original checkouts. Create the feature's worktree(s) when useful, without requiring extra setup approval; put feature specs and implementation artifacts in the appropriate worktree, never in an original checkout.
4. A feature may use multiple worktrees under its feature container. Assign exactly one implementation pane/worker to each repo/worktree pair. Additional coordinators are allowed only for separately owned planning work, not to create another user-feedback channel.
5. Use the same harness as the intake coordinator by default: Codex, OpenCode, or Claude Code. Mix harnesses only when the user explicitly requests it.
6. Present proposed scope and plan to the user. Worktree/tab setup and writing a proposal do not authorize implementation. Begin implementation only after the user approves the scope/plan.

## Isolation gate — before every worker launch

Treat workers as separate trust/configuration domains. The coordinator's private Azure DevOps, Teamwork, PR tools, MCP servers, credentials, integrations, and private configuration must never reach worker runtime or shared repository configuration.

Before launch, inspect the worker's *effective* configuration sources and inherited environment. Prove that each resolved MCP, integration, credential, config directory/file, and relevant environment variable is worker-approved and excludes coordinator-private resources. Do not copy, symlink, inherit, or commit coordinator config/secrets. Do not treat instruction text, a different cwd, an alternate config file alone, or a clean-looking top-level file as proof of isolation. In particular, OpenCode merges project config over custom/global configuration; inspect the effective merged worker setup.

Only launch after this gate passes. If any source cannot be inspected or excluded, do not launch the worker; pause affected implementation and escalate to the user. Never silently fall back to the coordinator configuration or original checkout.

## Worktree and pane lifecycle

- Implementation, edits, builds, and tests happen only inside the assigned Git worktree. Never run implementation in an original checkout, even as a fallback.
- Keep the coordinator visible. Keep implementation sessions hidden from the user-facing layout but persistent and resumable after coding, so coordinator can run verification and provide follow-up feedback.
- Route all questions, plan feedback, and blockers through the coordinator. Workers do not ask the user directly. On ambiguity or blocker, pause the affected work and report the exact question/blocker to the coordinator; unaffected independent work may continue only if its approved scope remains clear.
- Reuse the same worker for review feedback. If its session cannot resume, hand off to a replacement with the worktree, approved plan, current state, and verification evidence.
- Do not automatically close, delete, remove, stop, or clean up feature tabs, panes, worktrees, or sessions. Do so only after explicit user instruction.

## Failure handling

Diagnose, retry, and safely repair Herdr problems within existing permissions. Required capabilities include creating the feature tab/window, creating safe worktrees, establishing isolated worker configuration, and launching the assigned workers. A required failure blocks only its affected step and must be reported to the user; do not bypass it with an unsafe fallback. Optional presentation or session-recovery failures may use a fallback only when feature ownership, config isolation, worktree safety, and resumability remain intact. Never perform destructive or broad repairs without user approval.

See [intake and routing](references/intake-and-routing.md), [isolation and worktrees](references/isolation-and-worktrees.md), and [recovery](references/recovery.md).
