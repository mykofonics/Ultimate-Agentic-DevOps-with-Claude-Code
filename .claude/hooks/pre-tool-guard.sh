#!/bin/bash
# DO hook — blocks dangerous Bash commands before they execute

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "clear all|clean all|erase all|tear down|clear|destroy|terraform destroy|terraform apply.*-auto-approve|aws s3 rm|aws s3 rb"; then
  echo '{"decision": "block", "reason": "Destructive command detected. Use /tf-destroy or /tf-apply commands for safety."}'
fi
