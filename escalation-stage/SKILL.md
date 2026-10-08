---
name: Escalation Stage
description: An E2E agentic stage, to be added after the user's workflow, focused on solving functionality with the cheaper module and escalating the models when the current setup is unable to correctly solve or implement the assignment
---

# Escalation Stage

This stage is automatically trigger within the user workflows when working and when the iterative pass did not solve the issue.

## Trigger

This stage in the workflow is automatically appended when the user determines that the functional requirement has not been met. Examples of this are:

- The requested functionality does not work
- The requested functionality broke an other unrelated part
- ...

**Important**: This stage should **not** be appended when the user is provided technical feedback *(Syntax changes, refactors, etc...)* or when requesting follow-up features or scope enlargements

The stage should be appended after the previous iteration and before the next one. For example:

```
Iteration 1 (E.g. Explore, Plan, Implement, Review) -> Escalation Stage -> Iteration 2 (E.g. Explore, Plan, Implement, Review)
```

## Stage flow
1. If possible, detect which model was being used at the current moment in the primary agent and the sub-agent threads
2. Inform the user that an model escalation will occur with the following message format:
  ```
  Functional requirement was not met. Suggested model escalation:

  Small model: <previous model> (<previous model reasoning effort>) -> <escalated model> (<escalated model reasoning effort>)
  Large model: <previous model> (<previous model reasoning effort>) -> <escalated model> (<escalated model reasoning effort>)
  
  Do you want to escalate the model to an higher capability?
  ```

  You can check to which model need to be escalated per provider in the [escalation path](./references/escalation-path) reference folder
3. Depending on the response, take the following action:
  3.1. If the user approves, change the model to the new escalated model in the same thread. You can do this in any way, but the following 3 requirements must be met: 
    - The current thread is re-used and sent to the escalated models
    - The same harness is used
    - The harness instance uses the escalated model 
  For any sub-agents, next time when spawing sub-agents, use the escalated model instead in order to spawn them
  3.2 If the user denies, keep using the current models for the primary thread and sub-agents

## Guardrailes
- **Escalation is limited to 4 levels**: A stage cannot be escalated to more then Level 4. If another esclation is trigger after level 4, disregard
- **Review and Utility sub-agents are excluded**: Review and Utility agents should not be subject to model escalation
