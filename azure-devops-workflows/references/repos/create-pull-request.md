# Create a pull request

Use when asked to create an Azure Repos pull request.

1. Confirm repository, source branch, target branch, title, description, and whether a draft PR was requested. Check whether the source branch exists remotely and contains the intended commits. If it is not pushed, stop and ask before pushing; publishing commits is a separate external action. Ask if the target branch is ambiguous.
2. Look for an existing active PR from the same source to target branch:

   ```bash
   az repos pr list --source-branch <source-branch> \
     --target-branch <target-branch> --status active \
     --repository <repository> --org <organization-url> \
     --project <project> --output table
   ```

   If one exists, inspect and report it instead of creating a duplicate unless the user requests another.
3. Create the PR with the confirmed details:

   ```bash
   az repos pr create --repository <repository> \
     --source-branch <source-branch> --target-branch <target-branch> \
     --title "<title>" --description "<description>" \
     --org <organization-url> --project <project> --output json
   ```

   Append `--draft true` only when the user explicitly requested a draft. Work-item linking and reviewer changes are separate workflows. Do not enable auto-complete, transition work items, delete the source branch, or bypass policies unless each was explicitly requested and authorized.
4. Capture the PR ID and URL, then inspect it to verify repository, branches, title, description, and status.

Done when the intended active PR exists and its details are verified. Report the PR ID/URL and any required checks still pending.
