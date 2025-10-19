#!/usr/bin/env bash
set -euo pipefail

# Defaults (override via env if needed)
BASE="${BASE:-http://localhost:8080/FROST-Server/v1.1}"
USER=""
PASS=""

usage() {
  echo "Usage: $0 <LOCATION_ID> <NEW_LON> <NEW_LAT>"
  echo "Example: $0 123 174.5000 -36.7700"
  echo "Env vars: BASE=${BASE}  USER=${USER}  PASS=<hidden>"
  exit 1
}

[[ $# -eq 3 ]] || usage

LID="$1"
NEW_LON="$2"
NEW_LAT="$3"

# Build JSON payload (coordinates are [lon, lat])
PAYLOAD=$(cat <<EOF
{"location":{"type":"Point","coordinates":[${NEW_LON},${NEW_LAT}]}}
EOF
)

# Do the PATCH
TMP_RESP="$(mktemp)"
HTTP_CODE=$(
  curl -sS -o "$TMP_RESP" -w "%{http_code}" \
    -X PATCH \
    -H "Content-Type: application/json" \
    -H "If-Match: *" \
    -u "${USER}:${PASS}" \
    -d "${PAYLOAD}" \
    "${BASE}/Locations(${LID})"
)

echo "HTTP ${HTTP_CODE}"
cat "$TMP_RESP" || true
rm -f "$TMP_RESP"

# Success codes are typically 200 (OK) or 204 (No Content)
if [[ "$HTTP_CODE" != "200" && "$HTTP_CODE" != "204" ]]; then
  echo "Patch failed. Check the Location id and credentials." >&2
  exit 1
fi

