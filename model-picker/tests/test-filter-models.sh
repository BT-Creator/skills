#!/usr/bin/env bash
# test-filter-models.sh — tests for filter-models.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/filter-models.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache -f reasoning=true >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "filter-models.sh"

test_start "reasoning filter"
OUT=$("$SCRIPT" -f reasoning=true 2>/dev/null)
assert_contains "$OUT" "MODEL_ID" "header"
assert_line_count_ge "$OUT" 2 ">=1 result"
test_pass "reasoning filter"

test_start "multi-filter"
OUT_M=$("$SCRIPT" -f reasoning=true -f family=grok 2>/dev/null)
assert_contains "$OUT_M" "MODEL_ID" "multi header"
test_pass "multi-filter"

test_start "fails without -f"
assert_exit_code 1 "nofilter" "$SCRIPT"
test_pass "no filter error"

summary
