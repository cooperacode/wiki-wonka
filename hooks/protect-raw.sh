#!/bin/bash
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ "$FILE" == raw/* ]]; then
  echo "Blocked: raw/ is immutable. Add sources manually — never via the agent." >&2
  exit 2
fi
exit 0