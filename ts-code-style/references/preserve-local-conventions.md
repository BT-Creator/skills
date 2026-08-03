# Preserve local conventions

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Match the surrounding project's conventions for:

- Naming, formatting, imports, and file organization
- Semicolons, quotes, trailing commas, and arrow-function style
- `type` versus `interface` where the codebase has a deliberate established rule
- Strictness flags and null handling
- Module system, module resolution, and export style
- Generic naming and public type annotations
- Error and result handling
- Async naming and abort or cancellation patterns
- Compiler, linter, formatter, and build settings
- TypeScript version and JavaScript runtime target

Treat `tsconfig.json`, configured linters and formatters, and established nearby code as stronger formatting and compatibility signals than this skill.

Do not make unrelated style changes while refactoring. Keep diffs focused on the requested behavior or simplification.

Preserve public exports, declaration output, module shape, overloads, generic contracts, runtime validation boundaries, serialization shapes, and backwards compatibility unless the user explicitly requests a breaking change.
