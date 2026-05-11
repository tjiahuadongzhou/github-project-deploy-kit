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
