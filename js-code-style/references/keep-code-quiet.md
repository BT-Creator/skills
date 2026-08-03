# Keep code quiet

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Remove code that adds ceremony without adding behavior:

- Variables that only rename a value used once
- Functions that only forward arguments
- Comments that restate the next line
- Repeated boolean branches
- Custom bookkeeping replaced cleanly by native data structures
- Dependencies introduced only to save a few native JavaScript lines

```js
// Avoid
const userName = user.name;
return userName;

// Prefer
return user.name;
```

Keep an intermediate variable when it makes a domain concept explicit, avoids repeated or expensive computation, enables debugging of a complex expression, or separates meaningful steps.

Add a comment only for a non-obvious constraint, workaround, compatibility issue, or decision that the code cannot express itself.
