#!/usr/bin/env bash
# list-providers.sh — List all providers from models.dev
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

NOCACHE=false
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) cat <<'USAGE'
Usage: list-providers.sh [--no-cache]

List all providers from models.dev. Output: TSV table.
USAGE
exit 0 ;; --no-cache) NOCACHE=true; shift ;; -*) echo "Unknown: $1" >&2; exit 1 ;; esac
done

printf "PROVIDER\tNAME\tMODELS\tAPI\tENV\n"
fetch_json "$API_URL" "api.json" | jq -r '
    to_entries | sort_by(.key) | .[]
    | [.key, .value.name, (.value.models | length | tostring), (.value.api // "-"), (.value.env[0] // "-")]
    | @tsv
'
