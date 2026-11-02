# Update work item fields

Use when asked to change a work-item title, description, assignee, area, iteration, or custom field without changing its state.

1. Inspect the item; confirm its ID and the exact requested field values.
2. Update only those fields. Example:

   ```bash
   az boards work-item update --id <work-item-id> \
     --assigned-to <user> --title "<new-title>" \
      --org <organization-url> --output json
   ```

   Use `--fields "<field-reference>=<value>"` for custom fields, and `--area` or `--iteration` for those paths. Check valid field names and values in the project process if uncertain. Do not include `--state` here.
3. Read the item again and verify every requested field; confirm unrelated fields remain unchanged where relevant.

Done when each requested field has the specified value. Report the fields changed; do not fold comments, relations, or state transitions into this update.
