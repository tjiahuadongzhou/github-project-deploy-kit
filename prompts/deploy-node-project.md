# Node.js / Next.js / React 项目部署提示词

请帮我部署一个 Node.js / Next.js / React GitHub 开源项目，并用中文讲解过程。

项目地址：
<在这里粘贴 GitHub 地址>

请优先使用以下能力：

1. `documentation-lookup` skill：优先查 `README`、`docs`、官方安装说明
2. `codebase-onboarding` skill：解释项目用途
3. `code-tour` skill：解释目录结构和关键入口
4. `code-reviewer` agent：审查项目结构、风险点和可维护性
5. `security-reviewer` agent：检查安装脚本、`postinstall`、权限和密钥风险
6. `build-error-resolver` agent：构建或启动失败时分析错误并做最小修复

请按以下流程执行：

## 第一阶段：只读分析

1. 阅读 `package.json`
2. 识别项目使用 `npm`、`pnpm`、`yarn` 还是 `bun`
3. 查看 `engines` 字段、`.nvmrc`、`.node-version`
4. 判断是 Node.js 后端、React 前端、Next.js 全栈还是 monorepo
5. 输出项目用途、技术栈、启动命令、测试命令、构建命令

## 第二阶段：环境检查

先检查，不要直接安装：

1. `node -v`
2. `npm -v`
3. `pnpm -v`
4. `yarn -v`
5. `bun -v`
6. 操作系统和 CPU 架构
7. 是否缺少系统依赖

## 第三阶段：安装计划

先说明命令，再等我确认：

1. 准备执行哪些命令
2. 每条命令的用途
3. 为什么选择对应的包管理器
4. 哪些步骤需要网络
5. 是否会触发构建脚本或 `postinstall`
6. 哪些步骤可能失败

## 第四阶段：执行安装

确认后再执行：

1. `git clone`
2. 进入项目目录
3. 安装依赖
4. 启动 dev server
5. 如果 `build` 或启动失败，调用 `build-error-resolver`
6. 用最小改动修复问题

执行时注意：

- 先说明安装命令，再实际执行
- 发现可疑脚本时先提醒我
- 不要自动改大量代码

## 第五阶段：交付结果

输出中文部署笔记，至少包含：

1. 项目用途
2. Node 版本要求
3. 包管理器判断结果
4. 实际执行命令
5. 启动方式
6. 构建与测试方式
7. 问题与修复记录
