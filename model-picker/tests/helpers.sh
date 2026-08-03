# helpers.sh — shared test functions for model-picker tests
# Source at the top of each test file

PASS=0
FAIL=0
FAILED_TESTS=()

green() { printf '\033[32m%s\033[0m\n' "$1"; }
red()   { printf '\033[31m%s\033[0m\n' "$1"; }
bold()  { printf '\033[1m%s\033[0m\n' "$1"; }

test_start() { printf '  %s ... ' "$1"; }
test_pass()  { green 'PASS'; ((PASS++)) || true; }
test_fail()  { red 'FAIL'; ((FAIL++)) || true; FAILED_TESTS+=("$1"); }

assert_exit_code() {
    local expected=$1 desc=$2
    shift 2
    local actual=0
    "$@" >/dev/null 2>&1 || actual=$?
    if [[ "$actual" != "$expected" ]]; then
        test_fail "$desc"
        echo "    Expected exit $expected, got $actual ($*)" >&2
        return 1
    fi
    return 0
}

assert_contains() {
    local output=$1 pattern=$2 desc=$3
    if ! grep -q -F -- "$pattern" <<< "$output" 2>/dev/null; then
        test_fail "$desc"
        echo "    Missing pattern: $pattern" >&2
        return 1
    fi
    return 0
}

assert_not_empty() {
    local output=$1 desc=$2
    if [[ -z "$output" || "$output" =~ ^[[:space:]]*$ ]]; then
        test_fail "$desc"
        echo "    Output is empty" >&2
        return 1
    fi
    return 0
}

assert_line_count_ge() {
    local output=$1 min=$2 desc=$3
    local count
    count=$(wc -l <<< "$output" | tr -d ' ')
    if (( count < min )); then
        test_fail "$desc"
        echo "    Expected >=$min lines, got $count" >&2
        return 1
    fi
    return 0
}

assert_valid_json() {
    local output=$1 desc=$2
    if ! jq . >/dev/null 2>&1 <<< "$output"; then
        test_fail "$desc"
        echo "    Invalid JSON" >&2
        return 1
    fi
    return 0
}

summary() {
    echo ""
    bold "=== Summary ==="
    echo "  Total: $((PASS + FAIL))  Passed: $(green "$PASS")  Failed: $(red "$FAIL")"
    if (( FAIL > 0 )); then
        echo "  Failed tests:"
        for t in "${FAILED_TESTS[@]}"; do
            echo "    - $t"
        done
        exit 1
    fi
    echo "  All tests passed."
}
