# Specification User-Approval Loop

Use this loop to obtain the user's approval of a specification or plan after internal review passes.

## Participants

- [Coordinator](../roles/coordinator.md): presents the artifact and owns the approval gate.
- [Reviewer](../roles/reviewer.md): interprets user feedback and reports required changes.
- [Speccer](../roles/speccer.md): updates the artifact when changes are requested.
- User: approves the artifact or requests changes.

## Steps

1. Coordinator presents the internally reviewed artifact to the user.
2. Coordinator gives the user's feedback to the Reviewer.
3. Reviewer identifies whether the user approved the artifact or requested changes, then reports that interpretation to the Coordinator.
4. If changes are requested, Coordinator assigns them to the Speccer. Speccer updates the artifact; Coordinator runs the [spec self-review loop](spec-self-review.md), then presents the revised artifact to the user again.

## Completion

The loop passes only when the user explicitly approves the specification or plan. Coordinator may then authorize workspace setup and implementation.
