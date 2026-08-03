## check-provider.sh

Quick availability check for one or more providers. Returns FOUND/NOT_FOUND table.

### Usage

```
check-provider.sh [--no-cache] <provider-id> [provider-id ...]
```

### Examples

```bash
exec bash scripts/check-provider.sh openai
exec bash scripts/check-provider.sh openai anthropic nonexistent
exec bash scripts/check-provider.sh openai,github-copilot
```

### Output

Tab-separated: PROVIDER, STATUS (FOUND/NOT_FOUND), NAME, MODELS

## Practical Examples

Quick check before querying provider details:

```bash
bash scripts/check-provider.sh openai && bash scripts/provider-detail.sh openai
```

Verify multiple providers exist:

```bash
bash scripts/check-provider.sh openai anthropic google xai mistral
```
