# Update an item state

Use when asked to change a work item's state or move it to a board column.

1. Inspect the item and confirm its ID, type, current state, organization, and project.
2. Identify a valid target state for that work-item type and process. State names and allowed transitions vary by project/process; use the project’s process or board UI to confirm them.
3. If the user named a board column rather than a state, inspect that team board’s column-to-state mapping. A column label is not a portable state name. Ask if the mapping or target is ambiguous.
4. Apply only the state change:

   ```bash
   az boards work-item update --id <work-item-id> \
     --state "<confirmed-state>" \
      --org <organization-url> --output json
   ```

5. Read the item again and verify the state. When the request named a board column, verify the item appears in that column on the intended team board.

Done when the stored state—and, if requested, the board column—matches the confirmed target. Report the final state and column separately. Never infer a state from a column name or a different project's workflow.
