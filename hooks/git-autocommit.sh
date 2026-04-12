#!/bin/bash
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# only commit files inside wiki/
[[ "$FILE" != wiki/* ]] && exit 0

# skip navigation files — they are committed together with the page that triggered the write
[[ "$FILE" == "wiki/index.md" ]] && exit 0
[[ "$FILE" == "wiki/log.md" ]]   && exit 0

# verify this is a git repository
git -C "$CLAUDE_PROJECT_DIR" rev-parse --git-dir > /dev/null 2>&1 || exit 0

git -C "$CLAUDE_PROJECT_DIR" add "$FILE"
git -C "$CLAUDE_PROJECT_DIR" add wiki/index.md wiki/log.md 2>/dev/null
git -C "$CLAUDE_PROJECT_DIR" diff --cached --quiet && exit 0

# derive commit type from file path
TYPE="update"
[[ "$FILE" == wiki/sources/* ]] && TYPE="ingest"
[[ "$FILE" == wiki/concepts/* ]] && TYPE="concept"
[[ "$FILE" == wiki/entities/* ]] && TYPE="entity"

SLUG=$(basename "$FILE" .md)
git -C "$CLAUDE_PROJECT_DIR" commit -m "wiki($TYPE): $SLUG" --quiet
exit 0