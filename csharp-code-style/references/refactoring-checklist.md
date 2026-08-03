# Refactoring checklist

Use this checklist before completing a C# refactor under this skill.

1. Identify observable behavior, side effects, ordering, exceptions, mutation, equality, and public contracts.
2. Check nullability, disposal, deferred execution, repeated enumeration, and async/cancellation behavior.
3. Search for suitable existing project functionality, language features, and Base Class Library APIs.
4. Remove redundant branches, temporary state, forwarding wrappers, and unjustified single-use helpers.
5. Use modern syntax only when supported by the configured language version and target framework.
6. Preserve meaningful domain boundaries even when inlining would reduce line count.
7. Avoid changing record/class semantics, collection mutability, serialization, overload resolution, or resource lifetime accidentally.
8. Build the affected project and run or update relevant tests when execution tools and a test suite are available.
