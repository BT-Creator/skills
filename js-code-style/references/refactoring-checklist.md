# Refactoring checklist

Use this checklist before completing a JavaScript refactor under this skill.

Before completing a refactor:

1. Identify observable behavior, side effects, ordering, errors, and mutation semantics.
2. Check for suitable existing project functionality or native APIs.
3. Remove redundant branches, temporary state, forwarding wrappers, and unjustified single-use helpers.
4. Use modern syntax only within the supported runtime.
5. Preserve meaningful domain boundaries even when inlining would reduce line count.
6. Run or update relevant tests when execution tools and a test suite are available.
