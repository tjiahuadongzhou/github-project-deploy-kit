# Python 项目部署提示词

请帮我部署一个 Python GitHub 开源项目，并尽量用中文解释过程。

项目地址：
<在这里粘贴 GitHub 地址>

请优先使用以下能力：

1. `documentation-lookup` skill：优先阅读 `README`、`docs`、`pyproject.toml`、`requirements.txt`
2. `codebase-onboarding` skill：讲清楚这个项目是做什么的
3. `code-tour` skill：讲清楚目录结构和入口文件
4. `python-reviewer` agent：分析 Python 项目结构、依赖和运行方式
5. `build-error-resolver` agent：安装或启动失败时分析错误并做最小修复
6. `security-reviewer` agent：检查安装步骤、脚本和依赖风险

请按以下流程执行：

## 第一阶段：只读分析

1. 优先阅读 `pyproject.toml`、`requirements.txt`、`README`
2. 判断项目使用的是 `uv`、`pip`、`poetry` 还是 `conda`
3. 判断最低 Python 版本和推荐 Python 版本
4. 判断是否有系统依赖，例如 `ffmpeg`、`libsndfile`、`rust`、`cmake`、`libffi`
5. 输出项目说明、技术栈、入口命令、测试命令、构建命令

## 第二阶段：环境检查

请先检查，不要直接安装：

1. `python3 --version`
2. `uv --version`
3. `pip --version`
4. `poetry --version`
5. `conda --version`
6. 操作系统和 CPU 架构
7. 关键系统依赖是否已安装

如果存在多个安装方案，请优先使用 `uv`。

## 第三阶段：安装计划

先输出计划，再等我确认：

1. 会执行哪些命令
2. 为什么优先选择 `uv`
3. 是否需要虚拟环境
4. 是否需要国内镜像
5. 是否会改动系统环境
6. 可能的失败点是什么

国内网络支持：

如果需要从 PyPI 安装依赖，优先考虑阿里云镜像，例如：

```bash
uv sync --index https://mirrors.aliyun.com/pypi/simple/
```

## 第四阶段：执行安装

确认后再执行：

1. `git clone`
2. 进入项目目录
3. 优先执行 `uv sync --index https://mirrors.aliyun.com/pypi/simple/`
4. 如果项目不支持 `uv`，再退回到 `pip`、`poetry` 或 `conda`
5. 启动项目
6. 如果启动失败，调用 `build-error-resolver` 分析
7. 使用最小修改策略修复问题

## 第五阶段：交付结果

输出中文部署笔记，至少包含：

1. 项目用途
2. Python 版本要求
3. 依赖安装方法
4. 实际执行命令
5. 启动命令
6. 报错与修复过程
7. 后续开发建议

安全限制：

- 不要自动安装 CUDA / GPU 依赖
- 不要读取 `.env`、私钥、`token`
- 如果需要 API Key、模型权重或商业服务凭证，必须先停下来问我
- 不要因为一个报错就大面积改代码
