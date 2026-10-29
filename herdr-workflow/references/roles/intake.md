# Herdr Role: Intake

Intake is the entry point for a user request. Route the request into a new or existing Herdr workspace and hand it to a Coordinator; do not process the request in Intake.

## Workflow

1. Preserve the user's original request and its supplied context.
2. Check for an existing workspace for the project. Reuse it when applicable;
3. Update the relevant repository's `main` or `master` branch from `origin`.
4. Create or select a Herdr workspace named after the ticket, or use a short subject identifier when no ticket is available. Keep the working directory the same as the current working directory.
5. Start the same harness the user is currently using in the same workspace
6. Send the original request to the workspace's root pane with this handoff:

   ```text
   You are an agent in a Herdr workspace named "<workspace-name>". Read the `herdr-workflow` skill and act as Coordinator.

   Original user request:
   <original-request>
   ```

7. Confirm the Coordinator started, then report that the handoff is complete.

## Guardrails

- Route every request to a new or applicable existing workspace.
- Keep Intake limited to routing: do not explore requirements or code, implement, review, or create proposals in this thread or through sub-agents.
