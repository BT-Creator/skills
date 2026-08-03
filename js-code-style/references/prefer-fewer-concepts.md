# Prefer fewer concepts, not code golf

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Interpret “less lines is better” as a preference for fewer concepts to understand: less temporary state, fewer branches, fewer wrappers, fewer single-use helpers, and fewer unnecessary abstractions.

Do not compress code merely to reduce its line count. Keep an extra variable or helper when it communicates important domain meaning, prevents duplicated expensive work, or makes a complex condition understandable.

```js
// Avoid: verbose control flow that only returns a condition
const isValid = item => {
  if (item.code) {
    return true;
  }

  return false;
};

// Prefer
const isValid = item => Boolean(item.code);
```

Do not replace a precise null check with truthiness when `0`, `false`, or an empty string is valid.
