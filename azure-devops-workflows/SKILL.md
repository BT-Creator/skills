---
name: azure-devops-workflows
description: Use when asked to query, inspect, create, or update Azure DevOps work items; change item states or fields; add comments or relations; create, inspect, or update Azure Repos pull requests; manage reviewers; or link work items to pull requests. Load the matching atomic workflow reference for each requested action.
---

# Azure DevOps Workflows

Use these references for one Azure Boards or Azure Repos action at a time. For a compound request—such as creating a PR and changing a work item state—load both relevant references and perform each action separately.

## Boards

| Action | Use when | Reference |
| --- | --- | --- |
| Query work items | Use when asked to find work items by ID, state, assignee, title, or other fields. | [Query work items](references/boards/query-work-items.md) |
| Inspect one work item | Use when asked to look up or verify one Azure Boards item. | [Inspect a work item](references/boards/inspect-work-item.md) |
| Create a work item | Use when asked to create one Azure Boards item. | [Create a work item](references/boards/create-work-item.md) |
| Change a work item state | Use when asked to change a work item's state or move it to a board column. | [Update an item state](references/boards/update-item-state.md) |
| Update other work item fields | Use when asked to change a work-item title, description, assignee, area, iteration, or custom field without changing its state. | [Update item fields](references/boards/update-item-fields.md) |
| Add a discussion comment | Use when asked to add one discussion comment to a work item. | [Add a work item comment](references/boards/add-comment.md) |
| Add a work item relation | Use when asked to link two Azure Boards work items, for example as parent/child, predecessor/successor, or related. | [Add a work item relation](references/boards/add-work-item-relation.md) |
| Remove a work item relation | Use when asked to unlink two Azure Boards work items. | [Remove a work item relation](references/boards/remove-work-item-relation.md) |

## Repos

| Action | Use when | Reference |
| --- | --- | --- |
| Create a pull request | Use when asked to create an Azure Repos pull request. | [Create a pull request](references/repos/create-pull-request.md) |
| Inspect PR policies and checks | Use when asked whether a PR is approved, blocked, or ready to merge, or to inspect its required policies/checks. | [Inspect PR checks](references/repos/inspect-pull-request-checks.md) |
| Update PR title, description, or draft status | Use when asked to change an existing PR's title, description, or draft status. | [Update PR metadata](references/repos/update-pull-request-metadata.md) |
| Add a PR reviewer | Use when asked to add a named person or group as an Azure Repos PR reviewer. | [Add a PR reviewer](references/repos/add-pull-request-reviewer.md) |
| Remove a PR reviewer | Use when asked to remove a named reviewer from an Azure Repos PR. | [Remove a PR reviewer](references/repos/remove-pull-request-reviewer.md) |
| List work items linked to a PR | Use when asked which Azure Boards items are linked to an existing PR. | [List linked work items](references/repos/list-linked-work-items.md) |
| Link a work item to a PR | Use when asked to associate an existing Azure Boards item with an existing Azure Repos PR. | [Link a work item to a PR](references/repos/link-work-item-to-pull-request.md) |
| Unlink a work item from a PR | Use when asked to remove an Azure Boards item link from an existing Azure Repos PR. | [Unlink a work item from a PR](references/repos/unlink-work-item-from-pull-request.md) |

## Shared safeguards

- Before a write, confirm organization, project, repository, and target IDs from the request or inspected context. Ask when target or scope is ambiguous.
- Make only explicitly requested changes. Keep state transitions, PR creation, reviewer changes, and work-item linking as separate actions.
- Verify each write by reading the affected item or PR again. Report the verified result and any failed or unavailable verification.
- Treat substituted values as untrusted shell data. Pass them as separate arguments where possible; otherwise apply shell-specific escaping to every value before composing a command. Never interpolate raw titles, descriptions, comments, identities, or paths into shell command strings.
- Examples use the Azure DevOps CLI (`az` with its Azure DevOps extension). Supply `--org` and `--project` where supported when configured defaults are uncertain. Check command help if installed CLI version differs; never expose credentials.
