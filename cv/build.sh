#!/usr/bin/env bash
# Render cv/cv.html to CV-Tim-Hewitt.pdf in the repo root.
# Usage: ./cv/build.sh
set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/cv/cv.html"
OUT="$ROOT/CV-Tim-Hewitt.pdf"

[ -x "$CHROME" ] || { echo "Google Chrome not found at $CHROME" >&2; exit 1; }

# --virtual-time-budget gives the webfonts time to load before the PDF is captured.
"$CHROME" \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --virtual-time-budget=10000 \
  --print-to-pdf="$OUT" \
  "file://$SRC" 2>/dev/null

echo "Wrote $OUT"
