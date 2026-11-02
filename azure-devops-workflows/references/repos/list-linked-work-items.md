# List work items linked to a pull request

Use when asked which Azure Boards items are linked to an existing PR.

1. Confirm organization, project, repository, and PR ID.
2. List linked work items:

   ```bash
   az repos pr work-item list --id <pr-id> \
     --org <organization-url> --output json
   ```

3. Check returned IDs and summaries. Inspect a work item separately if the user needs its current state or fields.

Done when the linked-item list is returned and verified for the requested PR. This workflow is read-only; it does not change work-item state.
