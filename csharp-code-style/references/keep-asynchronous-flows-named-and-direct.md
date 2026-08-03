# Keep asynchronous flows named and direct

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Use asynchronous APIs all the way through the call chain. Give non-trivial asynchronous operations meaningful method names so intent is visible and stack traces are useful.

```csharp
// Avoid: Task.Run adds a thread-pool hop around naturally asynchronous I/O
public void LoadReport()
{
    Task.Run(async () =>
    {
        var report = await _reportClient.GetAsync();
        Console.WriteLine(report);
    });
}

// Prefer
public async Task LoadReportAsync(CancellationToken cancellationToken)
{
    var report = await _reportClient.GetAsync(cancellationToken);
    Console.WriteLine(report);
}
```

Avoid `async void` except for event handlers. Return `Task` or `Task<T>` so callers can await completion and observe exceptions.

Avoid `.Result`, `.Wait()`, and `GetAwaiter().GetResult()` in asynchronous flows unless a documented integration boundary makes blocking unavoidable.

Do not add `async` and `await` when directly returning the task preserves the same exception, disposal, and control-flow semantics.

```csharp
// Avoid
private async Task<User?> LoadUserAsync(
    Guid id,
    CancellationToken cancellationToken)
{
    return await _repository.GetUserAsync(id, cancellationToken);
}

// Prefer
private Task<User?> LoadUserAsync(
    Guid id,
    CancellationToken cancellationToken) =>
    _repository.GetUserAsync(id, cancellationToken);
```

Keep `await` when it is required for `try`/`catch` behavior, `finally`, `using` or `await using` lifetime, sequencing, context, or transformation of the result.

An inline async lambda is acceptable when an API requires a callback and the operation is short, obvious, and local. Extract non-trivial callbacks into named methods.

Forward an existing `CancellationToken` through cancellable operations. Do not introduce `Task.Run` for I/O-bound work; reserve it for intentional CPU-bound offloading when the execution context makes that appropriate.
