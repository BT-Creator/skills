#!/usr/bin/env bash
# models-of.sh — Combined view: provider info + pricing + model capabilities
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

PROVIDERS=(); NOCACHE=false
usage() { cat <<'USAGE'
Usage: models-of.sh [--no-cache] <provider-id> [provider-id ...]

Show provider info + pricing + model capabilities for 1+ providers.
Works for direct providers (openai, anthropic, etc.), not resellers (github-copilot).
USAGE
exit 0; }
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) usage ;; --no-cache) NOCACHE=true; shift ;;
        -*) echo "Unknown: $1" >&2; exit 1 ;;
        *) IFS=',' read -ra PARTS <<< "$1"; PROVIDERS+=("${PARTS[@]}"); shift ;; esac
done
if [[ ${#PROVIDERS[@]} -eq 0 ]]; then echo "Error: provider ID required" >&2; exit 1; fi

api_json=$(fetch_json "$API_URL" "api.json")
models_json=$(fetch_json "$MODELS_URL" "models.json")

for prefix in "${PROVIDERS[@]}"; do
    echo "$api_json" | jq -r --arg id "$prefix" '
        .[$id] as $p
        | if $p then "--- " + $id + " ---\nAPI: " + ($p.api // "n/a") + "  ENV: " + ($p.env[0] // "n/a") + "  Models: " + ($p.models | length | tostring)
          else "--- " + $id + " (provider not found) ---" end
    '
    echo "$api_json" | jq -r --arg id "$prefix" '
        .[$id].models | to_entries[]
        | [.key, .value.name, (.value.cost.input // "-" | tostring), (.value.cost.output // "-" | tostring)]
        | @tsv
    ' 2>/dev/null | awk 'BEGIN{printf "  MODEL\tNAME\tCOST_IN\tCOST_OUT\n"}{print "  " $0}'
    echo ""
done

select_cond=""
for prefix in "${PROVIDERS[@]}"; do
    [[ -n "$select_cond" ]] && select_cond+=" or "
    select_cond+="(.key | startswith(\"$prefix/\"))"
done

printf "MODEL_ID\tNAME\tFAMILY\tCONTEXT\tREASONING\tTOOLS\tKNOWLEDGE\n"
echo "$models_json" | jq -r '
    [to_entries[] | select('"$select_cond"')]
    | sort_by(.key)[]
    | [.key, .value.name, (.value.family // "-"), (.value.limit.context // "-" | tostring),
       (.value.reasoning // false | tostring), (.value.tool_call // false | tostring), (.value.knowledge // "-")]
    | @tsv
'
