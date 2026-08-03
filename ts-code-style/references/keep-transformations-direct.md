# Keep transformations direct

Apply this rule reasonably rather than mechanically. Correctness, type safety, and understandable intent take priority over reducing physical line count.

Choose the built-in operation that directly describes the intent. Avoid custom wrappers around straightforward array, object, `Map`, or `Set` operations.

```ts
// Avoid
function filterItems(items: Item[], filter: ItemFilter): Item[] {
    return items.filter(item => {
        if (filter.code) {
            return item.code === filter.code;
        }

        return true;
    });
}

// Prefer
const filteredItems = items.filter(
    item => !filter.code || item.code === filter.code,
);
```

Use the operation that matches the task:

- `map` for one output per input
- `filter` for selection
- `find` for the first optional match
- `some` or `every` for boolean checks
- `flatMap` for mapping and flattening
- `Object.fromEntries` for object lookup construction
- `Map` for keyed data with non-string keys or intentional map semantics
- `Set` for uniqueness and repeated membership checks
- `reduce` for a genuine accumulation that remains easy to follow

Do not force several unrelated operations into a dense `reduce` merely to iterate once. Use a direct loop when processing is stateful, must stop early, performs several side effects, mutates multiple outputs, or becomes less clear as a chain.

Keep callback bodies concise when the transformation is simple. Use a block or named function when the callback has meaningful branching, side effects, or multiple steps.
