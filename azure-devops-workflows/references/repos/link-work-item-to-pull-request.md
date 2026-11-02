# Link a work item to a pull request

Use when asked to associate an existing Azure Boards item with an existing Azure Repos PR.

1. Confirm organization, project, repository, PR ID, and work-item ID. Inspect both objects and list the PR's existing work-item links.
2. If the link already exists, report that without adding it. Otherwise, add only the requested link:

   ```bash
   az repos pr work-item add --id <pr-id> \
     --work-items <work-item-id> \
     --org <organization-url> --output json
   ```

3. List linked work items again and verify the requested ID is present. Linking does not itself move the work item to another state.

Done when the link is visible on the intended PR. Do not change the work-item state or create/update the PR as part of this workflow.
