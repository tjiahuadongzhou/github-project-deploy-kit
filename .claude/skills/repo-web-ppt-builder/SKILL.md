---
name: repo-web-ppt-builder
description: 想把 GitHub 项目整理成适合浏览器直接打开的网页版 PPT 时使用，输出单文件 HTML 讲解页面，适合小白学习或分享
disable-model-invocation: true
---

# repo-web-ppt-builder

## 用途

当用户提供一个 GitHub 项目地址，
希望生成一个“网页版 PPT / 可视化讲解页面”时，
使用这个 skill。

## 基本原则

1. 只读分析原项目
2. 不安装依赖
3. 不运行项目
4. 不修改被分析的原始 GitHub 项目源码
5. 允许创建新的 `project-presentation/` 目录作为输出
6. 默认优先单文件 HTML，不要引入复杂框架

## 推荐配合

- `codebase-onboarding`
- `code-tour`
- `documentation-lookup`

## 工作流程

### 第一阶段：只读分析

只阅读：

- `README`
- `docs`
- `package.json`
- `pyproject.toml`
- `pubspec.yaml`
- `go.mod`
- `Cargo.toml`

总结：

- 项目用途
- 核心功能
- 技术栈
- 目录结构
- 安装方式

### 第二阶段：生成 PPT 内容大纲

整理为 10 个章节：

1. 项目一句话介绍
2. 这个项目解决什么问题
3. 适合谁使用
4. 核心功能
5. 技术栈
6. 项目目录结构
7. 核心文件讲解
8. 安装和启动流程
9. 英文术语词典
10. 学习路线和下一步

要求：

- 每个英文术语带中文翻译
- 每个专业词带小白解释
- 多用生活类比
- 不要只复制 `README`

### 第三阶段：生成网页文件

创建：

```text
project-presentation/
├── index.html
└── README.md
```

`index.html` 要求：

1. 单文件 HTML
2. 尽量少依赖外部资源
3. 像网页版 PPT，一屏一节或一屏一页
4. 有清晰导航
5. 有目录树展示
6. 有卡片式信息区
7. 有英文术语词典表格
8. 视觉风格简洁现代
9. 适合浏览器直接打开
10. 支持移动端基本阅读

`README.md` 要求：

1. 说明基于哪个 GitHub 项目生成
2. 说明如何打开
3. 说明包含哪些章节
4. 说明如何重新生成

### 第四阶段：输出结果

最后告诉用户：

1. 生成了哪些文件
2. 如何打开 `index.html`
3. 这个项目最值得学习的 3 个点
4. 如果想继续深入，下一步建议看哪些文件
