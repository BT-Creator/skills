# Keep asynchronous flows named and direct

Apply this rule reasonably rather than mechanically. Correctness, debuggability, and understandable intent take priority over reducing physical line count.

Use promises directly through the call chain. Give non-trivial asynchronous operations meaningful names so intent is visible and stack traces are useful.

```ts
// Avoid: detached anonymous work is difficult to observe and handle
function loadReport(): void {
    void (async () => {
        const report = await reportClient.get();
        console.log(report);
    })();
}

// Prefer
async function loadReport(): Promise<void> {
    const report = await reportClient.get();
    console.log(report);
}
```

Do not create a new `Promise` around an API that already returns a promise.

```ts
// Avoid
const loadUser = (id: string) =>
    new Promise<User>((resolve, reject) => {
        userClient.get(id).then(resolve, reject);
    });

// Prefer
const loadUser = (id: string) => userClient.get(id);
```

Do not mark a function `async` when it only returns an existing promise and `await` adds no required behavior.

```ts
// Avoid
async function loadUser(id: string): Promise<User> {
    return await userClient.get(id);
}

// Prefer
const loadUser = (id: string): Promise<User> => userClient.get(id);
```

Keep `await` when it is required for local `try`/`catch` or `finally` behavior, sequencing, resource cleanup, result transformation, or clearer control flow.

An inline async callback is acceptable when an API requires one and the operation is short, obvious, and local. Extract non-trivial callbacks into named functions.

Do not start unobserved work with `void` unless fire-and-forget behavior is deliberate and errors are handled. Preserve cancellation or abort signals when the surrounding API supports them.
