# GitHub Project Deploy Kit

中文名：GitHub 开源项目部署助手包

## 这个项目是做什么的？

这是一个面向 Claude Code / Codex 的辅助工具包，用于部署、理解、运行、讲解 GitHub 开源项目。

它把一组常用的 Agent、Skill、提示词模板和安装脚本整理到同一个仓库里，方便你以后遇到任何新的 GitHub 项目时，直接复制提示词并粘贴项目地址，让 Claude Code / Codex 按固定流程协助你完成部署。

它内置以下能力：

- `build-error-resolver` = 构建错误修复员
- `code-reviewer` = 通用代码审查员
- `security-reviewer` = 安全审查员
- `python-reviewer` = Python 审查员
- `codebase-onboarding` = 代码库入门技能
- `code-tour` = 代码导览技能
- `documentation-lookup` = 文档查找技能

## 适合什么场景？

- 我看到一个 GitHub 项目，不知道怎么安装
- 我想让 Claude Code 帮我部署
- 我想让 Claude Code 帮我解释项目
- 我想让 Claude Code 报错后自动分析
- 我想生成中文部署笔记
- 我想学习一个开源项目

## 目录说明

```text
github-project-deploy-kit/
├── README.md
├── LICENSE
├── NOTICE.md
├── THIRD_PARTY_LICENSES/
├── .claude/
│   ├── agents/
│   └── skills/
├── prompts/
├── scripts/
└── examples/
```

## 怎么使用？

### 方式一：直接在本工具包目录打开 Claude Code

```bash
git clone <你的仓库地址>
cd github-project-deploy-kit
claude
```

进入后输入：

```text
/agents
/skills
```

确认能看到 `.claude/agents` 和 `.claude/skills` 中的内容。

然后打开 [`prompts/deploy-any-github-project.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-any-github-project.md)，复制里面的提示词，把其中的 GitHub 地址替换成目标项目地址即可。

### 方式二：把工具包安装到某个已有项目

进入目标项目目录后运行：

macOS / Linux：

```bash
../github-project-deploy-kit/scripts/install-to-current-project.sh
```

Windows PowerShell：

```powershell
../github-project-deploy-kit/scripts/install-to-current-project.ps1
```

安装完成后，目标项目目录下会出现：

- `.claude/agents`
- `.claude/skills`

如果目标位置原本已经有同名内容，脚本会先备份为 `.bak` 后缀，再复制新的内容，不会直接删除用户已有文件。

## 推荐工作流

1. 先只读分析
2. 再检查环境
3. 再输出安装计划
4. 等用户确认
5. 再执行安装
6. 报错时调用 `build-error-resolver`
7. 完成后输出中文部署笔记

## 提示词模板

仓库内置以下模板：

- [`prompts/deploy-any-github-project.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-any-github-project.md)
- [`prompts/deploy-python-project.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-python-project.md)
- [`prompts/deploy-node-project.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-node-project.md)
- [`prompts/deploy-flutter-project.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-flutter-project.md)
- [`prompts/deploy-pyvideotrans.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-pyvideotrans.md)

你可以：

- 直接复制通用模板后粘贴 GitHub 地址
- 按项目类型选择 Python / Node / Flutter 模板
- 参考 `pyvideotrans` 示例快速复用

## 推荐检查命令

可以在仓库根目录运行：

```bash
./scripts/check-kit.sh
```

它会检查：

- `.claude/agents` 是否存在
- `.claude/skills` 是否存在
- 4 个 agent 文件是否齐全
- 3 个 skill 目录及 `SKILL.md` 是否齐全
- `prompts` 是否存在
- `README.md` 是否存在

## 注意事项

- 不要直接执行未知脚本
- 不要读取 `.env`、私钥、token
- 不要自动安装 CUDA / GPU 依赖
- 不要执行危险命令
- 不要连续失败后死循环
- 如果需要 API Key，必须停下来问用户

## 第三方来源说明

本项目部分 Agent / Skill 来源于：

[affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)

已复制的内容包括：

- `.claude/agents/build-error-resolver.md`
- `.claude/agents/code-reviewer.md`
- `.claude/agents/security-reviewer.md`
- `.claude/agents/python-reviewer.md`
- `.claude/skills/codebase-onboarding/`
- `.claude/skills/code-tour/`
- `.claude/skills/documentation-lookup/`

请保留原始 LICENSE 和 attribution。本仓库已将其许可证副本保存到：

- [`THIRD_PARTY_LICENSES/everything-claude-code-LICENSE`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/THIRD_PARTY_LICENSES/everything-claude-code-LICENSE)

## LICENSE

本仓库自身采用 MIT License，第三方内容仍遵循其原始许可证。使用或二次分发前，请同时阅读：

- [`LICENSE`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/LICENSE)
- [`NOTICE.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/NOTICE.md)
- [`THIRD_PARTY_LICENSES/everything-claude-code-LICENSE`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/THIRD_PARTY_LICENSES/everything-claude-code-LICENSE)
