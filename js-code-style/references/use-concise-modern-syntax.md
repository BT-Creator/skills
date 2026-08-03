# Use concise modern syntax

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Use `const` by default, `let` only for reassignment, and never `var`.

Prefer syntax that removes ceremony while preserving meaning:

- Destructuring
- Property and method shorthand
- Optional chaining
- Nullish coalescing
- Rest and spread
- Template literals
- Logical assignment
- Concise arrow functions for small synchronous expressions

```js
// Avoid
const createUser = (name, email) => {
  return {
    name: name,
    email: email,
    active: true,
  };
};

// Prefer
const createUser = (name, email) => ({ name, email, active: true });
```

```js
// Avoid
const city = user && user.address && user.address.city
  ? user.address.city
  : 'Unknown';

// Prefer
const city = user?.address?.city ?? 'Unknown';
```

Choose operators according to semantics:

- Use `??` when only `null` or `undefined` should fall back.
- Use `||` when every falsy value should fall back.
- Use `Boolean(value)` or `!!value` only when an actual boolean is needed.

Prefer newer standard APIs when the target runtime supports them.

```js
// Compatible with older runtimes; mutates the copy
const sortedUsers = [...users].sort((a, b) => a.name.localeCompare(b.name));

// Prefer when supported; does not mutate
const sortedUsers = users.toSorted((a, b) => a.name.localeCompare(b.name));
```

Do not silently change mutation behavior, error behavior, enumeration order, or runtime requirements while modernizing syntax.
