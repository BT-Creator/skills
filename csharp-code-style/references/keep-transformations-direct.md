# Keep transformations direct

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Choose the built-in operation that directly describes the intent. Avoid custom wrappers around straightforward LINQ or collection operations.

```csharp
// Avoid
private static bool IsDefined(string? code) => !string.IsNullOrWhiteSpace(code);

private static bool IsAccessible(
    string code,
    bool hasWildcardPermission,
    IReadOnlySet<string> accessibleCodes) =>
    hasWildcardPermission || accessibleCodes.Contains(code);

var result = items
    .Where(item => IsDefined(item.Code))
    .Where(item => IsAccessible(item.Code!, hasWildcardPermission, accessibleCodes))
    .ToList();

// Prefer
var result = items
    .Where(item => !string.IsNullOrWhiteSpace(item.Code))
    .Where(item => hasWildcardPermission || accessibleCodes.Contains(item.Code!))
    .DistinctBy(item => item.Code, StringComparer.Ordinal)
    .ToList();
```

Use the operation that matches the task:

- `Select` for one output per input
- `Where` for selection
- `Any` or `All` for boolean checks
- `FirstOrDefault` for the first optional match
- `Single` or `SingleOrDefault` when uniqueness is an invariant
- `SelectMany` for flattening
- `GroupBy` or `ToLookup` for grouping
- `ToDictionary` for keyed lookup
- `Distinct` or `DistinctBy` for deduplication
- `HashSet<T>` for repeated membership checks

Avoid forcing several unrelated operations into a dense `Aggregate` merely to enumerate once. A direct loop is appropriate when processing is stateful, must stop early, performs multiple side effects, requires careful disposal, or becomes less clear in LINQ.

Remember that LINQ is usually deferred. Do not add or remove materialization such as `ToList` without considering timing, exceptions, repeated enumeration, and mutation of the source.
