# Intake and routing

## Every request starts as a separate feature

For each new user message after activation, create a fresh, descriptively named feature tab/window, even if request is a standalone question. Answer or investigate within that feature's ownership. Do not attach it to an existing feature, reuse an existing feature tab, or take over another feature's supervision. Keep coordinator anchored in project workspace root; the feature window/tab belongs to that root workspace.

If Herdr cannot create the required feature tab/window, stop that request's workflow and report the failure. Do not answer as though feature routing happened, or repurpose an existing tab.

## Proposal before implementation

Coordinator can inspect original repositories read-only, determine affected repos, create feature worktrees, and author scope/spec/plan within the right worktree while preparing a proposal. Do not ask for extra approval merely to set up those proposal artifacts. User approval of scope/plan is the implementation gate; creating a worktree is not that approval.

After approval, assign one implementation pane to each repo/worktree pair and verify its isolation first. Preserve distinct planning ownership if a second coordinator is needed. All user interactions remain with the primary coordinator.

## Naming and records

Use Herdr's returned IDs and live state; never guess IDs or derive them from visual order. Name tabs/features for their request. Keep specs, plans, implementation notes, and handoff notes inside their owning worktree. Avoid private coordinator data in these artifacts if workers or shared storage may read them.
