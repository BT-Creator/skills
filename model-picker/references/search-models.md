## search-models.sh

Search models by id, name, or description (case-insensitive).

### Usage

```
search-models.sh [--no-cache] <term>
```

### Examples

```bash
exec bash scripts/search-models.sh claude
exec bash scripts/search-models.sh --no-cache "gpt-5"
```

### Output

Same TSV format as list-models, filtered to matching models.

## Practical Examples

Find all models mentioning "claude" then get details on one:

```bash
bash scripts/search-models.sh claude
bash scripts/model-detail.sh anthropic/claude-sonnet-5
```

Search for a provider's models by name prefix:

```bash
bash scripts/search-models.sh "gpt-5"
```
