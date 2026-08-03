#!/usr/bin/env bash
# check-provider.sh - Check if provider(s) exist in models.dev dataset
# Usage: check-provider.sh [--no-cache] <provider-id> [provider-id ...]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

NOCACHE=false
PROVIDERS=()

usage() {
    cat <<'USAGE'
Usage: check-provider.sh [--no-cache] <provider-id> [provider-id ...]

Check whether provider(s) exist in the models.dev dataset.

Output: compact TSV table — PROVIDER, STATUS (FOUND/NOT_FOUND), NAME, MODELS

Examples:
  check-provider.sh openai
  check-provider.sh openai anthropic nonexistent
  check-provider.sh openai,github-copilot
  check-provider.sh --no-cache openai
USAGE
    exit 0
}

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help) usage ;;
        --no-cache) NOCACHE=true; shift ;;
        -*) echo "Unknown: $1" >&2; exit 1 ;;
        *)
            IFS=',' read -ra PARTS <<< "$1"
            PROVIDERS+=("${PARTS[@]}")
            shift ;;
    esac
done

if [[ ${#PROVIDERS[@]} -eq 0 ]]; then
    echo "Error: at least one provider ID required" >&2
    exit 1
fi

api_json=$(fetch_json "$API_URL" "api.json")

# Check each provider
printf "PROVIDER\tSTATUS\tNAME\tMODELS\n"
for pid in "${PROVIDERS[@]}"; do
    jq -r --arg id "$pid" '
        .[$id] as $p
        | if $p then $id + "\tFOUND\t" + $p.name + "\t" + ($p.models | length | tostring)
          else $id + "\tNOT_FOUND\t-\t-"
          end
    ' <<< "$api_json"
done
