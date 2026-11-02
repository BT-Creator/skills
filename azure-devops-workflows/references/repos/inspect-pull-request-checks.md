# Inspect pull request checks

Use when asked whether a PR is approved, blocked, or ready to merge, or to inspect its required policies/checks.

1. Confirm organization, project, repository, and PR ID. Read the PR details:

   ```bash
   az repos pr show --id <pr-id> \
     --org <organization-url> --output json
   ```

2. List policies and evaluations for that PR:

   ```bash
   az repos pr policy list --id <pr-id> \
     --org <organization-url> --output table
   ```

3. Report each blocking policy's status and any running, rejected, or missing evaluation. Open the PR/build details in Azure DevOps when CLI output does not expose the underlying check result.

Done when PR status and all visible policy evaluations have been checked. Distinguish pending checks from failures; this is a read-only workflow and does not complete or modify the PR.
