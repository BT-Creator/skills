# Reuse before adding

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Search the current module and nearby project code for suitable existing functionality before adding another implementation. Prefer built-in JavaScript and TypeScript capabilities over custom equivalents.

Commonly useful capabilities include:

- Array operations such as `map`, `filter`, `find`, `some`, `every`, `flatMap`, and `reduce`
- `Map`, `Set`, `WeakMap`, and `WeakSet`
- `Object.entries`, `Object.keys`, `Object.values`, `Object.fromEntries`, and object spread
- `URL`, `URLSearchParams`, `Intl`, `Date`, and standard platform APIs
- Optional chaining, nullish coalescing, destructuring, and default parameters
- Type utilities such as `Pick`, `Omit`, `Partial`, `Required`, `Readonly`, `Record`, `Extract`, and `Exclude`
- Existing project types, utilities, constants, and domain functions

Use features only when supported by the configured TypeScript version and runtime target.

```ts
// Avoid
function toLookup(items: Item[]): Record<string, string> {
    const result: Record<string, string> = {};

    for (const item of items) {
        result[item.code] = item.description;
    }

    return result;
}

// Prefer
const lookup = Object.fromEntries(
    items.map(item => [item.code, item.description]),
);
```

```ts
// Avoid
const uniqueCodes: string[] = [];

for (const code of codes) {
    if (!uniqueCodes.includes(code)) uniqueCodes.push(code);
}

// Prefer
const uniqueCodes = [...new Set(codes)];
```

Create a domain abstraction when it carries behavior, invariants, lifecycle, or meaning that built-in types cannot express clearly.
