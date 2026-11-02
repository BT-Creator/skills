# Add a work item comment

Use when asked to add one discussion comment to a work item.

1. Inspect the item and confirm its ID, organization, and project. Preserve the user's intended wording; clarify before posting if the comment is ambiguous or incomplete.
2. Add the comment using the discussion field:

   ```bash
   az boards work-item update --id <work-item-id> \
     --discussion "<comment>" \
      --org <organization-url> --output json
   ```

3. Verify the comment in the work item's discussion/activity view or the supported comments endpoint. The update command may not return the discussion history.

Done when the exact comment is visible on the intended item. Posting is not idempotent: if the command result or verification is unclear, inspect discussion history before retrying to avoid a duplicate.
