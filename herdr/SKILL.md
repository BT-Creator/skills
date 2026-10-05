---
name: Herdr
description: Instructions on how to use the Herdr Multiplexer, including the controls, the different roles and workflows. Must be used when running in the Herdr environment
---

# Herdr

This details how to use Herdr, an agentic Multiplexer and which different roles there are in Herdr. This includes the different commands, roles and how the workflow looks like.

If you are an agent reading this, please read the refence for the role that you've been assigned:
- [Intake](references/roles/intake.md)
- [Coordinator](references/roles/coordinator.md)
- [Implementor](references/roles/implementor.md)

If no explicit role has been mentioned, assume that you have been assigned the role of [Intake](references/roles/intake.md) 

## Controls

The original Herdr skill is available under [Controls](references/controls.md). This includes the commands that are available to you, and how to use them. It is recommended to read this before using Herdr, as it will help you understand how to use the different commands and how to use them in the different roles.

## Workflow

### Roles

Within the workflow, there are 3 roles:
- [Intake](references/roles/intake.md): The intake is the top-level agent that takes in the request of the user and creates a new Herdr worktree for it. The intake is responsible for routing.
- [Coordinator](references/roles/coordinator.md): The coordinator is the top-level agent of a Herdr worktree. The coordinator is responsible for processing the request of the user by researching it, planning and creating spec. It is also responsible for creating the required worktrees and planes for the Implementor and managing the lifecycle.
- [Implementor](references/roles/implementor.md): The implementor is the agent that is responsible for implementing the feature in the codebase. The implementor is created by the coordinator and is responsible for implementing the feature in the worktree that is assigned to it.

## Example Flow

A full example workflow looks like this:

**Start Intake boundary**
1. Take in the original user request
2. Check if there is a workspace for the current project. If there isn't any, rename the current workspace to the project name.
3. Based on the user request and the context given within that request, create a new named Herdr worktree. 
4. Start the same harness as the user is currently using
5. Forward the request of the user towards the root plane of the newly created workspace
**End Intake boundary**

**Start Coordinator boundary**
6. Research, create the needed specs / plans and review this with the user
7. Assess which repos will need to be changed for the implementation.
8. For these repos, create worktrees in line with the user preference so that work can be performed in the worktrees
9. For each worktree that has been created per repo, create a spec/plan/artifacts per repo that is scoped to the repo
10. For each worktree created, create a new Herdr plane, using the repo path as worktree. If possible, keep the current plane (Where you are running) as the largest plane, as it is the plane that will take incomming requests
11. Forward the work that needs to be done in each plane based on the repo
**End coordinator boundary**

**Start Implementor Boundary**
12. Implement the work you've been assigned to by the coordinator according to the user coding preferences in regards to commit, reviewing, etc...
13. Perform a review round for the work
14. Resolve any bugs of issues discovered
15. Report back the work you've performed to the coordinator
**End implementor boundary**

**Start coordinator boundary**
16. Verify if the work perform in each repo is compatible with eachother and will not cause any issues
17. If any imcompatibilies arise, send instructions back to the appropriate implementor to resolve this
**End coordinator boundary**

**Start implementor boundary**
18. Resolve imcompatibilities and implement feedback from coordinator
19. Report back to coordinator
**End implementor coordinator**

**Start coordinator boundary**
20. Report back to the user and let the user review the code & the functionality
**End coordinator boundary**
