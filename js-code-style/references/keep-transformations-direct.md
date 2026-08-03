# Keep transformations direct

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Choose the built-in operation that directly describes the intent. Avoid custom wrapper functions around straightforward collection operations.

```js
// Avoid
const filterItems = (items, status) => items.filter(item => {
  if (status) {
    return item.status === status;
  }

  return true;
});

const visibleItems = filterItems(items, status);

// Prefer
const visibleItems = items.filter(item => !status || item.status === status);
```

Use the operation that matches the task:

- `map` for one output per input
- `filter` for selection
- `find` for the first match
- `some` or `every` for boolean checks
- `flatMap` for mapping to zero or more outputs
- `Set` for membership or primitive deduplication
- `Map` for keyed lookup where key identity or insertion order matters

```js
// Avoid
const uniqueCodes = [];

for (const { code } of items) {
  if (!uniqueCodes.includes(code)) uniqueCodes.push(code);
}

// Prefer
const uniqueCodes = [...new Set(items.map(({ code }) => code))];
```

Avoid multiple passes only when combining them remains clear and preserves semantics. Do not force several unrelated operations into one dense `reduce` merely to traverse the array once.

Prefer early returns when they remove nesting.

```js
// Avoid
const processOrder = order => {
  if (order) {
    if (order.items.length) {
      return calculateTotal(order.items);
    }
  }

  return 0;
};

// Prefer
const processOrder = order => {
  if (!order?.items.length) return 0;

  return calculateTotal(order.items);
};
```

Keep separate guards when they communicate distinct failure cases more clearly than one combined condition.
