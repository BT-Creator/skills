## model-detail.sh

Show full JSON details for one or more models by their model ID.

### Usage

```
model-detail.sh [--no-cache] <model-id> [model-id ...]
```

### Examples

```bash
exec bash scripts/model-detail.sh anthropic/claude-sonnet-5
exec bash scripts/model-detail.sh openai/gpt-5 anthropic/claude-sonnet-5
```

### Output

JSON object per model with all fields (id, name, family, reasoning, tool_call, limit, modalities, etc.).

If model not found: `{"error": "Model not found: <id>"}`

## Practical Examples

Compare two models side by side:

```bash
bash scripts/model-detail.sh openai/gpt-5 anthropic/claude-sonnet-5
```

Extract specific fields:

```bash
bash scripts/model-detail.sh openai/gpt-5 | jq '{id, family, reasoning, tool_call, limit: .limit.context}'
```
