# Use concise modern syntax

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Use modern C# syntax when supported by the project’s configured language version and target framework. Do not assume the newest compiler or runtime without checking the project.

Prefer syntax that removes ceremony while preserving meaning:

- Expression-bodied members for simple expressions
- Pattern matching and property patterns
- Switch expressions
- Null-coalescing and null-conditional operators
- Target-typed `new`
- Collection expressions
- Primary constructors when initialization remains simple
- File-scoped namespaces when consistent with the project
- Records when value equality and record semantics are intended
- `using` declarations when the resource lifetime remains clear

```csharp
// Avoid
private static string GetDisplayName(User? user)
{
    if (user == null || string.IsNullOrWhiteSpace(user.Name))
    {
        return "Unknown";
    }

    return user.Name;
}

// Prefer
private static string GetDisplayName(User? user) =>
    string.IsNullOrWhiteSpace(user?.Name) ? "Unknown" : user.Name;
```

```csharp
// Avoid when the type is immutable data with value semantics
public sealed class Customer
{
    public Customer(string name, string email)
    {
        Name = name;
        Email = email;
    }

    public string Name { get; }
    public string Email { get; }
}

// Prefer when record semantics are correct
public sealed record Customer(string Name, string Email);
```

Do not replace a class with a record when reference identity, mutable entity behavior, custom equality, inheritance behavior, or serialization compatibility requires class semantics.

Use `var` according to local project conventions. Prefer it when the type is obvious or repeated on the right-hand side; keep the explicit type when it communicates important intent.

Do not use newer syntax if it changes allocation, mutation, equality, overload resolution, disposal, nullability, serialization, or compatibility behavior.
