# Remove a pull request reviewer

Use when asked to remove a named reviewer from an Azure Repos PR.

1. Inspect the PR and current reviewer list. Confirm the exact identity. Check whether the reviewer is required by branch policy before removal.
2. Remove only the requested reviewer when present:

   ```bash
   az repos pr reviewer remove --id <pr-id> \
     --reviewer "<user-or-group>" \
     --org <organization-url> --output json
   ```

   If a branch policy requires that reviewer, report the conflict and ask before changing the policy.
3. List reviewers again and verify that the requested reviewer is absent.

Done when the exact reviewer is removed and remaining reviewers/policies are unaffected. Do not remove other reviewers or edit branch policy as part of this workflow.
