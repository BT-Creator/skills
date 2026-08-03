# Avoid unnecessary abstraction

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Do not extract a simple one-line method used once when the expression is clearer at the call site.

```csharp
// Avoid
private static bool MatchesStatus(Item item, Status? status) =>
    status is null || item.Status == status;

var visibleItems = items.Where(item => MatchesStatus(item, status)).ToList();

// Prefer
var visibleItems = items
    .Where(item => status is null || item.Status == status)
    .ToList();
```

Extract code when at least one of these applies:

- It is reused meaningfully.
- It contains enough complexity to distract from the surrounding flow.
- It is independently testable behavior.
- It names an important domain operation or invariant.
- It separates a real responsibility, side effect, policy, or resource lifetime.
- It provides an intentional boundary expected to vary.

Do not add a class, interface, service, extension method, or wrapper that merely forwards arguments.

```csharp
// Avoid
public Task<User?> GetUserAsync(Guid id, CancellationToken cancellationToken) =>
    _repository.GetUserAsync(id, cancellationToken);

// Prefer at the call site when no boundary is needed
var user = await repository.GetUserAsync(id, cancellationToken);
```

Keep a wrapper or interface when it enforces policy, stabilizes a boundary, enables multiple implementations, adds observability, coordinates errors or transactions, or isolates volatile dependencies.

Prefer a small amount of local duplication over a premature abstraction that makes control flow and ownership harder to follow.
