# Specification Self-Review Loop

Use this internal review loop to resolve specification or plan findings before asking the user to approve the artifact.

## Participants

- [Speccer](../roles/speccer.md): creates and revises the artifact.
- [Coordinator](../roles/coordinator.md): dispatches review and routes findings.
- [Reviewer](../roles/reviewer.md): independently reviews the artifact.

## Steps

1. Speccer sends the requested artifact and its file paths to the Coordinator.
2. Coordinator assigns a Reviewer to check the artifact against the original request, approved research, and applicable format or project standards.
3. Reviewer reports findings to the Coordinator.
4. If findings require changes, Coordinator sends them to the Speccer. Speccer revises the artifact and returns it for review; repeat from step 2.

## Completion

The loop passes when the Reviewer reports no actionable findings. The artifact is then ready for the [spec user-approval loop](spec-user-approval.md).
