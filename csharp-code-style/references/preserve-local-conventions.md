# Preserve local conventions

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Match the surrounding project’s conventions for:

- Naming and member ordering
- Braces, indentation, and namespace style
- `var` versus explicit types
- Nullable reference types and annotations
- Async method naming and cancellation tokens
- Exception and result handling
- Records, primary constructors, and collection expressions
- Analyzer, formatter, and compiler settings
- Language version and target framework

Treat configured analyzers, `.editorconfig`, and established nearby code as stronger formatting and convention signals than this skill.

Do not make unrelated style changes while refactoring. Keep diffs focused on the requested behavior or simplification.

Preserve public APIs, serialization contracts, equality behavior, nullability contracts, and binary compatibility unless the user explicitly requests a breaking change.
