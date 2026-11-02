# Unlink a work item from a pull request

Use when asked to remove an Azure Boards item link from an existing Azure Repos PR.

1. Confirm organization, project, repository, PR ID, and work-item ID. List current PR links and identify the exact association.
2. Remove only the requested link:

   ```bash
   az repos pr work-item remove --id <pr-id> \
     --work-items <work-item-id> \
     --org <organization-url> --output json
   ```

3. List linked work items again and verify the requested ID is absent. Azure DevOps may retain links created through branches or commits; this operation removes only the PR association.

Done when the PR no longer lists that work item. Do not delete the work item or alter PR status.
