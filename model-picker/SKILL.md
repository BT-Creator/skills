---
name: model-picker
description: Use when you need to look up LLM models by provider, capability, context size, cost, or name — or to compare models for a task. Fetches live data from models.dev.
---

# Model Picker

Query [models.dev](https://models.dev/) to find and compare LLM models by provider, capability, context window, pricing, and more.

## Requirements

- `bash` 4+
- `curl` (or `wget`)
- `jq`

## Quick Reference

| Script | Purpose | Output | Reference |
|--------|---------|--------|-----------|
| `list-models.sh` | List all models | TSV | [docs](references/list-models.md) |
| `search-models.sh` | Search by name/id/description | TSV | [docs](references/search-models.md) |
| `filter-models.sh` | Filter by capability criteria | TSV | [docs](references/filter-models.md) |
| `model-detail.sh` | Full JSON spec for specific model IDs | JSON | [docs](references/model-detail.md) |
| `list-providers.sh` | List all 151+ providers | TSV | [docs](references/list-providers.md) |
| `provider-detail.sh` | Provider API key, endpoints, model pricing | JSON | [docs](references/provider-detail.md) |
| `check-provider.sh` | Quick "does this provider exist?" check | TSV | [docs](references/check-provider.md) |
| `models-of.sh` | Combined: provider pricing + model capabilities | Mixed | [docs](references/models-of.md) |

## Quick Start

```bash
# List all models
bash scripts/list-models.sh

# Search for models
bash scripts/search-models.sh claude

# Filter by capability
bash scripts/filter-models.sh -f reasoning=true -f "context>=1000000"

# Check if a provider exists
bash scripts/check-provider.sh openai

# Show provider details with pricing
bash scripts/provider-detail.sh openai

# Show full model details
bash scripts/model-detail.sh anthropic/claude-sonnet-5

# Combined provider + model view
bash scripts/models-of.sh openai
```

## Shared Dependencies

All scripts source `assets/lib.sh` for config, caching, and JSON helpers. Cache lives in `~/.cache/model-picker/` (1h TTL). Pass `--no-cache` to bypass.

## Data Sources

| Endpoint | Content | Size |
|----------|---------|------|
| `models.dev/models.json` | 235+ models with specs | 164 KB |
| `models.dev/api.json` | 151+ providers with pricing | 3 MB |

## Script Design

- Each script does one thing — atomic output
- List/search/filter scripts output TSV (machine-parseable, compact)
- Detail scripts output JSON (complete schema)
- All scripts support `--no-cache` and `--help`
- Filters support AND logic: `-f reasoning=true -f "context>=1000000"`

## Limitations

### `-m` / `models-of.sh` only works for direct model providers

Only matches models whose key starts with `<provider>/`. Works for openai, anthropic, google, alibaba, etc. Does NOT work for resellers (github-copilot, github-models). Use `provider-detail.sh` for those.

### Data freshness

Data cached 1 hour from models.dev. Use `--no-cache` for fresh data.

## Tests

One test file per script. Requires network on first run (data caches after).

```bash
bash tests/test-list-models.sh
bash tests/test-search-models.sh
bash tests/test-filter-models.sh
bash tests/test-list-providers.sh
bash tests/test-provider-detail.sh
bash tests/test-model-detail.sh
bash tests/test-models-of.sh
bash tests/test-check-provider.sh

# Or run all at once:
for f in tests/test-*.sh; do bash "$f"; done
```

## Examples

| LLM use case | Practical example | Filepath |
|-------------|-------------------|----------|
| Choose model for long-context coding agent | Compare context window, reasoning, and pricing before picking a code model | `references/model-detail.md` |
| Find cheapest reasoning model | Filter by `reasoning=true` and inspect provider pricing after shortlist | `references/filter-models.md` |
| Check provider support for deployment | Verify provider exists, then inspect endpoints and auth details | `references/check-provider.md` |
| Compare two candidate chat models | Pull full specs for both models, then compare limits and cost | `references/model-detail.md` |
| Build provider shortlist for app migration | List providers, then inspect one provider's pricing and model set | `references/list-providers.md` |
| Map model family options by provider | Use combined provider + model view to see capability coverage fast | `references/models-of.md` |
