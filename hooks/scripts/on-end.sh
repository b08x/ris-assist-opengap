#!/usr/bin/env bash
set -euo pipefail
INPUT=$(cat)
mkdir -p .gitagent
printf 'session ended %s\n' "$(date -u +%FT%TZ)" >> .gitagent/sessions.log
echo '{"action": "allow", "modifications": null}'
