#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

failures=0

check_contains() {
  local path="$1"
  local pattern="$2"

  if grep -Fq "${pattern}" "${path}"; then
    echo "OK   ${path} contains ${pattern}"
  else
    echo "MISS ${path} missing ${pattern}"
    failures=$((failures + 1))
  fi
}

check_min_lines() {
  local path="$1"
  local min_lines="$2"
  local line_count

  line_count="$(wc -l < "${path}")"

  if [[ "${line_count}" -gt "${min_lines}" ]]; then
    echo "OK   ${path} has ${line_count} lines"
  else
    echo "MISS ${path} has only ${line_count} lines; 文件可能被压缩成单行"
    failures=$((failures + 1))
  fi
}

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
check_dir "${KIT_ROOT}/.claude/skills/repo-overview-teacher"
check_dir "${KIT_ROOT}/.claude/skills/repo-deep-teacher"
check_dir "${KIT_ROOT}/.claude/skills/repo-md-explainer"
check_dir "${KIT_ROOT}/.claude/skills/repo-web-ppt-builder"
check_dir "${KIT_ROOT}/.claude/skills/repo-risk-check"
check_dir "${KIT_ROOT}/.claude/skills/deploy-any-github-project"

check_file "${KIT_ROOT}/.claude/skills/codebase-onboarding/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/code-tour/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/documentation-lookup/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/repo-overview-teacher/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/repo-deep-teacher/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/repo-md-explainer/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/repo-web-ppt-builder/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/repo-risk-check/SKILL.md"
check_file "${KIT_ROOT}/.claude/skills/deploy-any-github-project/SKILL.md"

check_dir "${KIT_ROOT}/prompts"
check_file "${KIT_ROOT}/README.md"
check_file "${KIT_ROOT}/AGENTS.md"
check_file "${KIT_ROOT}/prompts/repo-learning-notes.md"
check_file "${KIT_ROOT}/prompts/repo-risk-check.md"
check_file "${KIT_ROOT}/prompts/repo-overview-teacher.md"
check_file "${KIT_ROOT}/prompts/repo-deep-teacher.md"
check_file "${KIT_ROOT}/prompts/repo-md-explainer.md"
check_file "${KIT_ROOT}/prompts/repo-web-ppt-builder.md"
check_file "${KIT_ROOT}/prompts/repo-slidev-builder.md"
check_file "${KIT_ROOT}/scripts/update-from-ecc.sh"

check_contains "${KIT_ROOT}/.claude/skills/repo-overview-teacher/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/repo-overview-teacher/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/repo-overview-teacher/SKILL.md" "disable-model-invocation: true"

check_contains "${KIT_ROOT}/.claude/skills/repo-deep-teacher/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/repo-deep-teacher/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/repo-deep-teacher/SKILL.md" "disable-model-invocation: true"

check_contains "${KIT_ROOT}/.claude/skills/repo-md-explainer/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/repo-md-explainer/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/repo-md-explainer/SKILL.md" "disable-model-invocation: true"

check_contains "${KIT_ROOT}/.claude/skills/repo-web-ppt-builder/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/repo-web-ppt-builder/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/repo-web-ppt-builder/SKILL.md" "disable-model-invocation: true"

check_contains "${KIT_ROOT}/.claude/skills/repo-risk-check/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/repo-risk-check/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/repo-risk-check/SKILL.md" "disable-model-invocation: true"

check_contains "${KIT_ROOT}/.claude/skills/deploy-any-github-project/SKILL.md" "name:"
check_contains "${KIT_ROOT}/.claude/skills/deploy-any-github-project/SKILL.md" "description:"
check_contains "${KIT_ROOT}/.claude/skills/deploy-any-github-project/SKILL.md" "disable-model-invocation: true"

check_min_lines "${KIT_ROOT}/README.md" 80
check_min_lines "${KIT_ROOT}/scripts/check-kit.sh" 40
check_min_lines "${KIT_ROOT}/prompts/repo-deep-teacher.md" 80
check_min_lines "${KIT_ROOT}/prompts/repo-web-ppt-builder.md" 40
check_min_lines "${KIT_ROOT}/.claude/skills/repo-deep-teacher/SKILL.md" 60

if [[ "${failures}" -gt 0 ]]; then
  echo "工具包检查失败，共 ${failures} 项缺失。"
  exit 1
fi

echo "工具包检查通过。"
