#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

actual_skills() {
  find skills -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
}

extract_bullets_between() {
  local file="$1"
  local start_regex="$2"
  local end_regex="$3"

  awk -v start="$start_regex" -v end="$end_regex" '
    $0 ~ start { in_block=1; next }
    in_block && $0 ~ end { exit }
    in_block && /^- `/ {
      line=$0
      sub(/^- `/, "", line)
      sub(/`.*/, "", line)
      print line
    }
  ' "$file" | sort
}

check_markdown_links() {
  local file="$1"
  local target resolved
  while IFS= read -r target; do
    case "$target" in
      http://*|https://*|mailto:*|\#*) continue ;;
    esac

    resolved="$(dirname "$file")/$target"
    if [[ ! -e "$resolved" ]]; then
      fail "$file references missing path: $target"
    fi
  done < <(grep -oE '\[[^]]+\]\(([^)]+)\)' "$file" | sed -E 's/.*\(([^)]+)\)/\1/' || true)
}

echo "Checking local markdown links..."
while IFS= read -r file; do
  check_markdown_links "$file"
done < <(printf '%s\n' README.md && find docs -type f -name '*.md' | sort)

echo "Checking implemented skill structure..."
mapfile -t skills < <(actual_skills)
[[ "${#skills[@]}" -gt 0 ]] || fail "No skill directories found under skills/"

for skill in "${skills[@]}"; do
  skill_dir="skills/$skill"
  [[ -f "$skill_dir/SKILL.md" ]] || fail "$skill_dir is missing SKILL.md"
  [[ -d "$skill_dir/references" ]] || fail "$skill_dir is missing references/"

  while IFS= read -r ref_path; do
    [[ -e "$skill_dir/$ref_path" ]] || fail "$skill_dir/SKILL.md mentions missing path: $ref_path"
  done < <(grep -oE 'references/[^` )]+' "$skill_dir/SKILL.md" | sort -u)
done

echo "Checking implemented-skill snapshots..."
actual_list="$(printf '%s\n' "${skills[@]}")"

conversion_list="$(extract_bullets_between docs/CONVERSION_PLAN.md '^Current implemented skills in this repo:$' '^Current truth-source note:$')"
[[ "$conversion_list" == "$actual_list" ]] || fail "docs/CONVERSION_PLAN.md implemented skill snapshot is out of sync with skills/"

matrix_list="$(extract_bullets_between docs/SKILL_MATRIX.md '^Implemented in this repo today:$' '^Notes:$')"
[[ "$matrix_list" == "$actual_list" ]] || fail "docs/SKILL_MATRIX.md current implementation snapshot is out of sync with skills/"

table_rows="$(awk '
  /^### Per-skill readiness$/ { in_table=1; next }
  in_table && /^## / { exit }
  in_table && /^\| `[^`]+` \|/ { print }
' docs/IMPLEMENTATION_INVENTORY.md | wc -l | tr -d ' ')"
[[ "$table_rows" == "${#skills[@]}" ]] || fail "docs/IMPLEMENTATION_INVENTORY.md readiness table row count ($table_rows) does not match skills/ count (${#skills[@]})"

echo "Checking documented skill counts..."
inventory_count="$(grep -oE '\*\*[0-9]+ implemented skills\*\*' docs/IMPLEMENTATION_INVENTORY.md | grep -oE '[0-9]+')"
[[ "$inventory_count" == "${#skills[@]}" ]] || fail "docs/IMPLEMENTATION_INVENTORY.md implemented count ($inventory_count) does not match skills/ count (${#skills[@]})"

echo "validate-docs.sh: OK"
