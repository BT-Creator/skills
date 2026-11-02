# Update pull request metadata

Use when asked to change an existing PR's title, description, or draft status.

1. Inspect the PR and confirm its ID, repository, and current values.
2. Apply only the requested metadata. Example:

   ```bash
   az repos pr update --id <pr-id> \
     --title "<new-title>" --description "<new-description>" \
     --org <organization-url> --output json
   ```

   For draft status, use `--draft true` or `--draft false` only when explicitly requested. Do not set PR status, auto-complete, merge options, or work-item transitions in this workflow.
3. Read the PR again with `az repos pr show` and verify the changed values.

Done when requested metadata matches. Report the updated fields and PR ID; reviewer changes and work-item links use separate references.
