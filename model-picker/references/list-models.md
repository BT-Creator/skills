## list-models.sh

List all models from models.dev. Compact TSV output.

### Usage

```
list-models.sh [--no-cache]
```

### Examples

```bash
exec bash scripts/list-models.sh
exec bash scripts/list-models.sh --no-cache
```

### Output

Tab-separated: MODEL_ID, NAME, FAMILY, CONTEXT, REASONING, TOOLS, KNOWLEDGE

## Practical Examples

List all models and pipe through grep to find specific ones:

```bash
bash scripts/list-models.sh | grep -i claude
```

List models and count how many support reasoning:

```bash
bash scripts/list-models.sh | grep true | wc -l
```
