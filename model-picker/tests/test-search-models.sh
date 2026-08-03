#!/usr/bin/env bash
# test-search-models.sh — tests for search-models.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/search-models.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache claude >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "search-models.sh"

test_start "finds claude"
OUT=$("$SCRIPT" claude 2>/dev/null)
assert_contains "$OUT" "MODEL_ID" "header"
assert_line_count_ge "$OUT" 2 ">=1 result"
test_pass "search output"

test_start "exit 0"
assert_exit_code 0 "exit" "$SCRIPT" claude
test_pass "exit 0"

test_start "fails without term"
assert_exit_code 1 "noarg" "$SCRIPT"
test_pass "no term error"

summary
