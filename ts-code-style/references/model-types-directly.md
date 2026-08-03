# Model types directly

Apply this rule reasonably rather than mechanically. Runtime correctness, type safety, and understandable intent take priority over type cleverness.

Prefer `type` aliases for object shapes, unions, intersections, callbacks, mapped types, and aliases. Use `interface` only when declaration merging, an intentionally extensible public contract, or a project convention makes it materially better.

```ts
// Avoid by default
interface User {
    id: string;
    name: string;
}

// Prefer
type User = {
    id: string;
    name: string;
};
```

Prefer inference when the compiler already knows the type. Add annotations at public boundaries, where inference is too broad, where a contract must be enforced, or where the annotation improves understanding.

```ts
// Avoid
const names: string[] = users.map((user: User): string => user.name);

// Prefer
const names = users.map(user => user.name);
```

Derive related types instead of duplicating shapes that can drift.

```ts
type User = {
    id: string;
    name: string;
    email: string;
};

// Prefer deriving the subset
type UserSummary = Pick<User, 'id' | 'name'>;
```

Prefer unions, discriminated unions, generics, and narrowing over broad optional-property bags or overloads that hide invalid states.

```ts
// Avoid: invalid combinations are representable
type Result<T> = {
    data?: T;
    error?: Error;
};

// Prefer
type Result<T> =
    | { status: 'success'; data: T }
    | { status: 'error'; error: Error };
```

Avoid `any`. Use `unknown` for untrusted values and narrow it before use. Avoid `as` assertions when narrowing, `satisfies`, a type guard, a generic constraint, or a corrected type definition can express the relationship safely.

Use `satisfies` when a value must conform to a type without losing its useful inferred literals. Use `as const` only when readonly literal inference is intended.

Do not create branded types, opaque wrappers, classes, or complex generic utilities solely to appear more type-safe. Add them when they enforce a real domain distinction or prevent a concrete class of errors.
