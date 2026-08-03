# Refactoring checklist

Use this checklist before completing a TypeScript refactor under this skill.

1. Identify observable runtime behavior, side effects, ordering, errors, mutation, asynchronous work, and public exports.
2. Check type inference, narrowing, generic relationships, overload resolution, optional-property semantics, and discriminated unions.
3. Search for suitable existing project functionality and built-in JavaScript or TypeScript features.
4. Remove redundant branches, temporary state, forwarding wrappers, duplicated type shapes, unjustified assertions, and single-use helpers.
5. Use modern syntax and type features only when supported by the configured TypeScript version and runtime target.
6. Preserve meaningful domain boundaries even when inlining would reduce line count.
7. Avoid accidentally changing object allocation, property precedence, module output, mutation, error timing, promise handling, declaration output, or runtime validation.
8. Run the configured type checker, linter, formatter, build, and relevant tests when execution tools and project scripts are available.
