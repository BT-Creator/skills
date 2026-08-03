## models-of.sh

Combined view showing provider info + pricing + model capabilities for one or more providers.

### Usage

```
models-of.sh [--no-cache] <provider-id> [provider-id ...]
```

### Examples

```bash
exec bash scripts/models-of.sh openai
exec bash scripts/models-of.sh openai,anthropic
```

### Limitations

Only works for **direct providers** (openai, anthropic, google, etc.) whose models are keyed as `<provider>/<model>` in models.json. Does NOT work for resellers (github-copilot, github-models). Use `provider-detail.sh` for reseller pricing.

### Output

```
--- openai ---
API: n/a  ENV: OPENAI_API_KEY  Models: 51
  MODEL          NAME             COST_IN  COST_OUT
  gpt-5          GPT-5            1.25     10

MODEL_ID         NAME              FAMILY  CONTEXT  REASONING  TOOLS  KNOWLEDGE
openai/gpt-5     GPT-5             gpt     400000   true       true   2024-09-30
```

## Practical Examples

Compare multiple providers in one view:

```bash
bash scripts/models-of.sh openai anthropic
```

Combined workflow - filter then get pricing + capabilities:

```bash
bash scripts/filter-models.sh -f reasoning=true -f family=grok
bash scripts/models-of.sh xai
```

Limitation note: resellers like github-copilot won't show model capabilities table.
