# Use concise modern syntax

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Use modern TypeScript and JavaScript syntax when supported by the project's configured compiler and runtime target. Do not assume the newest TypeScript version or JavaScript runtime without checking the project.

Prefer syntax that removes ceremony while preserving meaning:

- Arrow functions for short local callbacks and expressions
- Object property and method shorthand
- Destructuring when it makes accessed values clearer
- Optional chaining and nullish coalescing
- Default parameters
- Template literals
- Object and array spread where allocation and overwrite semantics are intended
- `satisfies` for conformance without widening away useful inference
- `as const` for intentional readonly literal inference
- `const` type parameters when supported and useful
- Native private fields only when their runtime semantics are intended

```ts
// Avoid
function getDisplayName(user: User | undefined): string {
    if (user === undefined || user.name === undefined || user.name === '') {
        return 'Unknown';
    }

    return user.name;
}

// Prefer when an empty string is considered absent
const getDisplayName = (user?: User): string => user?.name || 'Unknown';
```

Use `??` instead of `||` when `0`, `false`, or an empty string are valid values.

```ts
const pageSize = options.pageSize ?? 25;
```

Do not use newer syntax if it changes allocation, enumerability, property ordering, prototype behavior, module output, runtime compatibility, mutation, or narrowing in an unintended way.
