# Keep asynchronous flows named

Apply this rule reasonably rather than mechanically. Correctness and understandable intent take priority over reducing physical line count.

Give top-level and non-trivial asynchronous operations meaningful names. Named functions improve stack traces, make intent visible, and are easier to reuse or test.

```js
// Avoid
button.addEventListener('click', async () => {
  const response = await fetch('/api/report');
  const report = await response.json();
  renderReport(report);
});

// Prefer
const loadReport = async () => {
  const response = await fetch('/api/report');
  const report = await response.json();
  renderReport(report);
};

button.addEventListener('click', loadReport);
```

Avoid anonymous async IIFEs when the operation can be named and invoked normally.

```js
// Avoid
(async () => {
  const config = await loadConfig();
  startApp(config);
})();

// Prefer
const initialize = async () => {
  const config = await loadConfig();
  startApp(config);
};

initialize();
```

An inline async callback is acceptable when the consuming API requires a callback and the operation is short, obvious, and purely local.

Do not wrap an existing promise in `new Promise`.

```js
// Avoid
const loadUser = id => new Promise((resolve, reject) => {
  fetch(`/api/users/${id}`)
    .then(resolve)
    .catch(reject);
});

// Prefer
const loadUser = id => fetch(`/api/users/${id}`);
```

Use `new Promise` only when adapting a callback-based API or coordinating an operation that does not already expose a promise.
