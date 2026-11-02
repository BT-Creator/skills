# Query work items

Use when asked to find work items by ID, state, assignee, title, or other fields.

1. Confirm organization and project. Translate the requested filter into WIQL; keep result fields and scope limited to what is needed.
2. Run a read-only query:

   ```bash
   az boards query \
     --wiql "SELECT [System.Id], [System.Title], [System.State] FROM WorkItems WHERE [System.State] = 'Active'" \
     --org <organization-url> --project <project> --output table
   ```

3. Check returned IDs, titles, and states. If one item is the target for a later change, inspect it with [Inspect a work item](inspect-work-item.md) before editing.

Done when results match the requested filters, or the query returns no matches. Report the query scope and relevant IDs; do not update items in this workflow.
