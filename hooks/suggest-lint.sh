#!/bin/bash
LOG="wiki/log.md"
[ ! -f "$LOG" ] && exit 0

INGESTS_SINCE=$(awk '
  /^## \[.*\] lint/  { found=1 }
  !found && /^## \[.*\] ingest/ { count++ }
  END { print count+0 }
' "$LOG")

if [ "$INGESTS_SINCE" -ge 5 ]; then
  echo "wiki-wonka: $INGESTS_SINCE ingests since the last lint. Consider running /wiki-wonka:lint to keep the wiki healthy."
fi
exit 0