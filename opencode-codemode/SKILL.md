---
name: opencode-codemode
description: Use during agentic coding when coordinating multiple exposed tools with OpenCode Code Mode, or when the user asks for it. Guides discovery and safe orchestration; use repo tools for local edits and tests.
---

# OpenCode Code Mode

Use Code Mode as a bounded orchestration layer during coding sessions. The current host defines which tools and capabilities are available.

## Workflow

1. Read the host's current Code Mode instructions and tool catalog. If Code Mode is unavailable, or the task is a simple local edit or test, use the normal repository tools.
2. Discover exact tool paths, descriptions, and signatures from the catalog or its search function. Call only discovered tools; never guess names or arguments.
3. Keep orchestration focused: sequence dependent calls, parallelize independent calls, and use code to filter or combine results when that saves round trips.
4. Await every result the task depends on. Unawaited work may be interrupted when the Code Mode program returns. Handle failures and partial results explicitly.
5. Respect host limits for time, tool calls, and output. Inspect results using the host's return contract; account for errors, warnings, or truncation when exposed.

## Boundaries

- Use repository tools for local file inspection, edits, builds, and tests. Code Mode does not imply filesystem or shell access.
- Use only capabilities explicitly exposed by the host; do not assume network, process, or application access. Pass external data only when needed, and follow each tool's authorization and confirmation requirements.
- Treat mutations carefully: inspect the operation and its effects before calling it. Do not retry a failed mutation unless it is safe to repeat.
- Use Code Mode when orchestration meaningfully reduces work; direct tool calls are simpler for isolated operations.

## `@opencode/codemode` reference

When a task changes or debugs the Code Mode runtime itself, use the [package README](https://github.com/anomalyco/opencode/blob/dev/packages/codemode/README.md) and its [interpreter support checklist](https://github.com/anomalyco/opencode/blob/dev/packages/codemode/interpreter-support.md) as the source of truth. The package interprets a supported JavaScript-like subset, not arbitrary JavaScript; host tools and extensions define its external capabilities. Do not apply package-specific APIs or result shapes to another host without checking that host's contract.
