#!/usr/bin/env bash
# test-provider-detail.sh — tests for provider-detail.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

SCRIPT="$(cd "$SCRIPT_DIR/.." && pwd)/scripts/provider-detail.sh"

# Fetch data if no cache
if [[ ! -f "${XDG_CACHE_HOME:-$HOME/.cache}/model-picker/api.json" ]]; then
    echo "No cache found, fetching fresh data from models.dev..."
    "$SCRIPT" --no-cache openai >/dev/null 2>&1 || {
        echo "ERROR: Cannot fetch data from models.dev. Tests require network on first run." >&2
        exit 1
    }
fi

bold "provider-detail.sh"

test_start "openai returns valid JSON"
OUT=$("$SCRIPT" openai 2>/dev/null)
assert_valid_json "$OUT" "json"
ID=$(jq -r '.id' <<< "$OUT")
if [[ "$ID" != "openai" ]]; then
    test_fail ".id"
    echo "    Expected openai, got $ID" >&2
else
    test_pass "valid provider detail"
fi

test_start "multi comma-separated"
OUT_M=$("$SCRIPT" openai,anthropic 2>/dev/null)
assert_valid_json "$(jq -s '.[0]' <<< "$OUT_M")" "first json"
CT=$(jq -s 'length' <<< "$OUT_M")
if (( CT != 2 )); then
    test_fail "multi count"
    echo "    Expected 2, got $CT" >&2
else
    test_pass "multi provider detail"
fi

test_start "fails without arg"
assert_exit_code 1 "noarg" "$SCRIPT"
test_pass "no arg error"

summary
