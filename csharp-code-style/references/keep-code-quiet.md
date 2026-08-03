# Keep code quiet

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Remove code that adds ceremony without adding behavior:

- Variables that only rename a value used once
- Methods or services that only forward arguments
- Comments that restate the next line
- Redundant boolean branches
- Unnecessary `else` blocks after `return`, `throw`, `break`, or `continue`
- Custom bookkeeping replaced cleanly by built-in collections
- Needless `ToList`, `ToArray`, or repeated conversions
- Explicit default initialization already provided by the language

```csharp
// Avoid
var userName = user.Name;
return userName;

// Prefer
return user.Name;
```

```csharp
// Avoid
if (user is null)
{
    return null;
}
else
{
    return user.Name;
}

// Prefer
if (user is null)
{
    return null;
}

return user.Name;
```

Keep an intermediate variable when it names a meaningful domain concept, prevents repeated enumeration or expensive work, clarifies ownership or disposal, supports debugging of a complex expression, or separates meaningful steps.

Add a comment only for a non-obvious constraint, workaround, compatibility issue, or decision that the code cannot express itself.
