---
name: csharp-code-style
description: Apply a concise, native-first C# coding style when generating new C# or refactoring existing C# source code. Prefer suitable existing project functionality, Base Class Library APIs, direct LINQ or collection operations, modern supported C# syntax, minimal abstractions, expression-bodied members, and clear named asynchronous flows. Preserve behavior, readability, nullability, equality, mutation, disposal, and async semantics while reducing unnecessary lines, state, branches, wrappers, helpers, and concepts. Use only for language-level C# style; do not treat it as a standalone code-review, ASP.NET Core, Entity Framework, testing-framework, architecture, or package-specific best-practices skill.
---

# C# Code Style

Write and refactor C# using a concise, native-first style.

## Scope

Apply these rules to language-level C# code. They may be combined with separate framework or architecture skills, but do not infer ASP.NET Core, Entity Framework, testing-framework, dependency-injection, or package-specific conventions from this skill alone. Do not use this skill solely to perform a standalone code review.

## Style rules

- **[Prefer fewer concepts, not code golf](references/prefer-fewer-concepts.md).** Reduce unnecessary state, branches, wrappers, helpers, and abstractions without sacrificing correctness or clear intent.
- **[Reuse before adding](references/reuse-before-adding.md).** Reuse suitable project functionality, C# language features, and Base Class Library APIs before creating custom functions, classes, or data structures.
- **[Keep transformations direct](references/keep-transformations-direct.md).** Express filtering, mapping, lookup, aggregation, grouping, and deduplication with the clearest suitable LINQ, collection, or language operation.
- **[Avoid unnecessary abstraction](references/avoid-unnecessary-abstraction.md).** Keep simple single-use logic inline; extract only when reuse, complexity, testing, policy, side effects, or domain meaning justify it.
- **[Use concise modern syntax](references/use-concise-modern-syntax.md).** Prefer shorthand and modern C# features supported by the project, while preserving compatibility and semantics.
- **[Keep asynchronous flows named and direct](references/keep-asynchronous-flows-named-and-direct.md).** Use async all the way, name non-trivial asynchronous operations, and avoid redundant task wrappers, blocking, or unnecessary `Task.Run` calls.
- **[Keep code quiet](references/keep-code-quiet.md).** Avoid ceremonial variables, forwarding wrappers, redundant comments, needless branches, and materialization that adds no meaningful behavior.
- **[Preserve local conventions](references/preserve-local-conventions.md).** Follow the project’s naming, formatting, nullable, analyzer, language-version, exception, and `var` conventions unless explicitly asked to change them.

## Applying the rules

Read each linked reference whose rule is materially relevant to the requested code. For broad generation or refactoring tasks, read all rule references. For a narrowly targeted change, load only the applicable references.

When refactoring, preserve observable behavior, side effects, ordering, deferred execution, enumeration count where relevant, mutation, equality, nullability, exceptions, disposal, asynchronous behavior, public interfaces, and supported language/runtime versions unless the user explicitly requests a change. Before finalizing a refactor, apply [the refactoring checklist](references/refactoring-checklist.md).

Produce the code in this style without narrating every style choice. Explain only behaviorally meaningful changes, compatibility constraints, or relevant tradeoffs.
