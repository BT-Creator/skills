## list-providers.sh

List all providers from models.dev.

### Usage

```
list-providers.sh [--no-cache]
```

### Examples

```bash
exec bash scripts/list-providers.sh
exec bash scripts/list-providers.sh --no-cache
```

### Output

Tab-separated: PROVIDER, NAME, MODELS, API, ENV

## Practical Examples

List all providers, then check specific ones:

```bash
bash scripts/list-providers.sh
bash scripts/check-provider.sh openai anthropic google
```

Count providers:

```bash
bash scripts/list-providers.sh | tail -n +2 | wc -l
```
