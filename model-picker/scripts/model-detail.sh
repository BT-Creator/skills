#!/usr/bin/env bash
# model-detail.sh — Show full model details by ID
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

MODELS=(); NOCACHE=false
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) cat <<'USAGE'
Usage: model-detail.sh [--no-cache] <model-id> [model-id ...]

Show full JSON details for one or more models.
USAGE
exit 0 ;; --no-cache) NOCACHE=true; shift ;; -*) echo "Unknown: $1" >&2; exit 1 ;; *) MODELS+=("$1"); shift ;; esac
done
if [[ ${#MODELS[@]} -eq 0 ]]; then echo "Error: model ID required" >&2; exit 1; fi

models_json=$(fetch_json "$MODELS_URL" "models.json")
for id in "${MODELS[@]}"; do
    echo "$models_json" | jq --arg id "$id" '.[$id] // {"error": "Model not found: \($id)"}'
done
