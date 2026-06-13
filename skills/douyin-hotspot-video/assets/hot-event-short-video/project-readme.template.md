# 项目说明

## 这条视频要做什么

一句话说明主题和目标观众。

## 需求定义

- 平台：
- 比例：
- 时长：
- 声音：
- 表达类型：
- 主要目标：
- 目标受众：
- 字幕和画面文字：

## 已确认事实

- 事实 1：
- 事实 2：
- 事实 3：

## 素材

- 主素材：
- 备用素材：
- 不能使用的素材：

## 制作步骤

1. 核对 `data/facts.json`。
2. 录制或生成 `scripts/narration.zh.txt` 对应旁白。
3. 按 `data/timeline.json` 裁切画面。
4. 生成封面，检查 `publish/cover.md`。
5. 跑 HyperFrames 检查和渲染。

## 检查

```powershell
npm run lint
npm run validate
npm run inspect -- --samples 12
```
