#!/usr/bin/env bash
# provider-detail.sh — Show provider details (api, env, models, pricing)
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

PROVIDERS=(); NOCACHE=false
usage() { cat <<'USAGE'
Usage: provider-detail.sh [--no-cache] <provider-id> [provider-id ...]

Show provider details including models with pricing.
Multiple providers: space or comma-separated.
USAGE
exit 0; }
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) usage ;; --no-cache) NOCACHE=true; shift ;;
        -*) echo "Unknown: $1" >&2; exit 1 ;;
        *) IFS=',' read -ra PARTS <<< "$1"; PROVIDERS+=("${PARTS[@]}"); shift ;; esac
done
if [[ ${#PROVIDERS[@]} -eq 0 ]]; then echo "Error: provider ID required" >&2; exit 1; fi

api_json=$(fetch_json "$API_URL" "api.json")
for pid in "${PROVIDERS[@]}"; do
    echo "$api_json" | jq --arg id "$pid" '
        .[$id] as $p
        | if $p == null then {"error": "Provider not found: \($id)"}
          else $p | {id, name, api, env, npm, doc} + {
            models: [$p.models | to_entries[] | {id: .key, name: .value.name, cost: .value.cost}]
          } end
    '
done
