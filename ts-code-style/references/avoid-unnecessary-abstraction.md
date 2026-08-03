# Avoid unnecessary abstraction

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Do not extract a simple one-line function used once when the expression is clearer at the call site.

```ts
// Avoid
const matchesStatus = (item: Item, status?: Status) =>
    !status || item.status === status;

const visibleItems = items.filter(item => matchesStatus(item, status));

// Prefer
const visibleItems = items.filter(
    item => !status || item.status === status,
);
```

Extract code when at least one of these applies:

- It is reused meaningfully.
- It contains enough complexity to distract from the surrounding flow.
- It is independently testable behavior.
- It names an important domain operation or invariant.
- It separates a real responsibility, side effect, policy, or resource lifetime.
- It provides an intentional boundary expected to vary.

Do not add a class, interface, generic wrapper, service, or forwarding function that merely renames a built-in operation or passes arguments through.

```ts
// Avoid
class UserCollection {
    constructor(private readonly users: User[]) {}

    findById(id: string): User | undefined {
        return this.users.find(user => user.id === id);
    }
}

// Prefer
const user = users.find(user => user.id === id);
```

Keep an abstraction when it enforces policy, owns state or resources, stabilizes a boundary, coordinates errors, represents a domain concept, or isolates a volatile dependency.

Prefer a small amount of local duplication over a premature abstraction that makes control flow, generic relationships, or ownership harder to follow.
