#!/bin/bash
INDEX="wiki/index.md"
LOG="wiki/log.md"

echo "=== wiki-wonka: context restored after compaction ==="
echo ""

if [ -f "$INDEX" ]; then
  echo "--- current index ---"
  cat "$INDEX"
  echo ""
fi

if [ -f "$LOG" ]; then
  echo "--- last 5 log entries ---"
  grep -A3 "^## \[" "$LOG" | head -25
fi
exit 0