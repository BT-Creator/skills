#!/usr/bin/env bash
# filter-models.sh — Filter models by field criteria
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$SCRIPT_DIR/assets/lib.sh"

FILTERS=(); NOCACHE=false
usage() { cat <<'USAGE'
Usage: filter-models.sh [--no-cache] -f <field=value> [-f ...]

Filter models by field. Operators: = != >= <=
Fields: reasoning, family, tool_call, context, input, output, or any model key
Examples:
  filter-models.sh -f reasoning=true
  filter-models.sh -f family=qwen -f "context>=1000000"
USAGE
exit 0; }
while [[ $# -gt 0 ]]; do
    case "$1" in -h|--help) usage ;; -f|--filter) FILTERS+=("$2"); shift 2 ;; --no-cache) NOCACHE=true; shift ;; -*) echo "Unknown: $1" >&2; exit 1 ;; *) echo "Unknown arg: $1" >&2; exit 1 ;; esac
done
if [[ ${#FILTERS[@]} -eq 0 ]]; then echo "Error: at least one -f required" >&2; exit 1; fi

chain=""
for expr in "${FILTERS[@]}"; do
    s=$(build_jq_filter "$expr") || exit 1
    [[ -n "$chain" ]] && chain+=" | "
    chain+="$s"
done

printf "MODEL_ID\tNAME\tFAMILY\tCONTEXT\tREASONING\tTOOLS\tKNOWLEDGE\n"
list_models_tsv "$chain"
