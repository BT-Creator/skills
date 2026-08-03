#!/usr/bin/env bash
# test-model-detail.sh — tests for model-detail.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/model-detail.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/models.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    bash "$(cd "$SCRIPT_DIR/.." && pwd)/scripts/list-models.sh" --no-cache >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "model-detail.sh"

test_start "returns valid JSON"
OUT=$("$SCRIPT" anthropic/claude-sonnet-5 2>/dev/null)
assert_valid_json "$OUT" "json"
ID=$(jq -r '.id' <<< "$OUT")
if [[ "$ID" != "anthropic/claude-sonnet-5" ]]; then
    test_fail ".id"
    echo "    Expected anthropic/claude-sonnet-5, got $ID" >&2
else
    test_pass "valid model detail"
fi

test_start "multi"
OUT_M=$("$SCRIPT" anthropic/claude-sonnet-5 openai/gpt-5 2>/dev/null)
CT=$(jq -s 'length' <<< "$OUT_M")
if (( CT != 2 )); then test_fail "multi"; else test_pass "multi"; fi

test_start "fails without arg"
assert_exit_code 1 "noarg" "$SCRIPT"
test_pass "no arg error"

summary
