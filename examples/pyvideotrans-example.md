# pyVideoTrans 示例

如果你想快速部署 `pyVideoTrans`，可以直接打开：

- [`prompts/deploy-pyvideotrans.md`](/Users/jiahuajiahuadongzhou/Documents/IT2026/音乐下载/github-project-deploy-kit/prompts/deploy-pyvideotrans.md)

或者复制下面这一段到 Claude Code / Codex：

```md
请帮我在 macOS 上部署 pyVideoTrans，并按国内网络环境优化安装速度。

项目地址：
https://github.com/jianchang512/pyvideotrans

要求：
- 优先阅读 README、pyproject.toml 和官方文档
- 先只读分析，再检查环境，再输出安装计划，等我确认后执行
- 系统依赖优先使用 brew install ffmpeg libsndfile git
- Python 依赖优先使用阿里云镜像
- 尽量使用 uv
- 不要安装 CUDA / NVIDIA GPU 依赖
- 安装或启动失败时使用 build-error-resolver
- 最后输出中文部署笔记
```
