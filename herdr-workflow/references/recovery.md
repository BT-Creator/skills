# Recovery and blockers

## Safe recovery

Within existing permissions, inspect Herdr status and command output, read installed help, retry read-only diagnostics, and make a narrow reversible repair that restores the intended workflow without widening access or destroying state. Check live state before retrying a timed-out mutation: failure output may not prove that no change occurred.

## Stop and escalate

Pause affected work and tell coordinator/user when:

- A required feature tab/window, worktree, pane, isolated config, or worker cannot be established.
- Worker configuration or inherited environment cannot be proven free of coordinator-private tools/credentials.
- User scope/plan approval is missing for implementation, or worker reports ambiguity/blocker.
- Recovery would delete/close/stop a user's or another feature's state, broadly change configuration, expose credentials, or otherwise exceed current permissions.

Report the failed capability, observed evidence, safe recovery already attempted, and exact decision needed. Do not silently reroute to another feature, fallback to the original checkout, launch under coordinator config, or change shared repo config.

## Optional failures

For optional display or session-recovery capabilities, use only a fallback that keeps feature ownership, coordinator visibility, worker isolation, worktree confinement, and a resumable handoff. Otherwise pause and escalate. Cleanup always requires explicit user instruction.
