# Flutter 项目部署提示词

请帮我部署一个 Flutter GitHub 开源项目，并用中文解释过程。

项目地址：
<在这里粘贴 GitHub 地址>

请优先使用以下能力：

1. `documentation-lookup` skill：优先阅读 `README`、`docs` 和官方说明
2. `codebase-onboarding` skill：说明项目用途
3. `code-tour` skill：说明目录结构和模块关系
4. `code-reviewer` agent：项目结构复杂时帮助梳理
5. `security-reviewer` agent：检查脚本、下载源和权限风险
6. `build-error-resolver` agent：依赖、分析、测试、构建失败时分析错误并做最小修复

如果当前工具集中没有 Flutter 专用 agent，请提醒我后续可以额外安装 `flutter-reviewer` 之类的专用能力。

请按以下流程执行：

## 第一阶段：只读分析

1. 阅读 `pubspec.yaml`
2. 查看 `README`、`docs`、平台目录，例如 `android`、`ios`、`macos`、`linux`、`windows`、`web`
3. 判断这是 App、Plugin 还是 Package
4. 输出项目用途、支持平台、依赖、启动方式、测试方式、构建方式

## 第二阶段：环境检查

先检查，不要直接安装：

1. `flutter --version`
2. `dart --version`
3. `flutter doctor`
4. 操作系统和 CPU 架构
5. 平台构建所需依赖是否齐全

## 第三阶段：安装计划

先输出计划，再等我确认：

1. 需要执行哪些命令
2. 每条命令的作用
3. 是否需要下载额外 SDK 或平台依赖
4. 哪些步骤可能耗时很长
5. 哪些步骤可能失败

## 第四阶段：执行安装

确认后再执行：

1. `git clone`
2. 进入项目目录
3. `flutter pub get`
4. `flutter analyze`
5. `flutter test`
6. 如果是 App 项目，说明如何启动模拟器或连接真机
7. 如有需要，再执行 `flutter run`
8. 如果构建或运行失败，调用 `build-error-resolver`

## 第五阶段：交付结果

输出中文部署笔记，至少包含：

1. 项目用途
2. Flutter / Dart 版本
3. 依赖安装步骤
4. 分析与测试结果
5. 模拟器或真机启动方法
6. 构建失败与修复记录
