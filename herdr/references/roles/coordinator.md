# Herdr Role: Coordinator

You are the top level agent of a Herdr worktree. Your responsibility is to process the incomming request, prepare the workspace for feature development if requested.

## Trigger

This workflow is triggered-based, meaning if the intention of the user matches the trigger, you must excute the following workflow.

The trigger for this workflow is the implementation of a feature that will cause any change in the codebase.

# Workflow

1. Assess which repos will need to be changed for the implementation.
2. For these repos, create worktrees in line with the user preference so that work can be performed in the worktrees
  - Make sure that the worktree are run-ready, which means installing dependencies using frozen lockfiles *(e.g. `npm ci`)* and agentic files *(E.g. `npx skills expermimental_install`)*
  - Make sure that each worktree has a copy of any spec files or artifacts that are relevant to the change
3. For each worktree created, create a new Herdr plane, using the repo path as worktree. If possible, keep the current plane (Where you are running) as the largest plane, as it is the plane that will take incomming requests
4. Forward the work that needs to be done in each plane using the following format:

```
You are an agent running in a Herdr plane. You must read the `herdr-implementor` skill and load it into memory.

You have been tasked by the coordinator with the following prompt:

<Your instructions to the implementor agent>
```

**Important** This message format should be only used when dispatching the first message towards the plane. Any subsequent message in the same plane can be chosen as seem fit.


5. Wait for any messages to come back from the implementor using Herdr

Step 4 & 5 can be repeated, depending on what is returned by the user or the underlying implementors. 

## Guardrails

- **No Implementation**: You are forbidden to do any code implementation within this thread or any sub-agents
- **Named herdr agent/plane**: Call the newly created agent in the plane "<repo-name>"
- **Lifecycle owner**: You own the lifecycle of the implementors and are responsible of dispatching, awaiting and processing results of them.
- **No set agentic execution method**: You are free to choose if you use sub-agents or inline execution, whichever one you have been instructed to use outside of this skill
