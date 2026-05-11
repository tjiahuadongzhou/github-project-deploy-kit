#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

failures=0

check_file() {
  local path="$1"
  if [[ -f "${path}" ]]; then
    echo "OK   ${path}"
  else
    echo "MISS ${path}"
    failures=$((failures + 1))
  fi
}

check_dir() {
  local path="$1"
  if [[ -d "${path}" ]]; then
    echo "OK   ${path}"
  else
    echo "MISS ${path}"
    failures=$((failures + 1))
  fi
}

check_dir "${KIT_ROOT}/.claude/agents"
check_dir "${KIT_ROOT}/.claude/skills"

check_file "${KIT_ROOT}/.claude/agents/build-error-resolver.md"
check_file "${KIT_ROOT}/.claude/agents/code-reviewer.md"
check_file "${KIT_ROOT}/.claude/agents/security-reviewer.md"
check_file "${KIT_ROOT}/.claude/agents/python-reviewer.md"

check_dir "${KIT_ROOT}/.claude/skills/codebase-onboarding"
check_dir "${KIT_ROOT}/.claude/skills/code-tour"
check_dir "${KIT_ROOT}/.claude/skills/documentation-lookup"

check_file "${KIT_ROOT}/.claude/skills/codebase-onboarding/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/code-tour/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/documentation-lookup/SKILL.md"

check_dir "${KIT_ROOT}/prompts"
check_file "${KIT_ROOT}/README.md"
check_file "${KIT_ROOT}/AGENTS.md"
check_file "${KIT_ROOT}/prompts/repo-learning-notes.md"
check_file "${KIT_ROOT}/prompts/repo-risk-check.md"
check_file "${KIT_ROOT}/scripts/update-from-ecc.sh"

if [[ "${failures}" -gt 0 ]]; then
  echo "工具包检查失败，共 ${failures} 项缺失。"
  exit 1
fi

echo "工具包检查通过。"
