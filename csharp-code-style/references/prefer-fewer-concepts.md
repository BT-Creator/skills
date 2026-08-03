# Prefer fewer concepts, not code golf

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Interpret “less lines is better” as a preference for fewer concepts to understand: less temporary state, fewer branches, fewer wrappers, fewer single-use helpers, and fewer unnecessary abstractions.

Do not compress code merely to reduce its line count. Keep an extra variable, method, or type when it communicates important domain meaning, prevents duplicated expensive work, or makes complex behavior understandable.

```csharp
// Avoid: verbose control flow that only returns a condition
private static bool IsValid(Item item)
{
    if (!string.IsNullOrWhiteSpace(item.Code))
    {
        return true;
    }

    return false;
}

// Prefer
private static bool IsValid(Item item) => !string.IsNullOrWhiteSpace(item.Code);
```

Prefer guard clauses when they remove unnecessary nesting.

```csharp
// Avoid
private static decimal CalculateTotal(Order? order)
{
    if (order is not null)
    {
        if (order.Items.Count > 0)
        {
            return order.Items.Sum(item => item.Price);
        }
    }

    return 0;
}

// Prefer
private static decimal CalculateTotal(Order? order)
{
    if (order is not { Items.Count: > 0 })
    {
        return 0;
    }

    return order.Items.Sum(item => item.Price);
}
```

Do not replace precise null, equality, or state checks with shorter expressions that change semantics.
