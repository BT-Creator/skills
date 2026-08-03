# Reuse before adding

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Search the current type, module, and nearby project code for suitable existing functionality before adding another implementation. Prefer C# language features and Base Class Library APIs over custom equivalents.

Commonly useful capabilities include:

- LINQ operations such as `Select`, `Where`, `Any`, `All`, `GroupBy`, `ToDictionary`, `Distinct`, and `DistinctBy`
- `Dictionary<TKey, TValue>`, `HashSet<T>`, `Queue<T>`, and `Stack<T>`
- `string.IsNullOrWhiteSpace`, `string.Join`, and comparison overloads
- `TryParse`, `TryGetValue`, and `TryAdd` patterns
- `ArgumentNullException.ThrowIfNull`
- `Path`, `Uri`, `DateOnly`, `TimeOnly`, and `TimeProvider`
- Existing records, value objects, extension methods, and project utilities

Use APIs only when supported by the project’s target framework and language version.

```csharp
// Avoid
private static Dictionary<string, string> BuildLookup(IEnumerable<Item> items)
{
    var result = new Dictionary<string, string>();

    foreach (var item in items)
    {
        result[item.Code] = item.Description;
    }

    return result;
}

// Prefer
var lookup = items.ToDictionary(item => item.Code, item => item.Description);
```

Do not create a custom class when an existing collection or built-in type fully represents non-domain data and behavior.

```csharp
// Avoid
public sealed class CodeRegistry
{
    private readonly List<string> _codes = [];

    public void Add(string code)
    {
        if (!_codes.Contains(code))
        {
            _codes.Add(code);
        }
    }
}

// Prefer
var codes = new HashSet<string>(StringComparer.Ordinal);
codes.Add(code);
```

Create a domain type when it carries invariants, behavior, identity, or meaning that a built-in type cannot express clearly.
