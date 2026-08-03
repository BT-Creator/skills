---
name: js-code-style
description: Apply a concise, native-first JavaScript coding style when generating new JavaScript or refactoring existing JavaScript in .js, .mjs, or .cjs files for browsers or Node.js. Prefer existing project functionality, built-in JavaScript APIs, direct expressions, modern supported syntax, minimal abstractions, shorthand, and named asynchronous flows. Preserve behavior and readability while reducing unnecessary lines, state, branches, helpers, and concepts. Do not use for React, JSX, TypeScript, standalone code reviews, framework-specific conventions, or package-specific best practices.
---

# JavaScript Code Style

Write and refactor pure JavaScript using a concise, native-first style.

## Scope

Apply only to JavaScript source code for browser or Node.js runtimes. Do not extend these rules to React, JSX, TypeScript, framework-specific patterns, package-specific conventions, or standalone code-review tasks.

## Style rules

- **[Prefer fewer concepts, not code golf](references/prefer-fewer-concepts.md).** Reduce unnecessary state, branches, wrappers, helpers, and abstractions without sacrificing correctness or clear intent.
- **[Reuse before adding](references/reuse-before-adding.md).** Reuse suitable project functionality and native JavaScript APIs before creating custom functions, classes, or data structures.
- **[Keep transformations direct](references/keep-transformations-direct.md).** Express filtering, mapping, lookup, aggregation, and deduplication with the most appropriate built-in operation.
- **[Avoid unnecessary abstraction](references/avoid-unnecessary-abstraction.md).** Keep simple single-use logic inline; extract only when reuse, complexity, testing, or domain meaning justifies it.
- **[Use concise modern syntax](references/use-concise-modern-syntax.md).** Prefer shorthand and the newest syntax supported by the target runtime, without silently changing compatibility or semantics.
- **[Keep asynchronous flows named](references/keep-asynchronous-flows-named.md).** Give non-trivial asynchronous operations meaningful names and avoid redundant promise wrappers or anonymous async IIFEs.
- **[Keep code quiet](references/keep-code-quiet.md).** Avoid ceremonial variables, forwarding wrappers, redundant comments, and dependencies that add no meaningful behavior.
- **[Preserve local conventions](references/preserve-local-conventions.md).** Follow the project's existing naming, formatting, module, and semicolon conventions unless explicitly asked to change them.

## Applying the rules

Read each linked reference whose rule is materially relevant to the requested code. For broad generation or refactoring tasks, read all rule references. For a narrowly targeted change, load only the applicable references.

When refactoring, preserve observable behavior, side effects, ordering, mutation semantics, error handling, public interfaces, and supported runtime unless the user explicitly requests a change. Before finalizing a refactor, apply [the refactoring checklist](references/refactoring-checklist.md).

Produce the code in this style without narrating every style choice. Explain only behaviorally meaningful changes, compatibility constraints, or relevant tradeoffs.
