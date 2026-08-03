#!/usr/bin/env bash
# test-list-models.sh — tests for list-models.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/list-models.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "list-models.sh"

test_start "has header + models"
OUT=$("$SCRIPT" 2>/dev/null)
assert_contains "$OUT" "MODEL_ID" "header"
assert_line_count_ge "$OUT" 200 ">=200 lines"
test_pass "output"

test_start "exit 0"
assert_exit_code 0 "exit" "$SCRIPT"
test_pass "exit 0"

summary
