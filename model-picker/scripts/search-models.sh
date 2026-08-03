#!/usr/bin/env bash
# search-models.sh — Search models by id/name/description
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

NOCACHE=false; TERM=""
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) cat <<'USAGE'
Usage: search-models.sh [--no-cache] <term>

Search models by id, name, or description (case-insensitive).
USAGE
exit 0 ;; --no-cache) NOCACHE=true; shift ;; -*) echo "Unknown: $1" >&2; exit 1 ;; *) TERM="$1"; shift ;; esac
done

if [[ -z "$TERM" ]]; then echo "Error: search term required" >&2; exit 1; fi

printf "MODEL_ID\tNAME\tFAMILY\tCONTEXT\tREASONING\tTOOLS\tKNOWLEDGE\n"
models_json=$(fetch_json "$MODELS_URL" "models.json")
echo "$models_json" | jq -r --arg q "$TERM" '
    to_entries[]
    | select((.key | test($q; "i")) or (.value.name | test($q; "i")) or (.value.description // "" | test($q; "i")))
    | [.key, .value.name, (.value.family // "-"), (.value.limit.context // "-" | tostring),
       (.value.reasoning // false | tostring), (.value.tool_call // false | tostring), (.value.knowledge // "-")]
    | @tsv
'
