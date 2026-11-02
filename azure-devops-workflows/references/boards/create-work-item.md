# Create a work item

Use when asked to create one Azure Boards item.

1. Confirm organization, project, work-item type, title, and any requested description, assignee, area, iteration, or custom fields. Ask if required values are unclear.
2. Query for likely duplicates using the title and project. If a matching item exists, report it instead of creating another unless the user confirms a separate item is intended.
3. Create only with the confirmed values:

   ```bash
   az boards work-item create \
     --type <work-item-type> --title "<title>" \
     --description "<description>" \
     --org <organization-url> --project <project> --output json
   ```

   Omit optional fields the user did not request; do not set an initial state unless explicitly requested and valid for this type/process.
4. Capture the created ID and read it back with [Inspect a work item](inspect-work-item.md).

Done when one new item exists with the requested type/title and supplied fields. Report its ID and link if available. If creation succeeds but read-back fails, report that uncertainty; do not retry blindly.
