#!/usr/bin/env bash
# list-models.sh — List all models from models.dev
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

NOCACHE=false
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) cat <<'USAGE'
Usage: list-models.sh [--no-cache]

List all models from models.dev. Output: TSV table.
USAGE
exit 0 ;; --no-cache) NOCACHE=true; shift ;; -*) echo "Unknown: $1" >&2; exit 1 ;; esac
done

printf "MODEL_ID\tNAME\tFAMILY\tCONTEXT\tREASONING\tTOOLS\tKNOWLEDGE\n"
list_models_tsv ""
