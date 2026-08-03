#!/usr/bin/env bash
# test-list-providers.sh — tests for list-providers.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/list-providers.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    bash "$(cd "$SCRIPT_DIR/.." && pwd)/scripts/list-models.sh" --no-cache >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/api.json" ]]; then
    echo "No api.json cache, fetching..."
    "$SCRIPT" --no-cache >/dev/null 2>&1 || true
fi

bold "list-providers.sh"

test_start "has header + providers"
OUT=$("$SCRIPT" 2>/dev/null)
assert_contains "$OUT" "PROVIDER" "header"
assert_contains "$OUT" "NAME" "NAME col"
assert_contains "$OUT" "MODELS" "MODELS col"
assert_line_count_ge "$OUT" 100 ">=100 providers"
assert_contains "$OUT" "openai" "has openai"
test_pass "output"

test_start "exit 0"
assert_exit_code 0 "exit" "$SCRIPT"
test_pass "exit 0"

summary
