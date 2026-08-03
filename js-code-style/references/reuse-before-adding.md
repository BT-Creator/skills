# Reuse before adding

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Search the current module and nearby project code for suitable existing functionality before adding another implementation. Prefer built-in JavaScript and runtime APIs over custom equivalents.

Commonly useful native capabilities include:

- Array methods such as `map`, `filter`, `find`, `some`, `every`, `reduce`, and `flatMap`
- `Map` and `Set`
- `Object.entries`, `Object.fromEntries`, `Object.groupBy`, and `Object.hasOwn`
- `URL` and `URLSearchParams`
- `structuredClone`
- Built-in string, number, date, and internationalization APIs

Use them only when supported by the declared runtime.

```js
// Avoid
const codes = [];

for (const item of items) {
  codes.push(item.code);
}

// Prefer
const codes = items.map(({ code }) => code);
```

Do not create a custom class when a plain object, `Map`, `Set`, or existing built-in type represents the data and behavior adequately.

```js
// Avoid
class CodeRegistry {
  constructor() {
    this.codes = [];
  }

  add(code) {
    if (!this.codes.includes(code)) this.codes.push(code);
  }
}

// Prefer
const codes = new Set();
codes.add(code);
```

A direct loop remains appropriate when it is clearer for stateful processing, early termination, or multiple side effects.
