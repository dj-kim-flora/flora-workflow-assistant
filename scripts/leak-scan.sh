#!/usr/bin/env bash
# Scan the files that ship for internal names, ids and client details.
# Terms live in _work/leak-terms.txt (gitignored) so the list itself never ships.
# Usage: scripts/leak-scan.sh   (exit 1 if anything is found)
set -uo pipefail
cd "$(dirname "$0")/.."
TERMS="_work/leak-terms.txt"
[ -f "$TERMS" ] || { echo "Missing $TERMS (create it with one regex per line)"; exit 2; }
PATHS=()
for p in skills README.md tests; do [ -e "$p" ] && PATHS+=("$p"); done
hits=0
while IFS= read -r term; do
  [ -z "$term" ] && continue
  # the repo's own owner/name in its public URL is allowed; strip it before matching
  out=$(grep -rniE --exclude=PROFILE.md --exclude=lessons.md --exclude=.DS_Store -e "$term" "${PATHS[@]}" 2>/dev/null \
    | sed 's|github.com/dj-kim-flora/flora-workflow-assistant||g' | grep -iE -e "$term" || true)
  if [ -n "$out" ]; then echo "$out"; echo ">>> term: $term"; hits=1; fi
done < "$TERMS"
# The style rules forbid em and en dashes
dash=$(grep -rnP --exclude=.DS_Store '\x{2014}|\x{2013}' "${PATHS[@]}" 2>/dev/null || true)
if [ -n "$dash" ]; then echo "$dash"; echo ">>> em or en dash found"; hits=1; fi
if [ "$hits" = 0 ]; then echo "Leak scan clean."; else echo "Leak scan FOUND ISSUES."; exit 1; fi
