#!/bin/bash
# LOG hook — records every terraform command to the deploy log

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "terraform (apply|destroy|plan|init|validate)"; then
  ACTION=$(echo "$CMD" | grep -oE "terraform (apply|destroy|plan|init|validate)")
  echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] $ACTION executed — full command: $CMD" >> .claude/deploy.log
fi