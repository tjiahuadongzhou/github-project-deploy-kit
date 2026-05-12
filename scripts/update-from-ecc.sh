#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ECC_ROOT="${ECC_ROOT:-$HOME/projects/everything-claude-code}"

backup_path() {
  local path="$1"
  local backup="${path}.bak"

  if [[ -e "${backup}" ]]; then
    backup="${path}.bak.$(date +%Y%m%d%H%M%S)"
  fi

  mv "${path}" "${backup}"
  echo "已备份: ${path} -> ${backup}"
}

replace_entry() {
  local source_path="$1"
  local target_path="$2"

  if [[ -e "${target_path}" ]]; then
    backup_path "${target_path}"
  fi

  cp -R "${source_path}" "${target_path}"
  echo "已更新: ${target_path}"
}

if [[ ! -d "${ECC_ROOT}" ]]; then
  echo "未找到 ECC 仓库: ${ECC_ROOT}" >&2
  echo "请先执行：" >&2
  echo "git clone https://github.com/affaan-m/everything-claude-code \"${ECC_ROOT}\"" >&2
  exit 1
fi

mkdir -p "${KIT_ROOT}/.claude/agents" "${KIT_ROOT}/.claude/skills"

agents=(
  "build-error-resolver.md"
  "code-reviewer.md"
  "security-reviewer.md"
  "python-reviewer.md"
)

skills=(
  "codebase-onboarding"
  "code-tour"
  "documentation-lookup"
)

for agent_name in "${agents[@]}"; do
  source_path="${ECC_ROOT}/agents/${agent_name}"
  target_path="${KIT_ROOT}/.claude/agents/${agent_name}"

  if [[ ! -f "${source_path}" ]]; then
    echo "缺少 ECC agent 文件: ${source_path}" >&2
    exit 1
  fi

  replace_entry "${source_path}" "${target_path}"
done

for skill_name in "${skills[@]}"; do
  source_path="${ECC_ROOT}/skills/${skill_name}"
  target_path="${KIT_ROOT}/.claude/skills/${skill_name}"

  if [[ ! -d "${source_path}" ]]; then
    echo "缺少 ECC skill 目录: ${source_path}" >&2
    exit 1
  fi

  replace_entry "${source_path}" "${target_path}"
done

echo "开始运行工具包自检..."
bash "${KIT_ROOT}/scripts/check-kit.sh"
echo "ECC 内容更新完成。"
echo "提示：脚本不会自动 git commit，请在检查 diff 后手动提交。"
