# pyVideoTrans 部署提示词

请帮我在 macOS 上部署 `pyVideoTrans`，并尽量按国内网络环境优化依赖安装。

项目地址：
https://github.com/jianchang512/pyvideotrans

请优先使用以下能力：

1. `documentation-lookup` skill：优先阅读 `README`、项目文档和官方说明
2. `codebase-onboarding` skill：先理解项目用途
3. `code-tour` skill：讲清楚目录结构和入口
4. `python-reviewer` agent：分析 Python 结构、依赖和运行方式
5. `build-error-resolver` agent：`uv sync` 或启动失败时分析错误并最小修复
6. `security-reviewer` agent：检查安装脚本、外部依赖和权限风险

环境要求和倾向：

- 操作系统：macOS
- 网络环境：国内网络
- Python 包索引优先使用阿里云镜像
- 不要安装 CUDA / NVIDIA GPU 依赖

优先参考以下步骤：

## 系统依赖

```bash
brew install ffmpeg libsndfile git
```

## 安装 uv

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## clone 项目

```bash
git clone https://github.com/jianchang512/pyvideotrans
cd pyvideotrans
```

## 安装依赖

```bash
uv sync --index https://mirrors.aliyun.com/pypi/simple/
```

## 启动

```bash
uv run sp.py
```

请按以下流程执行：

### 第一阶段：只读分析

1. 先阅读 `README`、`pyproject.toml`、`requirements` 类文件和启动入口
2. 解释这个项目是做什么的
3. 说明是否依赖 GUI、PySide、FFmpeg、`libsndfile` 或特定 Python 版本

### 第二阶段：环境检查

1. 检查 macOS 版本和 CPU 架构
2. 检查 `brew`、`git`、`python3`、`uv`、`ffmpeg`
3. 检查是否适合在当前目录 clone

### 第三阶段：安装计划

先列出准备执行的命令，再等我确认：

1. 安装系统依赖
2. 安装 `uv`
3. `git clone`
4. `uv sync --index https://mirrors.aliyun.com/pypi/simple/`
5. `uv run sp.py`

同时说明：

- 哪些命令需要网络
- 哪些步骤可能比较慢
- 是否会改动系统环境
- 是否需要 GUI 权限

### 第四阶段：执行安装

确认后再执行。

如果 `uv sync` 失败，调用 `build-error-resolver` 分析。
如果启动失败，请优先分析以下问题：

- GUI / PySide 依赖问题
- `ffmpeg` 是否可用
- `libsndfile` 是否可用
- Python 版本是否兼容
- macOS 权限或图形界面限制

### 第五阶段：交付结果

完成后输出中文部署笔记，至少包含：

1. 项目用途
2. 实际执行命令
3. 安装中遇到的问题
4. 解决方式
5. 启动方式
6. 常用命令
7. 后续排错建议
