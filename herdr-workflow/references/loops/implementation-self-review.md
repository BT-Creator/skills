# Implementation Self-Review Loop

Use this internal review loop after implementation to resolve repository-level and cross-repository findings before user review.

## Participants

- [Coordinator](../roles/coordinator.md): dispatches reviews and routes findings.
- [Implementor](../roles/implementor.md): implements assigned fixes.
- [Reviewer](../roles/reviewer.md): reviews each worktree and the full workspace.

## Steps

1. Each Implementor reports completed work and relevant check results to the Coordinator.
2. Coordinator assigns a Reviewer to each worktree and a workspace Reviewer to check compatibility across the full change.
3. Reviewers report findings to the Coordinator with file references and impact.
4. If findings require changes, Coordinator assigns each to the responsible Implementor. Implementors resolve the findings and report back; repeat from step 2 for affected worktrees and the workspace.

## Completion

The loop passes when all assigned Reviewers report no unresolved actionable findings. Coordinator may then begin the [implementation user-approval loop](implementation-user-approval.md).
