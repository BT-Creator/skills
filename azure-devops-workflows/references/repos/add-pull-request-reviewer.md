# Add a pull request reviewer

Use when asked to add a named person or group as an Azure Repos PR reviewer.

1. Inspect the PR and list its current reviewers. Confirm the exact identity and whether the user requested an optional or required reviewer.
2. Add an optional reviewer only when the identity is not already present:

   ```bash
   az repos pr reviewer add --id <pr-id> \
     --reviewers "<user-or-group>" \
     --org <organization-url> --output json
   ```

3. Verify the reviewer list. The CLI command adds optional reviewers; to add or change a required reviewer, use the Azure DevOps PR UI and verify its required status there. Never infer reviewer identities or bypass configured policy.

Done when the exact requested reviewer is present with the requested optional/required status. If the command cannot set required status, use the UI or report the limitation rather than treating an optional reviewer as required.
