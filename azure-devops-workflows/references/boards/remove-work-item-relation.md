# Remove a work item relation

Use when asked to unlink two Azure Boards work items.

1. Inspect both work items and confirm IDs, organization, and project. Read the source item's current relations and identify the exact target and relation type.
2. If multiple links could match, clarify which one to remove. Removing a relation changes the work-item hierarchy/dependency and requires explicit user authorization.
3. Remove only the confirmed relation:

   ```bash
   az boards work-item relation remove --id <source-id> \
     --relation-type "<relation-type>" --target-id <target-id> --yes \
     --org <organization-url> --output json
   ```

4. Read the source item's relations again and verify that exact relation is absent.

Done when the requested relation is removed and other relations remain intact. If it was already absent, report that without retrying. Do not delete either work item.
