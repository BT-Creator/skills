---
name: herdr-workflow
description: Use when user is working with the herdr multiplexer
---

# Herdr Workflow

Use this skill for Herdr controls, role assignment, and the workspace lifecycle. Depending on the role you've been assigned, load the following references:
- **Intake**: [intake.md](references/roles/intake.md)
- **Coordinator**: [coordinator.md](references/roles/coordinator.md) & [research approval loop](references/loops/research-approval.md) & [spec self-review loop](references/loops/spec-self-review.md) & [spec user-approval loop](references/loops/spec-user-approval.md) & [implementation self-review loop](references/loops/implementation-self-review.md) & [implementation user-approval loop](references/loops/implementation-user-approval.md)
- **Researcher**: [researcher.md](references/roles/researcher.md) & [research approval loop](references/loops/research-approval.md) 
- **Speccer**: [speccer.md](references/roles/speccer.md) & [spec self-review loop](references/loops/spec-self-review.md) & [spec user-approval loop](references/loops/spec-user-approval.md)
- **Scafolder**: [scafolder.md](references/roles/scafolder.md)
- **Implementor**: [implementor.md](references/roles/implementor.md) & [implementation self-review loop](references/loops/implementation-self-review.md) & [implementation user-approval loop](references/loops/implementation-user-approval.md)
- **Reviewer**: [reviewer.md](references/roles/reviewer.md) & [spec self-review loop](references/loops/spec-self-review.md) & [implementation self-review loop](references/loops/implementation-self-review.md)

> If no role is assigned, use [Intake](references/roles/intake.md).

## Roles

The role indicates which responsibility you need to take as the agent.

| Role | Reference | Responsibility | Communication flow |
| --- | --- | --- | --- |
| Intake | [intake.md](references/roles/intake.md) | Routes the original request into a Herdr workspace. | Intake -> Coordinator |
| Coordinator | [coordinator.md](references/roles/coordinator.md) | Owns the workspace lifecycle, handoffs, panes, and user approvals. | Coordinator -> Researcher / Speccer / Scafolder / Implementor / Reviewer |
| Researcher | [researcher.md](references/roles/researcher.md) | Identifies affected repositories, impact, risks, and solution options. | Researcher -> Coordinator |
| Speccer | [speccer.md](references/roles/speccer.md) | Produces requested specifications, plans, and execution breakdowns. | Researcher -> Coordinator |
| Scafolder | [scafolder.md](references/roles/scafolder.md) | Prepares the workspace and assigned worktrees. | Scafolder -> Coordinator |
| Implementor | [implementor.md](references/roles/implementor.md) | Implements assigned changes in a repository worktree. | Implementor -> Coordinator |
| Reviewer | [reviewer.md](references/roles/reviewer.md) | Reviews assigned artifacts or code and reports findings. | Reviewer -> Coordinator |

## Controls

The original Herdr skill is available as the `herdr` skill or through `herdr --skill`.

## Loops

Loops indicate how to handle certain steps within the lifecycle of implementing a feature.

| Name | Reference | Description | Load when... |
| --- | --- | --- | --- |
| Research approval loop | [research approval loop](references/loops/research-approval.md) | Researcher and Coordinator collaborate to identify affected repositories, impact, risks, and solution options | To be used when starting a new coordinator session |
| Spec self-review loop | [spec self-review loop](references/loops/spec-self-review.md) | Speccer and Coordinator collaborate to review the produced specifications, plans, and execution breakdowns. | To be used after research |
| Spec user-approval loop | [spec user-approval loop](references/loops/spec-user-approval.md) | Coordinator prompts user to review the produced specifications, plans, and execution breakdowns. | To be used after spec self-review |
| Implementation self-review loop | [implementation self-review loop](references/loops/implementation-self-review.md) | Implementor and Coordinator collaborate to review the implemented changes. | To be used after implementation of spec |
| Implementation user-approval loop | [implementation user-approval loop](references/loops/implementation-user-approval.md) | Coordinator prompts user to review the implemented changes. | To be used after implementation self-review |

## Workflow example

1. Intake routes the request to a Coordinator in a new or applicable workspace.
2. Coordinator and Researcher complete the [research approval loop](references/loops/research-approval.md).
3. After approval, Speccer creates the requested artifacts; Coordinator runs the [spec self-review loop](references/loops/spec-self-review.md) and [spec user-approval loop](references/loops/spec-user-approval.md).
4. After spec approval, Scafolder prepares the workspace. Implementors work in assigned repo worktrees, with Reviewers scoped to each worktree and the full workspace. Coordinator runs the [implementation self-review loop](references/loops/implementation-self-review.md) and [implementation user-approval loop](references/loops/implementation-user-approval.md).
5. Coordinator reports the approved result and remaining risks.

The role profiles define responsibilities and handoffs. Each loop reference defines its participants, steps, return path, and completion condition.
