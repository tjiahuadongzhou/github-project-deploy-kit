#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_DIR="$(pwd)"

if [[ ! -d "${TARGET_DIR}" ]]; then
  echo "当前目录不存在: ${TARGET_DIR}" >&2
  exit 1
fi

if [[ ! -d "${KIT_ROOT}/.claude/agents" || ! -d "${KIT_ROOT}/.claude/skills" ]]; then
  echo "工具包内容不完整，缺少 .claude/agents 或 .claude/skills" >&2
  exit 1
fi

mkdir -p "${TARGET_DIR}/.claude/agents"
mkdir -p "${TARGET_DIR}/.claude/skills"

backup_path() {
  local path="$1"
  local backup="${path}.bak"

  if [[ -e "${backup}" ]]; then
    backup="${path}.bak.$(date +%Y%m%d%H%M%S)"
  fi

  mv "${path}" "${backup}"
  echo "已备份: ${path} -> ${backup}"
}

install_entry() {
  local source_path="$1"
  local target_path="$2"

  if [[ -e "${target_path}" ]]; then
    backup_path "${target_path}"
  fi

  cp -R "${source_path}" "${target_path}"
  echo "已安装: ${target_path}"
}

for agent_file in "${KIT_ROOT}/.claude/agents/"*.md; do
  agent_name="$(basename "${agent_file}")"
  install_entry "${agent_file}" "${TARGET_DIR}/.claude/agents/${agent_name}"
done

for skill_dir in "${KIT_ROOT}/.claude/skills/"*; do
  skill_name="$(basename "${skill_dir}")"
  install_entry "${skill_dir}" "${TARGET_DIR}/.claude/skills/${skill_name}"
done

echo "安装完成。"
echo "目标目录: ${TARGET_DIR}"
echo "已复制 .claude/agents 和 .claude/skills，原有同名内容已备份为 .bak。"
