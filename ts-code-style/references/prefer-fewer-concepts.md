# Prefer fewer concepts, not code golf

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Interpret "less lines is better" as a preference for fewer concepts to understand: less temporary state, fewer branches, fewer wrappers, fewer single-use helpers, fewer redundant type declarations, and fewer unnecessary abstractions.

Do not compress code merely to reduce its line count. Keep an extra variable, function, or type when it communicates important domain meaning, avoids duplicated expensive work, improves narrowing, or makes complex behavior understandable.

```ts
// Avoid: verbose control flow that only returns a condition
function isValid(item: Item): boolean {
    if (item.code) {
        return true;
    }

    return false;
}

// Prefer
const isValid = (item: Item): boolean => !!item.code;
```

Prefer guard clauses when they remove unnecessary nesting.

```ts
// Avoid
function getDisplayName(user?: User): string {
    if (user) {
        if (user.name) {
            return user.name;
        }
    }

    return 'Unknown';
}

// Prefer
function getDisplayName(user?: User): string {
    if (!user?.name) return 'Unknown';

    return user.name;
}
```

Do not replace precise checks with shorter truthiness expressions when values such as `0`, `false`, or an empty string are valid and semantically different from absence.
