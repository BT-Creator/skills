#!/usr/bin/env bash
# test-models-of.sh — tests for models-of.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/models-of.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]] || \
   [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/api.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache openai >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "models-of.sh"

test_start "openai has provider + pricing + capabilities"
OUT=$("$SCRIPT" openai 2>/dev/null)
assert_contains "$OUT" "--- openai ---" "header"
assert_contains "$OUT" "COST_IN" "pricing"
assert_contains "$OUT" "MODEL_ID" "capabilities"
assert_contains "$OUT" "openai/gpt" "models"
test_pass "output"

test_start "multi"
OUT_M=$("$SCRIPT" openai,github-copilot 2>/dev/null)
assert_contains "$OUT_M" "--- openai ---" "multi openai"
assert_contains "$OUT_M" "--- github-copilot ---" "multi github"
test_pass "multi"

test_start "fails without arg"
assert_exit_code 1 "noarg" "$SCRIPT"
test_pass "no arg error"

summary
