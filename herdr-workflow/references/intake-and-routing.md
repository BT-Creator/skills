# Intake and routing

## Every request starts as a separate feature

Activation only waits for the next user message; its no-inspection/no-control rule ends when that message arrives. Intake applies only to a top-level request in the intake context. Replies, questions, or plan feedback addressed to an existing feature coordinator stay with that coordinator and do not start another feature.

For each top-level request, capture the request verbatim—including command, arguments, constraints, and already-known context—then use installed Herdr CLI to create a fresh, descriptively named feature tab/window. Never attach it to an existing feature, reuse an existing feature tab, or take over another feature's supervision. Keep the separate coordinator anchored at the project workspace root; the feature tab belongs to that root workspace. Launch the coordinator as a separate Herdr session using the same harness as intake and its intended private workspace configuration. Verify that this coordinator configuration is loaded; coordinator private configuration is expected and is not subject to the worker exclusion gate. Deliver the captured request unchanged. Confirm both successful delivery and coordinator session readiness, then stop intake.

If Herdr cannot create the required feature tab/window, isolate/launch the coordinator, deliver the request, or confirm readiness, stop intake and report the exact failed capability and observed evidence. Do not answer or perform request work as though routing happened, repurpose an existing tab, inspect/research the request, or switch roles in-session. Intake never researches, brainstorms, writes specs/plans, or executes request commands; that belongs to the separate coordinator. Do not replace Herdr sessions/panes with internal tasks or subagents.

## Proposal before implementation

After intake handoff, the separate coordinator can inspect original repositories read-only, determine affected repos, create feature worktrees, and author scope/spec/plan within the right worktree while preparing a proposal. Do not ask for extra approval merely to set up those proposal artifacts. User approval of scope/plan is the implementation gate; creating a worktree is not that approval. Coordinator does no implementation.

After approval, create a real, separate Herdr implementation pane/session for each repo/worktree pair before implementation. Confirm worker readiness, assigned worktree cwd, same harness by default (mix harnesses only when the user explicitly requests it), and effective config/environment isolation from coordinator-private resources. Do not use coordinator coding, role switches, internal tasks, or subagents as substitutes. Preserve distinct planning ownership if a second coordinator is needed. All feature questions and user interactions remain with the primary coordinator.

## Naming and records

Use Herdr's returned IDs and live state; never guess IDs or derive them from visual order. Name tabs/features for their request. Keep specs, plans, implementation notes, and handoff notes inside their owning worktree. Avoid private coordinator data in these artifacts if workers or shared storage may read them.
