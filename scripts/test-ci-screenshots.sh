#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
workspace="$(mktemp -d)"
trap 'rm -rf "$workspace"' EXIT
mkdir -p "$workspace/bin" "$workspace/run"

cat > "$workspace/bin/adb" <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *" get-state") echo device ;;
  *" shell getprop sys.boot_completed") echo 1 ;;
esac
EOF

cat > "$workspace/bin/timeout" <<'EOF'
#!/usr/bin/env bash
while [[ "${1:-}" == --* ]]; do shift; done
shift # discard the duration and execute the mocked flutter command
exec "$@"
EOF

cat > "$workspace/bin/flutter" <<'EOF'
#!/usr/bin/env bash
attempt=0
[[ ! -f "$MOCK_ATTEMPT_FILE" ]] || read -r attempt < "$MOCK_ATTEMPT_FILE"
attempt=$((attempt + 1))
printf '%s\n' "$attempt" > "$MOCK_ATTEMPT_FILE"

if [[ "$MOCK_MODE" == 'assertion' ]]; then
  echo 'Screenshot test assertion failed'
  exit 1
fi
if [[ "$MOCK_MODE" == 'offline' || "$attempt" -lt 3 ]]; then
  echo 'Service has disappeared'
  exit 1
fi

mkdir -p fastlane/metadata/android/en-US/images/phoneScreenshots
for number in {1..8}; do
  printf 'mock screenshot %s\n' "$number" > "fastlane/metadata/android/en-US/images/phoneScreenshots/${number}_en-US.png"
done
echo 'All tests passed!'
EOF
chmod +x "$workspace/bin/adb" "$workspace/bin/timeout" "$workspace/bin/flutter"

run_case() {
  local mode="$1"
  local expected_status="$2"
  local expected_attempts="$3"
  local status=0
  rm -f "$workspace/attempt-count"
  rm -rf "$workspace/run/fastlane"
  (
    cd "$workspace/run"
    PATH="$workspace/bin:$PATH" \
      FITBOOK_DEVICE_TYPE=phoneScreenshots \
      EMULATOR_PORT=5554 \
      MOCK_MODE="$mode" \
      MOCK_ATTEMPT_FILE="$workspace/attempt-count" \
      SCREENSHOT_DRIVE_TIMEOUT=1m \
      SCREENSHOT_DRIVE_ATTEMPTS=3 \
      SCREENSHOT_SCREEN_SIZE='' \
      bash "$repo_root/scripts/ci-screenshots.sh"
  ) > "$workspace/$mode.log" 2>&1 || status=$?

  if [[ "$status" -ne "$expected_status" ]] ||
     [[ "$(cat "$workspace/attempt-count")" -ne "$expected_attempts" ]]; then
    cat "$workspace/$mode.log" >&2
    echo "Unexpected result for $mode: status=$status, attempts=$(cat "$workspace/attempt-count")" >&2
    exit 1
  fi
}

run_case recovered 0 3
run_case assertion 1 1
run_case offline 1 3

echo 'Screenshot transport retries recover after two transient failures, fail fast on assertions, and remain bounded.'
