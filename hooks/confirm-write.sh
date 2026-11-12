#!/bin/sh
# Every Mirror write needs the user's own click, even if tools are auto-approved.
cat <<'JSON'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "ask",
    "permissionDecisionReason": "This will SAVE a change in Mirror ERP. Check the preview above before allowing."
  }
}
JSON
