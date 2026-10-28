---
name: herdr-workflow
description: Use when user is working with the herdr multiplexer and sending teh first message.
---

# Herdr Workflow

Use this skill for Herdr controls, role assignment, and the workspace lifecycle. Read the assigned role profile; read loop references when coordinating that phase.

If no role is assigned, use [Intake](references/roles/intake.md).

## Controls

The original Herdr skill is available as the `herdr` skill or through `herdr --skill`.

## Roles

| Role | Profile | Responsibility |
| --- | --- | --- |
| Intake | [intake.md](references/roles/intake.md) | Routes the original request into a Herdr workspace. |
| Coordinator | [coordinator.md](references/roles/coordinator.md) | Owns the workspace lifecycle, handoffs, panes, and user approvals. |
| Researcher | [researcher.md](references/roles/researcher.md) | Identifies affected repositories, impact, risks, and solution options. |
| Speccer | [speccer.md](references/roles/speccer.md) | Produces requested specifications, plans, and execution breakdowns. |
| Scafolder | [scafolder.md](references/roles/scafolder.md) | Prepares the workspace and assigned worktrees. |
| Implementor | [implementor.md](references/roles/implementor.md) | Implements assigned changes in a repository worktree. |
| Reviewer | [reviewer.md](references/roles/reviewer.md) | Reviews assigned artifacts or code and reports findings. |

## Workflow overview

1. Intake routes the request to a Coordinator in a new or applicable workspace.
2. Coordinator and Researcher complete the [research approval loop](references/loops/research-approval.md).
3. After approval, Speccer creates the requested artifacts; Coordinator runs the [spec self-review loop](references/loops/spec-self-review.md) and [spec user-approval loop](references/loops/spec-user-approval.md).
4. After spec approval, Scafolder prepares the workspace. Implementors work in assigned repo worktrees, with Reviewers scoped to each worktree and the full workspace. Coordinator runs the [implementation self-review loop](references/loops/implementation-self-review.md) and [implementation user-approval loop](references/loops/implementation-user-approval.md).
5. Coordinator reports the approved result and remaining risks.

The role profiles define responsibilities and handoffs. Each loop reference defines its participants, steps, return path, and completion condition.
