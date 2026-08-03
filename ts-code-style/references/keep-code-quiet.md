# Keep code quiet

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Remove code that adds ceremony without adding behavior or useful type information:

- Variables that only rename a value used once
- Functions or classes that only forward arguments
- Comments that restate the next line
- Redundant boolean branches
- Unnecessary `else` blocks after `return`, `throw`, `break`, or `continue`
- Type annotations that merely repeat obvious inference
- Repeated spreads, conversions, or temporary arrays
- Custom bookkeeping replaced cleanly by `Map` or `Set`
- Non-null assertions or casts used only to silence the compiler

```ts
// Avoid
const userName: string = user.name;
return userName;

// Prefer
return user.name;
```

```ts
// Avoid
if (!user) {
    return undefined;
} else {
    return user.name;
}

// Prefer
return user?.name;
```

Keep an intermediate variable when it names a meaningful domain concept, prevents repeated work, improves narrowing, clarifies mutation or ownership, supports debugging of a complex expression, or separates meaningful steps.

Add a comment only for a non-obvious constraint, workaround, compatibility issue, or decision that the code cannot express itself.
