# lib.sh — Shared config and helpers for model-picker scripts
# Source: source "$(dirname "$0")/lib.sh"
# shellcheck disable=SC2034,SC2317

MODELS_URL="https://models.dev/models.json"
API_URL="https://models.dev/api.json"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/model-picker"
TTL=3600

fetch_json() {
    local url="$1" name="$2"
    local cache_file="$CACHE_DIR/$name"
    mkdir -p "$CACHE_DIR"

    if [[ "$NOCACHE" == false && -f "$cache_file" ]]; then
        local mtime
        mtime=$(stat -f %m "$cache_file" 2>/dev/null || echo 0)
        local now
        now=$(date +%s)
        if (( (now - mtime) < TTL )); then
            cat "$cache_file"
            return
        fi
    fi

    curl -sSf "$url" -o "$cache_file" 2>/dev/null || {
        if [[ -f "$cache_file" ]]; then
            cat "$cache_file"
            return
        fi
        echo "Error: failed to fetch $url" >&2
        exit 1
    }
    cat "$cache_file"
}

build_jq_filter() {
    local expr="$1"
    local field op value jq_field jq_value jq_op

    if [[ "$expr" =~ ^([a-zA-Z_.]+)([><!=]+)(.+)$ ]]; then
        field="${BASH_REMATCH[1]}"
        op="${BASH_REMATCH[2]}"
        value="${BASH_REMATCH[3]}"
    else
        echo "Invalid filter: $expr (expected field=value)" >&2
        return 1
    fi

    case "$field" in
        context) jq_field=".value.limit.context" ;;
        input)   jq_field=".value.limit.input" ;;
        output)  jq_field=".value.limit.output" ;;
        *)       jq_field=".value.$field" ;;
    esac

    if [[ "$value" == "true" || "$value" == "false" ]]; then
        jq_value="$value"
    elif [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        jq_value="$value"
    else
        jq_value="\"$value\""
    fi

    case "$op" in
        "=")  jq_op="==" ;;
        "!=") jq_op="!=" ;;
        ">"|">="|"<"|"<=") jq_op="$op" ;;
        *) echo "Unknown operator: $op" >&2; return 1 ;;
    esac

    echo "select($jq_field $jq_op $jq_value)"
}

list_models_tsv() {
    local jq_filter="$1"
    local jq_prog
    local models_json
    models_json=$(fetch_json "$MODELS_URL" "models.json")

    if [[ -n "$jq_filter" ]]; then
        jq_prog="to_entries[] | $jq_filter | [.key, .value.name, (.value.family // \"-\"), (.value.limit.context // \"-\" | tostring), (.value.reasoning // false | tostring), (.value.tool_call // false | tostring), (.value.knowledge // \"-\")] | @tsv"
    else
        jq_prog="to_entries[] | [.key, .value.name, (.value.family // \"-\"), (.value.limit.context // \"-\" | tostring), (.value.reasoning // false | tostring), (.value.tool_call // false | tostring), (.value.knowledge // \"-\")] | @tsv"
    fi

    echo "$models_json" | jq -r "$jq_prog"
}
