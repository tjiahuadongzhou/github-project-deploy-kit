---
name: deploy-any-github-project
description: 需要在 Claude Code 中按步骤部署 GitHub 开源项目时使用，先只读分析和输出安装计划，等用户确认后再执行安装与修复
disable-model-invocation: true
---

# deploy-any-github-project

## 用途

当用户想在 Claude Code 中部署任意 GitHub 开源项目时，
使用这个 skill。

## 基本原则

1. 不要一上来就安装依赖
2. 先只读分析
3. 先检查环境
4. 先输出安装计划
5. 必须等用户确认后再执行安装
6. 不要凭记忆乱猜，优先依据项目文档

## 推荐配合

- `codebase-onboarding`
- `code-tour`
- `documentation-lookup`
- `build-error-resolver`
- `code-reviewer`
- `security-reviewer`
- 如果是 Python 项目，额外使用 `python-reviewer`

## 工作流程

### 第一阶段：只读分析

不要安装依赖，
不要修改文件。
先阅读：

- `README`
- `docs`
- `package.json`
- `pyproject.toml`
- `pubspec.yaml`
- `requirements.txt`

总结：

- 项目是做什么的
- 技术栈是什么
- 支持哪些平台
- 官方推荐安装方式
- 启动命令
- 测试命令
- 构建命令
- 常见风险点

### 第二阶段：环境检查

先检查，
不要直接安装：

1. 操作系统
2. CPU 架构
3. Python / Node / Flutter / Go 等版本
4. `git` 是否安装
5. 包管理器是否安装
6. 项目要求的系统依赖是否安装
7. 当前目录是否适合 clone 项目

### 第三阶段：安装计划

必须先输出计划，
内容至少包括：

1. 会执行哪些命令
2. 每条命令的作用
3. 哪些命令可能耗时较长
4. 哪些命令可能需要网络
5. 是否需要国内镜像
6. 是否会修改系统环境
7. 是否有高风险命令

只有在用户确认后，
才能进入执行阶段。

### 第四阶段：执行安装

确认后再执行：

1. `git clone`
2. 安装系统依赖
3. 安装项目依赖
4. 启动项目
5. 如果失败，复制关键错误信息
6. 使用 `build-error-resolver` 分析错误
7. 使用最小修改或最小命令修复
8. 修复后重新验证

### 第五阶段：交付结果

输出中文部署笔记，
至少包括：

1. 项目用途
2. 安装步骤
3. 实际执行的命令
4. 遇到的问题
5. 解决方式
6. 启动方式
7. 常用命令
8. 卸载 / 清理方式
9. 后续学习建议

## 安全要求

- 不要执行危险命令
- 不要读取 `.env`、私钥、`token`
- 不要安装 CUDA / GPU 内容，除非用户明确要求
- 如果需要 API Key，先停下来问用户
- 如果连续失败 3 次，停止并总结原因
