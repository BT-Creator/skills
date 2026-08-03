#!/usr/bin/env bash
# test-check-provider.sh — tests for check-provider.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/check-provider.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/api.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache openai >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "check-provider.sh"

test_start "finds known providers"
OUT=$("$SCRIPT" openai anthropic 2>/dev/null)
assert_contains "$OUT" "PROVIDER" "header"
assert_contains "$OUT" "STATUS" "STATUS col"
assert_contains "$OUT" "FOUND" "FOUND"
assert_contains "$OUT" "OpenAI" "openai name"
assert_contains "$OUT" "Anthropic" "anthropic name"
LINES=$(wc -l <<< "$OUT" | tr -d ' ')
if (( LINES < 3 )); then
    test_fail "known count"
    echo "    Expected >=3 lines, got $LINES" >&2
else
    test_pass "known providers"
fi

test_start "marks missing as NOT_FOUND"
OUT_M=$("$SCRIPT" nonexistent-foo 2>/dev/null)
assert_contains "$OUT_M" "NOT_FOUND" "not found"
assert_contains "$OUT_M" "nonexistent-foo" "shows input id"
test_pass "missing provider"

test_start "comma-separated"
OUT_C=$("$SCRIPT" openai,anthropic 2>/dev/null)
LINES=$(wc -l <<< "$OUT_C" | tr -d ' ')
if (( LINES < 3 )); then
    test_fail "comma count"
    echo "    Expected >=3 lines, got $LINES" >&2
else
    test_pass "comma-sep"
fi

test_start "exit 0"
assert_exit_code 0 "exit" "$SCRIPT" openai
test_pass "exit 0"

summary
