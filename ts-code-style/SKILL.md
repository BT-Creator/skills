---
name: typescript-code-style
description: Apply a concise, native-first TypeScript coding style when generating new TypeScript or refactoring existing TypeScript source code. Prefer suitable existing project functionality, JavaScript and TypeScript language features, direct collection operations, derived and precise types, type aliases, modern supported syntax, minimal abstractions, and clear named asynchronous flows. Preserve runtime behavior, type safety, inference, narrowing, mutation, ordering, errors, module semantics, and public contracts while reducing unnecessary lines, state, branches, wrappers, helpers, assertions, annotations, and concepts. Use only for language-level TypeScript in .ts, .mts, and .cts files; do not treat it as a standalone code-review, React, JSX/TSX, framework, package, architecture, or tooling best-practices skill.
---

# TypeScript Code Style

Write and refactor TypeScript using a concise, native-first style.

## Scope

Apply these rules to language-level TypeScript in `.ts`, `.mts`, and `.cts` files. They may be combined with separate framework or package skills, but do not infer React, JSX/TSX, frontend-framework, backend-framework, validation-library, ORM, testing-framework, or package-specific conventions from this skill alone. Do not use this skill solely to perform a standalone code review.

## Style rules

- **[Prefer fewer concepts, not code golf](references/prefer-fewer-concepts.md).** Reduce unnecessary state, branches, wrappers, helpers, annotations, and abstractions without sacrificing correctness, type safety, or clear intent.
- **[Reuse before adding](references/reuse-before-adding.md).** Reuse suitable project functionality and built-in JavaScript or TypeScript features before creating custom functions, classes, types, or data structures.
- **[Keep transformations direct](references/keep-transformations-direct.md).** Express filtering, mapping, lookup, aggregation, grouping, and deduplication with the clearest suitable array, object, `Map`, `Set`, or language operation.
- **[Avoid unnecessary abstraction](references/avoid-unnecessary-abstraction.md).** Keep simple single-use logic inline; extract only when reuse, complexity, testing, policy, side effects, or domain meaning justify it.
- **[Model types directly](references/model-types-directly.md).** Prefer precise inferred or derived types, type aliases, narrowing, and discriminated unions over duplicated shapes, broad types, assertions, and nominal wrappers without behavior.
- **[Use concise modern syntax](references/use-concise-modern-syntax.md).** Prefer shorthand and modern TypeScript or JavaScript syntax supported by the project while preserving runtime and type semantics.
- **[Keep asynchronous flows named and direct](references/keep-asynchronous-flows-named-and-direct.md).** Use promises directly, name non-trivial asynchronous operations, and avoid redundant promise wrappers, detached work, or unnecessary `async` functions.
- **[Keep code quiet](references/keep-code-quiet.md).** Avoid ceremonial variables, forwarding wrappers, redundant comments, needless branches, repeated conversions, and annotations that add no useful information.
- **[Preserve local conventions](references/preserve-local-conventions.md).** Follow the project's naming, formatting, strictness, module, compiler, linting, and file-organization conventions unless explicitly asked to change them.

## Applying the rules

Read each linked reference whose rule is materially relevant to the requested code. For broad generation or refactoring tasks, read all rule references. For a narrowly targeted change, load only the applicable references.

When refactoring, preserve observable runtime behavior, side effects, ordering, mutation, errors, asynchronous behavior, type inference, narrowing, generic relationships, overload behavior, module exports, public types, and supported compiler/runtime versions unless the user explicitly requests a change. Before finalizing a refactor, apply [the refactoring checklist](references/refactoring-checklist.md).

Produce the code in this style without narrating every style choice. Explain only behaviorally meaningful changes, compatibility constraints, type-safety tradeoffs, or relevant limitations.
