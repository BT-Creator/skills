---
name: herdr-workflow
description: Use when Herdr workflow mode is active and the user submits any new request, or when coordinating coding work through Herdr tabs, worktrees, panes, or agents.
---

# Herdr workflow

Run every user request through the feature intake and ownership workflow below, including standalone questions. Herdr's installed CLI and `herdr --skill` are the syntax authority. This workflow intentionally overrides any conflicting default in Herdr's bundled skill.

## Activation

`/herdr` only verifies that Herdr CLI is available, loads this persistent workflow into the conversation, and waits for the next user message. During activation only, do not inspect or control Herdr state or create/focus tabs, worktrees, panes, or agents. Once the next message arrives, intake may use Herdr to route it as specified below. For Codex, `$herdr-workflow` is the supported skill activation entry point; it is not a slash command.

## Intake and ownership

1. Intake handles only a top-level new request received in the intake context. A reply, question, or plan feedback addressed to an existing feature coordinator stays with that coordinator; never recursively create a feature tab for it.
2. Capture the user's request verbatim, including command, arguments, constraints, and already-known context. Use Herdr's installed CLI to create a newly named feature tab/window; never reuse or redirect into an existing feature tab. Launch a separate coordinator session in that feature location, rooted at the project workspace root, with the same harness and its intended private workspace configuration available. Verify that this coordinator configuration is loaded; coordinator private configuration is expected and is not subject to the worker exclusion gate. Deliver the verbatim request and context unchanged. Confirm the coordinator session started and request delivery succeeded, then stop intake. If creation, intended config, launch, delivery, or readiness cannot be confirmed, report the exact failure and stop.
3. Intake is routing-only. It must not research, inspect repositories, brainstorm, write specs/plans, execute commands for the request, or switch into coordinator duties. The separate coordinator owns all subsequent user communication and planning, and retains its private integrations. Do not substitute an internal task, subagent, or role switch for the separate Herdr coordinator.
4. The coordinator may inspect original checkouts read-only, determine affected repositories, create feature worktrees, and author scope/spec/plan in the appropriate worktree. No extra approval is needed for proposal setup. Keep all feature artifacts out of original checkouts.
5. Present proposed scope and plan to the user. Tab/worktree setup and proposal writing do not authorize implementation. After user approval, the coordinator must create a real, separate Herdr implementation pane/session for every repo/worktree pair before any implementation. Confirm each worker is ready, running from its assigned worktree, uses the same harness by default (mix harnesses only when the user explicitly requests it), and has effective config/environment isolated from coordinator-private resources. Coordinator does not implement. Never substitute internal tasks/subagents for required Herdr panes. If a gate fails, pause that worker and report the evidence.
6. Keep the coordinator in the project workspace root for the full feature lifecycle. A feature may use multiple worktrees under its feature container. Assign exactly one implementation worker to each repo/worktree pair. Additional coordinators are allowed only for separately owned planning work, not to create another user-feedback channel.

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
