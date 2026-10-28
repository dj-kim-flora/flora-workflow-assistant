#!/usr/bin/env bash
# Build one installable zip of the skill into deliverables/.
# Runs the leak scan first and refuses to zip if it finds anything.
set -euo pipefail
cd "$(dirname "$0")/.."
scripts/leak-scan.sh
NAME="flora-workflow-assistant"
rm -f "deliverables/$NAME.zip"
( cd skills && zip -rq "../deliverables/$NAME.zip" "$NAME" -x '*/PROFILE.md' '*/lessons.md' '*.DS_Store' )
echo "Built deliverables/$NAME.zip"
unzip -l "deliverables/$NAME.zip" | tail -n 3
