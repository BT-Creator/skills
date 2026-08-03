## provider-detail.sh

Show provider details including API endpoint, env vars, npm package, and models with pricing.

### Usage

```
provider-detail.sh [--no-cache] <provider-id> [provider-id ...]
```

Supports space-separated and comma-separated IDs.

### Examples

```bash
exec bash scripts/provider-detail.sh openai
exec bash scripts/provider-detail.sh openai github-copilot
exec bash scripts/provider-detail.sh openai,anthropic
```

### Output

JSON object per provider: `{id, name, api, env, npm, doc, models: [{id, name, cost}]}`

If provider not found: `{"error": "Provider not found: <id>"}`

## Practical Examples

Compare pricing across providers:

```bash
bash scripts/provider-detail.sh openai > /tmp/openai.json
bash scripts/provider-detail.sh anthropic > /tmp/anthropic.json
```

Get a specific provider's API setup info:

```bash
bash scripts/provider-detail.sh openai | jq '.env, .npm, .doc'
```

Check a reseller provider (not in models.json):

```bash
bash scripts/provider-detail.sh github-copilot
```
