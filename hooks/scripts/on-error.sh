#!/usr/bin/env bash
set -euo pipefail
INPUT=$(cat)
mkdir -p .gitagent
printf '%s\n' "$INPUT" >> .gitagent/errors.log
echo '{"action": "allow", "modifications": null}'
