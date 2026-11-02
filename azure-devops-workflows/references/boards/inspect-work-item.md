# Inspect a work item

Use when asked to look up or verify one Azure Boards item.

1. Confirm the organization, project, and work-item ID. Resolve a URL to its organization/project/ID rather than guessing defaults.
2. Read the item:

   ```bash
   az boards work-item show --id <work-item-id> \
     --org <organization-url> --output json
   ```

3. Check the returned ID, type, title, state, assignee, and any fields relevant to the request. Read relations separately with `az boards work-item relation show --id <work-item-id>` when needed.

Done when the returned item ID matches the requested ID and the requested details are verified. This workflow is read-only.
