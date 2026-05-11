# AGENTS.md

## 本仓库用途

这是一个用于 Claude Code / Codex 的 GitHub 开源项目部署助手包。
仓库主要保存：

- 可复用的 `.claude/agents`
- 可复用的 `.claude/skills`
- 面向部署、学习和风险检查的中文提示词模板
- 用于安装和自检的辅助脚本

## 目录结构

```text
.claude/
  agents/
  skills/
prompts/
scripts/
examples/
THIRD_PARTY_LICENSES/
README.md
NOTICE.md
LICENSE
```

## 维护规则

1. 不要删除 `.claude/agents` 和 `.claude/skills`
2. 修改 `prompts/` 时保持中文清晰、步骤化、可直接复制使用
3. 修改 `scripts/` 后必须运行 `bash scripts/check-kit.sh`
4. 不要引入任何本机绝对路径
5. 保留 `NOTICE.md` 和 `THIRD_PARTY_LICENSES/`
6. 如果更新 ECC 内容，必须保留许可证和 attribution
7. 如果新增模板或脚本，优先同步更新 `README.md`
8. 不要在这个仓库中加入敏感信息、私钥、token 或本地环境特定路径

## Prompt 维护规则

1. 所有 prompt 必须中文清晰
2. 每个 prompt 都要写明用途
3. 面向小白的 prompt 必须要求英文术语翻译
4. Markdown 必须保持正常多行格式
5. 不要写入本机绝对路径
6. 修改 prompt 后必须运行 `bash scripts/check-kit.sh`
7. `prompts` 和 `skills` 要保持同步
8. 如果修改 `prompts/repo-deep-teacher.md`，也要同步修改 `.claude/skills/repo-deep-teacher/SKILL.md`
9. 新增高频 prompt 时，优先考虑是否也要新增 skill
10. 重型 skill 默认必须设置 `disable-model-invocation: true`
11. 提交前必须检查文件不是单行压缩格式

## PPT / UI Prompt 规则

1. 不要生成过度复杂的前端项目
2. 默认优先单文件 HTML
3. 所有英文术语必须带中文解释
4. 输出要适合小白学习
5. 不要安装依赖，除非用户明确要求
6. 不要修改被分析的原始 GitHub 项目源码

## 提交前检查

1. 修改 `scripts/` 后必须运行 `bash scripts/check-kit.sh`
2. 修改重型 prompt / skill 后，建议同时运行 `wc -l` 抽查关键文件行数
3. 如果发现文件被压成单行或极少几行，先修复格式再提交

## 更新 ECC 内容

默认 ECC 路径是：

```text
~/projects/everything-claude-code
```

如果要同步最新的 agents / skills，优先使用：

```bash
bash scripts/update-from-ecc.sh
```

运行后要再次执行：

```bash
bash scripts/check-kit.sh
```
