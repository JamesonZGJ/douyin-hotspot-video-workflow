---
name: douyin-hotspot-video
description: Define and scaffold Chinese short-video projects through a question-first workflow for Douyin, Xiaohongshu, Bilibili, WeChat Channels, TikTok, and YouTube Shorts. Use when the user wants to make a vertical or horizontal video from a game event, showcase, Direct, trailer, local footage, official article, livestream recording, or raw idea; triggers include 做一期热点视频, 剪一个发布会总结, 用这个素材做视频, 初始化这个视频工程, 像 state of play 模板那样做.
---

# Douyin Hotspot Video

## Core Rule

先提问定义需求，再生成工程脚手架。不要默认接入 `cheat-on-content`，不要做发布预测、发布登记或复盘。

## Workflow

1. 先判断用户是否已经回答 `references/questionnaire.md` 的 12 个关键问题。
2. 缺少主题、平台、比例、时长、声音、表达类型、目标、受众、重点、禁忌、字幕文字或发布物料需求时，读取 `references/questionnaire.md`，按顺序提问。
3. 优先确认视频目标和受众，再确认素材和制作细节。不要一上来写文案。
4. 生成新工程目录时使用英文短名，例如 `nintendo-direct-2026-douyin`。本地素材路径可以保留中文。
5. 复用 `assets/hot-event-short-video/` 里的模板文件，生成可继续制作的工程骨架。
6. 输出文件默认包括：
   - `data/facts.json`
   - `scripts/narration.zh.txt`
   - `data/timeline.json`
   - `publish/cover.md`
   - `README.md`
7. 若用户要求发布物料，同时生成封面标题、发布标题、简介文案和话题标签。
8. 若用户只要求文案或剪辑计划，只生成对应文件；若用户要求完整工程，补齐所有默认文件。

## Fact Rules

- 游戏名优先使用官方中文名；没有官方中文时保留原名，不硬翻。
- 发售日、平台、DLC、免费更新、发布会日期等事实必须来自用户材料或官方来源。
- 事实不确定时先停下来问用户，不要用猜测、传闻或泛化说法填进 `facts.json`。
- 素材优先级：用户本地录屏 > 官方实机片段 > 官方预告 > 官方截图 > 官方文章配图。
- 不把官方原片、渲染 MP4、下载缓存或大体积素材写进 Git 仓库。

## Style Rules

- 平台和比例以用户回答为准；没回答时才默认抖音 `9:16` 竖屏、`30fps`。
- 默认文案结构：先给爆点或判断，再讲重点，最后用目标受众能听懂的一句话收束。
- 如果用户点名某个博主，只学习节奏和结构，不照搬句子。
- 发布会总结不要平均分配篇幅，最强爆点放前 30 秒。
- 单款游戏介绍要围绕“为什么现在值得看”，不要写成官网公告。
- 情绪型、预告片型、极简卡片型不要塞满信息；快报型、观点型、吐槽型要把结论放前面。

## Output Rules

- `facts.json` 只放已确认事实、来源和素材映射。
- `narration.zh.txt` 使用自然中文口播，不写新闻稿腔。
- `timeline.json` 先按旁白含义分段，再分配画面；不要按素材长度硬切。
- `cover.md` 给出封面标题、发布标题、简介文案、话题标签、推荐封面帧和避坑说明。
- `README.md` 用短句说明这条视频下一步怎么剪、怎么配音、怎么检查。
