# Avoid unnecessary abstraction

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Do not extract a simple one-line helper that is used once and is clearer at the call site.

```js
// Avoid
const matchesStatus = (item, status) => !status || item.status === status;
const visibleItems = items.filter(item => matchesStatus(item, status));

// Prefer
const visibleItems = items.filter(item => !status || item.status === status);
```

Extract code when at least one of these applies:

- It is reused meaningfully.
- It is independently testable behavior.
- It contains enough complexity to distract from the surrounding flow.
- It names an important domain operation.
- It separates a real responsibility or side effect.

Do not add wrappers that merely forward arguments.

```js
// Avoid
const loadUser = id => userApi.loadUser(id);

// Prefer
const user = await userApi.loadUser(id);
```

Keep a wrapper when it intentionally stabilizes an interface, injects policy, handles errors, adds instrumentation, or centralizes behavior expected to change.

Prefer a small amount of local duplication over a premature abstraction that makes the flow harder to follow.
