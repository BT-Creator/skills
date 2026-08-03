## filter-models.sh

Filter models by field criteria with AND logic.

### Usage

```
filter-models.sh [--no-cache] -f <field=value> [-f ...]
```

### Filter Fields

| Shorthand | Maps to |
|-----------|---------|
| `context` | `.limit.context` |
| `input` | `.limit.input` |
| `output` | `.limit.output` |
| `reasoning` | `.reasoning` |
| `family` | `.family` |
| `tool_call` | `.tool_call` |

Operators: `=` `!=` `>=` `<=`

### Examples

```bash
exec bash scripts/filter-models.sh -f reasoning=true
exec bash scripts/filter-models.sh -f family=qwen -f "context>=1000000"
exec bash scripts/filter-models.sh -f reasoning=true -f tool_call=true -f "context>=100000"
```

### Output

Same TSV format as list-models, filtered to matching models.

## Practical Examples

Find reasoning models with large context:

```bash
bash scripts/filter-models.sh -f reasoning=true -f "context>=1000000"
```

Find models from a specific family with tool calling:

```bash
bash scripts/filter-models.sh -f family=gpt -f tool_call=true
```

Chain with provider detail to get pricing:

```bash
bash scripts/filter-models.sh -f reasoning=true -f family=grok
bash scripts/provider-detail.sh xai
```
