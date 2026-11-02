# Add a work item relation

Use when asked to link two Azure Boards work items, for example as parent/child, predecessor/successor, or related.

1. Inspect both work items and confirm IDs, organization, and project. Check existing links with `az boards work-item relation show --id <source-id>`.
2. Confirm the exact relation type and direction. If needed, list valid relation types with `az boards work-item relation list-type --org <organization-url>`. Ask if the user's wording does not determine the link direction.
3. Add only the requested relation:

   ```bash
   az boards work-item relation add --id <source-id> \
     --relation-type "<relation-type>" --target-id <target-id> \
     --org <organization-url> --output json
   ```

4. Read the source item's relations again and verify the target and relation type.

Done when the intended relation is present. If it already exists, report that without adding a duplicate. Do not change either item's fields or state.
