# Implementation User-Approval Loop

Use this loop to obtain the user's approval of the complete workspace change after internal review passes.

## Participants

- [Coordinator](../roles/coordinator.md): presents the complete change and owns the approval gate.
- [Reviewer](../roles/reviewer.md): interprets user feedback and reports required changes.
- [Implementor](../roles/implementor.md): makes assigned code corrections.
- User: approves the change or requests updates.

## Steps

1. Coordinator presents the complete workspace change for user review.
2. Coordinator sends the user's feedback to the workspace Reviewer.
3. Reviewer identifies whether the user approved the change or requested updates, then reports that interpretation to the Coordinator.
4. If updates are requested, Coordinator assigns them to the relevant Implementor. After the changes are made, run the [implementation self-review loop](implementation-self-review.md), then present the updated workspace to the user again.

## Completion

The loop passes only when the user explicitly approves the code changes. Coordinator then reports the completed work and remaining risks.
